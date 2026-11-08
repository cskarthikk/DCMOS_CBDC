from pathlib import Path
import json,csv,statistics
o=Path(__file__).resolve().parent
design=json.loads((o/'DESIGN_COMPARISON.json').read_text());timing=json.loads((o/'TIMING_RESULTS.json').read_text());eight=json.loads((o/'EIGHT_TIMING_RESULTS.json').read_text())
rows=list(csv.DictReader((o/'all_64_cores.csv').open()));placement={int(r['core']):r for r in csv.DictReader((o/'arbiter_target_feasibility.csv').open())}
for r in rows:
 i=int(r['core']);t=timing['per_core'][i];p=placement[i]
 r['arbiter_bel_family']=p['current_bel'];r['proposed_endrow_bff_occupied']=bool(p['proposed_bff_occupant'])
 r['launch_exceeds_eight_reference_max']=abs(float(r['launch_slow_max_ps']))>29
 r['arbiter_exceeds_eight_reference_max']=abs(float(r['arbiter_slow_max_ps']))>76
 r['feedback_exceeds_eight_reference_max']=abs(float(r['feedback_slow_max_ps']))>276
 for step,wait in ((0,8),(1,16),(2,32),(4,64),(5,127),(6,8)):
  r[f'subset_step{step}_wait{wait}_ones_percent']=t[f'step{step}_wait{wait}_ones_percent']
 r['subset_wait127_minus_wait8_pp']=t['step5_wait127_ones_percent']-t['step0_wait8_ones_percent']
with (o/'all_64_cores_complete.csv').open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
lines=['# All-core design review — 8 November 2026','',
'The eight-core implementation was better balanced at its measured eight-cycle operating profile. It was not a fully qualified paper reproduction. This review checks every current core, the actual routed placement and the same board running both preserved bitstreams.',
'','## Confirmed circuit and interface checks','',
'Seven shared RTL files (element, chain, core, controller, engine, UART and button) are byte-identical between the two designs and match the original eight-core build record. The controller sequences and single negative-edge, Latch-enabled arbiter architecture are the same. The current64 source/evidence manifest still verifies. A fresh routed-checkpoint query confirms one response FF and falling-edge clock inversion in each of the 64 cores.',
'',
'The completed structural audit checks each core’s D/C/CE/CLR connections, gate truth tables, stage cascades, configuration selectors, LOC/BEL and LUT pin locks. The saved64 route audit contains 4096 paired internal net comparisons with zero reported skew at SLOW_MAX and FAST_MIN. Controlled digital tests exercise full configuration/readback and all64 response bits. These establish digital structure and modeled nets, not analog PUF behavior or measured liveness.',
'','## The physical macro changed during scaling','',
'The 64-core build copied the RTL, not the complete tested physical macro. All eight reference arbiters use SLICEL sites. The64 routed image uses43 SLICEL and21 SLICEM arbiter sites. This is legal and is not proof of a defect, but it adds a physical implementation variable. Upper/lower chain tile families also expand from CLBLL_L to four families.',
'',
'Relative to the chain entrance Y, the reference excitation FF is at Y and arbiter at Y+16. The64 design places them at Y−1 and Y+17. Six reused column pairs also shift the chains by one row, leaving the excitation FF at the old absolute row while moving the arbiter two rows. Thus the old balance cannot be assumed to transfer.',
'',
'| Boundary | Eight-core absolute slow skew, median / maximum |64-core median / maximum |64 cores above eight-core maximum |',
'|---|---:|---:|---:|']
for kind,label in [('launch','Excitation'),('arbiter','Arbiter D/C'),('feedback','Cross-feedback')]:
 a=design['boundary_ranges']['eight'][kind];b=design['boundary_ranges']['sixty_four'][kind]
 n=sum(abs(float(r[kind+'_slow_max_ps']))>a['max_abs_ps'] for r in rows)
 lines.append(f"|{label}|{a['median_abs_ps']:g} / {a['max_abs_ps']:g} ps|{b['median_abs_ps']:g} / {b['max_abs_ps']:g} ps|{n}/64|")
