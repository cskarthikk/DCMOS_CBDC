param([string]$VivadoBin='C:\AMDDesignTools\2025.2\Vivado\bin')
$ErrorActionPreference='Stop'
$projectRoot=Split-Path $PSScriptRoot -Parent
$outputDir=Join-Path $projectRoot 'build_sim/pulled_single'
New-Item -ItemType Directory -Force $outputDir | Out-Null
Push-Location $outputDir
try {
    $sources=@('../../sim/sim_unisim_primitives.v')
    $sources+=@('cbdc_uart','cbdc_button','cbdc_puf_element','cbdc_puf_chain','cbdc_puf_core','cbdc_puf_ctrl','cbdc_puf_serial') | ForEach-Object {Join-Path $projectRoot ('rtl/'+$_+'.v')}
    $sources+='../../sim/tb_pulled_single.v'
    & (Join-Path $VivadoBin 'xvlog.bat') --sv @sources *> compile.log
    if($LASTEXITCODE -ne 0){throw 'Board compile failed: build_sim/pulled_single/compile.log'}
    & (Join-Path $VivadoBin 'xelab.bat') tb_pulled_single -s serial -debug typical -mt off *> elaborate.log
    if($LASTEXITCODE -ne 0){throw 'Board elaboration failed: build_sim/pulled_single/elaborate.log'}
    & (Join-Path $VivadoBin 'xsim.bat') serial -runall *> run.log
    $result=Get-Content run.log -Raw
    if($LASTEXITCODE -ne 0 -or $result -match '(?im)^\s*(Fatal:|ERROR:)' -or $result -notmatch 'PASS: serial'){
        Get-Content run.log -Tail 25
        throw 'Board simulation failed'
    }
    Write-Output 'PASS: serial board-interface regression (artificial PUF delays)'
} finally {Pop-Location}

