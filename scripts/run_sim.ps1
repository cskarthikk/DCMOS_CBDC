param([string]$VivadoBin = 'C:\AMDDesignTools\2025.2\Vivado\bin')
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$simulationDir = Join-Path $projectRoot 'build_sim'
New-Item -ItemType Directory -Force $simulationDir | Out-Null
function Invoke-SimTool([string]$Tool, [string[]]$ToolArgs, [string]$Log) {
    & (Join-Path $VivadoBin "$Tool.bat") @ToolArgs *> $Log
    if ($LASTEXITCODE -ne 0) {
        Get-Content $Log -Tail 25
        throw "$Tool failed ($LASTEXITCODE); see $Log"
    }
}
Push-Location $simulationDir
try {
    $sources = @('../sim/sim_unisim_primitives.v', '../rtl/cbdc_puf_element.v',
        '../rtl/cbdc_puf_chain.v', '../rtl/cbdc_puf_core.v', '../rtl/cbdc_puf_ctrl.v',
        '../rtl/cbdc_puf_top.v', '../sim/cbdc_puf_ref_model.v',
        '../sim/tb_cbdc_units.v', '../sim/tb_cbdc_ctrl.v', '../sim/tb_cbdc_puf_m1.v',
        '../sim/tb_invalid_params.v')
    Invoke-SimTool 'xvlog' (@('--sv') + $sources) 'compile.log'
    foreach ($test in @('tb_cbdc_units', 'tb_cbdc_ctrl', 'tb_cbdc_puf_m1', 'tb_invalid_params')) {
        Invoke-SimTool 'xelab' @($test, '-s', $test, '-debug', 'typical', '-mt', 'off') "$test-elaborate.log"
        # XSim can return zero after HDL $fatal: inspect log AND completion marker.
        & (Join-Path $VivadoBin 'xsim.bat') $test '-runall' *> "$test-run.log"
        $code = $LASTEXITCODE
        $result = Get-Content "$test-run.log" -Raw
        if ($test -eq 'tb_invalid_params') {
            if ($result -notmatch 'Fatal: Cycle counts must fit timer' -or $result -match 'invalid parameter accepted') {
                throw "Parameter rejection did not behave as expected; see $test-run.log"
            }
            Write-Output 'PASS: invalid HOLD_CYCLES rejected (intentional fatal)'
        } elseif ($code -ne 0 -or $result -match '(?im)^\s*(Fatal:|ERROR:)|\[FAIL\]' -or
                  $result -notmatch 'PASS:|ALL TESTS PASSED \(0 ERRORS\)') {
            Get-Content "$test-run.log" -Tail 30
            throw "Test failed: $test"
        } else {
            Write-Output "PASS: $test"
        }
    }
    Write-Output 'Artificial-delay suite passed. No physical PUF behavior is validated.'
} finally { Pop-Location }