lines+=['','Reference maxima are comparative observations, not qualification limits. The eight-core feedback paths were already mismatched, so feedback mismatch alone is a weaker explanation. The strong signed launch/arbiter correlations with bias are observational and cannot identify a unique cause for each core.',
'','## Live timing checks on every core','',
'The64 tests use a frozen first64-vector subset,20 repeats, Parallel mode, unchanged bitstream and an unchanged eight-cycle Latch window. Only excitation wait changes. The subset was selected by index, not output balance. Its aggregate differs from the full256-vector measurement and must not be substituted for that result.',
'', '| Sequence step | Excitation wait | Ones | Changed majority positions versus first8-cycle run |', '|---|---:|---:|---:|']
for r in timing['conditions']:lines.append(f"|{r['condition']}|{r['wait']} cycles|{r['ones_percent']:.3f}%|{r['majority_changes_vs_first8']}/{r['comparable_positions']}|")
n=sum(abs(float(r['subset_wait127_minus_wait8_pp']))>10 for r in rows)
lines+=['',f'{n}/64 cores change by more than10 percentage points between8 and127 cycles. Returning to8 cycles restores approximately the original distribution. Core30 changes from0.078% ones at8 cycles to46.094% at127 cycles on the same subset. This is timing sensitivity, not proof that a particular wait is correct or that zero-heavy cores are dead.',
'',
'The six-pair matched-challenge eight-core test used identical configurations for each counterpart, on the same board today. Two other reference cores use a fixed reference pool. Widths, geometry and array context remain different.',
'', '| Eight-core condition | Excitation wait | Ones | Changed majority positions versus first8-cycle run |', '|---|---:|---:|---:|']
for r in eight['conditions']:lines.append(f"|{r['step']}|{r['wait']} cycles|{r['ones_percent']:.3f}%|{r['majority_changes_vs_first8']}/{r['comparable_positions']}|")
lines+=['','Timing sensitivity is therefore inherited from the shared implementation, not exclusively introduced by64-core scaling. It does not invalidate fixed-profile repeatability measurements, but the earlier41.25% aggregate did not establish timing robustness.',
'', '| Reference core →64 core | Same-day8-core ones, eight-cycle wait |64-core ones, same challenges and wait |', '|---|---:|---:|']
for r in eight['matched_challenge_location_comparisons']:lines.append(f"|{r['reference_core']} → {r['candidate_core']}|{r['eight_ones_percent']:.3f}%|{r['sixtyfour_ones_percent']:.3f}%|")
lines+=['','All six pairs have fewer ones in the64-core image. Matching challenges removes the previous pool-size/pool-content explanation for those pairs. Physical geometry and array context still change together, so this does not prove the arbiter row alone caused the difference.',
'','## Capture-window limitation','',
'The Latch window remains8 controller cycles (80ns nominal). The controller reports sequence completion; it does not observe whether a falling Qb edge reached the arbiter while Latch was enabled. A controlled digital counterexample with D=1 and a falling clock100ns after Latch opens produces a completed zero with an80ns window and a captured one with a640ns window. See `tb_capture_window.v` and `capture_window_result.txt`.',
'',
'That experiment proves a possible missed-capture mechanism, not its occurrence on the FPGA. Actual oscillation periods, edge counts inside the window, pulse-width evolution, initialization adequacy and asynchronous CE timing remain unmeasured. The live wait sweep demonstrates a timing interaction but does not distinguish these mechanisms. A near50% aggregate at16 cycles is not a valid reason to select that setting.',
'','## Next controlled corrections','',
'1. Qualify capture behavior first. Build a separate longer-Latch-window diagnostic with the same core RTL, excitation setting and geometry; explicitly record the changed controller parameter. Check whether it reduces wait-dependent majority changes without collapsing challenge diversity. Validate repeatability and per-core outputs, not aggregate balance alone. Record any incidental routing differences between builds.',
'2. Separately test the reference relative arbiter geometry (same row as the chain ends), then excitation routing and site-family consistency. Do not change timing and placement in the same experiment. The actual checkpoint inspection found61/64 proposed BFFs free, but four target slices contain ordinary controller FFs, including three occupied BFFs. Moving all64 arbiters blindly would introduce placement/control-clock conflicts; those ordinary cells need a proper place/route rebuild.',
'3. Preserve the matched internal routes and audit all64 cells, connections, route status, both timing corners and control timing after each physical change. Use saved configurations plus independent fresh configurations for validation. Keep every core in reports; do not invert responses, filter for50%, add arbiters or add SHA/BCH as a bias fix.',
'',
'No new RTL, placement or routing has been promoted in this review. The current64 bitstream was restored after the reference test and its64-core protocol/configuration readback was confirmed with four frames. All original sources, bitstreams and captures remain intact. The paper’s unpublished two-LUT mapping and AND/NAND/configuration-domain ambiguities remain unresolved.',
'','## All64 observations','',
'The complete machine-readable audit is `all_64_cores_complete.csv`. The table below separates the full256-vector eight-cycle balance from the same64-vector timing comparison. A large skew or timing change is an investigation flag, not a proven failure diagnosis.',
'', '| Core | Tile | Arbiter site | Full256 ones | Subset8 →127 cycles ones | Launch / arbiter absolute slow skew |', '|---|---|---|---:|---:|---:|']
for r in rows:
 lines.append(f"|{r['core']}|{r['tile_type']}|{r['arbiter_bel_family']}|{float(r['ones_percent']):.2f}%|{float(r['subset_step0_wait8_ones_percent']):.2f}% → {float(r['subset_step5_wait127_ones_percent']):.2f}%|{abs(float(r['launch_slow_max_ps'])):g} / {abs(float(r['arbiter_slow_max_ps'])):g} ps|")
lines+=['','## Evidence and reproduction','',
'`rtl_comparison.json`: shared source identities against the eight-core build record. `DESIGN_COMPARISON.json`, `near_reference_geometry.csv`, `eight_core_boundaries.csv`: layout/boundary comparison. `TIMING_RESULTS.json`, `all_core_timing_sensitivity.csv`, `SWEEP_INDEX.json`, `SWEEP_LONG_INDEX.json`:64-core live sweep. `EIGHT_TIMING_RESULTS.json`, `EIGHT_SWEEP_INDEX.json`: same-day reference sweep. `arbiter_target_feasibility.csv`: fresh routed-checkpoint occupancy/edge checks. All indexed captures have their exact configuration matrices and metadata. The earlier full256-vector Parallel/Sequential/Parallel investigation remains in the adjacent `investigation_2026-11-08` directory.',
'']
report='\n'.join(lines)+'\n'
for before,after in [('The64','The 64'),('the64','the 64'),('all64','all 64'),('and21','and 21'),('uses43','uses 43'),('64-vector subset,20','64-vector subset, 20'),('than10','than 10'),('between8','between 8'),('and127','and 127'),('to8','to 8'),('Core30','Core 30'),('from0.078','from 0.078'),('at8','at 8'),('to46.094','to 46.094'),('at127','at 127'),('at16','at 16'),('is `all_64','is `all_64')]:report=report.replace(before,after)
(o/'REPORT.md').write_text(report,encoding='utf-8')
print('Wrote all64 design review and complete per-core audit.')
