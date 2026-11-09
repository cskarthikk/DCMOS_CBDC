param([Parameter(Mandatory=$true)][string]$ProjectRoot,[string]$Clocks='20,22,24')
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent;$main=Split-Path $root -Parent
$ProjectRoot=(Resolve-Path $ProjectRoot).Path
$record=Get-Content (Join-Path $ProjectRoot 'BUILD_RECORD.json') -Raw | ConvertFrom-Json
$bit=Join-Path $ProjectRoot $record.bitstream
if((Get-FileHash $bit).Hash -ne $record.sha256){throw 'Selected bitstream identity changed'}
foreach($entry in $record.files.PSObject.Properties){if((Get-FileHash (Join-Path $ProjectRoot $entry.Name)).Hash -ne $entry.Value){throw ('Evidence changed: '+$entry.Name)}}
$clockList=@($Clocks.Split(',') | ForEach-Object {[int]$_});if($clockList.Count -gt 9 -or ($clockList | Where-Object {$_ -lt 1 -or $_ -gt 127})){throw 'Invalid bounded clock list'}
$python=Join-Path $main 'runtime/python/python.exe';$vivado='C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat'
$dir=Join-Path $root ('runs/run_'+[Guid]::NewGuid().ToString('N'));New-Item -ItemType Directory -Path $dir -Force | Out-Null
$devMatrix=Join-Path $main 'array64_candidate_2026-11-08/reports/all_core_design_review_2026-11-08/first64_vectors.json'
$collector=Join-Path $ProjectRoot 'scripts/collect.ps1'
[pscustomobject]@{source_project=$ProjectRoot;bitstream=$bit;bitstream_sha256=$record.sha256;source_record_sha256=(Get-FileHash (Join-Path $ProjectRoot 'BUILD_RECORD.json')).Hash;predeclared_clocks=$clockList;development_matrix_sha256=(Get-FileHash $devMatrix).Hash;latch_cycles=8;cores=64;raw_only=$true} | ConvertTo-Json | Set-Content (Join-Path $dir 'SELECTED_SOURCE.json')
& $vivado -mode batch -notrace -log (Join-Path $dir 'program.log') -nojournal -source (Join-Path $main 'scripts/program.tcl') -tclargs $bit PROGRAM_SELECTED_BITSTREAM
if($LASTEXITCODE -ne 0){throw 'Programming failed'}
$dev=@()
foreach($clock in $clockList){
 $path=Join-Path $dir ('development_wait'+$clock+'.csv')
 & $collector -Port COM5 -BitstreamLoaded -Mode Parallel -ExciteCycles $clock -Repeats 20 -ChallengeFile $devMatrix -Output $path
 $dev+=[pscustomobject]@{clock=$clock;csv=$path};ConvertTo-Json -InputObject @($dev) | Set-Content (Join-Path $dir 'DEV_INDEX.json')
}
$chosen=& $python -B -I (Join-Path $PSScriptRoot 'calibration.py') choose $dir
if($LASTEXITCODE -ne 0){throw 'Clock selection failed'};$chosen=[int]$chosen
[pscustomobject]@{source_project=$ProjectRoot;bitstream=$bit;bitstream_sha256=$record.sha256;excite_cycles=$chosen;latch_cycles=8;cores=64;raw_only=$true} | ConvertTo-Json | Set-Content (Join-Path $dir 'OPERATING_PROFILE.json')
$validation=@()
for($i=1;$i -le 2;$i++){
 $path=Join-Path $dir ('validation_'+$i+'.csv')
 & $collector -Port COM5 -BitstreamLoaded -Mode Parallel -ExciteCycles $chosen -Repeats 20 -ChallengeFile (Join-Path $dir 'validation_matrix.json') -Output $path
 $validation+=[pscustomobject]@{capture=$i;csv=$path};ConvertTo-Json -InputObject @($validation) | Set-Content (Join-Path $dir 'VALIDATION_INDEX.json')
}
& $python -B -I (Join-Path $PSScriptRoot 'calibration.py') review $dir
if($LASTEXITCODE -ne 0){throw 'Independent validation analysis failed'}
Write-Output ('CALIBRATION_AND_VALIDATION_COMPLETE '+$dir)
