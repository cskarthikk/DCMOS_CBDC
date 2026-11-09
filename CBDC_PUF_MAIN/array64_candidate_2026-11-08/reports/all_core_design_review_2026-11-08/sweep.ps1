param([switch]$LongerWaits)
$ErrorActionPreference='Stop'
$root=Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$sequence=@(8,16,32,8)
$indexName='SWEEP_INDEX.json'
if($LongerWaits){$sequence=@(64,127,8);$indexName='SWEEP_LONG_INDEX.json'}
$records=@()
for($i=0;$i -lt $sequence.Count;$i++){
 $out=Join-Path $PSScriptRoot ('wait_'+$sequence[$i]+'_step_'+$i+'_'+[Guid]::NewGuid().ToString('N')+'.csv')
 Write-Output ('Condition '+$i+': excite wait='+$sequence[$i])
 & (Join-Path $root 'scripts/collect.ps1') -Port COM5 -BitstreamLoaded -Mode Parallel -ExciteCycles $sequence[$i] -Repeats 20 -ChallengeFile (Join-Path $PSScriptRoot 'first64_vectors.json') -Output $out
 $records+=[pscustomobject]@{step=$i;excite_cycles=$sequence[$i];csv=$out}
 $records | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $PSScriptRoot $indexName)
}
Write-Output 'BOUNDED_WAIT_SWEEP_COMPLETE'
