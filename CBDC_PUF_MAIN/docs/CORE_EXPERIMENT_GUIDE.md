# Corrected single-core experiments — 3 November 2026

## What changed

This is a separate CBDC-derived experimental architecture, not a claim of exact
reproduction of the paper's unpublished physical macro. Original RTL tops,
bitstreams and datasets remain the baseline. No FPGA programming was automated.

The experiment provides three independent controls in one programming file:

- Single-shot capture: the existing Qb activity FF acts as the primary done flag.
  After the first eligible Qb falling edge, a LUT disables the primary arbiter's
  CE. The reverse arbiter uses the Qu activity FF in the same way. No extra done
  FF is added. Both monitors and arbiters exist in every mode, keeping static
  clock loading constant between runtime comparisons.
- Automatic entrance parity: odd challenges use AND and even challenges use
  NAND, from LUT3 INIT=87, with parity computed from the held challenge. This is
  a coverage extension beyond the paper's explicit diagram; launch eligibility
  does not certify entropy, independence, or repeatability.
- Reverse arbiter: D=Qb and falling C=Qu. It occupies a separate slice because
  the clocks differ. A and B are returned separately. No XOR/XNOR cancellation
  or corrected response is computed.

The primary connection remains D=Qu, falling C=Qb. For a wait of zero in shot
mode, the controller asserts latch one full system-clock cycle BEFORE exciting
the chains. This is first-after-excitation capture. With a nonzero wait, shot
mode instead takes first-after-enable; the distinction is explicit.

## Runtime modes

Mode bits: bit0 single-shot, bit1 automatic parity, bit2 reverse arbiter enabled.
All values 0..7 are defined by those bits. Reserved upper bits reject the request.

| Mode | Capture | Parity policy | Reverse result |
|---|---|---|---|
| 0 | Continuous | Odd only | Disabled, B=0 placeholder |
| 1 | Single shot | Odd only | Disabled, B=0 placeholder |
| 3 | Single shot | AND/NAND automatic | Disabled, B=0 placeholder |
| 5 | Single shot | Odd only | Enabled |
| 7 | Single shot | AND/NAND automatic | Enabled |

Modes 2,4,6 are the remaining continuous/parity/reverse combinations. Mode 0 is
the continuous CONTROL IN THIS NEW PHYSICAL BUILD, not an electrical duplicate
of the old measured baseline: an extra arbiter and parity/CE gates now exist.
Never pool the builds' CRPs. Wait=0 is allowed only in shot mode; capture length
is 1..255 clock cycles. One cycle is 10 ns. Mode and timing are latched per query.
Clear/settle/hold timing remains fixed. Inherited static EXCITE/LATCH parameters
do not replace the runtime timing inputs in this experimental controller.

## Physical implementation and checks

Upper/lower LUT placement and their 96 internal connections are copied from the
measured core and checked after routing. All 120 original core/input-driver
placements are preserved. The two entrance gates now have third input A3.
Additional parity loads and the reverse arbiter require new input/terminal
routing; those are not claimed identical to the old build.

Primary arbiter: SLICE_X23Y116/BFF. Reverse: SLICE_X23Y118/BFF. Monitors stay at
X25Y117/AFF (Qb) and X21Y117/AFF (Qu). CE gates use X22Y116 and X22Y118/A6LUT.
The different-clock arbiters are not placed in the same slice.

Completed checks:

- Functional UART/engine regression: mode and timing echo, invalid requests,
  zero timing rejection, pre-excitation arm, continuous recapture, exactly one
  shot, reverse-disable behavior and checksum/truncated-frame recovery.
- Exhaustive artificial-delay core test: all 65,536 challenges initialize,
  launch and permit exactly one primary capture with automatic parity. This is
  not a physical validation of all silicon CRPs.
- Original fixed-timing and serial regressions remain passing.
- Four routed-core SDF tests (fast/min, fast/max, slow/min, slow/max): one-shot
  attempts exactly one; continuous mode can recapture; gate self-disable occurs
  after the sampled edge and before later captures in the tested cases. No timing
  warnings occurred in those tests. Ideal external controls exclude the external
  controller input wires; no per-chip noise/manufacturing model is present.
