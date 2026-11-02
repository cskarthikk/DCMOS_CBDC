# Diagnostic: swapped physical chain locations - 2026-11-01

Baseline bitstream/checkpoint/placement and reports are preserved in
build_m1/baseline_all_ones. Baseline SHA256:
E39FD978C0EE9320B1676ADC9AE843CD93BA8D86BA6EBDD6D000AA8B3118E023

New file constraints/puf_swapped_placement.xdc exchanges upper/lower X20/X21
slice locations. The 98 cell names, BEL choices, LUT input mappings and RTL are
unchanged. Static checks confirm 98 LOCs and no duplicate (site,BEL) allocation.
Do not enable original and swapped placement simultaneously. Mark new file
USED_IN_SYNTHESIS=false, USED_IN_IMPLEMENTATION=true. Disable original only
for implementation. Keep board XDC and exact feedback acknowledgement enabled.

This is a diagnostic experiment, not a guaranteed repair. Rerouting may also move
other paths or the unconstrained arbiter, so it is not a perfectly isolated
physical swap. A change of response suggests physical implementation dependence;
constant responses still require investigation of bias and capture behavior.
Neither outcome alone demonstrates PUF randomness, uniqueness or reliability.

Additional analysis of the BASELINE routed checkpoint: temporary 100 ns max-delay
constraints were used in memory only to expose combinational paths from each
entrance excite input I0 to the opposite feedback entrance input I1. Structural
worst-case SLOW paths were 34.992 ns upper, 34.507 ns lower. Reported logic delay
was 4.092 ns for both; routing was 30.900 ns upper, 30.415 ns lower. These are
unconditioned structural paths, not exact valid-challenge or silicon race delays.
The temporary constraints and analysis changes were NOT saved to the checkpoint,
project, board XDC, or bitstream. Their positive slack is not validation evidence.
Reports are in build_m1/diagnosis/*_full_estimate.rpt.

GUI procedure: add new XDC, disable original placement for implementation,
rerun implementation, and save route status/DRC/timing/netlist/checkpoint under
build_m1/swapped_routed. Review before programming the diagnostic version.
To restore baseline: re-enable original placement, disable swapped placement,
or program the preserved baseline .bit file directly without rebuilding.
