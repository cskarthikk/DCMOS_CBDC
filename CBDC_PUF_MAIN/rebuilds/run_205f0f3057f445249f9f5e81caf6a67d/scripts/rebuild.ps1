param([string]$VivadoPath='C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat',
 [string]$IcarusBin='C:\iverilog\bin',[switch]$PrepareOnly)
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$stage=Join-Path $root ('rebuilds/run_'+[Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $stage -Force | Out-Null
foreach($dir in @('rtl','constraints','scripts','sim')){Copy-Item -LiteralPath (Join-Path $root $dir) -Destination (Join-Path $stage $dir) -Recurse}
foreach($file in @('layout.tcl','internal_route_template.tcl')){Copy-Item -LiteralPath (Join-Path $root $file) -Destination (Join-Path $stage $file)}
Write-Output ('Prepared isolated hardware rebuild: '+$stage)
if($PrepareOnly){return}
if(!(Test-Path -LiteralPath $VivadoPath)){throw 'Vivado not found; supply -VivadoPath.'}
$python=Join-Path $root 'runtime/python/python.exe'
& $python -B -I (Join-Path $stage 'scripts/simulate.py') --icarus-bin $IcarusBin --refresh-stage-evidence
if($LASTEXITCODE -ne 0){throw 'Staged functional simulation failed'}
Push-Location $stage
try{
 foreach($script in @('build.tcl','match_local.tcl','verify_placement.tcl')){
  $vargs=@('-mode','batch','-notrace','-nojournal','-log',($script+'.log'),'-source',('scripts/'+$script))
  if($script -eq 'verify_placement.tcl'){$vargs+=@('-tclargs','build_matched')}
  & $VivadoPath @vargs
  if($LASTEXITCODE -ne 0){throw ('Vivado failed at '+$script+'; the frozen release remains available.')}
 }
 & $python -B -I 'scripts/record_build.py'
 if($LASTEXITCODE -ne 0){throw 'Rebuilt implementation failed release checks'}
 Write-Output ('Rebuilt candidate: '+(Join-Path $stage 'build_matched/paper_array8.bit'))
 Write-Output 'This is a separate candidate. Rebuilding does not replace the measured release or its enrollment.'
}finally{Pop-Location}