- Model CE feedback disable delays span approximately 0.55–1.69 ns in those
  cases. They are not measured silicon delays or an all-environment guarantee.
- Routed 745/745 nets, zero routing errors. Conventional setup/hold slack:
  +3.681/+0.058 ns. The familiar five loop/gated-clock DRC warnings remain.
  Methodology has four unclocked-sequential-cell critical warnings (two arbiters
  and two monitors); this is not complete asynchronous timing signoff.
- Host-only mocks checked frame encoding, raw pair decoding, rejection of a
  mismatched echoed mode and all six comparison configurations. The analyzer is
  designed to retain missing-edge rows. Real serial exchange awaits the board.

Bitstream: `build_m1/core_experiment/cbdc_core_experiment.bit`.

## Program and smoke test

1. Power/connect Basys 3. In Vivado Hardware Manager right-click xc7a35t_0,
   Program Device. Select the file above. Debug probes field stays empty.
2. Program, then press/release BTNU and wait a second. LD4 indicates ready.
3. Use the NEW collector/protocol, not either old collector:

```powershell
Set-Location 'C:\BTech\Semester_5\DCMOS\Project'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\collect_core_experiment.ps1 -Port COM5 -Mode 3 -WaitCycles 0 -CaptureCycles 16 -Repeats 3
```

Expected: 24 queries accepted, zero rejected, over the default eight challenges
(including even values 0000,0003,FFFF). A/B values are not predetermined.
It automatically uses a unique filename and records a bitstream hash and settings.
Missing activity flags or protocol errors need review before the comparison.
The hash identifies the local file, not proof of which file the operator loaded.

## Controlled comparison

After the smoke test works, keep the same programming file loaded and run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\run_core_experiment_comparison.ps1 -Port COM5 -Repeats 20 -RunName comparison01
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\analyze_core_experiment.ps1 -Directory build_m1/measurements/core_experiment/comparison01
```

This uses the first 32 original reference odd challenges and their LSB-toggled
even partners: 64 distinct values. Configurations:

1. Mode0, wait8, capture8: new continuous baseline.
2. Mode1, wait8, capture8: first eligible edge after enable, same timing.
3. Mode1, wait0, capture8: arm before excitation, same parity policy.
4. Mode3, wait0, capture8: add parity coverage; compare odd subset separately.
5. Mode7, wait0, capture8: enable the reverse readout.
6. Repeat Mode0, wait8, capture8: reference drift check.

Expected per file: 1,280 requests. Modes0/1 accept 640 odd requests and reject
640 even requests. Modes3/7 accept all 1,280. Six files total 7,680 requests.
Expected rejection under odd-only policy is not a communication failure or PUF
zero. The analyzer compares primary A on the common odd subset and reports
coverage/rejections separately. Do not compare all-challenge balance across
different eligible populations as if they were identical datasets.

Pair labels in detail CSV use A first: pair_01 means A=0,B=1 (raw byte 2),
pair_10 means A=1,B=0 (raw byte 1). Pair counts are meaningful as dual readout
only when bit2 of mode is enabled. Equal pairs are diagnostic observations,
not automatically invalid serial replies or proof of failure. Complementarity
does not certify metastability freedom, and XOR/XNOR would lose winner direction.

## Reproduce without touching old projects

In an empty Vivado session source `scripts/build_core_experiment.tcl` to generate
the checkpoint and core SDF. Run `scripts/run_experiment_sim.ps1`, its
`-Top tb_experiment_coverage` variant, and all four combinations of
`scripts/run_experiment_postroute.ps1`. After checking timing warnings, source
`scripts/finalize_core_experiment.tcl` to generate the separate bitstream.

Do not scale to 128 cores or claim improvement until the single-core comparisons
support it. Physical bias can remain even with correct first-edge capture; the
three controls test different hypotheses and are not guaranteed remedies.
