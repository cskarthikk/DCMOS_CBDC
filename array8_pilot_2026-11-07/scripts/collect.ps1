param(
 [Parameter(Mandatory=$true)][string]$Port,
 [switch]$BitstreamLoaded,
 [ValidateRange(1,4096)][int]$Patterns=256,
 [ValidateRange(1,1000)][int]$Repeats=20,
 [string]$Output='',
 [switch]$VerifyOnly
)
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$record=Get-Content -LiteralPath (Join-Path $root 'BUILD_RECORD.json') -Raw | ConvertFrom-Json
$bit=Join-Path $root $record.bitstream
if((Get-FileHash -LiteralPath $bit -Algorithm SHA256).Hash -ne $record.sha256){throw 'Bitstream hash differs from verified build'}
Write-Output ('Program this file first: '+$bit)
if(!$Output){$Output=Join-Path $root ('measurements/array8_'+[Guid]::NewGuid().ToString('N')+'.csv')}
$Output=[IO.Path]::GetFullPath($Output)
foreach($p in @($Output,($Output+'.metadata.json'),($Output+'.challenges.json'))){if(Test-Path -LiteralPath $p){throw "Output exists: $p"}}
$rng=[Random]::new(20261107)
$matrix=@(for($p=0;$p -lt $Patterns;$p++){
 $values=@(for($core=0;$core -lt 8;$core++){
  if($p -lt 4){@(0,1,0x8000,0xFFFF)[$p]}else{$rng.Next(65536)}
 })
 [pscustomobject]@{pattern=$p;challenges=$values}
})
if($VerifyOnly){Write-Output "PASS: bitstream verified; $Patterns configuration vectors generated; port not opened.";return}
if(!$BitstreamLoaded){throw 'Load the exact bitstream printed above, then supply -BitstreamLoaded.'}
New-Item -ItemType Directory -Force (Split-Path $Output -Parent) | Out-Null
$matrix | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath ($Output+'.challenges.json')
[pscustomobject]@{utc=[DateTime]::UtcNow.ToString('o');variant='array8_preserved_pilot_v1';bitstream=$bit;sha256=$record.sha256;
 patterns=$Patterns;repeats=$Repeats;cores=8;seed=20261107;port=$Port;operator_confirmed_file=$true;
 note='Local hash does not identify live firmware. Eight independent raw primary responses; no BCH/hash. Diagnostic edges are observations.'} |
 ConvertTo-Json | Set-Content -LiteralPath ($Output+'.metadata.json')
$serial=[IO.Ports.SerialPort]::new($Port,115200,[IO.Ports.Parity]::None,8,[IO.Ports.StopBits]::One)
$serial.ReadTimeout=2000;$serial.WriteTimeout=2000;$serial.DtrEnable=$false;$serial.RtsEnable=$false
$writer=$null;$frames=0;$ones=0;$missing=0
try{
 $serial.Open();Start-Sleep -Milliseconds 100;$serial.DiscardInBuffer()
 $writer=[IO.StreamWriter]::new($Output,$false)
 $writer.WriteLine('utc,variant,pattern,trial,core,challenge_hex,response,response_word_hex,qb_edge_seen,qu_edge_seen,flags_hex')
 foreach($pattern in $matrix){
  $request=New-Object byte[] 18;$request[0]=0xA8;$crc=0xA8
  for($c=0;$c -lt 8;$c++){
   $v=[int]$pattern.challenges[$c];$request[1+2*$c]=$v-band 255;$request[2+2*$c]=($v-shr 8)-band 255
  }
  for($i=1;$i -le 16;$i++){$crc=$crc-bxor $request[$i]};$request[17]=$crc
  for($trial=1;$trial -le $Repeats;$trial++){
   $serial.Write($request,0,18);$reply=New-Object byte[] 22
   for($i=0;$i -lt 22;$i++){$reply[$i]=$serial.ReadByte()}
   $crc=0;for($i=0;$i -lt 21;$i++){$crc=$crc-bxor $reply[$i]}
   if($reply[0] -ne 0x58 -or $reply[21] -ne $crc -or $reply[17] -ne 0x41){throw 'Wrong firmware, invalid frame or FPGA query failure; stop and check programming.'}
   for($i=1;$i -le 16;$i++){if($reply[$i] -ne $request[$i]){throw 'Configuration echo mismatch'}}
   $utc=[DateTime]::UtcNow.ToString('o')
   for($c=0;$c -lt 8;$c++){
    $b=($reply[18]-shr $c)-band 1;$qb=($reply[19]-shr $c)-band 1;$qu=($reply[20]-shr $c)-band 1
    $ones+=$b;if(!$qb -or !$qu){$missing++}
    $writer.WriteLine(('{0},array8_preserved_pilot_v1,{1},{2},{3},{4:X4},{5},{6:X2},{7},{8},41' -f $utc,$pattern.pattern,$trial,$c,$pattern.challenges[$c],$b,$reply[18],$qb,$qu))
   }
   $frames++
  }
  $writer.Flush()
 }
 Write-Output "Saved $frames frames / $($frames*8) raw core responses to $Output"
 Write-Output "Ones=$ones; core observations missing one or both edge flags=$missing"
}finally{if($writer){$writer.Dispose()};if($serial.IsOpen){$serial.Close()};$serial.Dispose()}
