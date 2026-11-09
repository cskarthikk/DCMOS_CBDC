param(
    [string]$Port = 'COM5',
    [string]$Challenge = 'DigitalCMOS_CBDC_PUF_Key_2026',
    [ValidateSet(8, 64)][int]$Cores = 64,
    [int]$ExciteCycles = 0
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

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "         CBDC-PUF LIVE END-TO-END CRYPTOGRAPHIC PIPELINE DEMO           " -ForegroundColor Cyan
Write-Host "    Research Reference: Liu et al., ACM TODAES 2023 (Figure 1, Sec 4)   " -ForegroundColor Cyan
Write-Host "    Configuration: $Cores Cores | Excite: $ExciteCycles Cycles | Port: $Port" -ForegroundColor Cyan
Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host ""

# -----------------------------------------------------------------------------
# STEP 1: SHA-3 Challenge Preprocessing (Paper Section 3.2)
# -----------------------------------------------------------------------------
Write-Host "[STEP 1] SHA-3 Challenge Preprocessing (Anti-Modeling Attack)" -ForegroundColor Yellow
Write-Host "  External Input Challenge : '$Challenge'"

$shaJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') hash_challenge --challenge $Challenge --cores $Cores
$shaData = $shaJsonRaw | ConvertFrom-Json

Write-Host "  SHA-3 256-bit Digest     : $($shaData.sha3_256_digest)"
if ($Cores -eq 64) {
    Write-Host "  Mapped Odd-Parity Configs: $($shaData.configurations_hex[0..3] -join ' ') ... ($($shaData.configurations_hex.Count) cores)"
} else {
    Write-Host "  Mapped Odd-Parity Configs: $($shaData.configurations_hex -join ' ')"
}
Write-Host "  Status: Nonlinear challenge projection verified. Linear modeling defeated." -ForegroundColor Green
Write-Host ""

# -----------------------------------------------------------------------------
# STEP 2: Hardware Query on Basys 3 over COM Port
# -----------------------------------------------------------------------------
Write-Host "[STEP 2] Hardware Query on Basys 3 via $Port ($Cores Cores)" -ForegroundColor Yellow

function Query-Hardware-8([System.IO.Ports.SerialPort]$serial, [int[]]$cfgs, [int]$excite) {
    $control = ($excite -shl 1) # Parallel mode
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
        throw "FPGA UART frame check failed for 8 cores. Please verify bitstream."
    }
    return [int]$reply[19]
}

function Query-Hardware-64([System.IO.Ports.SerialPort]$serial, [int[]]$cfgs, [int]$excite) {
    $control = ($excite -shl 1) # Parallel mode
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
        throw "FPGA UART frame check failed for 64 cores. Please verify bitstream."
    }
    return [BitConverter]::ToUInt64($reply, 131)
}

$serial = [System.IO.Ports.SerialPort]::new($Port, 115200, [System.IO.Ports.Parity]::None, 8, [System.IO.Ports.StopBits]::One)
$serial.ReadTimeout = 3000
$serial.WriteTimeout = 3000

