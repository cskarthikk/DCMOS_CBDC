param(
    [string]$Bitstream = '',
    [string]$VivadoPath = ''
)

$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent

if (!$Bitstream) {
    $Bitstream = Join-Path $root 'bitstream\paper_array64.bit'
}

if (!(Test-Path -LiteralPath $Bitstream)) {
    throw "Bitstream file not found at: $Bitstream"
}

if (!$VivadoPath) {
    $candidates = @(
        'C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat',
        'C:\Xilinx\Vivado\2025.2\bin\vivado.bat',
        'C:\Xilinx\Vivado\2024.2\bin\vivado.bat',
        'C:\Xilinx\Vivado\2023.2\bin\vivado.bat',
        'vivado.bat'
    )
    foreach ($c in $candidates) {
        if ($c -eq 'vivado.bat') {
            $cmd = Get-Command vivado.bat -ErrorAction SilentlyContinue
            if ($cmd) { $VivadoPath = $cmd.Source; break }
        } elseif (Test-Path -LiteralPath $c) {
            $VivadoPath = $c
            break
        }
    }
}

if (!$VivadoPath -or !(Test-Path -LiteralPath $VivadoPath)) {
    Write-Host "Vivado executable not found automatically in standard locations." -ForegroundColor Yellow
    Write-Host "Please specify path with -VivadoPath, for example:" -ForegroundColor Yellow
    Write-Host "  powershell -File scripts\program_board.ps1 -VivadoPath 'C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat'" -ForegroundColor Yellow
    exit 1
}

$programTcl = Join-Path $PSScriptRoot 'program.tcl'
$logFile = Join-Path $root ("program_" + [Guid]::NewGuid().ToString('N') + ".log")

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "             PROGRAMMING DIGILENT BASYS 3 (XC7A35T) FPGA                " -ForegroundColor Cyan
Write-Host "  Bitstream : $Bitstream" -ForegroundColor Cyan
Write-Host "  Vivado    : $VivadoPath" -ForegroundColor Cyan
Write-Host "========================================================================" -ForegroundColor Cyan

& $VivadoPath -mode batch -notrace -nojournal -log $logFile -source $programTcl -tclargs $Bitstream PROGRAM_SELECTED_BITSTREAM

if ($LASTEXITCODE -ne 0) {
    Write-Host "Programming failed! Inspect log: $logFile" -ForegroundColor Red
    exit 1
} else {
    Write-Host "Programming succeeded! Board is configured and ready." -ForegroundColor Green
    if (Test-Path $logFile) { Remove-Item $logFile -Force }
}

