param([Parameter(Mandatory=$true)][string]$InputCsv)
$ErrorActionPreference='Stop'
$all=@(Import-Csv -LiteralPath $InputCsv)
$rows=@($all | Where-Object accepted -eq '1')
if(!$rows.Count){throw 'No accepted queries in this CSV'}
Write-Output ('Accepted rows: {0}; response ones: {1}; Qb edge missing: {2}; Qu edge missing: {3}' -f
 $rows.Count,@($rows|Where-Object response -eq '1').Count,
 @($rows|Where-Object qb_edge_seen -eq '0').Count,@($rows|Where-Object qu_edge_seen -eq '0').Count)
Write-Output 'All accepted rows are included; edge failures are not silently discarded.'
$summary=@($rows|Group-Object challenge_hex|ForEach-Object {
 $ones=@($_.Group|Where-Object response -eq '1').Count
 [pscustomobject]@{challenge=$_.Name;trials=$_.Count;ones=$ones;zeros=$_.Count-$ones;
  repeated_same_bit=($ones -eq 0 -or $ones -eq $_.Count);
  qb_missing=@($_.Group|Where-Object qb_edge_seen -eq '0').Count;
  qu_missing=@($_.Group|Where-Object qu_edge_seen -eq '0').Count}
})
$summary|Format-Table -AutoSize
Write-Output ('Challenges returning both values: {0} / {1}' -f @($summary|Where-Object repeated_same_bit -eq $false).Count,$summary.Count)
Write-Output 'This measures within-run behavior of the instrumented build, not cross-device uniqueness.'
