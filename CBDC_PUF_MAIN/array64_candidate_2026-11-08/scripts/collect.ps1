param(
 [Parameter(Mandatory=$true)][string]$Port,
 [switch]$BitstreamLoaded,
 [ValidateRange(1,4096)][int]$Patterns=256,
 [ValidateRange(1,1000)][int]$Repeats=20,
 [ValidateSet('Parallel','Sequential')][string]$Mode='Parallel',
 [ValidateRange(1,127)][int]$ExciteCycles=8,
 [string]$Output='',
 [string]$ChallengeFile='',
 [string]$EnrollmentHash='',
 [switch]$VerifyOnly
)
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$record=Get-Content -LiteralPath (Join-Path $root 'BUILD_RECORD.json') -Raw | ConvertFrom-Json
$bit=Join-Path $root $record.bitstream
if((Get-FileHash -LiteralPath $bit -Algorithm SHA256).Hash -ne $record.sha256){throw 'Bitstream hash differs from verified build'}
Write-Output ('Program this file first: '+$bit)
if(!$Output){$Output=Join-Path $root ('measurements/new/array64_'+[Guid]::NewGuid().ToString('N')+'.csv')}
$Output=[IO.Path]::GetFullPath($Output)
foreach($p in @($Output,($Output+'.metadata.json'),($Output+'.challenges.json'))){if(Test-Path -LiteralPath $p){throw "Output exists: $p"}}
$matrixFileHash=$null
if($ChallengeFile){
 $ChallengeFile=(Resolve-Path -LiteralPath $ChallengeFile).Path
 $parsed=Get-Content -LiteralPath $ChallengeFile -Raw | ConvertFrom-Json
 $matrix=@($parsed)
 if($matrix.Count -lt 1 -or $matrix.Count -gt 4096){throw 'Invalid replay matrix length'}
 for($p=0;$p -lt $matrix.Count;$p++){
  if($matrix[$p].pattern -ne $p -or $matrix[$p].challenges.Count -ne 64){throw 'Invalid replay vector'}
  foreach($value in $matrix[$p].challenges){
   if($value -is [bool] -or [double]$value -ne [int]$value -or $value -lt 0 -or $value -gt 65535){throw 'Invalid replay configuration'}
   $parity=0;for($b=0;$b -lt 16;$b++){$parity=$parity-bxor (([int]$value-shr $b)-band 1)}
   if($parity -ne 1){throw 'Unsupported replay configuration parity'}
  }
 }
 $Patterns=$matrix.Count;$matrixFileHash=(Get-FileHash -LiteralPath $ChallengeFile -Algorithm SHA256).Hash
}else{
$rng=[Random]::new(20261107)
$matrix=@(for($p=0;$p -lt $Patterns;$p++){
 $values=@(for($core=0;$core -lt 64;$core++){
  if($p -lt 4){@(1,2,0x8000,0x7FFF)[$p]}else{
   do{$value=$rng.Next(65536);$parity=0;for($b=0;$b -lt 16;$b++){$parity=$parity-bxor (($value-shr $b)-band 1)}}while($parity -ne 1)
   $value
  }
 })
 [pscustomobject]@{pattern=$p;challenges=$values}
})
}
if($VerifyOnly){Write-Output "PASS: bitstream verified; $Patterns configuration vectors generated; port not opened.";return}
if(!$BitstreamLoaded){throw 'Load the exact bitstream printed above, then supply -BitstreamLoaded.'}
New-Item -ItemType Directory -Force (Split-Path $Output -Parent) | Out-Null
ConvertTo-Json -InputObject @($matrix) -Depth 4 | Set-Content -LiteralPath ($Output+'.challenges.json')
[pscustomobject]@{utc=[DateTime]::UtcNow.ToString('o');variant='paper_array64_and_ce';mode=$Mode;excite_cycles=$ExciteCycles;bitstream=$bit;sha256=$record.sha256;
 patterns=$Patterns;repeats=$Repeats;cores=64;seed=20261107;port=$Port;operator_confirmed_file=$true;
 activity_measurements_available=$false;
 challenges_file_sha256=$matrixFileHash;enrollment_sha256=$EnrollmentHash;
 configuration_source=$(if($ChallengeFile){'frozen matrix replay'}else{'seeded generator'});
 note='Local hash does not identify live firmware. Fixed-AND odd-parity Figure 1 interpretation, one Latch-controlled arbiter/core. Raw response; no activity monitors, BCH/hash.'} |
 ConvertTo-Json | Set-Content -LiteralPath ($Output+'.metadata.json')
$serial=[IO.Ports.SerialPort]::new($Port,115200,[IO.Ports.Parity]::None,8,[IO.Ports.StopBits]::One)
$serial.ReadTimeout=2000;$serial.WriteTimeout=2000;$serial.DtrEnable=$false;$serial.RtsEnable=$false
$writer=$null;$frames=0;$ones=0;$missing=0
try{
 $serial.Open();Start-Sleep -Milliseconds 100;$serial.DiscardInBuffer()
 $writer=[IO.StreamWriter]::new($Output,$false)
 $writer.WriteLine('utc,variant,mode,excite_cycles,pattern,trial,core,challenge_hex,response,response_word_hex,qb_edge_seen,qu_edge_seen,flags_hex')
 $control=($ExciteCycles-shl 1) -bor $(if($Mode -eq 'Sequential'){1}else{0})
 foreach($pattern in $matrix){
  $request=New-Object byte[] 131;$request[0]=0xA6;$request[1]=$control;$crc=0
  for($c=0;$c -lt 64;$c++){
   $v=[int]$pattern.challenges[$c];$request[2+2*$c]=$v-band 255;$request[3+2*$c]=($v-shr 8)-band 255
  }
  for($i=0;$i -le 129;$i++){$crc=$crc-bxor $request[$i]};$request[130]=$crc
  for($trial=1;$trial -le $Repeats;$trial++){
   $serial.Write($request,0,131);$reply=New-Object byte[] 140
   for($i=0;$i -lt 140;$i++){$reply[$i]=$serial.ReadByte()}
   $crc=0;for($i=0;$i -lt 139;$i++){$crc=$crc-bxor $reply[$i]}
   if($reply[0] -ne 0xD6 -or $reply[139] -ne $crc -or $reply[130] -ne 0x61 -or $reply[1] -ne $control){throw 'Wrong firmware, invalid frame or FPGA query failure; stop and check programming.'}
   for($i=2;$i -le 129;$i++){if($reply[$i] -ne $request[$i]){throw 'Actual latched configuration readback differs from request'}}
   $word=[BitConverter]::ToUInt64($reply,131);$wordHex=$word.ToString('X16')
   $utc=[DateTime]::UtcNow.ToString('o')
   for($c=0;$c -lt 64;$c++){
    $b=($reply[131+[int][Math]::Floor($c/8)]-shr ($c%8))-band 1;$ones+=$b
    $writer.WriteLine(('{0},paper_array64_and_ce,{1},{2},{3},{4},{5},{6:X4},{7},{8},,,61' -f $utc,$Mode,$ExciteCycles,$pattern.pattern,$trial,$c,$pattern.challenges[$c],$b,$wordHex))
   }
   $frames++
  }
  $writer.Flush()
 }
 Write-Output "Saved $frames frames / $($frames*64) raw core responses to $Output"
 Write-Output "Ones=$ones; mode=$Mode; excite wait=$ExciteCycles cycles. Activity is not instrumented."
}finally{if($writer){$writer.Dispose()};if($serial.IsOpen){$serial.Close()};$serial.Dispose()}
