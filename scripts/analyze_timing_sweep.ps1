param([Parameter(Mandatory=$true)][string]$Directory)
$ErrorActionPreference='Stop'
$files=@(Get-ChildItem -LiteralPath $Directory -Filter '*.csv' | Where-Object Name -Match '^\d\d_w\d+_c\d+\.csv$' | Sort-Object Name)
if(!$files.Count){throw 'No numbered timing acquisition CSVs found'}
$detail=[Collections.Generic.List[object]]::new()
$summary=@(foreach($file in $files){
 $all=@(Import-Csv -LiteralPath $file.FullName)
 $rows=@($all|Where-Object accepted -eq '1')
 if(!$rows.Count){throw "No accepted responses in $($file.Name)"}
 $settings=@($rows|ForEach-Object {"$($_.wait_cycles),$($_.capture_cycles)"}|Select-Object -Unique)
 if($settings.Count -ne 1){throw "Mixed timing settings in $($file.Name)"}
 $keys=@($rows|ForEach-Object {"$($_.challenge_hex),$($_.trial)"}|Select-Object -Unique)
 if($keys.Count -ne $rows.Count){throw "Duplicate challenge/trial in $($file.Name)"}
 if(@($rows|Where-Object { $_.response -notin @('0','1') -or $_.build -ne 'timing_instrumented' }).Count){throw 'Invalid response/build'}
 $mixed=0;$minority=0
 $groups=@($rows|Group-Object challenge_hex)
 foreach($g in $groups){
  $n=@($g.Group|Where-Object response -eq '1').Count
  $missing=@($g.Group|Where-Object {$_.qb_edge_seen -ne '1' -or $_.qu_edge_seen -ne '1'}).Count
  if($n -gt 0 -and $n -lt $g.Count){$mixed++}
  $minority+=[math]::Min($n,$g.Count-$n)
  $detail.Add([pscustomobject]@{file=$file.Name;wait_cycles=$rows[0].wait_cycles;capture_cycles=$rows[0].capture_cycles;
   challenge=$g.Name;trials=$g.Count;ones=$n;zeros=$g.Count-$n;missing_edges=$missing})
 }
 [pscustomobject]@{file=$file.Name;wait_cycles=[int]$rows[0].wait_cycles;capture_cycles=[int]$rows[0].capture_cycles;
  queries=$rows.Count;challenges=$groups.Count;ones=@($rows|Where-Object response -eq '1').Count;
  mixed_challenges=$mixed;minority_responses=$minority;
  missing_edges=@($rows|Where-Object {$_.qb_edge_seen -ne '1' -or $_.qu_edge_seen -ne '1'}).Count}
})
$summary | Export-Csv -NoTypeInformation -LiteralPath (Join-Path $Directory 'timing_summary.csv')
$detail | Export-Csv -NoTypeInformation -LiteralPath (Join-Path $Directory 'timing_challenges.csv')
$summary | Format-Table -AutoSize
Write-Output 'All accepted rows included, including missing-edge rows. Minority counts use each file/challenge own majority, not a certified error rate.'
Write-Output 'Compare first and last 8/8 settings for drift before attributing differences to capture timing.'
