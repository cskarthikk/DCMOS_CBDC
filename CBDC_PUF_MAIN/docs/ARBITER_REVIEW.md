# Arbiter review — 3 November 2026

## Purpose

Check whether the retained response follows the paper's intended path-delay
comparison, without changing gates, inventing response bits, or selecting a
timing setting solely to obtain balanced outputs. The main project result is
still the physical implementation plus its board measurements; see
`MENTOR_RESULTS.md` for a presentation-oriented summary.

## Checks completed

- The paper's drawing still maps D=Qu, falling-edge C=Qb and CE=Latch. No
  substantiated connection/polarity error was found that justifies changing RTL.
- Existing digital tests establish the requested control pulse durations; the
  hardware scans establish that the retained responses depend on capture timing.
- Exported Verilog timing netlists and fast/slow SDF files from the saved
  `build_m1/timing_diagnostic/timing_routed.dcp`; no FPGA programming was done.
- Ran focused routed-core timing simulation at fast/minimum and slow/maximum
  corners. SDF backannotation reported success; both traces completed without
  timing warnings in those runs. They cover two challenges, 0001 and 0002, at
  1/1, 8/8 and 32/16 timing settings.

The focused test uses ideal external c/excite/latch/clr signals and the actual
exported core, including its internal routes and arbiter. It excludes the UART,
controller and their external input routes. It is not a full-system timing
validation, and it does not contain per-chip manufacturing variation or an
analog metastability/noise model. Earlier full-system attempts with injected
internal inputs did not yield valid controller traces; a full UART timing run
was stopped because of runtime. Those attempts are not evidence of an RTL fault.

## What the focused model shows

| Setting (wait/capture cycles) | Enabled Qb falling edges, fast/min | Enabled edges, slow/max |
|---|---:|---:|
| 1 / 1 | 1 | 0 |
| 8 / 8 | 3 | 2 |
| 32 / 16 | 7 | 3 |

The counts above apply to each of the two tested challenges. The model produces
zero responses in all six evaluations per corner. In the fast early window it
captures a zero; in the slow early window it misses capture and retains cleared
zero. These are distinct mechanisms even though the visible bit is the same.

At enabled falling-clock events, D is already zero, with its most recent
transition 56 ps earlier in fast/min and 72 ps earlier in slow/max. These
ideal-control traces reflect the nonzero terminal wire offset. At 8/8 the
arbiter receives multiple eligible clock edges while enabled, rather than a
single controlled sample. Multiple edges themselves are compatible with the
paper's square-wave description; a phase-dependent retained bit remains an
unresolved quality issue in the actual hardware.

The generic model does not reproduce the hardware's challenge-dependent bits:
for example 0002 returns one in hardware at 8/8 but zero in these model traces.
The simulation therefore cannot be used to choose physical challenge bits or
claim that a particular real-chip mismatch caused the instability. All four
process/min/max combinations and all challenges were not simulated; these are
diagnostic traces, not timing signoff.

## Remaining terminal mismatch

Routed net-delay model values, in ps:

| Wire to arbiter pin | Slow max | Slow min | Fast max | Fast min |
|---|---:|---:|---:|---:|
| Qu to D | 776 | 643 | 314 | 263 |
| Qb to C | 848 | 724 | 369 | 319 |
| Absolute difference | 72 | 81 | 55 | 56 |

This mismatch is outside the 48-pair internal routing result. The flip-flop
also has nonzero setup/hold requirements. For example the fast SDF includes a
94 ps hold requirement for D relative to the falling C edge and negative setup
values; a bare sign-of-delay rule is not a complete flip-flop margin analysis.
These are library/model values, not measurements of the chip's true aperture.

## Physical experiment

`scripts/experiment_arbiter_bel.tcl` compares alternative flip-flop positions at
the arbiter's existing slice location, keeping logic and LUT placements fixed.
It removes the arbiter's data branch, fixes the remaining Qu route trunk, restores
the common clock/enable/reset connections, and routes the new data/output branch.
It records all four modeled terminal wire differences and checks protected
feedback/monitor delay values. It does not program hardware or select candidates
using their measured bit balance.

The original BFF position has worst modeled absolute terminal-wire difference
81 ps. The AFF experiment increased it to 145 ps and changed a protected delay;
it was rejected. The CFF/DFF comparisons are recorded separately under
`build_m1/arbiter_bel_round2`. A smaller terminal offset alone is not a validated
PUF fix, especially if another critical path changes. Keep each physical build
and its measurements separate.

## Reproduce the diagnostic core trace

Export in an otherwise empty Vivado session:

```tcl
source {C:/BTech/Semester_5/DCMOS/Project/scripts/export_arbiter_timing.tcl}
```

Then run `scripts/run_arbiter_timing_sim.ps1 -Corner fast -Delay min` or
`-Corner slow -Delay max`. Outputs are under `build_sim/arbiter_timing/core_*`.
Check the SDF success messages, `events.csv`, `summary.csv` and timing warnings.
An unannotated zero-delay loop is not an acceptable substitute for this trace.

AMD references: [timing-netlist export](https://docs.amd.com/r/2025.2-English/ug835-vivado-tcl-commands/write_verilog),
[simulation libraries and timing annotation](https://docs.amd.com/r/2024.1-English/ug900-vivado-logic-simulation/Using-AMD-Simulation-Libraries).
