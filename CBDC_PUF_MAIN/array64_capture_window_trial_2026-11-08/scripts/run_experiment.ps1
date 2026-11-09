$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent;$main=Split-Path $root -Parent
$base=Join-Path $main 'array64_candidate_2026-11-08'
$vivado='C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat'
$record=Get-Content (Join-Path $root 'BUILD_RECORD.json') -Raw | ConvertFrom-Json
foreach($entry in $record.files.PSObject.Properties){if((Get-FileHash (Join-Path $root $entry.Name)).Hash -ne $entry.Value){throw ('Diagnostic evidence changed: '+$entry.Name)}}
$trialBit=Join-Path $root $record.bitstream
if((Get-FileHash $trialBit).Hash -ne $record.sha256){throw 'Diagnostic bitstream changed'}
$baselineBit=Join-Path $base 'build/paper_array64.bit'
if((Get-FileHash $baselineBit).Hash -ne $record.baseline_bitstream_sha256){throw 'Baseline bitstream changed'}
$dir=Join-Path $root ('experiments/run_'+[Guid]::NewGuid().ToString('N'));New-Item -ItemType Directory -Path $dir | Out-Null
$entries=@();$matrix=Join-Path $root 'matrix64.json'
function SaveCapture([string]$label,[string]$collector,[int]$wait,[int]$latch){
 $path=Join-Path $dir ($label+'.csv')
 & $collector -Port COM5 -BitstreamLoaded -Mode Parallel -ExciteCycles $wait -Repeats 20 -ChallengeFile $matrix -Output $path
 $script:entries+=[pscustomobject]@{label=$label;excite_cycles=$wait;latch_cycles=$latch;csv=$path}
 ConvertTo-Json -InputObject @($script:entries) | Set-Content (Join-Path $dir 'INDEX.json')
}
function ProgramBit([string]$bit,[string]$label){
 & $vivado -mode batch -notrace -log (Join-Path $dir ($label+'.log')) -nojournal -source (Join-Path $main 'scripts/program.tcl') -tclargs $bit PROGRAM_SELECTED_BITSTREAM
 if($LASTEXITCODE -ne 0){throw ('Programming failed: '+$label)}
}
SaveCapture 'baseline_before_wait8' (Join-Path $base 'scripts/collect.ps1') 8 8
$attempted=$false
try{
 $attempted=$true;ProgramBit $trialBit 'program_trial'
 # Equal closing times:8+64 ==64+8;71+64 ==127+8.
 $waits=@(8,32,71,127,8)
 for($i=0;$i -lt $waits.Count;$i++){SaveCapture ('trial_step'+$i+'_wait'+$waits[$i]) (Join-Path $root 'scripts/collect.ps1') $waits[$i] 64}
}finally{if($attempted){ProgramBit $baselineBit 'restore_baseline'}}
SaveCapture 'baseline_after_wait8' (Join-Path $base 'scripts/collect.ps1') 8 8
Write-Output ('EXPERIMENT_COMPLETE_BASELINE_RESTORED '+$dir)
