# All-core design review — 8 November 2026

The eight-core implementation was better balanced at its measured eight-cycle operating profile. It was not a fully qualified paper reproduction. This review checks every current core, the actual routed placement and the same board running both preserved bitstreams.

## Confirmed circuit and interface checks

Seven shared RTL files (element, chain, core, controller, engine, UART and button) are byte-identical between the two designs and match the original eight-core build record. The controller sequences and single negative-edge, Latch-enabled arbiter architecture are the same. The current64 source/evidence manifest still verifies. A fresh routed-checkpoint query confirms one response FF and falling-edge clock inversion in each of the 64 cores.

The completed structural audit checks each core’s D/C/CE/CLR connections, gate truth tables, stage cascades, configuration selectors, LOC/BEL and LUT pin locks. The saved64 route audit contains 4096 paired internal net comparisons with zero reported skew at SLOW_MAX and FAST_MIN. Controlled digital tests exercise full configuration/readback and all 64 response bits. These establish digital structure and modeled nets, not analog PUF behavior or measured liveness.

## The physical macro changed during scaling

The 64-core build copied the RTL, not the complete tested physical macro. All eight reference arbiters use SLICEL sites. The 64 routed image uses 43 SLICEL and 21 SLICEM arbiter sites. This is legal and is not proof of a defect, but it adds a physical implementation variable. Upper/lower chain tile families also expand from CLBLL_L to four families.

Relative to the chain entrance Y, the reference excitation FF is at Y and arbiter at Y+16. The 64 design places them at Y−1 and Y+17. Six reused column pairs also shift the chains by one row, leaving the excitation FF at the old absolute row while moving the arbiter two rows. Thus the old balance cannot be assumed to transfer.

| Boundary | Eight-core absolute slow skew, median / maximum |64-core median / maximum |64 cores above eight-core maximum |
|---|---:|---:|---:|
|Excitation|11.5 / 29 ps|32 / 292 ps|33/64|
|Arbiter D/C|71 / 76 ps|169 / 517 ps|46/64|
|Cross-feedback|226 / 276 ps|150.5 / 340 ps|9/64|

Reference maxima are comparative observations, not qualification limits. The eight-core feedback paths were already mismatched, so feedback mismatch alone is a weaker explanation. The strong signed launch/arbiter correlations with bias are observational and cannot identify a unique cause for each core.

## Live timing checks on every core

The 64 tests use a frozen first64-vector subset, 20 repeats, Parallel mode, unchanged bitstream and an unchanged eight-cycle Latch window. Only excitation wait changes. The subset was selected by index, not output balance. Its aggregate differs from the full256-vector measurement and must not be substituted for that result.

| Sequence step | Excitation wait | Ones | Changed majority positions versus first8-cycle run |
|---|---:|---:|---:|
|0|8 cycles|36.957%|0/4082|
|1|16 cycles|45.355%|371/4075|
|2|32 cycles|54.299%|761/4074|
|3|8 cycles|36.771%|33/4077|
|4|64 cycles|59.879%|1018/4073|
|5|127 cycles|62.579%|1132/4072|
|6|8 cycles|36.763%|36/4075|

49/64 cores change by more than 10 percentage points between 8 and 127 cycles. Returning to 8 cycles restores approximately the original distribution. Core 30 changes from 0.078% ones at 8 cycles to 46.094% at 127 cycles on the same subset. This is timing sensitivity, not proof that a particular wait is correct or that zero-heavy cores are dead.

The six-pair matched-challenge eight-core test used identical configurations for each counterpart, on the same board today. Two other reference cores use a fixed reference pool. Widths, geometry and array context remain different.

| Eight-core condition | Excitation wait | Ones | Changed majority positions versus first8-cycle run |
|---|---:|---:|---:|
|0|8 cycles|40.635%|0/508|
|1|32 cycles|55.645%|75/507|
|2|127 cycles|62.266%|108/508|
|3|8 cycles|40.127%|4/508|

