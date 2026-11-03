param([string]$VivadoBin='C:\AMDDesignTools\2025.2\Vivado\bin',
 [ValidateSet('tb_experiment','tb_experiment_coverage')][string]$Top='tb_experiment')
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$out=Join-Path $root ('build_sim/'+$Top)
New-Item -ItemType Directory -Force -Path $out|Out-Null
Push-Location $out
try{
 $sources=@((Join-Path $root 'sim/sim_unisim_primitives.v'),(Join-Path $root 'sim/sim_experiment_lut4.v'))
 $sources+=@(Get-ChildItem (Join-Path $root 'rtl') -Filter '*.v'|ForEach-Object FullName)
 $sources+=Join-Path $root ('sim/'+$Top+'.v')
 & (Join-Path $VivadoBin 'xvlog.bat') --sv @sources *> compile.log
 if($LASTEXITCODE -ne 0){throw "Compile failed: $out/compile.log"}
 & (Join-Path $VivadoBin 'xelab.bat') $Top -s experiment -debug typical -mt off *> elaborate.log
 if($LASTEXITCODE -ne 0){throw "Elaboration failed: $out/elaborate.log"}
 & (Join-Path $VivadoBin 'xsim.bat') experiment -runall *> run.log
 $log=Get-Content run.log -Raw
 if($LASTEXITCODE -ne 0 -or $log -match '(?im)^\s*(Fatal:|ERROR:)' -or $log -notmatch 'PASS: experiment'){Get-Content run.log -Tail 15;throw 'Experiment simulation failed'}
 Write-Output 'PASS: experimental functional regression; artificial delays, no silicon margin proof'
}finally{Pop-Location}
