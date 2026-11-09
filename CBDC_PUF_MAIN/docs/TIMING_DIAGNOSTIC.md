# Runtime capture-timing experiment

This is a separate diagnostic top, `cbdc_puf_serial_timing`, with its own protocol.
The original serial/manual tops and original datasets remain separate. The chain
and arbiter RTL is unchanged. Wait and capture lengths are latched per request;
both are 1..255 cycles of the 100 MHz clock (10 ns per cycle). Zero values are
rejected. The 4-cycle clear, 4-cycle initialization settle and 4-cycle post-capture
hold remain unchanged.

The purpose is to test whether retained responses depend on capture timing. This
does not directly measure analog delay or metastability. In particular, 10 ns
steps are not a sub-nanosecond measurement of the race margin. No setting is
declared correct merely because its responses are closer to 50% ones.

## Physical control

`scripts/build_timing_diagnostic.tcl` first reads the preferred matched routed
checkpoint, then synthesizes the new controller/UART design separately. It
preserves the core LUT/FF placements, LUT pin assignments, all 98 core LUT output
routes (including the feedback/arbiter/monitor fanout), the 16 challenge driver
routes, and all 19 input-driver placements. This totals 114 preserved nets and
120 cell placements. The build aborts
if those saved routes or placements differ after routing. New controller logic
is placed and routed around these constraints. Excitation, capture-enable and
reset/clear wiring is allowed to route normally: former controller load branches
are absent in the runtime controller, so fixing those entire old nets would
leave unused antennas. Their driver placements remain fixed. The clear/settle
cycle lengths remain fixed. All new wires are the same for every runtime
setting, but those three controller wires are not claimed identical to the
earlier build. The new firmware therefore has its own 8/8 reference measurement.

This is stronger control than simply recompiling each timing setting. Every
setting in a sweep uses one programmed bitstream. New neighboring logic can
still affect physical behavior; compare the new 8/8 baseline separately from
the older build. Preserve all prior CSVs.

## Verification and protocol

Verified build (3 November 2026): timing simulation and original serial regression
passed. The analyzer fixture verifies that missing-edge rows are retained.
Implementation preserved 114 critical nets and 120 placements. All 721 routable
nets are fully routed with zero routing errors. Conventional setup/hold slack is
+3.458 ns / +0.053 ns. DRC reports the same five PUF-related warnings and no
errors. Methodology retains three TIMING-17 critical warnings for the unclocked
asynchronous arbiter/monitor cells, plus the existing loop/I/O-delay warnings.
This is not asynchronous timing signoff. Bitstream generation completed; the
board has not been programmed by this preparation.

`scripts/run_timing_sim.ps1` checks serial echo/checksum, actual emitted wait and
capture durations at 1, 8, 16, 32 and 255-cycle examples, zero rejection,
unsupported challenge rejection, corrupt checksums and truncated-frame recovery.
The original `scripts/run_serial_sim.ps1` regression is also used. Simulation
uses artificial PUF delays and does not validate analog behavior.

Request bytes: A6, challenge low, challenge high, wait, capture, XOR of previous
five bytes. Response: 5A, challenge low, challenge high, wait, capture, flags,
response, XOR of previous seven bytes. Flags bits5:4 are 11; bit0 accepted;
bits2:1 activity flags; bit7 timeout. Thus an accepted query with both activity
flags has flags=37 hex. The rejected all-zero control has flags=30 hex.
The host verifies the echoed settings. Use `collect_timing_crps.ps1`, not the
old collector, with this firmware.

## Board steps

1. In Vivado Hardware Manager, right-click xc7a35t_0 and choose Program Device.
2. Select `build_m1/timing_diagnostic/cbdc_timing_diagnostic.bit`. Leave the debug
   probes field empty. Program once for the entire experiment.
3. Press and release BTNU. Wait a second. LD4 indicates ready.
4. Close other serial terminals and use PowerShell in the project directory.

Initial 18-challenge, 3-repeat check at the previous 80 ns / 80 ns settings:

```powershell
Set-Location 'C:\BTech\Semester_5\DCMOS\Project'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\collect_timing_crps.ps1 -Port COM5 -WaitCycles 8 -CaptureCycles 8 -Repeats 3 -Output build_m1/measurements/timing_smoke01.csv
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\analyze_crps.ps1 -InputCsv build_m1/measurements/timing_smoke01.csv
```

Expected: 54 accepted queries plus the rejected control. Ideally no missing
activity flags at the 8/8 baseline. Response values are not predetermined.
Wrong firmware, timeout, echo/checksum or framing failures are not PUF responses.
Stop and inspect them before continuing.

Then run the automatic sweep:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\run_timing_sweep.ps1 -Port COM5 -Repeats 50 -RunName capture01
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\analyze_timing_sweep.ps1 -Directory build_m1/measurements/timing/capture01
```

Replace COM5 if the board's port changed. The sweep covers wait values 8,16,32
cycles (80,160,320 ns) and capture values 4,8,16 cycles (40,80,160 ns). It repeats
8/8 at the end: 10 files, 900 accepted queries per file, 9,000 total. Eighteen
challenges comprise the 15 observed unstable across the matched runs plus three
controls (0001,0002,8000). Trials are interleaved by challenge within each setting.
The order of settings is fixed and recorded, not a randomized environmental study.

Some shorter windows or longer waits may miss activity; those accepted rows remain in the data
and are counted, not filtered. The analyzer writes `timing_summary.csv` and
`timing_challenges.csv`. Compare the first/last baseline for drift before
attributing differences to timing. The sweep writes local bitstream SHA-256 and
settings metadata; the hash does not prove which file the operator programmed.

## Interpretation

If the same challenge changes its response probability systematically with the
wait or capture length, capture phase/window sensitivity is implicated. If first
and last 8/8 results differ considerably, drift/noise also needs consideration.
If many settings remain unstable, this experiment has not established a clean
capture margin. Do not discard inconvenient outcomes or select a setting just to
make aggregate responses balanced. A promising setting still needs larger and
environmental hardware checks before accepting PUF quality.

## Reproduce locally

In a separate empty Vivado Tcl session:

```tcl
source {C:/BTech/Semester_5/DCMOS/Project/scripts/build_timing_diagnostic.tcl}
```

The build writes separate reports, checkpoint and bitstream under
`build_m1/timing_diagnostic`. It never programs the board. Conventional controller
timing and PUF asynchronous timing limitations must be reviewed separately.