Timing sensitivity is therefore inherited from the shared implementation, not exclusively introduced by64-core scaling. It does not invalidate fixed-profile repeatability measurements, but the earlier41.25% aggregate did not establish timing robustness.

| Reference core →64 core | Same-day8-core ones, eight-cycle wait |64-core ones, same challenges and wait |
|---|---:|---:|
|0 → 50|45.703%|17.031%|
|1 → 0|39.219%|6.250%|
|3 → 10|37.812%|20.781%|
|4 → 12|37.031%|19.141%|
|6 → 21|23.359%|9.453%|
|7 → 23|66.484%|36.172%|

All six pairs have fewer ones in the 64-core image. Matching challenges removes the previous pool-size/pool-content explanation for those pairs. Physical geometry and array context still change together, so this does not prove the arbiter row alone caused the difference.

## Capture-window limitation

The Latch window remains8 controller cycles (80ns nominal). The controller reports sequence completion; it does not observe whether a falling Qb edge reached the arbiter while Latch was enabled. A controlled digital counterexample with D=1 and a falling clock100ns after Latch opens produces a completed zero with an80ns window and a captured one with a640ns window. See `tb_capture_window.v` and `capture_window_result.txt`.

That experiment proves a possible missed-capture mechanism, not its occurrence on the FPGA. Actual oscillation periods, edge counts inside the window, pulse-width evolution, initialization adequacy and asynchronous CE timing remain unmeasured. The live wait sweep demonstrates a timing interaction but does not distinguish these mechanisms. A near50% aggregate at 16 cycles is not a valid reason to select that setting.

## Next controlled corrections

1. Qualify capture behavior first. Build a separate longer-Latch-window diagnostic with the same core RTL, excitation setting and geometry; explicitly record the changed controller parameter. Check whether it reduces wait-dependent majority changes without collapsing challenge diversity. Validate repeatability and per-core outputs, not aggregate balance alone. Record any incidental routing differences between builds.
2. Separately test the reference relative arbiter geometry (same row as the chain ends), then excitation routing and site-family consistency. Do not change timing and placement in the same experiment. The actual checkpoint inspection found61/64 proposed BFFs free, but four target slices contain ordinary controller FFs, including three occupied BFFs. Moving all 64 arbiters blindly would introduce placement/control-clock conflicts; those ordinary cells need a proper place/route rebuild.
3. Preserve the matched internal routes and audit all 64 cells, connections, route status, both timing corners and control timing after each physical change. Use saved configurations plus independent fresh configurations for validation. Keep every core in reports; do not invert responses, filter for50%, add arbiters or add SHA/BCH as a bias fix.

No new RTL, placement or routing has been promoted in this review. The current64 bitstream was restored after the reference test and its64-core protocol/configuration readback was confirmed with four frames. All original sources, bitstreams and captures remain intact. The paper’s unpublished two-LUT mapping and AND/NAND/configuration-domain ambiguities remain unresolved.

## All64 observations

The complete machine-readable audit is `all_64_cores_complete.csv`. The table below separates the full256-vector eight-cycle balance from the same64-vector timing comparison. A large skew or timing change is an investigation flag, not a proven failure diagnosis.

