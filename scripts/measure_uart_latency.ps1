param([string]$Port='COM5',[int]$Queries=50,[Parameter(Mandatory=$true)][string]$Output)
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$profile=Get-Content (Join-Path $root 'bitstream/PROFILE.json') -Raw | ConvertFrom-Json
if((Get-FileHash (Join-Path $root 'bitstream/paper_array64.bit')).Hash -ne $profile.bitstream_sha256){throw 'Selected image changed'}
$tokens=$null;$errors=$null
$ast=[Management.Automation.Language.Parser]::ParseFile((Join-Path $root 'scripts/crypto_demo.ps1'),[ref]$tokens,[ref]$errors)
$fn=$ast.FindAll({param($node) $node -is [Management.Automation.Language.FunctionDefinitionAst] -and $node.Name -eq 'Query-Hardware-64'},$true)
if($fn.Count -ne 1){throw 'Expected existing 64-core UART function'}
Invoke-Expression $fn[0].Extent.Text
$sha=& (Join-Path $root 'runtime/python/python.exe') -B -I (Join-Path $root 'scripts/crypto_cli.py') hash_challenge --challenge 'Latency_Benchmark_64' --cores 64
if($LASTEXITCODE -ne 0){throw 'Configuration generation failed'}
$cfgs=($sha | ConvertFrom-Json).configurations_int
$serial=[IO.Ports.SerialPort]::new($Port,115200,[IO.Ports.Parity]::None,8,[IO.Ports.StopBits]::One)
$serial.ReadTimeout=3000;$serial.WriteTimeout=3000;$serial.DtrEnable=$false;$serial.RtsEnable=$false
$times=@()
try{
 $serial.Open();Start-Sleep -Milliseconds 150;$serial.DiscardInBuffer()
 [void](Query-Hardware-64 $serial $cfgs 22)
 for($i=0;$i -lt $Queries;$i++){
  $watch=[Diagnostics.Stopwatch]::StartNew()
  [void](Query-Hardware-64 $serial $cfgs 22)
  $watch.Stop();$times+=$watch.Elapsed.TotalMilliseconds
 }
}finally{if($serial.IsOpen){$serial.Close()}}
$stats=$times | Measure-Object -Average -Minimum -Maximum
[pscustomobject]@{queries=$Queries;cores=64;excite_cycles=22;baud=115200;request_bytes=131;reply_bytes=140;wire_time_lower_bound_ms=(271*10/115200*1000);mean_ms=$stats.Average;minimum_ms=$stats.Minimum;maximum_ms=$stats.Maximum;samples_ms=$times;scope='Measured host UART request/reply round-trip, including PowerShell, USB/serial, wire time and FPGA. Not intrinsic PUF propagation latency.'} | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $Output
Get-Content -LiteralPath $Output -TotalCount 12
