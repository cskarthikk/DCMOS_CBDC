param([Parameter(Mandatory=$true)][string]$Directory)
$ErrorActionPreference='Stop'
$files=@(Get-ChildItem -LiteralPath $Directory -Filter '*.csv'|Sort-Object Name)
$details=[Collections.Generic.List[object]]::new()
$summary=@(foreach($file in $files){
 $rows=@(Import-Csv -LiteralPath $file.FullName)
 if(!$rows.Count -or $rows[0].build -ne 'core_experiment'){continue}
 $keys=@($rows|ForEach-Object{"$($_.challenge_hex):$($_.trial)"}|Select-Object -Unique)
 if($keys.Count -ne $rows.Count){throw 'Duplicate challenge/trial'}
 foreach($row in $rows){
  $flag=[Convert]::ToInt32($row.flags_hex,16);$raw=[int]$row.raw_pair
  if($raw-lt 0 -or $raw-gt 3 -or ($flag-band 0xF0)-ne 0x70 -or ($flag-band 1)-ne [int]$row.accepted -or ($raw-band 1)-ne [int]$row.response -or (($raw-shr 1)-band 1)-ne [int]$row.reverse_response){throw 'Inconsistent experimental fields'}
 }
 $ok=@($rows|Where-Object accepted -eq '1')
 $oddOk=@($ok|Where-Object {$c=[Convert]::ToInt32($_.challenge_hex,16);$p=0;for($j=0;$j-lt 16;$j++){$p=$p-bxor (($c-shr $j)-band 1)};$p-eq 1})
 $mixed=0
 $oddMixed=@($oddOk|Group-Object challenge_hex|Where-Object {@($_.Group|Select-Object -ExpandProperty response -Unique).Count-gt 1}).Count
 foreach($g in ($ok|Group-Object challenge_hex)){
  $a=@($g.Group|Where-Object response -eq '1').Count;$b=@($g.Group|Where-Object reverse_response -eq '1').Count
  if($a-gt 0 -and $a-lt $g.Count){$mixed++}
  $details.Add([pscustomobject]@{file=$file.Name;mode=$rows[0].mode;challenge=$g.Name;trials=$g.Count;A_ones=$a;B_ones=$b;
   pair_01=@($g.Group|Where-Object raw_pair -eq '2').Count;pair_10=@($g.Group|Where-Object raw_pair -eq '1').Count;
   pair_00=@($g.Group|Where-Object raw_pair -eq '0').Count;pair_11=@($g.Group|Where-Object raw_pair -eq '3').Count;
   missing_edges=@($g.Group|Where-Object {$_.qb_edge_seen-ne '1' -or $_.qu_edge_seen-ne '1'}).Count})
 }
 [pscustomobject]@{file=$file.Name;mode=$rows[0].mode;wait=$rows[0].wait_cycles;capture=$rows[0].capture_cycles;queries=$rows.Count;
  accepted=$ok.Count;rejected=$rows.Count-$ok.Count;common_odd_queries=$oddOk.Count;common_odd_A_ones=@($oddOk|Where-Object response -eq '1').Count;
  common_odd_mixed=$oddMixed;mixed_A_all_challenges=$mixed;missing_edges=@($ok|Where-Object {$_.qb_edge_seen-ne '1' -or $_.qu_edge_seen-ne '1'}).Count}
})
if(!$summary.Count){throw 'No experimental CSVs found'}
$summary|Export-Csv -NoTypeInformation -LiteralPath (Join-Path $Directory 'experiment_summary.csv')
$details|Export-Csv -NoTypeInformation -LiteralPath (Join-Path $Directory 'experiment_challenges.csv')
$summary|Format-Table -AutoSize
Write-Output 'Compare A on the common odd subset. B/pair fields are diagnostic; no XOR correction or inter-device claim. Missing-edge rows retained.'
