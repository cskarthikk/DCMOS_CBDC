param(
 [Parameter(Mandatory=$true)][string]$Port,
 [ValidateRange(1,32768)][int]$Challenges=256,
 [ValidateRange(1,10000)][int]$Repeats=20,
 [string]$Output='build_m1/measurements/serial_diagnostic.csv'
)
$ErrorActionPreference='Stop'
$fullOutput=[IO.Path]::GetFullPath($Output)
if(Test-Path -LiteralPath $fullOutput){throw "Output already exists: $fullOutput. Choose a new -Output filename."}
$parent=Split-Path $fullOutput -Parent
New-Item -ItemType Directory -Force $parent | Out-Null
$serial=[IO.Ports.SerialPort]::new($Port,115200,[IO.Ports.Parity]::None,8,[IO.Ports.StopBits]::One)
$serial.ReadTimeout=2000;$serial.WriteTimeout=2000
$serial.DtrEnable=$false;$serial.RtsEnable=$false
$writer=$null
function Query([int]$c){
 $lo=$c -band 255;$hi=($c -shr 8) -band 255
 $frame=[byte[]]@(0xA5,$lo,$hi,(0xA5 -bxor $lo -bxor $hi))
 $serial.Write($frame,0,4)
 $reply=New-Object byte[] 6
 for($i=0;$i -lt 6;$i++){$reply[$i]=$serial.ReadByte()}
 $crc=0;for($i=0;$i -lt 5;$i++){$crc=$crc -bxor $reply[$i]}
 if($reply[0] -ne 0x5A -or $reply[1] -ne $lo -or $reply[2] -ne $hi -or $reply[5] -ne $crc){throw 'Serial frame/echo/checksum failed. Stop; reset board and retry with a new output filename.'}
 if(($reply[3] -band 0x80) -ne 0){throw 'FPGA internal query timeout'}
 if(($reply[3] -band 0x10) -eq 0){throw 'Wrong firmware: diagnostic version marker missing'}
 return ,$reply
}
try{
 $serial.Open();Start-Sleep -Milliseconds 100;$serial.DiscardInBuffer()
 $writer=[IO.StreamWriter]::new($fullOutput,$false)
 $writer.WriteLine('utc,build,challenge_hex,trial,accepted,response,qb_edge_seen,qu_edge_seen,flags_hex')
 # Include rejected all-zero control; do not mix it into valid-response statistics.
 $control=Query 0
 if(($control[3] -band 1) -ne 0){throw 'All-zero rejection control failed'}
 $writer.WriteLine(('{0},serial_instrumented,0000,0,0,{1},{2},{3},{4:X2}' -f [DateTime]::UtcNow.ToString('o'),$control[4],(($control[3] -shr 1)-band 1),(($control[3] -shr 2)-band 1),$control[3]))
 $chosen=[Collections.Generic.List[int]]::new()
 foreach($c in @(1,2,4,8,0x8000,7,0x1F,0x7FFF,0x8003,0x800C,0x800F,0xFFFE)){
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
   $qb=($f-shr 1)-band 1;$qu=($f-shr 2)-band 1
   if(!$qb -or !$qu){$missing++}
   $ones+=$r[4];$total++
   $writer.WriteLine(('{0},serial_instrumented,{1:X4},{2},1,{3},{4},{5},{6:X2}' -f [DateTime]::UtcNow.ToString('o'),$c,$trial,$r[4],$qb,$qu,$f))
  }
  $writer.Flush()
 }
 Write-Output "Saved $total accepted queries to $fullOutput"
 Write-Output "Ones=$ones; rows missing one or both edge flags=$missing"
 Write-Output 'These are instrumented-build results, not baseline PUF certification.'
} finally{
 if($writer){$writer.Dispose()}
 if($serial.IsOpen){$serial.Close()};$serial.Dispose()
}
