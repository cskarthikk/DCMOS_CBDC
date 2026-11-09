param(
 [Parameter(Mandatory=$true)][string]$InputCsv,
 [string]$ReferenceCsv=(Join-Path (Get-Location) 'continuation_single_puf_2026-11-06/reference/best_so_far_single_puf_2026-11-04/results/run_ab2cc0e61c854380a2e9dec91f7b500f.csv')
)
$ErrorActionPreference='Stop'
$inputPath=(Resolve-Path -LiteralPath $InputCsv).Path
$rows=@(Import-Csv -LiteralPath $inputPath)
$meta=Get-Content -LiteralPath ($inputPath+'.metadata.json') -Raw | ConvertFrom-Json
if(!$rows.Count){throw 'CSV contains no responses'}
if($meta.build -ne 'figure1_and_candidate' -or $meta.physical_variant -notin @('internal_matched_v2','boundary_v3')){
 throw 'Unexpected candidate metadata; do not pool different builds'
}
if($rows.Count -ne ([int]$meta.challenges*[int]$meta.repeats)){throw 'Incomplete collection: row count differs from metadata'}
$groups=@($rows | Group-Object challenge_hex)
if($groups.Count -ne [int]$meta.challenges){throw 'Distinct challenge count differs from metadata'}
$details=@(foreach($g in $groups){
 if($g.Name -notmatch '^[0-9A-Fa-f]{4}$'){throw 'Malformed challenge'}
 $value=[Convert]::ToInt32($g.Name,16); $parity=0
 for($i=0;$i -lt 16;$i++){$parity=$parity -bxor (($value -shr $i)-band 1)}
 if($parity -ne 1){throw "Unexpected even-parity challenge: $($g.Name)"}
 foreach($row in $g.Group){
  if($row.accepted -ne '1' -or $row.response -notin @('0','1') -or $row.flags_hex -ne '21' -or $row.build -ne 'figure1_and_candidate'){
   throw "Rejected/invalid response or unexpected firmware status: $($g.Name)"
  }
  if($row.qb_edge_seen -ne '' -or $row.qu_edge_seen -ne ''){throw 'Unexpected activity values; this candidate has no edge monitors'}
 }
 $trials=@($g.Group | ForEach-Object {[int]$_.trial} | Sort-Object)
 if(($trials -join ',') -ne ((1..[int]$meta.repeats) -join ',')){throw "Missing or duplicate trial IDs: $($g.Name)"}
 $ones=@($g.Group | Where-Object response -eq '1').Count
 [pscustomobject]@{challenge_hex=$g.Name;trials=$g.Count;ones=$ones;zeros=$g.Count-$ones;
  mixed=($ones -gt 0 -and $ones -lt $g.Count);
  majority=$(if(2*$ones -eq $g.Count){'tie'}elseif(2*$ones -gt $g.Count){'1'}else{'0'});
  smaller_count=[Math]::Min($ones,$g.Count-$ones)}
})
$totalOnes=@($rows | Where-Object response -eq '1').Count
$summary=[ordered]@{
 input_csv=$inputPath;physical_variant=$meta.physical_variant;bitstream_sha256=$meta.bitstream_sha256;accepted=$rows.Count;
 challenges=$details.Count;repeats=[int]$meta.repeats;ones=$totalOnes;
 ones_percent=100.0*$totalOnes/$rows.Count;
 constant_challenges=@($details | Where-Object mixed -eq $false).Count;
 mixed_challenges=@($details | Where-Object mixed -eq $true).Count;
 tied_challenges=@($details | Where-Object majority -eq 'tie').Count;
 smaller_response_count_sum=($details | Measure-Object smaller_count -Sum).Sum;
 activity_measurements_available=$false;
 interpretation='Observed sample behavior. Constant means constant in this finite collection; not certified reliability or entropy.'
}
$comparison=@()
if(Test-Path -LiteralPath $ReferenceCsv){
 $reference=@(Import-Csv -LiteralPath $ReferenceCsv)
 if(@($reference | Where-Object { $_.accepted -ne '1' -or $_.response -notin @('0','1') }).Count){throw 'Invalid reference responses'}
 $lookup=@{}
 foreach($g in @($reference | Group-Object challenge_hex)){$lookup[$g.Name]=$g.Group}
 $comparison=@(foreach($d in $details){
  if($lookup.ContainsKey($d.challenge_hex)){
   $rr=@($lookup[$d.challenge_hex]);$ones=@($rr | Where-Object response -eq '1').Count
   $majority=if(2*$ones -eq $rr.Count){'tie'}elseif(2*$ones -gt $rr.Count){'1'}else{'0'}
   [pscustomobject]@{challenge_hex=$d.challenge_hex;reference_trials=$rr.Count;reference_ones=$ones;
    reference_majority=$majority;candidate_trials=$d.trials;candidate_ones=$d.ones;candidate_majority=$d.majority;
    comparable=($majority -ne 'tie' -and $d.majority -ne 'tie');
    majority_changed=$(if($majority -eq 'tie' -or $d.majority -eq 'tie'){''}else{$majority -ne $d.majority})}
  }
 })
 $summary.reference_csv=[IO.Path]::GetFullPath($ReferenceCsv)
 $summary.shared_challenges=$comparison.Count
 $summary.shared_comparable_challenges=@($comparison | Where-Object comparable -eq $true).Count
 $summary.shared_majority_changes=@($comparison | Where-Object majority_changed -eq $true).Count
 if($comparison.Count){
  $refOnes=($comparison | Measure-Object reference_ones -Sum).Sum
  $newOnes=($comparison | Measure-Object candidate_ones -Sum).Sum
  $refTrials=($comparison | Measure-Object reference_trials -Sum).Sum
  $newTrials=($comparison | Measure-Object candidate_trials -Sum).Sum
  $summary.shared_reference_ones_percent=100.0*$refOnes/$refTrials
  $summary.shared_candidate_ones_percent=100.0*$newOnes/$newTrials
  $summary.shared_reference_mixed=@($comparison | Where-Object { $_.reference_ones -gt 0 -and $_.reference_ones -lt $_.reference_trials }).Count
  $summary.shared_candidate_mixed=@($comparison | Where-Object { $_.candidate_ones -gt 0 -and $_.candidate_ones -lt $_.candidate_trials }).Count
 }
 $summary.comparison_note='Different architectures and physical implementations; majority changes are not temporal errors. Only shared challenges are compared.'
}
$outputDir=Join-Path (Split-Path $inputPath -Parent) ('analysis_'+[Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $outputDir | Out-Null
$details | Export-Csv -LiteralPath (Join-Path $outputDir 'challenges.csv') -NoTypeInformation
if($comparison.Count){$comparison | Export-Csv -LiteralPath (Join-Path $outputDir 'shared_challenges.csv') -NoTypeInformation}
$summary | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $outputDir 'summary.json')
Write-Output ('Accepted={0}; challenges={1}; repeats={2}; ones={3} ({4:F4}%)' -f $rows.Count,$details.Count,$meta.repeats,$totalOnes,$summary.ones_percent)
Write-Output "Constant=$($summary.constant_challenges); mixed=$($summary.mixed_challenges); ties=$($summary.tied_challenges)"
Write-Output 'Activity measurements unavailable; blank edge columns were not treated as measured zeros.'
$details | Format-Table -AutoSize
if($comparison.Count){
 Write-Output "Shared with original: $($comparison.Count); majority changes across different designs: $($summary.shared_majority_changes) / $($summary.shared_comparable_challenges) comparable"
 Write-Output ('Shared-set ones: original={0:F4}%; candidate={1:F4}%. Mixed challenges: original={2}; candidate={3}' -f $summary.shared_reference_ones_percent,$summary.shared_candidate_ones_percent,$summary.shared_reference_mixed,$summary.shared_candidate_mixed)
}
Write-Output "Analysis saved: $outputDir"
