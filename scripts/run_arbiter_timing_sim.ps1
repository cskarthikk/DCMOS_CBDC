param([ValidateSet('fast','slow')][string]$Corner='fast',
 [ValidateSet('min','max')][string]$Delay='min',
 [string]$VivadoBin='C:\AMDDesignTools\2025.2\Vivado\bin')
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$export=Join-Path $root 'build_sim/arbiter_timing'
if(!(Test-Path -LiteralPath (Join-Path $export 'core_routed.v'))){throw 'Run export_arbiter_timing.tcl first'}
$out=Join-Path $export ('core_'+$Corner+'_'+$Delay)
New-Item -ItemType Directory -Force -Path $out|Out-Null
Push-Location $out
try{
 $sdf=Join-Path $export ('core_'+$Corner+'.sdf')
 Copy-Item -LiteralPath $sdf -Destination design.sdf -Force
 $glbl='C:\AMDDesignTools\2025.2\Vivado\data\verilog\src\glbl.v'
 $compileArgs=@('--sv')
 if($Delay -eq 'max'){$compileArgs+=@('-d','SDF_MAX')}
 $compileArgs+=@((Join-Path $export 'core_routed.v'),(Join-Path $root 'sim/tb_arbiter_core_timing.v'),$glbl)
 & (Join-Path $VivadoBin 'xvlog.bat') @compileArgs *> compile.log
 if($LASTEXITCODE -ne 0){throw "Compile failed: $out/compile.log"}
 # Use an argument file so Windows .bat parsing cannot split root=file at '='.
 $argsElab=@('tb_arbiter_core_timing','glbl','-L','simprims_ver','-L','secureip','-debug','typical','-mt','off','-transport_int_delays','-pulse_r','0','-pulse_int_r','0',('-sdf'+$Delay),'/tb_arbiter_core_timing/dut=design.sdf','-s','arbiter_timing')
 $argsElab | Set-Content -LiteralPath elaborate.args
 & (Join-Path $VivadoBin 'xelab.bat') -f elaborate.args *> elaborate.log
 if($LASTEXITCODE -ne 0){throw "Elaboration failed: $out/elaborate.log"}
 $elabLog=Get-Content elaborate.log -Raw
 if($elabLog -match 'without back annotation|Unable to find instance path|Unable to determine HDL language'){throw "SDF annotation failed: $out/elaborate.log"}
 & (Join-Path $VivadoBin 'xsim.bat') arbiter_timing -runall *> run.log
 $log=Get-Content run.log -Raw
 if($LASTEXITCODE -ne 0 -or $log -match '(?im)^\s*(Fatal:|ERROR:)' -or $log -notmatch 'TRACE_COMPLETE'){throw "Simulation failed: $out/run.log"}
 Write-Output "TRACE_COMPLETE: $Corner/$Delay; review SDF coverage, timing violations, events.csv and summary.csv. This is not PUF certification."
}finally{Pop-Location}
