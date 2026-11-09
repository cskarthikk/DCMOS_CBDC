param(
    [string]$Port = 'COM5',
    [ValidateRange(5, 500)][int]$NumChallenges = 50,
    [ValidateRange(2, 50)][int]$QueriesPerChallenge = 5,
    [ValidateSet(8, 64)][int]$Cores = 64,
    [int]$ExciteCycles = 0,
    [string]$Output = ''
)

$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$python = Join-Path $root 'runtime\python\python.exe'
if (!(Test-Path -LiteralPath $python)) {
    $python = 'python'
}

if ($ExciteCycles -le 0) {
    if ($Cores -eq 64) { $ExciteCycles = 22 } else { $ExciteCycles = 8 }
}

if (!$Output) {
    $Output = Join-Path $root ("measurements/batch_sweep_" + [Guid]::NewGuid().ToString('N') + ".json")
}
$Output = [IO.Path]::GetFullPath($Output)
New-Item -ItemType Directory -Force (Split-Path $Output -Parent) | Out-Null

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "      CBDC-PUF MULTI-CHALLENGE ROBUSTNESS & UNIQUENESS SWEEP            " -ForegroundColor Cyan
Write-Host "   Testing $NumChallenges SHA-3 Challenges x $QueriesPerChallenge Live Queries on $Port ($Cores Cores)   " -ForegroundColor Cyan
Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host ""

function Query-Hardware-8([System.IO.Ports.SerialPort]$serial, [int[]]$cfgs, [int]$excite) {
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
    for ($i = 0; $i -lt 21; $i++) { $reply[$i] = [byte]$serial.ReadByte() }
    $crc = 0
    for ($i = 0; $i -lt 20; $i++) { $crc = $crc -bxor $reply[$i] }
    if ($reply[0] -ne 0x5C -or $reply[20] -ne $crc -or $reply[18] -ne 0x61) {
        throw "FPGA UART frame error on port $Port."
    }
    return [int]$reply[19]
}

function Query-Hardware-64([System.IO.Ports.SerialPort]$serial, [int[]]$cfgs, [int]$excite) {
    $control = ($excite -shl 1)
    $request = New-Object byte[] 131
    $request[0] = 0xA6
    $request[1] = [byte]$control
    $crc = 0
    for ($c = 0; $c -lt 64; $c++) {
        $v = [int]$cfgs[$c]
        $request[2 + 2 * $c] = [byte]($v -band 0xFF)
        $request[3 + 2 * $c] = [byte](($v -shr 8) -band 0xFF)
    }
    for ($i = 0; $i -le 129; $i++) { $crc = $crc -bxor $request[$i] }
    $request[130] = [byte]$crc

    $serial.Write($request, 0, 131)
    $reply = New-Object byte[] 140
    for ($i = 0; $i -lt 140; $i++) { $reply[$i] = [byte]$serial.ReadByte() }
    $crc = 0
    for ($i = 0; $i -lt 139; $i++) { $crc = $crc -bxor $reply[$i] }
    if ($reply[0] -ne 0xD6 -or $reply[139] -ne $crc -or $reply[130] -ne 0x61 -or $reply[1] -ne $control) {
        throw "FPGA UART frame error on port $Port."
    }
    return [BitConverter]::ToUInt64($reply, 131)
}

$serial = [System.IO.Ports.SerialPort]::new($Port, 115200, [System.IO.Ports.Parity]::None, 8, [System.IO.Ports.StopBits]::One)
$serial.ReadTimeout = 3000
$serial.WriteTimeout = 3000

$allChallengeData = @()

