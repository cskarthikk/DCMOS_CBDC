param([string]$VivadoBin = 'C:\AMDDesignTools\2025.2\Vivado\bin')
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$vendorDir = Join-Path $projectRoot 'build_sim/vendor'
$installation = Split-Path (Split-Path $VivadoBin -Parent) -Parent
$vendorSource = Join-Path $installation 'data/verilog/src'
New-Item -ItemType Directory -Force $vendorDir | Out-Null
Push-Location $vendorDir
try {
    $files = @((Join-Path $vendorSource 'glbl.v'),
        (Join-Path $vendorSource 'retarget/FDCE_1.v'),
        (Join-Path $vendorSource 'unisims/FDCE.v'),
        (Join-Path $vendorSource 'unisims/LUT2.v'),
        (Join-Path $vendorSource 'unisims/LUT3.v'),
        '../../rtl/cbdc_puf_element.v','../../rtl/cbdc_puf_chain.v',
        '../../rtl/cbdc_puf_core.v','../../rtl/cbdc_puf_ctrl.v','../../rtl/cbdc_puf_top.v',
        '../../sim/tb_vendor_primitives.v')
    & (Join-Path $VivadoBin 'xvlog.bat') @files *> compile.log
    if($LASTEXITCODE -ne 0) {throw 'Vendor compile failed; see build_sim/vendor/compile.log'}
    & (Join-Path $VivadoBin 'xelab.bat') cbdc_puf_top glbl -s integrated_vendor -mt off *> top-elaborate.log
    if($LASTEXITCODE -ne 0) {throw 'Vendor integration elaboration failed'}
    & (Join-Path $VivadoBin 'xelab.bat') tb_vendor_primitives glbl -s vendor_units -mt off *> elaborate.log
    if($LASTEXITCODE -ne 0) {throw 'Vendor test elaboration failed'}
    & (Join-Path $VivadoBin 'xsim.bat') vendor_units -runall *> run.log
    $result=Get-Content run.log -Raw
    if($LASTEXITCODE -ne 0 -or $result -match '(?im)^\s*(Fatal:|ERROR:)' -or $result -notmatch 'PASS: AMD vendor') {
        Get-Content run.log -Tail 20
        throw 'Vendor primitive test failed'
    }
    Write-Output 'PASS: vendor integration elaboration and isolated primitive simulation'
} finally {Pop-Location}
