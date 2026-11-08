from pathlib import Path
r=Path(__file__).resolve().parents[1]
s=(r.parent/'scripts/collect.ps1').read_text()
s=s.replace('paper8_', 'array64_').replace('paper_array8_and_ce','paper_array64_and_ce')
s=s.replace('$matrix | ConvertTo-Json -Depth 4', 'ConvertTo-Json -InputObject @($matrix) -Depth 4')
s=s.replace('challenges.Count -ne 8','challenges.Count -ne 64').replace('$core -lt 8','$core -lt 64').replace('$c -lt 8','$c -lt 64').replace('cores=8','cores=64').replace('$frames*8','$frames*64')
s=s.replace('byte[] 19','byte[] 131').replace('byte[] 21','byte[] 140')
s=s.replace('0xAC','0xA6').replace('0x5C','0xD6')
s=s.replace('$i -le 17','$i -le 129').replace('$request[18]','$request[130]').replace('$request,0,19','$request,0,131')
s=s.replace('$i -lt 21','$i -lt 140').replace('$i -lt 20','$i -lt 139').replace('$reply[20]','$reply[139]').replace('$reply[18]','$reply[130]')
s=s.replace("$utc=[DateTime]::UtcNow.ToString('o')", "$word=[BitConverter]::ToUInt64($reply,131);$wordHex=$word.ToString('X16')\n   $utc=[DateTime]::UtcNow.ToString('o')")
s=s.replace('$b=($reply[19]-shr $c)-band 1', '$b=($reply[131+[int][Math]::Floor($c/8)]-shr ($c%8))-band 1')
s=s.replace('{8:X2}', '{8}').replace('$b,$reply[19]', '$b,$wordHex')
(r/'scripts/collect.ps1').write_text(s)
