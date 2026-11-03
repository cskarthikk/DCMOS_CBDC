# ==============================================================================
# Script: run_array_build.ps1
# Description:
#   Executes batch synthesis, implementation, and bitstream generation for the
#   128-core CBDC-PUF array on Digilent Basys 3.
# ==============================================================================

param(
    [string]$VivadoPath = "vivado"
)

$ErrorActionPreference = "Stop"

# Try standard Vivado installation locations if 'vivado' not in PATH
$vivadoCandidates = @(
    $VivadoPath,
    "C:\Xilinx\Vivado\2024.1\bin\vivado.bat",
    "C:\Xilinx\Vivado\2023.2\bin\vivado.bat",
    "C:\Xilinx\Vivado\2023.1\bin\vivado.bat",
    "C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat"
)

$resolvedVivado = $null
foreach ($cand in $vivadoCandidates) {
    if (Get-Command $cand -ErrorAction SilentlyContinue) {
        $resolvedVivado = $cand
        break
    } elseif (Test-Path $cand) {
        $resolvedVivado = $cand
        break
    }
}

if (-not $resolvedVivado) {
    Write-Warning "Vivado executable not found in PATH or standard installation directories."
    Write-Host "To run the build on a machine with Vivado installed, execute:"
    Write-Host "  vivado -mode batch -source scripts/build_array_bitstream.tcl"
    exit 0
}

Write-Host "Found Vivado at: $resolvedVivado"
Write-Host "Launching 128-Core CBDC-PUF Bitstream Build..."

& $resolvedVivado -mode batch -source scripts/build_array_bitstream.tcl

