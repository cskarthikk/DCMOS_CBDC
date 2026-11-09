# Requires build_internal_matched_v2/candidate.bit, A6/59 protocol.
param(
 [Parameter(Mandatory=$true)][string]$Port,
 [switch]$BitstreamLoaded,
 [ValidateRange(1,32768)][int]$Challenges=256,
 [ValidateRange(1,10000)][int]$Repeats=20,
 [string]$Output='',
 [switch]$VerifyOnly
)
$ErrorActionPreference='Stop'
if([string]::IsNullOrWhiteSpace($Output)){
 $Output=Join-Path (Split-Path $PSScriptRoot -Parent) ('measurements/run_'+[Guid]::NewGuid().ToString('N')+'.csv')
}
if($VerifyOnly){
 Write-Output ('Resolved output: '+[IO.Path]::GetFullPath($Output))
 Write-Output 'PASS: output path resolved; serial port was not opened.'
 return
}
if(!$BitstreamLoaded){throw 'Program build_internal_matched_v2/candidate.bit first, then supply -BitstreamLoaded as your confirmation.'}
$fullOutput=[IO.Path]::GetFullPath($Output)
if(Test-Path -LiteralPath $fullOutput){throw "Output already exists: $fullOutput. Choose a new -Output filename."}
$parent=Split-Path $fullOutput -Parent
New-Item -ItemType Directory -Force $parent | Out-Null
$projectRoot=Split-Path $PSScriptRoot -Parent
$bitstream=Join-Path $projectRoot 'build_internal_matched_v2/candidate.bit'
if(!(Test-Path -LiteralPath $bitstream)){throw 'Build the isolated PUF bitstream first'}
[pscustomobject]@{utc=[DateTime]::UtcNow.ToString('o');build='figure1_and_candidate';physical_variant='internal_matched_v2';operator_confirmed_file=$bitstream;
 bitstream_sha256=(Get-FileHash -LiteralPath $bitstream -Algorithm SHA256).Hash;
 challenges=$Challenges;repeats=$Repeats;port=$Port;auto_parity=0;capture_mode=0;dual_arbiter=0;diagnostic=0;gate_init=8;
 note='Operator must load this exact file. Local hash does not identify active firmware. Raw primary A only; no BCH/hash/array.'} |
 ConvertTo-Json | Set-Content -LiteralPath ($fullOutput+'.metadata.json')
$serial=[IO.Ports.SerialPort]::new($Port,115200,[IO.Ports.Parity]::None,8,[IO.Ports.StopBits]::One)
$serial.ReadTimeout=2000;$serial.WriteTimeout=2000
$serial.DtrEnable=$false;$serial.RtsEnable=$false
$writer=$null
function Query([int]$c){
 $lo=$c -band 255;$hi=($c -shr 8) -band 255
 $frame=[byte[]]@(0xA6,$lo,$hi,(0xA6 -bxor $lo -bxor $hi))
 $serial.Write($frame,0,4)
 $reply=New-Object byte[] 6
 for($i=0;$i -lt 6;$i++){$reply[$i]=$serial.ReadByte()}
 $crc=0;for($i=0;$i -lt 5;$i++){$crc=$crc -bxor $reply[$i]}
 if($reply[0] -ne 0x59 -or $reply[1] -ne $lo -or $reply[2] -ne $hi -or $reply[5] -ne $crc){throw 'Serial frame/echo/checksum failed. Stop; reset board and retry with a new output filename.'}
 if(($reply[3] -band 0x80) -ne 0){throw 'FPGA internal query timeout'}
 if(($reply[3] -band 0x7E) -ne 0x20){throw 'Wrong candidate firmware flags'}
 return ,$reply
}
try{
 $serial.Open();Start-Sleep -Milliseconds 100;$serial.DiscardInBuffer()
 $writer=[IO.StreamWriter]::new($fullOutput,$false)
 $writer.WriteLine('utc,build,challenge_hex,trial,accepted,response,qb_edge_seen,qu_edge_seen,flags_hex')
 # Figure 1 AND interpretation: odd-parity challenges only; no edge measurements.
 $chosen=[Collections.Generic.List[int]]::new()
 foreach($c in @(1,2,7,8,0x8000,0x1F,0x7FFF,0x8003,0xFFFE)){
  if($chosen.Count -lt $Challenges){$chosen.Add($c)}
 }
 $rng=[Random]::new(20261101)
 while($chosen.Count -lt $Challenges){
  $c=$rng.Next(65536);$parity=0
  for($i=0;$i -lt 16;$i++){$parity=$parity -bxor (($c -shr $i)-band 1)}
  if($parity -eq 1 -and !$chosen.Contains($c)){$chosen.Add($c)}
 }
 $ones=0;$missing=0;$total=0
 foreach($c in $chosen){
  for($trial=1;$trial -le $Repeats;$trial++){
   $r=Query $c;$f=[int]$r[3]
   if(($f-band 1)-eq 0){throw ('Valid challenge rejected: {0:X4}' -f $c)}
   if($r[4] -gt 1){throw 'Invalid response byte'}
   $qb='';$qu='' # Not instrumented; blank is not a measured zero
   
   $ones+=$r[4];$total++
   $writer.WriteLine(('{0},figure1_and_candidate,{1:X4},{2},1,{3},{4},{5},{6:X2}' -f [DateTime]::UtcNow.ToString('o'),$c,$trial,$r[4],$qb,$qu,$f))
  }
  $writer.Flush()
 }
 Write-Output "Saved $total accepted queries to $fullOutput"
 Write-Output "Ones=$ones; activity flags unavailable in this single-FF core"
 Write-Output 'Figure 1 candidate: fixed AND, Latch capture, one arbiter, odd parity only. Raw response; no measured activity flags.'
} finally{
 if($writer){$writer.Dispose()}
 if($serial.IsOpen){$serial.Close()};$serial.Dispose()
}
