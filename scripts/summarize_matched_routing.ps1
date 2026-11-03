param([string]$Directory = (Join-Path $PSScriptRoot '..\build_m1\matched_routing'))
$ErrorActionPreference = 'Stop'
$result = foreach ($phase in @('before','after')) {
    $rows = @(Import-Csv -LiteralPath (Join-Path $Directory ($phase + '_internal_delays.csv')))
    $upper = @{}
    foreach ($row in $rows | Where-Object side -eq 'upper') {
        $key = $row.connection + '|' + ($row.sink -replace 'u_chain_upper','u_chain_PAIR')
        if ($upper.ContainsKey($key)) { throw "Duplicate upper connection: $key" }
        $upper[$key] = $row
    }
    $pairs = @(foreach ($row in $rows | Where-Object side -eq 'lower') {
        $key = $row.connection + '|' + ($row.sink -replace 'u_chain_lower','u_chain_PAIR')
        if (!$upper.ContainsKey($key)) { throw "Missing upper counterpart: $key" }
        $u = $upper[$key]
        [pscustomobject]@{
            connection = $key
            upper_slow_max_ps = [double]$u.slow_max_ps
            lower_slow_max_ps = [double]$row.slow_max_ps
            absolute_difference_ps = [math]::Abs([double]$u.slow_max_ps - [double]$row.slow_max_ps)
        }
    })
    if ($pairs.Count -ne 64 -or $upper.Count -ne 64) { throw 'Expected 64 paired sink connections (48 paired nets)' }
    $pairs | Export-Csv -NoTypeInformation -LiteralPath (Join-Path $Directory ($phase + '_paired_delays.csv'))
    $measure = $pairs | Measure-Object absolute_difference_ps -Average -Maximum
    [pscustomobject]@{
        phase = $phase
        paired_sinks = $pairs.Count
        exactly_equal_slow_max = @($pairs | Where-Object absolute_difference_ps -eq 0).Count
        mean_absolute_difference_ps = [math]::Round($measure.Average,3)
        maximum_absolute_difference_ps = $measure.Maximum
    }
}
$result | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $Directory 'comparison_summary.json')
$result | Format-Table -AutoSize
Write-Output 'Vivado model estimates only; these statistics exclude the final feedback/arbiter fanout nets and excitation distribution.'
