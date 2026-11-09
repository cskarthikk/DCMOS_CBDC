param(
 [ValidateSet('Verify','Smoke','Collect','Analyze','Program')][string]$Action='Verify',
 [string]$Port='COM5',[switch]$BitstreamLoaded,
 [ValidateRange(1,4096)][int]$Patterns=256,
 [ValidateRange(1,1000)][int]$Repeats=20,
 [ValidateSet('Parallel','Sequential')][string]$Mode='Parallel',
 [ValidateRange(1,127)][int]$ExciteCycles=8,
 [string]$InputCsv='', [string]$ChallengeFile='',
 [string]$VivadoPath='C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat'
)
$ErrorActionPreference='Stop'
$root=$PSScriptRoot
$recordPath=Join-Path $root 'BUILD_RECORD.json'
if(!(Test-Path -LiteralPath $recordPath)){throw 'Candidate is not finalized. No verified bitstream is available yet.'}
$record=Get-Content -LiteralPath $recordPath -Raw | ConvertFrom-Json
foreach($entry in $record.files.PSObject.Properties){
 $path=Join-Path $root $entry.Name
 if(!(Test-Path -LiteralPath $path) -or (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne $entry.Value){throw ('Candidate evidence changed: '+$entry.Name)}
}
$bit=Join-Path $root $record.bitstream
if((Get-FileHash -LiteralPath $bit -Algorithm SHA256).Hash -ne $record.sha256){throw 'Candidate bitstream changed'}
Write-Output 'PASS: candidate bitstream and recorded implementation inputs/evidence verified.'
$python=Join-Path (Split-Path $root -Parent) 'runtime/python/python.exe'
switch($Action){
 'Verify' {Write-Output ('64 physical cores; raw response only. File: '+$bit);return}
 'Program' {
  if(!(Test-Path -LiteralPath $VivadoPath)){throw 'Vivado executable not found'}
  Push-Location $root
  try {& $VivadoPath -mode batch -notrace -nolog -nojournal -source (Join-Path $root 'scripts/program.tcl');if($LASTEXITCODE -ne 0){throw 'Vivado programming failed'}} finally {Pop-Location}
 }
 'Analyze' {
  if(!$InputCsv){throw '-InputCsv is required'}
  & $python -B -I (Join-Path $root 'scripts/analyze.py') $InputCsv
  if($LASTEXITCODE -ne 0){throw 'Raw capture analysis failed'}
 }
 default {
  if($Action -eq 'Smoke'){$Patterns=4;$Repeats=3}
  $output=Join-Path $root ('measurements/new/array64_'+[Guid]::NewGuid().ToString('N')+'.csv')
  & (Join-Path $root 'scripts/collect.ps1') -Port $Port -BitstreamLoaded:$BitstreamLoaded -Patterns $Patterns -Repeats $Repeats -Mode $Mode -ExciteCycles $ExciteCycles -ChallengeFile $ChallengeFile -Output $output
  & $python -B -I (Join-Path $root 'scripts/analyze.py') $output
  if($LASTEXITCODE -ne 0){throw 'Capture analysis failed; retain the raw file for investigation'}
 }
}
