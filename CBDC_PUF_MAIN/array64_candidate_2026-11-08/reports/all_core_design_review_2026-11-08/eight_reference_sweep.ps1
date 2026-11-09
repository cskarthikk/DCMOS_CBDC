$ErrorActionPreference='Stop'
$candidate=Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$main=Split-Path $candidate -Parent
$vivado='C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat'
$bit8=Join-Path $main 'build_matched/paper_array8.bit'
$bit64=Join-Path $candidate 'build/paper_array64.bit'
if((Get-FileHash -LiteralPath $bit8).Hash -ne '6BE7B2C364E2FB0A59864DB1597934BBE5EAB6538B239375E33445109A5666C7'){throw 'Eight-core reference identity changed'}
if((Get-FileHash -LiteralPath $bit64).Hash -ne '98266A06F5CA5EAE25EAFC507E1B4D81EC55CD21B48980969AF0A7CFF23C1517'){throw '64-core candidate identity changed'}
function ProgramSelected([string]$bit,[string]$label){
 Write-Output ('Programming preserved file: '+$bit)
 $log=Join-Path $PSScriptRoot ($label+'_'+[Guid]::NewGuid().ToString('N')+'.log')
 & $vivado -mode batch -notrace -log $log -nojournal -source (Join-Path $main 'scripts/program.tcl') -tclargs $bit PROGRAM_SELECTED_BITSTREAM
 if($LASTEXITCODE -ne 0){throw ('Programming failed: '+$label)}
}
$records=@();$attempted=$false
try{
 $attempted=$true;ProgramSelected $bit8 'program_reference8'
 $waits=@(8,32,127,8)
 for($i=0;$i -lt $waits.Count;$i++){
  $path=Join-Path $PSScriptRoot ('eight_wait_'+$waits[$i]+'_step_'+$i+'_'+[Guid]::NewGuid().ToString('N')+'.csv')
  & (Join-Path $main 'scripts/collect.ps1') -Port COM5 -BitstreamLoaded -Mode Parallel -ExciteCycles $waits[$i] -Repeats 20 -ChallengeFile (Join-Path $PSScriptRoot 'eight_matched_vectors.json') -Output $path
  $records+=[pscustomobject]@{step=$i;excite_cycles=$waits[$i];csv=$path}
  ConvertTo-Json -InputObject @($records) | Set-Content -LiteralPath (Join-Path $PSScriptRoot 'EIGHT_SWEEP_INDEX.json')
 }
}finally{
 if($attempted){ProgramSelected $bit64 'restore_candidate64'}
}
$smoke=Join-Path $PSScriptRoot ('restore64_smoke_'+[Guid]::NewGuid().ToString('N')+'.csv')
& (Join-Path $candidate 'scripts/collect.ps1') -Port COM5 -BitstreamLoaded -Mode Parallel -ExciteCycles 8 -Repeats 1 -ChallengeFile (Join-Path $PSScriptRoot 'restore_smoke_vectors.json') -Output $smoke
Write-Output 'EIGHT_REFERENCE_SWEEP_COMPLETE_AND_64_PROTOCOL_CONFIRMED'
