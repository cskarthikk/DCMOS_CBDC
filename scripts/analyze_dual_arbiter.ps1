param([Parameter(Mandatory=$true)][string]$InputCsv)
$ErrorActionPreference = 'Stop'
$all = @(Import-Csv -LiteralPath $InputCsv)
$rows = @($all | Where-Object accepted -eq '1')
if (!$rows.Count) { throw "No accepted queries in $InputCsv" }

$total = $rows.Count
$onesA = 0
$onesB = 0
$validRaces = 0

foreach ($r in $rows) {
    $qa = [int]$r.response
    $f = [Convert]::ToInt32($r.flags_hex, 16)
    $qb = ($f -shr 3) -band 1
    if ($qa -eq 1) { $onesA++ }
    if ($qb -eq 1) { $onesB++ }
    if (($qa -bxor $qb) -eq 1) { $validRaces++ }
}

$pctA = ($onesA / $total) * 100
$pctB = ($onesB / $total) * 100
$combinedPct = (($onesA + $onesB) / (2 * $total)) * 100
$validPct = ($validRaces / $total) * 100

Write-Output "================================================================="
Write-Output "               DUAL-ARBITER PHYSICAL PUF ANALYSIS                "
Write-Output "================================================================="
Write-Output ("Total Queries Analyzed         : {0}" -f $total)
Write-Output ("Arbiter A (Primary, QA) Ones   : {0} / {1} ({2:F2}%)" -f $onesA, $total, $pctA)
Write-Output ("Arbiter B (Inverted, QB) Ones  : {0} / {1} ({2:F2}%)" -f $onesB, $total, $pctB)
Write-Output ("Combined Balanced Ratio        : {0:F2}% (Ideal: 50.00%)" -f $combinedPct)
Write-Output ("Complementary Races (QA != QB) : {0} / {1} ({2:F2}%)" -f $validRaces, $total, $validPct)
Write-Output "================================================================="

$summary = @($rows | Group-Object challenge_hex | ForEach-Object {
    $trials = $_.Count
    $cOnesA = 0
    $cOnesB = 0
    $cValid = 0
    foreach ($item in $_.Group) {
        $qa = [int]$item.response
        $f = [Convert]::ToInt32($item.flags_hex, 16)
        $qb = ($f -shr 3) -band 1
        if ($qa -eq 1) { $cOnesA++ }
        if ($qb -eq 1) { $cOnesB++ }
        if (($qa -bxor $qb) -eq 1) { $cValid++ }
    }
    [pscustomobject]@{
        challenge   = $_.Name
        trials      = $trials
        QA_ones     = $cOnesA
        QB_ones     = $cOnesB
        valid_races = $cValid
        pure_comp   = ($cValid -eq $trials)
    }
})

$summary | Select-Object -First 30 | Format-Table -AutoSize
Write-Output ("Showing first 30 of {0} challenges." -f $summary.Count)
Write-Output ("Challenges with 100% pure complementary races: {0} / {1} ({2:F2}%)" -f
    @($summary | Where-Object pure_comp -eq $true).Count, $summary.Count,
    ((@($summary | Where-Object pure_comp -eq $true).Count / $summary.Count) * 100))
