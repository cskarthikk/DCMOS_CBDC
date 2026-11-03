# Narrow-window diagnostic. No FPGA programming or rebuilding.
param([Parameter(Mandatory=$true)][string]$Port,
 [ValidateRange(1,1000)][int]$Repeats=20,[string]$RunName=('capture_scan_'+[Guid]::NewGuid().ToString('N')))
$ErrorActionPreference='Stop'
if($RunName -notmatch '^[A-Za-z0-9_-]+$'){throw 'Invalid run name'}
$projectRoot=Split-Path $PSScriptRoot -Parent
$out=Join-Path $projectRoot ('build_m1/measurements/timing/'+$RunName)
while(Test-Path -LiteralPath $out){
 $RunName='capture_scan_'+[Guid]::NewGuid().ToString('N')
 $out=Join-Path $projectRoot ('build_m1/measurements/timing/'+$RunName)
}
Write-Output "Results folder: $out"
$bit=Join-Path $projectRoot 'build_m1/timing_diagnostic/cbdc_timing_diagnostic.bit'
if(!(Test-Path -LiteralPath $bit)){throw 'Missing timing diagnostic bitstream'}
New-Item -ItemType Directory -Path $out | Out-Null
$challenges='0001,0002,8000,0007,106A,007C'
[pscustomobject]@{utc=[DateTime]::UtcNow.ToString('o');port=$Port;repeats=$Repeats;
 challenges=$challenges;bitstream_sha256=(Get-FileHash -Algorithm SHA256 -LiteralPath $bit).Hash;
 note='Same runtime timing firmware; operator must keep it programmed. 8/8 references before/after. Wait 1..40, capture 1. Missing activity retained. 10ns resolution, not analog timing.'} |
 ConvertTo-Json | Set-Content -LiteralPath (Join-Path $out 'metadata.json')
for($i=0;$i -le 41;$i++){
 if($i -eq 0 -or $i -eq 41){$w=8;$c=8}else{$w=$i;$c=1}
 Write-Output "Scan $($i+1)/42: wait=$w cycles, capture=$c cycles"
 $csv=Join-Path $out ('{0:D2}_w{1}_c{2}.csv' -f $i,$w,$c)
 & (Join-Path $PSScriptRoot 'collect_timing_crps.ps1') -Port $Port -WaitCycles $w -CaptureCycles $c -Repeats $Repeats -ChallengeList $challenges -Output $csv
}
Write-Output "CAPTURE SCAN COMPLETE: $out"
