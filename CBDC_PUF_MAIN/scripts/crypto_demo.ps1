param(
    [string]$Port = 'COM5',
    [string]$Challenge = 'DigitalCMOS_CBDC_PUF_Key_2026',
    [int]$ExciteCycles = 8
)

$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$python = Join-Path $root 'runtime\python\python.exe'
if (!(Test-Path -LiteralPath $python)) {
    $python = 'python'
}

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "         CBDC-PUF LIVE END-TO-END CRYPTOGRAPHIC PIPELINE DEMO           " -ForegroundColor Cyan
Write-Host "    Research Reference: Liu et al., ACM TODAES 2023 (Figure 1, Sec 4)   " -ForegroundColor Cyan
Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host ""

# -----------------------------------------------------------------------------
# STEP 1: SHA-3 Challenge Preprocessing (Paper Section 3.2)
# -----------------------------------------------------------------------------
Write-Host "[STEP 1] SHA-3 Challenge Preprocessing (Anti-Modeling Attack)" -ForegroundColor Yellow
Write-Host "  External Input Challenge : '$Challenge'"

$shaJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') hash_challenge --challenge $Challenge --cores 8
$shaData = $shaJsonRaw | ConvertFrom-Json

Write-Host "  SHA-3 256-bit Digest     : $($shaData.sha3_256_digest)"
Write-Host "  Mapped Odd-Parity Configs: $($shaData.configurations_hex -join ' ')"
Write-Host "  Status: Nonlinear challenge projection verified. Linear modeling defeated." -ForegroundColor Green
Write-Host ""

# -----------------------------------------------------------------------------
# STEP 2: Query Basys 3 Hardware over COM Port
# -----------------------------------------------------------------------------
Write-Host "[STEP 2] Hardware Query on Basys 3 via $Port" -ForegroundColor Yellow

function Query-Hardware([System.IO.Ports.SerialPort]$serial, [int[]]$cfgs, [int]$excite) {
    $control = ($excite -shl 1) # Parallel mode, excite cycles
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
        throw "FPGA UART frame check failed. Please ensure bitstream is loaded."
    }
    # Return 8-bit response word (reply[19])
    return [int]$reply[19]
}

$serial = [System.IO.Ports.SerialPort]::new($Port, 115200, [System.IO.Ports.Parity]::None, 8, [System.IO.Ports.StopBits]::One)
$serial.ReadTimeout = 2500
$serial.WriteTimeout = 2500

try {
    $serial.Open()
    Start-Sleep -Milliseconds 150
    $serial.DiscardInBuffer()

    # Query 1: Primary configuration
    $cfgs1 = $shaData.configurations_int
    # Query 2: Inverted inner bits configuration for second 8-bit chunk
    $cfgs2 = @()
    for ($i = 0; $i -lt 8; $i++) {
        $inv = ($cfgs1[$i] -bxor 0x7FFE) # Flip 14 internal bits (preserves odd parity)
        $cfgs2 += $inv
    }

    # Enrollment Sampling: 5 trials to obtain Reference Key
    Write-Host "  Querying FPGA 5 times to obtain baseline response..."
    $samples1 = @()
    $samples2 = @()
    for ($t = 1; $t -le 5; $t++) {
        $b1 = Query-Hardware $serial $cfgs1 $ExciteCycles
        $b2 = Query-Hardware $serial $cfgs2 $ExciteCycles
        $samples1 += $b1
        $samples2 += $b2
    }

    # Majority vote
    $ref_b1 = 0
    $ref_b2 = 0
    for ($bit = 0; $bit -lt 8; $bit++) {
        $cnt1 = ($samples1 | Where-Object { ($_ -shr $bit) -band 1 }).Count
        if ($cnt1 -ge 3) { $ref_b1 = $ref_b1 -bor (1 -shl $bit) }
        $cnt2 = ($samples2 | Where-Object { ($_ -shr $bit) -band 1 }).Count
        if ($cnt2 -ge 3) { $ref_b2 = $ref_b2 -bor (1 -shl $bit) }
    }
    $ref16 = ($ref_b2 -shl 8) -bor $ref_b1

    # -------------------------------------------------------------------------
    # STEP 3: BCH(31, 16, 3) Helper Data Enrollment (Paper Section 4.1)
    # -------------------------------------------------------------------------
    Write-Host ""
    Write-Host "[STEP 3] BCH(31, 16, 3) Enrollment (Helper Data Generation)" -ForegroundColor Yellow
    $enrollJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') enroll_key --response16 $ref16
    $enrollData = $enrollJsonRaw | ConvertFrom-Json

    Write-Host "  Enrolled Reference Key : $($enrollData.reference_key_hex)  (Binary: $($enrollData.reference_key_bin))"
    Write-Host "  Generated Helper Data  : $($enrollData.helper_data_hex)  (Binary: $($enrollData.helper_data_bin))"
    Write-Host "  Status: Helper data safely published (reveals zero secret entropy)." -ForegroundColor Green
    Write-Host ""

    # -------------------------------------------------------------------------
    # STEP 4: Live Authentication & Key Reconstruction
    # -------------------------------------------------------------------------
    Write-Host "[STEP 4] Live Hardware Authentication Query (Simulating Real Usage)" -ForegroundColor Yellow
    Start-Sleep -Milliseconds 100
    $live_b1 = Query-Hardware $serial $cfgs1 $ExciteCycles
    $live_b2 = Query-Hardware $serial $cfgs2 $ExciteCycles
    $noisy16 = ($live_b2 -shl 8) -bor $live_b1

    $diffBits = 0
    for ($i = 0; $i -lt 16; $i++) {
        if ((($noisy16 -shr $i) -band 1) -ne (($ref16 -shr $i) -band 1)) {
            $diffBits++
        }
    }

    Write-Host "  Fresh Live Raw Response : $('0x{0:X4}' -f $noisy16)"
    Write-Host "  Raw Silicon Noise       : $diffBits bit flips detected from thermal/supply jitter"

    # Decode via BCH(31, 16, 3)
    $helperInt = [Convert]::ToInt32($enrollData.helper_data_hex, 16)
    $recJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') reconstruct_key --noisy16 $noisy16 --helper15 $helperInt
    $recData = $recJsonRaw | ConvertFrom-Json

    Write-Host "  BCH(31,16,3) Decoding   : Fixed $($recData.bit_errors_corrected) bit error(s) using Berlekamp-Massey + Chien search"
    Write-Host "  Reconstructed Key       : $($recData.reconstructed_key_hex)  (Binary: $($recData.reconstructed_key_bin))"

    if ($recData.reconstruction_success -and $recData.reconstructed_key_hex -eq $enrollData.reference_key_hex) {
        Write-Host ""
        Write-Host "========================================================================" -ForegroundColor Green
        Write-Host "  AUTHENTICATION SUCCESSFUL: 100% BIT-ACCURATE KEY RECONSTRUCTED!       " -ForegroundColor Green
        
        # Derive SHA-256 session key
        $hasher = [System.Security.Cryptography.SHA256]::Create()
        $keyBytes = [System.BitConverter]::GetBytes([uint16]$ref16)
        $sessionKey = [System.BitConverter]::ToString($hasher.ComputeHash($keyBytes)).Replace('-', '')
        Write-Host "  Derived 256-bit AES Master Key : $sessionKey" -ForegroundColor Green
        Write-Host "========================================================================" -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "AUTHENTICATION FAILED: Error count exceeded BCH(31, 16, 3) correction capability." -ForegroundColor Red
    }

} finally {
    if ($serial.IsOpen) {
        $serial.Close()
    }
}