try {
    $serial.Open()
    Start-Sleep -Milliseconds 150
    $serial.DiscardInBuffer()

    Write-Host "Executing sweep on live Basys 3 hardware ($Cores cores)..."

    for ($chIndex = 1; $chIndex -le $NumChallenges; $chIndex++) {
        $challengeStr = "DCMOS_Sweep_Challenge_${chIndex}_$(Get-Date -Format 'yyyyMMddHHmmssffff')"
        
        # 1. SHA-3 Challenge Preprocessing
        $shaRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') hash_challenge --challenge $challengeStr --cores $Cores
        $sha = $shaRaw | ConvertFrom-Json

        if ($Cores -eq 64) {
            $cfgs = $sha.configurations_int

            # 2. Baseline Enrollment (5 samples, majority vote)
            $samples = @()
            for ($s = 1; $s -le 5; $s++) {
                $samples += Query-Hardware-64 $serial $cfgs $ExciteCycles
            }

            [uint64]$refKey = 0
            for ($bit = 0; $bit -lt 64; $bit++) {
                $cnt = 0
                foreach ($sm in $samples) {
                    if ((($sm -shr $bit) -band 1) -eq 1) { $cnt++ }
                }
                if ($cnt -ge 3) {
                    $refKey = $refKey -bor ([uint64]1 -shl $bit)
                }
            }

            # 3. Helper Data Generation via MultiBlock BCH
            $refHex = '0x{0:X16}' -f $refKey
            $enrollRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') enroll_key64 --response64 $refHex
            $enroll = $enrollRaw | ConvertFrom-Json
            $helpersList = @($enroll.helpers_data_hex | ForEach-Object { [Convert]::ToInt32($_, 16) })

            # 4. Live Multi-Query Measurements
            $liveQueries = @()
            for ($q = 1; $q -le $QueriesPerChallenge; $q++) {
                [uint64]$resp = Query-Hardware-64 $serial $cfgs $ExciteCycles
                $liveQueries += @{
                    query_index = $q
                    noisy_response = $resp
                    noisy_response_hex = '0x{0:X16}' -f $resp
                }
            }

            $allChallengeData += @{
                challenge_index = $chIndex
                challenge_string = $challengeStr
                enrolled_key = $refKey
                enrolled_key_hex = $refHex
                helper_data = $helpersList
                live_queries = $liveQueries
            }

        } else {
            # 8-core mode
            $cfgs1 = $sha.configurations_int
            $cfgs2 = @()
            for ($i = 0; $i -lt 8; $i++) {
                $cfgs2 += ($cfgs1[$i] -bxor 0x7FFE)
            }

            $samples1 = @(); $samples2 = @()
            for ($s = 1; $s -le 5; $s++) {
                $samples1 += Query-Hardware-8 $serial $cfgs1 $ExciteCycles
                $samples2 += Query-Hardware-8 $serial $cfgs2 $ExciteCycles
            }

            $ref_b1 = 0; $ref_b2 = 0
            for ($bit = 0; $bit -lt 8; $bit++) {
                $cnt1 = ($samples1 | Where-Object { ($_ -shr $bit) -band 1 }).Count
                if ($cnt1 -ge 3) { $ref_b1 = $ref_b1 -bor (1 -shl $bit) }
                $cnt2 = ($samples2 | Where-Object { ($_ -shr $bit) -band 1 }).Count
                if ($cnt2 -ge 3) { $ref_b2 = $ref_b2 -bor (1 -shl $bit) }
            }
            $ref16 = ($ref_b2 -shl 8) -bor $ref_b1

            $enrollRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') enroll_key --response16 $ref16
            $enroll = $enrollRaw | ConvertFrom-Json
            $helperInt = [Convert]::ToInt32($enroll.helper_data_hex, 16)

            $liveQueries = @()
            for ($q = 1; $q -le $QueriesPerChallenge; $q++) {
                $lb1 = Query-Hardware-8 $serial $cfgs1 $ExciteCycles
                $lb2 = Query-Hardware-8 $serial $cfgs2 $ExciteCycles
                $noisy16 = ($lb2 -shl 8) -bor $lb1
                $liveQueries += @{
                    query_index = $q
                    noisy_response = $noisy16
                    noisy_response_hex = '0x{0:X4}' -f $noisy16
                }
            }

            $allChallengeData += @{
                challenge_index = $chIndex
                challenge_string = $challengeStr
                enrolled_key = $ref16
                enrolled_key_hex = '0x{0:X4}' -f $ref16
                helper_data = $helperInt
                live_queries = $liveQueries
            }
        }

        if ($chIndex % 5 -eq 0 -or $chIndex -eq $NumChallenges) {
            $latestKey = if ($Cores -eq 64) { '0x{0:X16}' -f $refKey } else { '0x{0:X4}' -f $ref16 }
            Write-Host "  Processed $chIndex / $NumChallenges challenges... (Latest Key: $latestKey)"
        }
    }

} finally {
    if ($serial.IsOpen) {
        $serial.Close()
    }
}

$payload = @{
    date = (Get-Date).ToString("yyyy-MM-ddTHH:mm:sszzz")
    port = $Port
    cores = $Cores
    key_bits = $(if ($Cores -eq 64) { 64 } else { 16 })
    excite_cycles = $ExciteCycles
    num_challenges = $NumChallenges
    queries_per_challenge = $QueriesPerChallenge
    challenges = $allChallengeData
}

$jsonText = $payload | ConvertTo-Json -Depth 5
[System.IO.File]::WriteAllText($Output, $jsonText, [System.Text.Encoding]::UTF8)
Write-Host ""
Write-Host "Raw sweep data saved to: $Output"

# Invoke analysis script
& $python (Join-Path $PSScriptRoot 'crypto_batch_analysis.py') --input $Output
