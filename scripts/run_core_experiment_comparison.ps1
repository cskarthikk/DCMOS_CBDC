param([Parameter(Mandatory=$true)][string]$Port,[ValidateRange(1,1000)][int]$Repeats=20,
 [string]$RunName=('comparison_'+[Guid]::NewGuid().ToString('N')))
$ErrorActionPreference='Stop'
if($RunName -notmatch '^[A-Za-z0-9_-]+$'){throw 'Invalid run name'}
$root=Split-Path $PSScriptRoot -Parent
$source=Join-Path $root 'build_m1/measurements/matched_run01.csv'
$odd=@(Import-Csv -LiteralPath $source|Where-Object accepted -eq '1'|Select-Object -ExpandProperty challenge_hex -Unique|Select-Object -First 32)
if($odd.Count -ne 32){throw 'Need the reference measurement set'}
$list=@(foreach($token in $odd){$c=[Convert]::ToInt32($token,16);'{0:X4}'-f $c;'{0:X4}'-f ($c-bxor 1)}) -join ','
$out=Join-Path $root ('build_m1/measurements/core_experiment/'+$RunName)
if(Test-Path -LiteralPath $out){throw "Run already exists: $out"}
New-Item -ItemType Directory -Path $out|Out-Null
$settings=@(@(0,8,8),@(1,8,8),@(1,0,8),@(3,0,8),@(7,0,8),@(0,8,8))
[pscustomobject]@{reference_csv=$source;challenges=$list;repeats=$Repeats;settings=$settings;
 note='First 32 reference odd challenges paired with LSB-toggled even challenges. Same bitstream for all settings; baseline repeated.'}|
 ConvertTo-Json -Depth 5|Set-Content -LiteralPath (Join-Path $out 'comparison_metadata.json')
for($i=0;$i-lt $settings.Count;$i++){
 $m=$settings[$i][0];$w=$settings[$i][1];$c=$settings[$i][2]
 Write-Output "Comparison $($i+1)/6: mode=$m wait=$w capture=$c"
 & (Join-Path $PSScriptRoot 'collect_core_experiment.ps1') -Port $Port -Mode $m -WaitCycles $w -CaptureCycles $c -Repeats $Repeats -ChallengeList $list -Output (Join-Path $out ('{0:D2}_m{1}_w{2}_c{3}.csv'-f $i,$m,$w,$c))
}
Write-Output "CORE COMPARISON COMPLETE: $out"
