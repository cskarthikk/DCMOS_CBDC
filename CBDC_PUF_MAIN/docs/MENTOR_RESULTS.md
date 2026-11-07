# CBDC-PUF on Basys 3: implementation and preliminary hardware results

## Objective and scope

Implement the paper's configurable butterfly delay-chain core on a Basys 3 and
verify whether repeated challenges produce useful, repeatable physical responses.
The implemented core has two 16-stage selectable buffer/inverter chains,
cross-coupled feedback and a falling-edge flip-flop arbiter. The board is an
XC7A35T-1CPG236. The system controller runs at 100 MHz.

This milestone covers one instrumented core and UART measurement. It does not
implement the paper's complete 128-core SHA-3/BCH framework or establish its
security/performance claims. The default stage realization uses separate buffer,
inverter and selector LUTs; it follows the circuit diagram but is not a recovered
copy of the authors' primitive netlist or hard macro.

## Physical implementation result

Corresponding upper/lower stages were placed at matching slice positions and
their LUT input pins locked. Forty-eight pairs of internal connections use the
same relative route patterns. Both selectable paths are included. The core uses
66 LUT2s and 32 LUT3s; instrumentation adds two edge-monitor FFs to the one
arbiter FF.

| Internal routing check | Initial layout | Matched layout |
|---|---:|---:|
| Corresponding sink connections with equal slow-maximum modeled delay | 0/64 | 64/64 |
| Largest corresponding internal wire-delay mismatch | 60 ps | 0 ps |

The zero mismatch is a Vivado model result, not a measurement of zero silicon
variation. Terminal/feedback and controller connections are outside this
48-pair matching claim. In particular, the modeled output-wire mismatch to the
arbiter was reduced from 267 ps to 72 ps; it was not eliminated.

The matched serial layout was fully routed with zero routing errors. Its
conventional controller timing passed. Asynchronous arbiter/loop warnings remain;
passing controller timing does not sign off the PUF race.

## Main board measurements

Each full run uses the same selected 256 supported odd-parity challenges, with
20 repetitions per challenge. All 5,120 accepted queries per run had both activity
flags. Invalid all-zero challenge controls were rejected and kept separate.

| Physical build/run | Ones | Ones fraction | Challenges returning both values |
|---|---:|---:|---:|
| Original serial layout, run 02 | 605/5,120 | 11.82% | 8/256 |
| Matched layout, run 01 | 685/5,120 | 13.38% | 12/256 |
| Matched layout, run 02 | 679/5,120 | 13.26% | 13/256 |

Across the two matched-layout runs, 241/256 challenges returned the same bit
through all 40 trials; 15 changed at least once. Matching the internal routing
improved physical control but did not remove the raw response's strong zero bias
or instability. Different-time measurements do not isolate routing as the sole
cause of the statistical changes. This one-board sample does not measure
cross-device uniqueness or environmental reliability.

## Additional finding explaining the next investigation

A separate diagnostic controller permits wait/capture durations to change over
UART without rebuilding between settings. Its build preserves 114 core/challenge
nets and 120 placements. Three controller output nets are routed anew; all
runtime settings then use that one fixed bitstream. The diagnostic has its own
baseline and is not pooled with earlier build statistics.

For 18 selected diagnostic challenges, a 320 ns wait / 160 ns capture setting
returned a constant one for 17 challenges and constant zero for one over 50
trials. This is highly biased, not a better PUF simply because it repeats. A
six-challenge narrow-window scan also showed recurring activity and responses
that depend on capture position. Thus the complete physical response mechanism
and capture conditions still need validation against the paper's intended
path-delay decision.

## Conclusion suitable for presentation

“A single CBDC-PUF core was implemented and measured on a Basys 3. Corresponding
internal routes were explicitly matched and verified, and challenge-response
acquisition was automated. Hardware measurements demonstrate challenge-dependent
responses, but the current raw output remains biased and some challenges are
unstable. Capture-window experiments show a timing-dependent retained response,
which is the focus of the next physical/timing analysis.”

Useful evidence to show: the paired route view in Vivado, the 48/48 route
comparison, the full-run table above, and representative per-challenge repetition
counts. Keep the detailed scan logs as supporting material. Do not label these
results as a fully reproduced, certified, unbiased, or secure PUF.

## Evidence locations

- `build_m1/matched_routing_center_launch/route_comparison.txt`
- `build_m1/matched_routing_center_launch/comparison_summary.json`
- `build_m1/measurements/run02.csv`
- `build_m1/measurements/matched_run01.csv`
- `build_m1/measurements/matched_run02.csv`
- `build_m1/measurements/timing/capture01/`
- `build_m1/measurements/timing/capture_scan_fe20e89e459249f59ff6d5d3288abfde/`
