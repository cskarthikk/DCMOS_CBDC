param([ValidateSet('fast','slow')][string]$Corner='fast',[ValidateSet('min','max')][string]$Delay='min',
 [string]$VivadoBin='C:\AMDDesignTools\2025.2\Vivado\bin')
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent;$build=Join-Path $root 'build_m1/core_experiment'
$out=Join-Path $root ('build_sim/experiment_postroute/'+$Corner+'_'+$Delay)
New-Item -ItemType Directory -Force -Path $out|Out-Null
Push-Location $out
try{
 Copy-Item -LiteralPath (Join-Path $build ('core_'+$Corner+'.sdf')) -Destination design.sdf -Force
 $install=Split-Path (Split-Path $VivadoBin -Parent) -Parent
 & (Join-Path $VivadoBin 'xvlog.bat') --sv (Join-Path $build 'core_routed.v') (Join-Path $root 'sim/tb_experiment_postroute.v') (Join-Path $install 'data/verilog/src/glbl.v') *> compile.log
 if($LASTEXITCODE-ne 0){throw "Compile failed: $out"}
 @('tb_experiment_postroute','glbl','-L','simprims_ver','-L','secureip','-debug','typical','-mt','off','-transport_int_delays','-pulse_r','0','-pulse_int_r','0',('-sdf'+$Delay),'/tb_experiment_postroute/dut=design.sdf','-s','postroute')|Set-Content elaborate.args
 & (Join-Path $VivadoBin 'xelab.bat') -f elaborate.args *> elaborate.log
 if($LASTEXITCODE-ne 0){throw "Elaboration failed: $out"}
 $elab=Get-Content elaborate.log -Raw
 if($elab-notmatch 'backannotation was successful' -or $elab-match 'without back annotation|Unable to find instance path'){throw "Annotation failed: $out"}
 & (Join-Path $VivadoBin 'xsim.bat') postroute -runall *> run.log
 $log=Get-Content run.log -Raw
 if($LASTEXITCODE-ne 0 -or $log-match '(?im)^\s*(Fatal:|ERROR:)' -or $log-notmatch 'PASS: postroute'){Get-Content run.log -Tail 15;throw "Postroute check failed: $out"}
 Write-Output "PASS: $Corner/$Delay core self-disable model; inspect timing checks, no silicon guarantee"
}finally{Pop-Location}