| Core | Tile | Arbiter site | Full256 ones | Subset8 →127 cycles ones | Launch / arbiter absolute slow skew |
|---|---|---|---:|---:|---:|
|0|CLBLL_L|SLICEL.BFF|5.88%|6.25% → 31.64%|12 / 198 ps|
|1|CLBLM_R|SLICEM.BFF|52.79%|64.77% → 88.98%|79 / 217 ps|
|2|CLBLM_R|SLICEL.BFF|45.59%|55.31% → 79.69%|90 / 24 ps|
|3|CLBLM_L|SLICEM.BFF|64.75%|60.47% → 67.34%|167 / 33 ps|
|4|CLBLL_R|SLICEL.BFF|28.54%|33.12% → 82.11%|19 / 169 ps|
|5|CLBLM_L|SLICEL.BFF|26.89%|32.89% → 74.14%|12 / 201 ps|
|6|CLBLM_R|SLICEL.BFF|32.44%|38.12% → 66.17%|9 / 167 ps|
|7|CLBLL_L|SLICEL.BFF|7.05%|8.20% → 55.31%|25 / 201 ps|
|8|CLBLM_R|SLICEM.BFF|90.74%|94.06% → 93.75%|278 / 149 ps|
|9|CLBLM_L|SLICEM.BFF|77.29%|85.39% → 82.58%|195 / 55 ps|
|10|CLBLL_L|SLICEL.BFF|20.18%|20.78% → 52.58%|12 / 201 ps|
|11|CLBLM_R|SLICEL.BFF|37.60%|30.70% → 79.61%|32 / 169 ps|
|12|CLBLL_L|SLICEL.BFF|18.52%|19.14% → 65.86%|23 / 203 ps|
|13|CLBLM_R|SLICEM.BFF|0.80%|0.00% → 20.39%|93 / 215 ps|
|14|CLBLM_R|SLICEL.BFF|34.67%|44.77% → 64.14%|79 / 22 ps|
|15|CLBLM_L|SLICEM.BFF|55.53%|57.73% → 60.39%|292 / 28 ps|
|16|CLBLM_L|SLICEL.BFF|14.82%|13.91% → 69.77%|20 / 343 ps|
|17|CLBLM_R|SLICEL.BFF|35.57%|33.75% → 38.67%|11 / 43 ps|
|18|CLBLL_L|SLICEL.BFF|23.48%|26.80% → 74.06%|25 / 201 ps|
|19|CLBLM_R|SLICEM.BFF|30.76%|28.59% → 22.50%|259 / 101 ps|
|20|CLBLM_L|SLICEM.BFF|27.54%|28.44% → 54.37%|195 / 89 ps|
|21|CLBLL_L|SLICEL.BFF|8.71%|9.45% → 48.98%|0 / 203 ps|
|22|CLBLM_R|SLICEL.BFF|28.87%|23.91% → 65.78%|19 / 169 ps|
|23|CLBLL_L|SLICEL.BFF|32.48%|36.17% → 81.41%|25 / 256 ps|
|24|CLBLM_R|SLICEM.BFF|8.11%|7.89% → 36.25%|69 / 215 ps|
|25|CLBLM_R|SLICEL.BFF|62.19%|64.92% → 84.38%|80 / 22 ps|
|26|CLBLM_L|SLICEM.BFF|62.54%|69.84% → 65.55%|292 / 31 ps|
|27|CLBLL_R|SLICEL.BFF|12.97%|12.34% → 46.88%|9 / 169 ps|
|28|CLBLM_L|SLICEL.BFF|3.96%|4.53% → 49.53%|25 / 201 ps|
|29|CLBLM_R|SLICEL.BFF|46.04%|49.22% → 72.58%|11 / 167 ps|
|30|CLBLL_L|SLICEL.BFF|0.43%|0.08% → 46.09%|25 / 517 ps|
|31|CLBLM_R|SLICEM.BFF|78.48%|81.72% → 71.33%|259 / 151 ps|
|32|CLBLL_L|SLICEL.BFF|2.40%|3.91% → 41.48%|25 / 203 ps|
|33|CLBLM_R|SLICEL.BFF|56.64%|52.03% → 83.91%|32 / 169 ps|
|34|CLBLL_L|SLICEL.BFF|29.34%|21.09% → 61.95%|0 / 203 ps|
|35|CLBLM_R|SLICEM.BFF|6.80%|8.75% → 45.23%|91 / 215 ps|
|36|CLBLM_R|SLICEL.BFF|42.32%|37.03% → 75.78%|104 / 22 ps|
|37|CLBLM_L|SLICEM.BFF|66.46%|68.36% → 63.52%|292 / 31 ps|
|38|CLBLL_R|SLICEL.BFF|26.74%|29.61% → 57.81%|7 / 169 ps|
|39|CLBLM_L|SLICEL.BFF|11.70%|9.84% → 46.25%|25 / 201 ps|
|40|CLBLM_R|SLICEL.BFF|44.57%|40.70% → 83.59%|11 / 202 ps|
|41|CLBLL_L|SLICEL.BFF|1.58%|0.86% → 27.27%|25 / 256 ps|
|42|CLBLM_R|SLICEM.BFF|44.28%|44.38% → 29.84%|248 / 151 ps|
|43|CLBLM_L|SLICEM.BFF|80.16%|85.08% → 81.41%|195 / 56 ps|
|44|CLBLL_L|SLICEL.BFF|8.95%|12.11% → 31.72%|2 / 203 ps|
|45|CLBLM_R|SLICEL.BFF|56.48%|52.11% → 95.16%|32 / 169 ps|
|46|CLBLL_L|SLICEL.BFF|37.13%|39.61% → 70.78%|25 / 201 ps|
|47|CLBLM_R|SLICEM.BFF|16.29%|11.48% → 62.11%|81 / 215 ps|
|48|CLBLM_L|SLICEM.BFF|92.36%|96.48% → 95.78%|292 / 31 ps|
|49|CLBLL_R|SLICEL.BFF|26.89%|36.80% → 67.58%|29 / 169 ps|
|50|CLBLL_L|SLICEL.BFF|15.00%|17.03% → 52.19%|11 / 201 ps|
|51|CLBLL_R|SLICEL.BFF|80.35%|81.48% → 72.81%|282 / 51 ps|
|52|CLBLM_L|SLICEL.BFF|7.68%|7.50% → 57.19%|23 / 256 ps|
|53|CLBLL_L|SLICEL.BFF|15.27%|15.78% → 41.02%|26 / 203 ps|
|54|CLBLM_R|SLICEM.BFF|84.51%|82.42% → 77.27%|292 / 30 ps|
|55|CLBLL_L|SLICEL.BFF|17.03%|16.33% → 53.12%|143 / 203 ps|
|56|CLBLM_R|SLICEM.BFF|4.96%|6.02% → 40.86%|81 / 215 ps|
|57|CLBLM_R|SLICEL.BFF|54.22%|57.73% → 82.34%|103 / 22 ps|
|58|CLBLM_L|SLICEM.BFF|83.07%|83.05% → 79.92%|292 / 31 ps|
|59|CLBLL_R|SLICEL.BFF|7.13%|8.59% → 58.91%|32 / 169 ps|
|60|CLBLL_L|SLICEL.BFF|20.21%|25.39% → 67.19%|12 / 201 ps|
|61|CLBLL_R|SLICEL.BFF|87.95%|88.91% → 92.03%|281 / 51 ps|
|62|CLBLM_L|SLICEL.BFF|31.86%|22.03% → 64.22%|25 / 201 ps|
|63|CLBLM_R|SLICEM.BFF|65.45%|59.45% → 52.03%|291 / 30 ps|

## Evidence and reproduction

`rtl_comparison.json`: shared source identities against the eight-core build record. `DESIGN_COMPARISON.json`, `near_reference_geometry.csv`, `eight_core_boundaries.csv`: layout/boundary comparison. `TIMING_RESULTS.json`, `all_core_timing_sensitivity.csv`, `SWEEP_INDEX.json`, `SWEEP_LONG_INDEX.json`:64-core live sweep. `EIGHT_TIMING_RESULTS.json`, `EIGHT_SWEEP_INDEX.json`: same-day reference sweep. `arbiter_target_feasibility.csv`: fresh routed-checkpoint occupancy/edge checks. All indexed captures have their exact configuration matrices and metadata. The earlier full256-vector Parallel/Sequential/Parallel investigation remains in the adjacent `investigation_2026-11-08` directory.

