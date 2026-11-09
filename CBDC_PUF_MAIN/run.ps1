param(
 [ValidateSet('Status','Verify','Smoke','Collect','Diagnostics','CollectValidation','Validate','Analyze','Enroll','Test','Simulate','Program','PrepareRebuild','Rebuild')][string]$Action='Status',
 [string]$Port='COM5',[switch]$BitstreamLoaded,[string]$InputCsv='',
 [ValidateRange(1,4096)][int]$Patterns=256,[ValidateRange(1,1000)][int]$Repeats=20,
 [ValidateSet('Parallel','Sequential')][string]$Mode='Parallel',[ValidateRange(1,127)][int]$ExciteCycles=8,
 [string]$VivadoPath='C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat',
 [string]$IcarusBin='C:\iverilog\bin'
)
$ErrorActionPreference='Stop'
$root=$PSScriptRoot
$python=Join-Path $root 'runtime/python/python.exe'
function Invoke-Python([string[]]$Arguments){
 & $python -B -I @Arguments
 if($LASTEXITCODE -ne 0){throw 'Python workflow failed; inspect the error above.'}
}
function Report-Validation([string]$Csv){
 $report=Join-Path $root ('validation/run_'+[Guid]::NewGuid().ToString('N'))
 Invoke-Python @((Join-Path $root 'scripts/workflow.py'),'validate','--input',$Csv,'--output',$report)
}
try{
 if(!(Test-Path -LiteralPath $python)){throw 'Bundled Python missing; restore the complete main folder.'}
 Invoke-Python @((Join-Path $root 'scripts/workflow.py'),'verify')
 switch($Action){
  'Verify' {}
  'Status' {Invoke-Python @((Join-Path $root 'scripts/workflow.py'),'status')}
  'Smoke' {& (Join-Path $root 'scripts/collect.ps1') -Port $Port -BitstreamLoaded:$BitstreamLoaded -Patterns 4 -Repeats 3 -Mode Parallel -ExciteCycles 8}
  'Collect' {& (Join-Path $root 'scripts/collect.ps1') -Port $Port -BitstreamLoaded:$BitstreamLoaded -Patterns $Patterns -Repeats $Repeats -Mode $Mode -ExciteCycles $ExciteCycles}
  'Diagnostics' {& (Join-Path $root 'scripts/run_diagnostics.ps1') -Port $Port -BitstreamLoaded:$BitstreamLoaded}
  'CollectValidation' {
   if(!$BitstreamLoaded){throw 'Load the preserved main-folder bitstream, then supply -BitstreamLoaded to confirm it.'}
   if($Repeats -lt 20){throw 'Confirmation requires at least 20 readings.'}
   $modelPath=Join-Path $root 'enrollment/baseline/model.json'
   $model=Get-Content -LiteralPath $modelPath -Raw | ConvertFrom-Json
   $matrix=Join-Path (Split-Path $modelPath -Parent) $model.challenge_matrix
   $output=Join-Path $root ('measurements/validation/capture_'+[Guid]::NewGuid().ToString('N')+'.csv')
   & (Join-Path $root 'scripts/collect.ps1') -Port $Port -BitstreamLoaded -Repeats $Repeats -Mode $model.profile.mode -ExciteCycles $model.profile.excite_cycles -ChallengeFile $matrix -EnrollmentHash (Get-FileHash -LiteralPath $modelPath -Algorithm SHA256).Hash -Output $output
   [pscustomobject]@{csv=$output.Substring($root.Length+1)} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $root 'measurements/validation/LATEST_CAPTURE.json')
   Report-Validation $output
  }
  'Validate' {
   if(!$InputCsv){
    $latest=Get-Content -LiteralPath (Join-Path $root 'measurements/validation/LATEST_CAPTURE.json') -Raw | ConvertFrom-Json
    $InputCsv=[IO.Path]::GetFullPath((Join-Path $root $latest.csv))
    if(!$InputCsv.StartsWith($root+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)){throw 'Unsafe capture pointer'}
   }
   Report-Validation ([IO.Path]::GetFullPath($InputCsv))
  }
  'Analyze' {
   if(!$InputCsv){$InputCsv=Join-Path $root 'measurements/paper8_0fcd36dbe06545a2bb3941b4976b5848.csv'}
   Invoke-Python @((Join-Path $root 'scripts/workflow.py'),'analyze','--input',([IO.Path]::GetFullPath($InputCsv)),'--output',(Join-Path $root ('reports/analysis_'+[Guid]::NewGuid().ToString('N')+'.json')))
  }
  'Enroll' {
   if(!$InputCsv){throw 'Baseline enrollment is already frozen. Supply -InputCsv to create a separate enrollment experiment.'}
   Invoke-Python @((Join-Path $root 'scripts/workflow.py'),'enroll','--input',([IO.Path]::GetFullPath($InputCsv)),'--output',(Join-Path $root ('enrollment/experiments/run_'+[Guid]::NewGuid().ToString('N')+'/model.json')))
  }
  'Test' {Invoke-Python @((Join-Path $root 'tests/test_workflow.py'))}
  'Simulate' {Invoke-Python @((Join-Path $root 'scripts/simulate.py'),'--icarus-bin',$IcarusBin)}
  'Program' {
   if(!(Test-Path -LiteralPath $VivadoPath)){throw 'Vivado executable not found; supply -VivadoPath.'}
   $release=Get-Content -LiteralPath (Join-Path $root 'BUILD_RECORD.json') -Raw | ConvertFrom-Json
   Push-Location $root
   try{& $VivadoPath -mode batch -notrace -nojournal -log 'reports/program.log' -source 'scripts/program.tcl' -tclargs (Join-Path $root $release.bitstream) 'PROGRAM_SELECTED_BITSTREAM'
    if($LASTEXITCODE -ne 0){throw 'FPGA programming failed.'}
   }finally{Pop-Location}
  }
  {$_ -in @('PrepareRebuild','Rebuild')} {
   & (Join-Path $root 'scripts/rebuild.ps1') -VivadoPath $VivadoPath -IcarusBin $IcarusBin -PrepareOnly:($Action -eq 'PrepareRebuild')
  }
 }
}catch{Write-Error $_;exit 1}
