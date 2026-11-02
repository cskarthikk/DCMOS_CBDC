param([string]$VivadoBin='C:\AMDDesignTools\2025.2\Vivado\bin')
$ErrorActionPreference='Stop'
$projectRoot=Split-Path $PSScriptRoot -Parent
$outputDir=Join-Path $projectRoot 'build_sim/board'
New-Item -ItemType Directory -Force $outputDir | Out-Null
Push-Location $outputDir
try {
    $sources=@('../../sim/sim_unisim_primitives.v')
    $sources+=@(Get-ChildItem (Join-Path $projectRoot 'rtl') -Filter '*.v' | ForEach-Object FullName)
    $sources+='../../sim/tb_cbdc_basys3.v'
    & (Join-Path $VivadoBin 'xvlog.bat') --sv @sources *> compile.log
    if($LASTEXITCODE -ne 0){throw 'Board compile failed: build_sim/board/compile.log'}
    & (Join-Path $VivadoBin 'xelab.bat') tb_cbdc_basys3 -s board -debug typical -mt off *> elaborate.log
    if($LASTEXITCODE -ne 0){throw 'Board elaboration failed: build_sim/board/elaborate.log'}
    & (Join-Path $VivadoBin 'xsim.bat') board -runall *> run.log
    $result=Get-Content run.log -Raw
    if($LASTEXITCODE -ne 0 -or $result -match '(?im)^\s*(Fatal:|ERROR:)' -or $result -notmatch 'PASS: Basys3'){
        Get-Content run.log -Tail 25
        throw 'Board simulation failed'
    }
    Write-Output 'PASS: Basys3 board-interface regression (artificial PUF delays)'
} finally {Pop-Location}
