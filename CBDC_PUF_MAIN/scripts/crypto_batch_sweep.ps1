param(
    [string]$Port = 'COM5',
    [ValidateRange(5, 500)][int]$NumChallenges = 50,
    [ValidateRange(2, 50)][int]$QueriesPerChallenge = 5,
    [int]$ExciteCycles = 8,
    [string]$Output = ''
)

$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$python = Join-Path $root 'runtime\python\python.exe'
if (!(Test-Path -LiteralPath $python)) {
    $python = 'python'
}

if (!$Output) {
    $Output = Join-Path $root ("measurements/validation/batch_sweep_" + [Guid]::NewGuid().ToString('N') + ".json")
}
$Output = [IO.Path]::GetFullPath($Output)
New-Item -ItemType Directory -Force (Split-Path $Output -Parent) | Out-Null

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "      CBDC-PUF MULTI-CHALLENGE ROBUSTNESS & UNIQUENESS SWEEP            " -ForegroundColor Cyan
Write-Host "   Testing $NumChallenges SHA-3 Challenges x $QueriesPerChallenge Live Queries on $Port       " -ForegroundColor Cyan
Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host ""

function Query-Hardware([System.IO.Ports.SerialPort]$serial, [int[]]$cfgs, [int]$excite) {
    $control = ($excite -shl 1)
    $request = New-Object byte[] 19
    $request[0] = 0xAC
    $request[1] = [byte]$control
    $crc = 0
    for ($c = 0; $c -lt 8; $c++) {
        $v = [int]$cfgs[$c]
        $request[2 + 2 * $c] = [byte]($v -band 0xFF)
        $request[3 + 2 * $c] = [byte](($v -shr 8) -band 0xFF)
    }
    for ($i = 0; $i -le 17; $i++) { $crc = $crc -bxor $request[$i] }
    $request[18] = [byte]$crc

    $serial.Write($request, 0, 19)
    $reply = New-Object byte[] 21
    for ($i = 0; $i -lt 21; $i++) {
        $reply[$i] = [byte]$serial.ReadByte()
    }
    $crc = 0
    for ($i = 0; $i -lt 20; $i++) { $crc = $crc -bxor $reply[$i] }
    if ($reply[0] -ne 0x5C -or $reply[20] -ne $crc -or $reply[18] -ne 0x61) {
        throw "FPGA UART frame error on port $Port."
    }
    return [int]$reply[19]
}

$serial = [System.IO.Ports.SerialPort]::new($Port, 115200, [System.IO.Ports.Parity]::None, 8, [System.IO.Ports.StopBits]::One)
$serial.ReadTimeout = 2500
$serial.WriteTimeout = 2500

$allChallengeData = @()

try {
    $serial.Open()
    Start-Sleep -Milliseconds 150
    $serial.DiscardInBuffer()

    Write-Host "Executing sweep on live Basys 3 hardware..." -ForegroundColor Yellow

    for ($idx = 1; $idx -le $NumChallenges; $idx++) {
        $chalStr = "DCMOS_CBDC_Challenge_Vector_$idx"
        $shaJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') hash_challenge --challenge $chalStr --cores 8
        $shaData = $shaJsonRaw | ConvertFrom-Json

        $cfgs1 = $shaData.configurations_int
        $cfgs2 = @()
        for ($i = 0; $i -lt 8; $i++) {
            $cfgs2 += ($cfgs1[$i] -bxor 0x7FFE)
        }

        # 5 samples for consensus enrollment
        $samples1 = @()
        $samples2 = @()
        for ($t = 1; $t -le 5; $t++) {
            $samples1 += Query-Hardware $serial $cfgs1 $ExciteCycles
            $samples2 += Query-Hardware $serial $cfgs2 $ExciteCycles
        }

        $ref_b1 = 0
        $ref_b2 = 0
        for ($bit = 0; $bit -lt 8; $bit++) {
            $cnt1 = ($samples1 | Where-Object { ($_ -shr $bit) -band 1 }).Count
            if ($cnt1 -ge 3) { $ref_b1 = $ref_b1 -bor (1 -shl $bit) }
            $cnt2 = ($samples2 | Where-Object { ($_ -shr $bit) -band 1 }).Count
            if ($cnt2 -ge 3) { $ref_b2 = $ref_b2 -bor (1 -shl $bit) }
        }
        $ref16 = ($ref_b2 -shl 8) -bor $ref_b1

        # Enroll helper data
        $enrollJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') enroll_key --response16 $ref16
        $enrollData = $enrollJsonRaw | ConvertFrom-Json
        $helperInt = [Convert]::ToInt32($enrollData.helper_data_hex, 16)

        # Run Live Queries
        $liveQueries = @()
        for ($q = 1; $q -le $QueriesPerChallenge; $q++) {
            $live1 = Query-Hardware $serial $cfgs1 $ExciteCycles
            $live2 = Query-Hardware $serial $cfgs2 $ExciteCycles
            $noisy16 = ($live2 -shl 8) -bor $live1
            $liveQueries += @{
                query_index = $q
                noisy_response = $noisy16
            }
        }

        $allChallengeData += @{
            challenge_index = $idx
            challenge_str = $chalStr
            enrolled_key = $ref16
            enrolled_key_hex = $enrollData.reference_key_hex
            helper_data = $helperInt
            helper_data_hex = $enrollData.helper_data_hex
            live_queries = $liveQueries
        }

        if ($idx % 5 -eq 0 -or $idx -eq $NumChallenges) {
            Write-Host "  Processed $idx / $NumChallenges challenges... (Latest Key: $($enrollData.reference_key_hex))" -ForegroundColor Cyan
        }
    }

} finally {
    if ($serial.IsOpen) {
        $serial.Close()
    }
}

# Save full results to JSON
@{ challenges = $allChallengeData } | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $Output -Encoding UTF8
Write-Host ""
Write-Host "Raw sweep data saved to: $Output" -ForegroundColor Green

# Run comprehensive multi-challenge analysis
$reportOut = [IO.Path]::ChangeExtension($Output, '.analysis.json')
& $python (Join-Path $PSScriptRoot 'crypto_batch_analysis.py') --input $Output --output $reportOut

