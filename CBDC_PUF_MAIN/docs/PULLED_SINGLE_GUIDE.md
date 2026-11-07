# Single PUF isolated from pulled commit 7cfc392

This build reads ONLY these original, unchanged RTL files:

- cbdc_uart.v and cbdc_button.v: board communication and reset.
- cbdc_puf_element.v, cbdc_puf_chain.v, cbdc_puf_core.v: ONE PUF instance.
- cbdc_puf_ctrl.v: sequencing and synchronized response readout.
- cbdc_puf_serial.v: existing single-core A5/5A serial top.

The array, response assembly, BCH, hash and array placement constraints are not
read. Their files are retained. The earlier experimental RTL is not read either.

The pulled core's defaults remain unchanged: 16 stages per chain,
AUTO_PARITY=1, CAPTURE_MODE=1 and DUAL_ARBITER=1. Thus this is ONE PUF with the
two arbiters already present in that version, not two PUFs. Only primary A is
returned by this existing serial interface. Its activity flags reuse the
first-edge lock registers. No error correction, response hashing or filtering
of missing-edge rows is performed.

CAPTURE_MODE=1 enables capture using excitation itself, as written by that
version. It is not the earlier experimental implementation that pre-armed one
system clock before excitation. This build does not fix or reinterpret its
capture logic. Automatic parity and first-edge capture are architecture
extensions, not proof of exact reproduction of the paper or improved entropy.

## Physical setup

New script: scripts/build_pulled_single.tcl. It selects exact cell names to
avoid matching helper parity LUTs. Chain LUTs use corresponding BELs/pins at
X21/X25, entrance Y100, stages Y101..116. Primary arbiter X23Y116/BFF,
reverse X23Y118/BFF, edge locks X25Y117/AFF and X21Y117/AFF. Extra helper logic
is placed by Vivado. This is paired placement, NOT matched/fixed routing.
Different routing means comparison to old bitstreams includes physical changes.

Output directory: build_m1/pulled_single. The script reads only Basys 3 serial
pin/timing constraints and the existing intentional feedback acknowledgement.
It exports reports, routed checkpoint/netlist and cbdc_pulled_single.bit.
Review timing and asynchronous-clock warnings before interpreting hardware data.
The new build script additionally acknowledges the intentional feedback on the
exact head-output net, because the pulled wildcard waiver can miss canonical
net names. It does not lower DRC severities or modify PUF gates.

Verified: serial simulation passed; one core in the hierarchical report,
106 LUTs and four FFs inside that core (98 chain LUTs plus parity/CE helpers).
The whole board design uses 368 LUTs and 290 FFs. All 639 routable nets routed,
zero routing errors. Conventional sys_clk setup/hold slack +3.928/+0.128 ns.
Four unclocked PUF-register methodology critical warnings remain. These slack
numbers do not validate the asynchronous race or guarantee repeatable CRPs.
Bitstream generation completed successfully. Final bitgen DRC has zero errors;
five DRC warnings remain: one acknowledged loop, two gated-clock checks and two
nonoptimal connections that could affect hold timing. Source and bitstream
SHA256 manifests are saved alongside the bitstream. No board was programmed.

## Simulation / rebuild

Run scripts/run_pulled_single_sim.ps1 in PowerShell. Its separate testbench
checks serial framing, accepted odd/even values (including zero), activity
flags, bad checksums and truncated-request recovery under artificial LUT delays.
It is not a chip delay/noise simulation.

In an empty Vivado session, use:

```tcl
source {C:/BTech/Semester_5/DCMOS/Project/scripts/build_pulled_single.tcl}
```

## Board test

1. In Hardware Manager, Open Target / Auto Connect.
2. Right-click xc7a35t_0 / Program Device. Choose:
   C:/BTech/Semester_5/DCMOS/Project/build_m1/pulled_single/cbdc_pulled_single.bit
3. Program, press/release BTNU, wait a second. LD4 is ready.
4. Use this dedicated collector. The previous collect_crps.ps1 has an all-zero
   rejection control incompatible with AUTO_PARITY=1; do not use it here.

```powershell
Set-Location 'C:\BTech\Semester_5\DCMOS\Project'
$csv = 'build_m1/measurements/pulled_single/smoke_' + [Guid]::NewGuid().ToString('N') + '.csv'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\collect_pulled_single.ps1 -Port COM5 -Challenges 8 -Repeats 3 -Output $csv
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\analyze_crps.ps1 -InputCsv $csv
```

Expected: 24 accepted rows, for 0000,0001,0002,0003,0007,0008,8000,FFFF.
Ideally missing activity flags = 0. Ones/zeros are unknown until measured;
all-zero/all-one responses must be reported honestly, not treated as success.
The collector checks checksum, echo, acceptance, diagnostic marker and timeout,
retains activity failures, and records the local bitstream hash in metadata.
Power loss requires programming again. CSV filenames above are unique.

After that smoke test, collect a broader sample using a new filename:

```powershell
$csv = 'build_m1/measurements/pulled_single/run_' + [Guid]::NewGuid().ToString('N') + '.csv'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\collect_pulled_single.ps1 -Port COM5 -Challenges 256 -Repeats 20 -Output $csv
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\analyze_crps.ps1 -InputCsv $csv
```

Expected: 5,120 accepted rows. Mixed responses measure within-run instability;
one board cannot establish cross-device uniqueness. Do not pool these CRPs with
old builds. The old core-experiment and array collectors use different protocols.
