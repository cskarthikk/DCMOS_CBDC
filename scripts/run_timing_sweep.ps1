param([Parameter(Mandatory=$true)][string]$Port,[ValidateRange(1,1000)][int]$Repeats=50,
 [string]$RunName=('sweep_'+[DateTime]::UtcNow.ToString('yyyyMMdd_HHmmss')))
$ErrorActionPreference='Stop'
if($RunName -notmatch '^[A-Za-z0-9_-]+$'){throw 'Use letters, digits, underscore or hyphen in RunName'}
$projectRoot=Split-Path $PSScriptRoot -Parent
$out=Join-Path $projectRoot ('build_m1/measurements/timing/'+$RunName)
if(Test-Path -LiteralPath $out){throw "Run directory already exists: $out"}
$bit=Join-Path $projectRoot 'build_m1/timing_diagnostic/cbdc_timing_diagnostic.bit'
if(!(Test-Path -LiteralPath $bit)){throw 'Timing diagnostic bitstream has not been built'}
New-Item -ItemType Directory -Path $out | Out-Null
$settings=@(@(8,8),@(16,8),@(8,4),@(32,16),@(16,16),@(8,16),@(32,4),@(16,4),@(32,8),@(8,8))
[pscustomobject]@{utc=[DateTime]::UtcNow.ToString('o');port=$Port;repeats=$Repeats;
 bitstream_path=$bit;bitstream_sha256=(Get-FileHash -Algorithm SHA256 -LiteralPath $bit).Hash;
 note='Hash identifies local file; operator must program it. One bitstream for every timing setting. Last setting repeats baseline.';
 settings=$settings} | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $out 'metadata.json')
for($i=0;$i -lt $settings.Count;$i++){
 $w=$settings[$i][0];$c=$settings[$i][1]
 $csv=Join-Path $out ('{0:D2}_w{1}_c{2}.csv' -f $i,$w,$c)
 Write-Output "Setting $($i+1)/10: wait=$w cycles, capture=$c cycles"
 & (Join-Path $PSScriptRoot 'collect_timing_crps.ps1') -Port $Port -WaitCycles $w -CaptureCycles $c -Repeats $Repeats -Output $csv
}
Write-Output "TIMING SWEEP COMPLETE: $out"
