param(
    [string]$Port = 'COM5',
    [switch]$VerifyOnly,
    [switch]$BitstreamLoaded,
    [string]$Conditions = 'Power-cycle history, ambient temperature and supply conditions not recorded.'
)
$ErrorActionPreference = 'Stop'
$reference = Join-Path $PSScriptRoot 'reference/best_so_far_single_puf_2026-11-04'
$hashes = Get-Content -LiteralPath (Join-Path $reference 'FILE_HASHES.json') -Raw | ConvertFrom-Json
foreach ($entry in $hashes.PSObject.Properties) {
    $actual = (Get-FileHash -LiteralPath (Join-Path $reference $entry.Name) -Algorithm SHA256).Hash
    if ($actual -ne $entry.Value) { throw "Reference hash mismatch: $($entry.Name)" }
}
$baseline = Join-Path $reference 'results/run_ab2cc0e61c854380a2e9dec91f7b500f.csv'
$observed = @((Import-Csv -LiteralPath $baseline) | Select-Object -ExpandProperty challenge_hex -Unique)
$chosen = [Collections.Generic.List[int]]::new()
foreach ($c in @(0,1,2,3,7,8,0x8000,0xFFFF,0x1F,0x7FFF,0x8003,0xFFFE)) { $chosen.Add($c) }
$rng = [Random]::new(20261101)
while ($chosen.Count -lt 256) {
    $c = $rng.Next(65536)
    if (!$chosen.Contains($c)) { $chosen.Add($c) }
}
$generated = @($chosen | ForEach-Object { '{0:X4}' -f $_ })
if (($observed -join ',') -ne ($generated -join ',')) { throw 'Collector challenge order does not match baseline in this runtime' }
$bitstream = Join-Path $reference 'build_m1/pulled_single/cbdc_pulled_single.bit'
Write-Output 'PASS: all 34 reference file hashes; same 256 challenges in the same order.'
Write-Output "Program this exact file first: $bitstream"
Write-Output 'Expected SHA256: 5DCC2151205DE1C92A79DC5EAFF657A57885A6715FD1DEAA62ECA8B8A497F111'
if ($VerifyOnly) { return }
if (!$BitstreamLoaded) { throw 'After programming the exact displayed file, run with -BitstreamLoaded to record your confirmation.' }
if ($Port -notin [IO.Ports.SerialPort]::GetPortNames()) { throw "Port not present: $Port" }
$measurementDir = Join-Path $PSScriptRoot 'measurements'
New-Item -ItemType Directory -Force -Path $measurementDir | Out-Null
$output = Join-Path $measurementDir ('run_' + [Guid]::NewGuid().ToString('N') + '.csv')
[pscustomobject]@{
    utc = [DateTime]::UtcNow.ToString('o')
    operator_confirmed_loaded_file = $bitstream
    note = 'Operator confirmation only; not independent FPGA firmware identification.'
    port = $Port
    conditions = $Conditions
} | ConvertTo-Json | Set-Content -LiteralPath ($output + '.operator.json')
& (Join-Path $reference 'scripts/collect_pulled_single.ps1') -Port $Port -Challenges 256 -Repeats 20 -Output $output
Write-Output "Compare this new CSV using: $output"
& (Join-Path $PSScriptRoot 'compare_saved_runs.ps1') -RepeatCsv $output
