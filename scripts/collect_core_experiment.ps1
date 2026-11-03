param([Parameter(Mandatory=$true)][string]$Port,
 [ValidateRange(0,7)][int]$Mode=3,[ValidateRange(0,255)][int]$WaitCycles=0,
 [ValidateRange(1,255)][int]$CaptureCycles=16,[ValidateRange(1,10000)][int]$Repeats=3,
 [string]$ChallengeList='0000,0001,0002,0003,0007,0008,8000,FFFF',[string]$Output='')
$ErrorActionPreference='Stop'
if($WaitCycles -eq 0 -and ($Mode -band 1) -eq 0){throw 'Wait=0 requires single-shot mode'}
$root=Split-Path $PSScriptRoot -Parent
if(!$Output){$Output=Join-Path $root ('build_m1/measurements/core_experiment/run_'+[Guid]::NewGuid().ToString('N')+'.csv')}
$full=[IO.Path]::GetFullPath($Output)
if(Test-Path -LiteralPath $full){throw "Output exists: $full"}
$bit=Join-Path $root 'build_m1/core_experiment/cbdc_core_experiment.bit'
if(!(Test-Path -LiteralPath $bit)){throw 'Experimental bitstream not yet built/qualified'}
$challenges=[Collections.Generic.List[int]]::new()
foreach($token in $ChallengeList.Split(',')){
 $c=[Convert]::ToInt32($token.Trim(),16)
 if($c -lt 0 -or $c -gt 65535 -or $challenges.Contains($c)){throw 'Challenges must be distinct hexadecimal values 0000..FFFF'}
 $challenges.Add($c)
}
New-Item -ItemType Directory -Force -Path (Split-Path $full -Parent)|Out-Null
[pscustomobject]@{utc=[DateTime]::UtcNow.ToString('o');mode=$Mode;wait=$WaitCycles;capture=$CaptureCycles;
 repeats=$Repeats;challenges=$ChallengeList;port=$Port;bitstream_sha256=(Get-FileHash -Algorithm SHA256 -LiteralPath $bit).Hash;
 note='Experimental derived architecture. Local hash requires operator to program this file. Raw A/B pair, no XOR correction.'}|
 ConvertTo-Json|Set-Content -LiteralPath ($full+'.metadata.json')
$serial=[IO.Ports.SerialPort]::new($Port,115200,[IO.Ports.Parity]::None,8,[IO.Ports.StopBits]::One)
$serial.ReadTimeout=2000;$serial.WriteTimeout=2000;$serial.DtrEnable=$false;$serial.RtsEnable=$false
$writer=$null
function Query([int]$c,[int]$requestedMode){
 $lo=$c-band 255;$hi=($c-shr 8)-band 255
 $frame=[byte[]]@(0xA7,$lo,$hi,$requestedMode,$WaitCycles,$CaptureCycles,(0xA7-bxor $lo-bxor $hi-bxor $requestedMode-bxor $WaitCycles-bxor $CaptureCycles))
 $serial.Write($frame,0,7)
 $reply=New-Object byte[] 9;for($i=0;$i-lt 9;$i++){$reply[$i]=$serial.ReadByte()}
 $crc=0;for($i=0;$i-lt 8;$i++){$crc=$crc-bxor $reply[$i]}
 if($reply[0]-ne 0x5B -or $reply[1]-ne $lo -or $reply[2]-ne $hi -or $reply[3]-ne $requestedMode -or $reply[4]-ne $WaitCycles -or $reply[5]-ne $CaptureCycles -or $reply[8]-ne $crc){throw 'Frame/echo/checksum mismatch'}
 if(($reply[6]-band 0x70)-ne 0x70 -or ($reply[6]-band 0x80)-ne 0){throw 'Wrong firmware or FPGA timeout'}
 if($reply[7]-gt 3){throw 'Invalid raw pair byte'}
 return ,$reply
}
try{
 $serial.Open();Start-Sleep -Milliseconds 100;$serial.DiscardInBuffer()
 $control=Query 0 128
 if(($control[6]-band 1)-ne 0 -or $control[7]-ne 0){throw 'Reserved-mode rejection control failed'}
 $writer=[IO.StreamWriter]::new($full,$false)
 $writer.WriteLine('utc,build,mode,wait_cycles,capture_cycles,challenge_hex,trial,accepted,response,reverse_response,raw_pair,qb_edge_seen,qu_edge_seen,flags_hex')
 $accepted=0;$rejected=0;$missing=0
 for($trial=1;$trial-le $Repeats;$trial++){
  foreach($c in $challenges){
   $reply=Query $c $Mode;$f=[int]$reply[6];$raw=[int]$reply[7];$ok=$f-band 1
   $parity=0;for($i=0;$i-lt 16;$i++){$parity=$parity-bxor (($c-shr $i)-band 1)}
   $expected=if(($Mode-band 2)-ne 0 -or $parity-eq 1){1}else{0}
   if($ok-ne $expected){throw 'Unexpected challenge acceptance status'}
   if(!$ok -and $raw-ne 0){throw 'Rejected query returned nonzero data'}
   if(($Mode-band 4)-eq 0 -and ($raw-band 2)-ne 0){throw 'Disabled reverse arbiter returned 1'}
   $qb=($f-shr 1)-band 1;$qu=($f-shr 2)-band 1
   if($ok){$accepted++;if(!$qb -or !$qu){$missing++}}else{$rejected++}
   $writer.WriteLine(('{0},core_experiment,{1},{2},{3},{4:X4},{5},{6},{7},{8},{9},{10},{11},{12:X2}'-f
    [DateTime]::UtcNow.ToString('o'),$Mode,$WaitCycles,$CaptureCycles,$c,$trial,$ok,($raw-band 1),(($raw-shr 1)-band 1),$raw,$qb,$qu,$f))
  }
  $writer.Flush()
 }
 Write-Output "Saved $($accepted+$rejected) queries: accepted=$accepted rejected=$rejected to $full"
 Write-Output "Accepted rows missing one or both activity flags=$missing"
 Write-Output 'Experimental build only. A and reverse B are separate outputs, not a bias-canceling XOR.'
}finally{if($writer){$writer.Dispose()};if($serial.IsOpen){$serial.Close()};$serial.Dispose()}
