param([string]$VivadoPath='C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat',
 [string]$IcarusBin='C:\iverilog\bin',[switch]$PrepareOnly,[string]$ResumeRoutedStage='')
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
if($ResumeRoutedStage){
 $stage=(Resolve-Path -LiteralPath $ResumeRoutedStage).Path
 if(!$stage.StartsWith((Join-Path $root 'rebuilds\'),[StringComparison]::OrdinalIgnoreCase) -or !(Test-Path (Join-Path $stage 'build/routed.dcp')) -or (Test-Path (Join-Path $stage 'build/routed_refined.dcp'))){throw 'Resume requires an isolated, initially routed stage before refinement'}
 $frozenInputs=Get-Content (Join-Path $stage 'REBUILD_INPUTS.json') -Raw | ConvertFrom-Json
 foreach($entry in $frozenInputs.PSObject.Properties){if((Get-FileHash (Join-Path $stage $entry.Name)).Hash -ne $entry.Value){throw ('Staged input changed: '+$entry.Name)}}
}else{
$stage=Join-Path $root ('rebuilds/run_'+[Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $stage -Force | Out-Null
foreach($dir in @('rtl','sim')){Copy-Item -LiteralPath (Join-Path $root $dir) -Destination (Join-Path $stage $dir) -Recurse}
New-Item -ItemType Directory -Path (Join-Path $stage 'scripts'),(Join-Path $stage 'build') | Out-Null
Get-ChildItem -LiteralPath (Join-Path $root 'scripts/build') -File | Copy-Item -Destination (Join-Path $stage 'scripts')
Copy-Item -LiteralPath (Join-Path $root 'scripts/simulate.py') -Destination (Join-Path $stage 'scripts/simulate.py')
Copy-Item -LiteralPath (Join-Path $root 'constraints/basys3_serial.xdc') -Destination (Join-Path $stage 'basys3_serial.xdc')
foreach($file in @('layout.tcl','layout.json','internal_route_template.tcl')){Copy-Item -LiteralPath (Join-Path $root ('layout/'+$file)) -Destination (Join-Path $stage $file)}
$inputHashes=[ordered]@{}
foreach($dir in @('rtl','sim','scripts')){foreach($file in Get-ChildItem -LiteralPath (Join-Path $stage $dir) -File){$inputHashes[$dir+'/'+$file.Name]=(Get-FileHash $file.FullName).Hash}}
foreach($name in @('basys3_serial.xdc','layout.tcl','layout.json','internal_route_template.tcl')){$inputHashes[$name]=(Get-FileHash (Join-Path $stage $name)).Hash}
$inputHashes | ConvertTo-Json -Depth 4 | Set-Content (Join-Path $stage 'REBUILD_INPUTS.json')
}
if($ResumeRoutedStage){
@'
set root [file normalize [pwd]]
set out $root/build
set_param general.maxThreads 2
open_checkpoint $root/build/routed.dcp
source $root/scripts/refine_routes.tcl
write_checkpoint -force $root/build/routed.dcp
report_timing_summary -report_unconstrained -file $root/build/timing.rpt
puts "REBUILD64_ROUTE_COMPLETE"
'@ | Set-Content (Join-Path $stage 'implement64.tcl')
}else{
@'
set root [file normalize [pwd]]
source $root/scripts/synthesize.tcl
close_project
source $root/scripts/implement.tcl
source $root/scripts/refine_routes.tcl
write_checkpoint -force $root/build/routed.dcp
report_timing_summary -report_unconstrained -file $root/build/timing.rpt
puts "REBUILD64_ROUTE_COMPLETE"
'@ | Set-Content (Join-Path $stage 'implement64.tcl')
}
Write-Output ('Prepared isolated 64-core rebuild: '+$stage)
[IO.File]::WriteAllText((Join-Path $root 'rebuilds/LATEST.txt'),$stage)
if($PrepareOnly){return}
if(!(Test-Path -LiteralPath $VivadoPath)){throw 'Vivado not found'}
$python=Join-Path $root 'runtime/python/python.exe'
if(!$ResumeRoutedStage){
 & $python -B -I (Join-Path $stage 'scripts/simulate.py') --project-root $stage --icarus-bin $IcarusBin --refresh-stage-evidence
 if($LASTEXITCODE -ne 0){throw '64-core simulation failed'}
}
Push-Location $stage
try{
 & $VivadoPath -mode batch -notrace -nojournal -log implementation.log -source implement64.tcl *> implementation_console.txt
 if($LASTEXITCODE -ne 0){throw '64-core implementation failed; inspect stage logs'}
 $jobs=@(for($i=0;$i -lt 4;$i++){
  Start-Job -ArgumentList $stage,$VivadoPath,$i -ScriptBlock {
   param($stagePath,$vivadoExe,$shard)
   Set-Location $stagePath
   & $vivadoExe -mode batch -notrace -nojournal -log ('audit_'+$shard+'.log') -source scripts/review_shard.tcl -tclargs $shard refined *> ('audit_console_'+$shard+'.txt')
   if($LASTEXITCODE -ne 0){throw ('Delay audit failed: '+$shard)}
  }
 })
 $jobs | Wait-Job | Out-Null
 foreach($job in $jobs){if($job.State -ne 'Completed'){Receive-Job $job;throw 'Delay audit job failed'}}
 $jobs | Receive-Job
 & $python -B -I scripts/merge_delays.py --refined
 if($LASTEXITCODE -ne 0){throw 'Delay merge failed'}
 & $python -B -I scripts/summarize_routes.py
 if($LASTEXITCODE -ne 0){throw 'Delay review failed'}
 $audit=Get-Content build/route_summary.json -Raw | ConvertFrom-Json
 if($audit.paired_internal_arcs -ne 4096 -or $audit.nonzero_slow -ne 0 -or $audit.nonzero_fast -ne 0){throw 'Matched routing acceptance failed; no bitstream finalized'}
 & $VivadoPath -mode batch -notrace -nojournal -log finalize.log -source scripts/finalize.tcl *> finalize_console.txt
 if($LASTEXITCODE -ne 0){throw 'Finalization failed'}
 [pscustomobject]@{bitstream='build/paper_array64.bit';sha256=(Get-FileHash build/paper_array64.bit).Hash;cores=64;source_revision=(git -C $root rev-parse HEAD);status='Rebuilt candidate only; characterize hardware before enrollment';matched_internal_pairs=4096} | ConvertTo-Json | Set-Content REBUILD_RESULT.json
 Write-Output ('REBUILD64_COMPLETE '+$stage)
}finally{Pop-Location}
