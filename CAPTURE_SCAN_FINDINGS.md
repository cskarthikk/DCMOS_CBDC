# Narrow-window capture findings — 3 November 2026

Data: all 42 numbered acquisition CSVs under
`build_m1/measurements/timing/capture_scan_fe20e89e459249f59ff6d5d3288abfde`.
The complete numerical extraction is in
`build_m1/timing_diagnostic/capture_scan_analysis.json`.

## Collection checks

There are 5,040 accepted queries: 42 settings x 6 challenges x 20 repeats, plus
42 rejected all-zero controls. Each challenge has trials 1..20 in every file;
there are no duplicate challenge/trial keys. Timing settings, response values,
version/acceptance flags and the two edge fields agree with their encoded flags.
The acquisition script checked each frame's challenge echo, timing echo and XOR.

The six challenges are 0001, 0002, 8000, 0007, 106A and 007C. This is a selected
diagnostic sample, not a uniformity or uniqueness population.

## Main observations

For 10 ns nominal capture windows, both edge flags were recorded in all 120
queries at waits 10, 40 and 70 ns. At waits 20, 30, 50 and 60 ns neither edge
flag was recorded in any query. At 100 ns both flags appeared in 119/120 queries.
These recurring early activity bands, roughly 30 ns apart, support repeated
falling-edge activity in the feedback circuit. They do not provide an exact
oscillation period: each window uses a separate evaluation, and the clock/CE
routes and sampling aperture affect detection.

At nominal waits 10 and 40 ns, all six challenges returned zero in all trials,
despite both edge flags being present. That early result does not distinguish
the six challenges. At 70 ns, 0002 returns one in all trials while the other five
return zero. At 100 ns, 007C returns one in 13/20 trials and 0002 in 20/20.
The retained bit therefore changes with capture position even for a fixed
challenge; it cannot currently be treated as an unqualified, fixed sign of a
single path-delay difference.

At 400 ns, all 120 queries return zero with neither activity flag. These rows are
protocol completions, not evidence of a reproducible physical race decision.
A missed falling clock edge can leave the explicitly cleared arbiter at zero.
Missing flags cannot establish that the chains never toggled outside that window.

There are also 10 accepted queries over the whole scan with response=1 while
Qb's monitor flag is zero. An ideal same-edge, same-enable observer would not
produce that combination. Separate physical clock and CE paths can make the
arbiter and monitor disagree near a window boundary; metastability and other
timing effects are also possible. This is a reason to treat flags as diagnostic
observations rather than perfect witnesses of arbiter capture. The data do not
identify the particular physical mechanism. No such disagreement occurs in
either 8/8 reference collection.

## Reference comparison

The initial and final 80 ns wait / 80 ns capture collections have both flags in
all 120 accepted queries. Ones total 48 initially and 45 finally. The only count
change is 0007, from 8/20 ones to 5/20. The other five challenge counts are
identical: 0001=0, 0002=20, 8000=0, 106A=0 and 007C=20.
This supports the scan having completed on a functioning build with broadly
similar reference behavior. It does not exclude all drift or certify stability.

## Relationship to the paper

ResearchPaper.pdf, Section 3.1 (PDF pages 5–6), explicitly describes square-wave
signals flowing through the cross-coupled structure and a clock-enabled
negative-edge DFF. Thus recurring edges are not, by themselves, a topology bug.
The paper does not specify our 80 ns wait and 80 ns capture duration, nor does it
state that the first edge must be selected. Selecting the first observed window
solely because it is first is not justified by the paper or these measurements.

The drawing connects D=Qu and clock=Qb; nearby prose inconsistently names Qu as
the falling clock signal. The implementation still follows the drawing. The
paper models the result using path-delay order; the observed timing dependence
means that model has not been demonstrated to describe this physical build's
retained response independently of capture phase.

## Next engineering work

Do not select the earliest all-zero setting, the later mostly-one setting, or a
setting nearest 50% ones as a fix. Further large challenge collections at the same
settings will not explain the mechanism.

The next review should examine the actual arbiter D, C, CE and CLR signals and
their physical routes, including rising/falling delay differences, feedback
evolution, setup/hold constraints and which eligible falling edge is retained.
Post-route timing simulation is a useful next diagnostic for waveform/sequence
errors, but cannot establish analog metastability behavior or true per-chip
manufacturing mismatch. Any physical correction needs a separate measured build.
No new board programming or further board collection is necessary to start that
review. A calibrated fine-time instrument would be needed for numerical silicon
race margins; the flags and 10 ns scan are not such an instrument.
