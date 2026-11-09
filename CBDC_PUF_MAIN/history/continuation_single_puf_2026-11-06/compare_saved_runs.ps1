param(
    [string]$RepeatCsv = (Join-Path (Split-Path $PSScriptRoot -Parent) 'build_m1/measurements/pulled_single/run2_verify.csv')
)
$ErrorActionPreference = 'Stop'
$baselinePath = Join-Path $PSScriptRoot 'reference/best_so_far_single_puf_2026-11-04/results/run_ab2cc0e61c854380a2e9dec91f7b500f.csv'
function Read-Run([string]$Path) {
    $rows = @(Import-Csv -LiteralPath $Path)
    if ($rows.Count -ne 5120) { throw "Expected 5120 rows: $Path" }
    $groups = @($rows | Group-Object challenge_hex)
    if ($groups.Count -ne 256) { throw "Expected 256 distinct challenges: $Path" }
    $map = @{}
    foreach ($group in $groups) {
        $trials = @($group.Group | ForEach-Object { [int]$_.trial } | Sort-Object)
        if (($trials -join ',') -ne ((1..20) -join ',')) { throw "Trials are not exactly 1..20 for $($group.Name)" }
        foreach ($row in $group.Group) {
            if ($row.accepted -ne '1' -or $row.response -notin @('0','1')) { throw 'Rejected or invalid response found' }
            $flags = [Convert]::ToInt32($row.flags_hex,16)
            if (($flags -band 0x91) -ne 0x11 -or (($flags -shr 1) -band 1) -ne [int]$row.qb_edge_seen -or (($flags -shr 2) -band 1) -ne [int]$row.qu_edge_seen) {
                throw 'Inconsistent status flags found'
            }
        }
        $ones = @($group.Group | Where-Object response -eq '1').Count
        $map[$group.Name] = [pscustomobject]@{
            Ones = $ones
            Majority = $(if ($ones -eq 10) { 'tie' } elseif ($ones -gt 10) { '1' } else { '0' })
            Mixed = ($ones -gt 0 -and $ones -lt 20)
        }
    }
    $metadata = Get-Content -LiteralPath ($Path + '.metadata.json') -Raw | ConvertFrom-Json
    [pscustomobject]@{ Rows=$rows; Map=$map; Metadata=$metadata }
}
$baseline = Read-Run $baselinePath
$repeat = Read-Run $RepeatCsv
if (@(Compare-Object @($baseline.Map.Keys) @($repeat.Map.Keys)).Count) { throw 'Challenge sets differ' }
$baseOrder = @($baseline.Rows | Select-Object -ExpandProperty challenge_hex -Unique)
$repeatOrder = @($repeat.Rows | Select-Object -ExpandProperty challenge_hex -Unique)
if (($baseOrder -join ',') -ne ($repeatOrder -join ',')) { throw 'Challenge orders differ' }
$sameHash = $baseline.Metadata.bitstream_sha256 -eq $repeat.Metadata.bitstream_sha256
Write-Output "Recorded bitstream hashes match: $sameHash"
Write-Output 'Metadata hashes identify local files, not the firmware actually loaded into the FPGA.'
$changed=0; $ties=0; $bothStable=0; $mixed=0; $ones=0; $minority=0
foreach ($c in $baseOrder) {
    $a=$baseline.Map[$c]; $b=$repeat.Map[$c]
    $ones += $b.Ones
    $minority += [Math]::Min($b.Ones,20-$b.Ones)
    if ($b.Mixed) { $mixed++ }
    if (!$a.Mixed -and !$b.Mixed) { $bothStable++ }
    if ($a.Majority -eq 'tie' -or $b.Majority -eq 'tie') {
        $ties++
        Write-Output "Tie excluded from majority comparison: $c (baseline ones=$($a.Ones); repeat ones=$($b.Ones))"
    } elseif ($a.Majority -ne $b.Majority) {
        $changed++
        Write-Output "Majority changed: $c (baseline ones=$($a.Ones); repeat ones=$($b.Ones))"
    }
}
$missing=@($repeat.Rows | Where-Object { $_.qb_edge_seen -ne '1' -or $_.qu_edge_seen -ne '1' }).Count
Write-Output ('Accepted=5120; ones={0} ({1:F4}%); mixed challenges={2}; missing activity rows={3}' -f $ones,(100*$ones/5120),$mixed,$missing)
Write-Output "Strict-majority changes=$changed / $(256-$ties) comparable challenges; ties=$ties"
Write-Output "Challenges constant in both runs=$bothStable / 256"
Write-Output "Sum of smaller response counts per challenge=$minority (20-trial ties contribute 10)"
Write-Output 'These are descriptive counts, not certified reliability, entropy, or uniqueness.'