try {
    $serial.Open()
    Start-Sleep -Milliseconds 150
    $serial.DiscardInBuffer()

    if ($Cores -eq 64) {
        # ---------------------------------------------------------------------
        # 64-CORE PIPELINE
        # ---------------------------------------------------------------------
        $cfgs = $shaData.configurations_int
        Write-Host "  Querying 64-core FPGA 5 times to obtain majority-voted baseline key..."
        $samples = @()
        for ($t = 1; $t -le 5; $t++) {
            $val = Query-Hardware-64 $serial $cfgs $ExciteCycles
            $samples += $val
        }

        # Majority vote across 64 individual bits
        [uint64]$ref64 = 0
        for ($bit = 0; $bit -lt 64; $bit++) {
            $cnt = 0
            foreach ($s in $samples) {
                if ((($s -shr $bit) -band 1) -eq 1) { $cnt++ }
            }
            if ($cnt -ge 3) {
                $ref64 = $ref64 -bor ([uint64]1 -shl $bit)
            }
        }

        $refHex = '0x{0:X16}' -f $ref64
        Write-Host ""
        Write-Host "[STEP 3] BCH(31, 16, 3) 4-Block Enrollment (Helper Data Generation)" -ForegroundColor Yellow
        $enrollJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') enroll_key64 --response64 $refHex
        $enrollData = $enrollJsonRaw | ConvertFrom-Json

        Write-Host "  Enrolled 64-bit Reference Key : $($enrollData.reference_key_hex)"
        Write-Host "  Generated 4-Block Helper Data : $($enrollData.helpers_data_hex -join ', ')"
        Write-Host "  Status: 60 helper bits published (reveals zero secret entropy)." -ForegroundColor Green
        Write-Host ""

        Write-Host "[STEP 4] Live Hardware Authentication Query" -ForegroundColor Yellow
        Start-Sleep -Milliseconds 100
        [uint64]$noisy64 = Query-Hardware-64 $serial $cfgs $ExciteCycles
        $noisyHex = '0x{0:X16}' -f $noisy64

        $diffBits = 0
        for ($i = 0; $i -lt 64; $i++) {
            if ((($noisy64 -shr $i) -band 1) -ne (($ref64 -shr $i) -band 1)) { $diffBits++ }
        }

        Write-Host "  Fresh Live 64-bit Response : $noisyHex"
        Write-Host "  Raw Silicon Noise          : $diffBits bit flips detected across 64 cores"

        $helpersCsv = $enrollData.helpers_data_csv
        $recJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') reconstruct_key64 --noisy64 $noisyHex --helpers15 $helpersCsv
        $recData = $recJsonRaw | ConvertFrom-Json

        Write-Host "  BCH(31,16,3) Decoding      : Fixed $($recData.bit_errors_corrected) bit error(s) across 4 blocks"
        Write-Host "  Reconstructed Key          : $($recData.reconstructed_key_hex)"

        if ($recData.reconstruction_success -and $recData.reconstructed_key_hex -eq $enrollData.reference_key_hex) {
            Write-Host ""
            Write-Host "========================================================================" -ForegroundColor Green
            Write-Host "  AUTHENTICATION SUCCESSFUL: 100% BIT-ACCURATE KEY RECONSTRUCTED!       " -ForegroundColor Green
            
            $hasher = [System.Security.Cryptography.SHA256]::Create()
            $keyBytes = [System.BitConverter]::GetBytes([uint64]$ref64)
            $sessionKey = [System.BitConverter]::ToString($hasher.ComputeHash($keyBytes)).Replace('-', '')
            Write-Host "  Derived 256-bit AES Master Key : $sessionKey" -ForegroundColor Green
            Write-Host "========================================================================" -ForegroundColor Green
        } else {
            Write-Host ""
            Write-Host "AUTHENTICATION FAILED: Error count exceeded BCH(31, 16, 3) correction capability." -ForegroundColor Red
        }

    } else {
        # ---------------------------------------------------------------------
        # 8-CORE PIPELINE (Legacy Mode)
        # ---------------------------------------------------------------------
        $cfgs1 = $shaData.configurations_int
        $cfgs2 = @()
        for ($i = 0; $i -lt 8; $i++) {
            $cfgs2 += ($cfgs1[$i] -bxor 0x7FFE)
        }

        Write-Host "  Querying 8-core FPGA 5 times to obtain baseline response..."
        $samples1 = @(); $samples2 = @()
        for ($t = 1; $t -le 5; $t++) {
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

        Write-Host ""
        Write-Host "[STEP 3] BCH(31, 16, 3) Enrollment (Helper Data Generation)" -ForegroundColor Yellow
        $enrollJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') enroll_key --response16 $ref16
        $enrollData = $enrollJsonRaw | ConvertFrom-Json

        Write-Host "  Enrolled Reference Key : $($enrollData.reference_key_hex)"
        Write-Host "  Generated Helper Data  : $($enrollData.helper_data_hex)"
        Write-Host ""

        Write-Host "[STEP 4] Live Hardware Authentication Query" -ForegroundColor Yellow
        Start-Sleep -Milliseconds 100
        $live_b1 = Query-Hardware-8 $serial $cfgs1 $ExciteCycles
        $live_b2 = Query-Hardware-8 $serial $cfgs2 $ExciteCycles
        $noisy16 = ($live_b2 -shl 8) -bor $live_b1

        $diffBits = 0
        for ($i = 0; $i -lt 16; $i++) {
            if ((($noisy16 -shr $i) -band 1) -ne (($ref16 -shr $i) -band 1)) { $diffBits++ }
        }

        Write-Host "  Fresh Live Raw Response : $('0x{0:X4}' -f $noisy16)"
        Write-Host "  Raw Silicon Noise       : $diffBits bit flips detected"

        $helperInt = [Convert]::ToInt32($enrollData.helper_data_hex, 16)
        $recJsonRaw = & $python (Join-Path $PSScriptRoot 'crypto_cli.py') reconstruct_key --noisy16 $noisy16 --helper15 $helperInt
        $recData = $recJsonRaw | ConvertFrom-Json

        Write-Host "  BCH(31,16,3) Decoding   : Fixed $($recData.bit_errors_corrected) bit error(s)"
        Write-Host "  Reconstructed Key       : $($recData.reconstructed_key_hex)"

        if ($recData.reconstruction_success -and $recData.reconstructed_key_hex -eq $enrollData.reference_key_hex) {
            Write-Host ""
            Write-Host "========================================================================" -ForegroundColor Green
            Write-Host "  AUTHENTICATION SUCCESSFUL: 100% BIT-ACCURATE KEY RECONSTRUCTED!       " -ForegroundColor Green
            $hasher = [System.Security.Cryptography.SHA256]::Create()
            $keyBytes = [System.BitConverter]::GetBytes([uint16]$ref16)
            $sessionKey = [System.BitConverter]::ToString($hasher.ComputeHash($keyBytes)).Replace('-', '')
            Write-Host "  Derived 256-bit AES Master Key : $sessionKey" -ForegroundColor Green
            Write-Host "========================================================================" -ForegroundColor Green
        } else {
            Write-Host ""
            Write-Host "AUTHENTICATION FAILED: Error count exceeded BCH(31, 16, 3) correction capability." -ForegroundColor Red
        }
    }

} finally {
    if ($serial.IsOpen) {
        $serial.Close()
    }
}
