param(
 [Parameter(Mandatory=$true)][string]$Port,
 [switch]$BitstreamLoaded,
 [ValidateRange(1,4096)][int]$Patterns=256,
 [ValidateRange(1,1000)][int]$Repeats=20,
 [ValidateSet('Parallel','Sequential')][string]$Mode='Parallel',
 [ValidateRange(1,127)][int]$ExciteCycles=8,
 [string]$Output='',
 [switch]$VerifyOnly
)
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$record=Get-Content -LiteralPath (Join-Path $root 'BUILD_RECORD.json') -Raw | ConvertFrom-Json
$bit=Join-Path $root $record.bitstream
if((Get-FileHash -LiteralPath $bit -Algorithm SHA256).Hash -ne $record.sha256){throw 'Bitstream hash differs from verified build'}
Write-Output ('Program this file first: '+$bit)
if(!$Output){$Output=Join-Path $root ('measurements/paper8_'+[Guid]::NewGuid().ToString('N')+'.csv')}
$Output=[IO.Path]::GetFullPath($Output)
foreach($p in @($Output,($Output+'.metadata.json'),($Output+'.challenges.json'))){if(Test-Path -LiteralPath $p){throw "Output exists: $p"}}
$rng=[Random]::new(20261107)
$matrix=@(for($p=0;$p -lt $Patterns;$p++){
 $values=@(for($core=0;$core -lt 8;$core++){
  if($p -lt 4){@(1,2,0x8000,0x7FFF)[$p]}else{
   do{$value=$rng.Next(65536);$parity=0;for($b=0;$b -lt 16;$b++){$parity=$parity-bxor (($value-shr $b)-band 1)}}while($parity -ne 1)
   $value
  }
 })
 [pscustomobject]@{pattern=$p;challenges=$values}
})
if($VerifyOnly){Write-Output "PASS: bitstream verified; $Patterns configuration vectors generated; port not opened.";return}
if(!$BitstreamLoaded){throw 'Load the exact bitstream printed above, then supply -BitstreamLoaded.'}
New-Item -ItemType Directory -Force (Split-Path $Output -Parent) | Out-Null
$matrix | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath ($Output+'.challenges.json')
[pscustomobject]@{utc=[DateTime]::UtcNow.ToString('o');variant='paper_array8_and_ce';mode=$Mode;excite_cycles=$ExciteCycles;bitstream=$bit;sha256=$record.sha256;
 patterns=$Patterns;repeats=$Repeats;cores=8;seed=20261107;port=$Port;operator_confirmed_file=$true;
 activity_measurements_available=$false;
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
  $request=New-Object byte[] 19;$request[0]=0xAC;$request[1]=$control;$crc=0
  for($c=0;$c -lt 8;$c++){
   $v=[int]$pattern.challenges[$c];$request[2+2*$c]=$v-band 255;$request[3+2*$c]=($v-shr 8)-band 255
  }
  for($i=0;$i -le 17;$i++){$crc=$crc-bxor $request[$i]};$request[18]=$crc
  for($trial=1;$trial -le $Repeats;$trial++){
   $serial.Write($request,0,19);$reply=New-Object byte[] 21
   for($i=0;$i -lt 21;$i++){$reply[$i]=$serial.ReadByte()}
   $crc=0;for($i=0;$i -lt 20;$i++){$crc=$crc-bxor $reply[$i]}
   if($reply[0] -ne 0x5C -or $reply[20] -ne $crc -or $reply[18] -ne 0x61 -or $reply[1] -ne $control){throw 'Wrong firmware, invalid frame or FPGA query failure; stop and check programming.'}
   for($i=2;$i -le 17;$i++){if($reply[$i] -ne $request[$i]){throw 'Actual latched configuration readback differs from request'}}
   $utc=[DateTime]::UtcNow.ToString('o')
   for($c=0;$c -lt 8;$c++){
    $b=($reply[19]-shr $c)-band 1;$ones+=$b
    $writer.WriteLine(('{0},paper_array8_and_ce,{1},{2},{3},{4},{5},{6:X4},{7},{8:X2},,,61' -f $utc,$Mode,$ExciteCycles,$pattern.pattern,$trial,$c,$pattern.challenges[$c],$b,$reply[19]))
   }
   $frames++
  }
  $writer.Flush()
 }
 Write-Output "Saved $frames frames / $($frames*8) raw core responses to $Output"
 Write-Output "Ones=$ones; mode=$Mode; excite wait=$ExciteCycles cycles. Activity is not instrumented."
}finally{if($writer){$writer.Dispose()};if($serial.IsOpen){$serial.Close()};$serial.Dispose()}
