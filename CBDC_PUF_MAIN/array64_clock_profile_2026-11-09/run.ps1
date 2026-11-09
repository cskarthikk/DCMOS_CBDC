param(
 [ValidateSet('Verify','Program','Smoke','Collect')][string]$Action='Verify',
 [string]$Port='COM5',
 [switch]$BitstreamLoaded,
 [ValidateRange(1,4096)][int]$Patterns=256,
 [ValidateRange(1,1000)][int]$Repeats=20,
 [string]$ChallengeFile='',
 [string]$Output=''
)
$ErrorActionPreference='Stop'
$root=$PSScriptRoot;$main=Split-Path $root -Parent
$profile=Get-Content -LiteralPath (Join-Path $root 'PROFILE.json') -Raw | ConvertFrom-Json
$source=Join-Path $main $profile.source_project_relative
$recordPath=Join-Path $source 'BUILD_RECORD.json'
if((Get-FileHash -LiteralPath $recordPath).Hash -ne $profile.source_record_sha256){throw 'Source build record changed'}
$record=Get-Content -LiteralPath $recordPath -Raw | ConvertFrom-Json
$bit=Join-Path $source $record.bitstream
if((Get-FileHash -LiteralPath $bit).Hash -ne $profile.bitstream_sha256){throw 'Selected bitstream changed'}
foreach($entry in $record.files.PSObject.Properties){if((Get-FileHash -LiteralPath (Join-Path $source $entry.Name)).Hash -ne $entry.Value){throw ('Source evidence changed: '+$entry.Name)}}
foreach($entry in $profile.files.PSObject.Properties){if((Get-FileHash -LiteralPath (Join-Path $root $entry.Name)).Hash -ne $entry.Value){throw ('Profile evidence changed: '+$entry.Name)}}
if($profile.cores -ne 64 -or $profile.latch_cycles -ne 8 -or !$profile.raw_only){throw 'Invalid raw operating profile'}
Write-Output ('PASS: 64-core bitstream and fixed timing profile verified. Excite='+$profile.excite_cycles+'; Latch=8 cycles.')
if($Action -eq 'Verify'){return}
if($Action -eq 'Program'){
 $log=Join-Path $root ('program_'+[Guid]::NewGuid().ToString('N')+'.log')
 & 'C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat' -mode batch -notrace -log $log -nojournal -source (Join-Path $main 'scripts/program.tcl') -tclargs $bit PROGRAM_SELECTED_BITSTREAM
 if($LASTEXITCODE -ne 0){throw 'FPGA programming failed'}
 return
}
if(!$BitstreamLoaded){throw 'Run -Action Program first, then acknowledge with -BitstreamLoaded'}
if($Action -eq 'Smoke'){$Patterns=4;$Repeats=3}
if(!$Output){$Output=Join-Path $root ('measurements/raw_'+[Guid]::NewGuid().ToString('N')+'.csv')}
$argsForCapture=@{Port=$Port;BitstreamLoaded=$true;Mode='Parallel';ExciteCycles=[int]$profile.excite_cycles;Patterns=$Patterns;Repeats=$Repeats;Output=$Output}
if($ChallengeFile){$argsForCapture.ChallengeFile=$ChallengeFile}
& (Join-Path $source 'scripts/collect.ps1') @argsForCapture
& (Join-Path $main 'runtime/python/python.exe') -B -I (Join-Path $source 'scripts/analyze.py') $Output
if($LASTEXITCODE -ne 0){throw 'Capture analysis failed'}
