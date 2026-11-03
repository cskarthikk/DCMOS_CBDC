param(
 [ValidateRange(1,255)][int]$WaitCycles=8,
 [ValidateRange(1,255)][int]$CaptureCycles=8,
 [string]$ChallengeList="0001,0002,8000,0007,7678,B39C,007C,146E,E084,106A,F937,D11C,7798,166A,B21A,22C1,96EC,82A2",
 [Parameter(Mandatory=$true)][string]$Port,
 [ValidateRange(1,10000)][int]$Repeats=20,
 [string]$Output='build_m1/measurements/timing_diagnostic.csv'
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
$chosen=[Collections.Generic.List[int]]::new()
foreach($token in $ChallengeList.Split(',')) {
 $c=[Convert]::ToInt32($token.Trim(),16)
 if($c -lt 1 -or $c -gt 65535){throw 'Challenge must be 0001..FFFF'}
 $parity=0;for($i=0;$i -lt 16;$i++){$parity=$parity -bxor (($c -shr $i)-band 1)}
 if($parity -ne 1 -or $chosen.Contains($c)){throw 'Challenge must be odd parity and distinct'}
 $chosen.Add($c)
}
function Query([int]$c){
 $lo=$c -band 255;$hi=($c -shr 8) -band 255
 $frame=[byte[]]@(0xA6,$lo,$hi,$WaitCycles,$CaptureCycles,(0xA6 -bxor $lo -bxor $hi -bxor $WaitCycles -bxor $CaptureCycles))
 $serial.Write($frame,0,6)
 $reply=New-Object byte[] 8
 for($i=0;$i -lt 8;$i++){$reply[$i]=$serial.ReadByte()}
 $crc=0;for($i=0;$i -lt 7;$i++){$crc=$crc -bxor $reply[$i]}
 if($reply[0] -ne 0x5A -or $reply[1] -ne $lo -or $reply[2] -ne $hi -or $reply[7] -ne $crc -or $reply[3] -ne $WaitCycles -or $reply[4] -ne $CaptureCycles){throw 'Serial frame/echo/checksum failed. Stop; reset board and retry with a new output filename.'}
 if(($reply[5] -band 0x80) -ne 0){throw 'FPGA internal query timeout'}
 if(($reply[5] -band 0x30) -ne 0x30){throw 'Wrong firmware: diagnostic version marker missing'}
 return ,$reply
}
try{
 $serial.Open();Start-Sleep -Milliseconds 100;$serial.DiscardInBuffer()
 $writer=[IO.StreamWriter]::new($fullOutput,$false)
 $writer.WriteLine('utc,build,wait_cycles,capture_cycles,challenge_hex,trial,accepted,response,qb_edge_seen,qu_edge_seen,flags_hex')
 # Include rejected all-zero control; do not mix it into valid-response statistics.
 $control=Query 0
 if(($control[5] -band 1) -ne 0){throw 'All-zero rejection control failed'}
 $writer.WriteLine(('{0},timing_instrumented,{5},{6},0000,0,0,{1},{2},{3},{4:X2}' -f [DateTime]::UtcNow.ToString('o'),$control[6],(($control[5] -shr 1)-band 1),(($control[5] -shr 2)-band 1),$control[5],$WaitCycles,$CaptureCycles))
 $ones=0;$missing=0;$total=0
 for($trial=1;$trial -le $Repeats;$trial++){
  foreach($c in $chosen){
   $r=Query $c;$f=[int]$r[5]
   if(($f-band 1)-eq 0){throw ('Valid challenge rejected: {0:X4}' -f $c)}
   if($r[6] -gt 1){throw 'Invalid response byte'}
   $qb=($f-shr 1)-band 1;$qu=($f-shr 2)-band 1
   if(!$qb -or !$qu){$missing++}
   $ones+=$r[6];$total++
   $writer.WriteLine(('{0},timing_instrumented,{7},{8},{1:X4},{2},1,{3},{4},{5},{6:X2}' -f [DateTime]::UtcNow.ToString('o'),$c,$trial,$r[6],$qb,$qu,$f,$WaitCycles,$CaptureCycles))
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
