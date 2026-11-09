$ErrorActionPreference='Stop'
foreach($file in Get-ChildItem -LiteralPath $PSScriptRoot -Filter '*.ps1'){
 $tokens=$null;$errors=$null
 [void][Management.Automation.Language.Parser]::ParseFile($file.FullName,[ref]$tokens,[ref]$errors)
 if($errors.Count){throw ($errors | Out-String)}
}
$code=Get-Content -LiteralPath (Join-Path $PSScriptRoot 'collect.ps1') -Raw
$start=$code.IndexOf('$rng=[Random]::new(20261107)');$end=$code.IndexOf('if($VerifyOnly)')
if($start -lt 0 -or $end -le $start){throw 'Cannot identify configuration generation block'}
$body='$Patterns=32'+"`n"+$code.Substring($start,$end-$start)+"`n"+'$matrix'
$matrix=@(& ([scriptblock]::Create($body)))
if($matrix.Count -ne 32){throw 'Wrong pattern count'}
foreach($p in $matrix){
 if($p.challenges.Count -ne 8){throw 'Wrong core count'}
 foreach($c in $p.challenges){
  $parity=0;for($b=0;$b -lt 16;$b++){$parity=$parity-bxor (($c-shr $b)-band 1)}
  if($parity -ne 1){throw 'Unsupported parity generated'}
 }
}
'PASS: Windows PowerShell syntax and 32 deterministic eight-core odd-parity vectors. No serial port opened.'
