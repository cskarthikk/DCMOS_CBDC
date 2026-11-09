# Continuation checkpoint — 3 November 2026

## Latest task: isolate pulled version to ONE PUF

User pulled commits b21076b then 7cfc392 and requested review/build without source
changes. 7cfc392 fixes syntax/old coordinate overlap but array head wildcard also
selects u_head_gate_i_1 helpers, causing placement conflicts; that array build
was stopped. Its BCH TB reports failures for clean and 1/2/3-error examples,
despite misleading final ALL PASSED. SHA3 is simplified and not integrated into
UART broadcast path. Do not claim these are working or build them for this task.

User NOW explicitly asks to isolate only one PUF and keep all other files.
New scripts/build_pulled_single.tcl reads seven original RTL files only, top
cbdc_puf_serial. No original RTL/constraints edited. Defaults preserved:
AUTO_PARITY=1 CAPTURE_MODE=1 DUAL_ARBITER=1; this is ONE core with two existing
arbiters, UART returns primary A only. It arms with excite, not prearmed as in
our previous experimental variant. Paired placement X21/X25, not matched routes.
Original array constraints/BCH/hash/experimental modules excluded from build.
Dedicated collector scripts/collect_pulled_single.ps1 accepts even/zero
challenges (old collect_crps.ps1 has incompatible zero-rejection control).
Protocol is old A5/5A, NOT prior experimental A7/5B or array 5C/CA.
New sim scripts/run_pulled_single_sim.ps1 passed with artificial delays.
Routed 639/639 nets; 368 total LUTs/290 FF, one core 106 LUTs/4 FF.
sys_clk WNS/WHS +3.928/+0.128; four TIMING-17 warnings remain.
Initial bitgen stopped because pulled feedback waiver missed net aliases;
new build script fixes exact head-output-net acknowledgement, no severity
override. scripts/finalize_pulled_single.tcl resumes routed checkpoint.
Target bitstream build_m1/pulled_single/cbdc_pulled_single.bit.
FINALIZATION SUCCEEDED: bitstream generated, bitgen DRC 0 errors; five DRC
warnings remain (allowed loop, two gated clocks, two nonoptimal hold connections).
Source and bitstream hashes are saved alongside the output. Board not programmed.
See PULLED_SINGLE_GUIDE.md for smoke (8 challenges x3), expected 24 accepted,
and larger 256x20 collection. No board programmed by agent. Hardware CRPs pending.

## Latest implementation — user resumed and authorized experiments

The user explicitly returned and requested implementation of the corrected
mentor proposals. The earlier pause below is historical and no longer applies.
See CORE_EXPERIMENT_GUIDE.md for architecture, limitations and exact commands.

Separate experimental RTL/build/collector now implement runtime single-shot
capture, automatic AND/NAND entrance parity and a separately located reverse
arbiter. Raw A/B are reported separately; no XOR correction. Wait=0 shot mode
arms a full clock before excitation; nonzero wait means first-after-enable.
This is an experimental derived architecture, not an exact-paper claim.
Original RTL, bitstreams and datasets remain separate. No board programming
was performed by the agent during this implementation.

Ready bitstream:
build_m1/core_experiment/cbdc_core_experiment.bit
SHA256: 5A2B39DB2CF6B3CFA7156EC1B06674CE4F7627D79E6B73C96B436F2AE3566899

Verified: UART/engine functional regression, exhaustive artificial-delay
single-shot launch for all 65,536 challenges, both original serial/timing
regressions, all four routed-core SDF fast/slow min/max tests, and host-only
protocol/comparison tests. No timing warnings in routed simulation cases.
96 internal core routes and 120 existing placements preserved and checked;
input and terminal routing change with the new loads. 745/745 nets routed,
setup/hold +3.681/+0.058 ns. Four unclocked sequential-cell methodology critical
warnings remain; this is not full asynchronous signoff or proven improvement.

NEXT: user programs this exact new file in Hardware Manager, presses BTNU,
then runs collect_core_experiment.ps1 -Port COM5 -Mode 3 -WaitCycles 0
-CaptureCycles 16 -Repeats 3. Default eight challenges should yield 24 accepted,
zero rejected; response values are unknown and activity flags need checking.
Use only the NEW collector (A7/5B protocol). Comparison and analyzer scripts
are prepared for six runtime settings in the same bitstream. Hardware results
are still pending. No 128-core array was built.

## Earlier review after returning (historical)

User supplied a mentor remediation plan and requested an honest detailed audit,
not immediate implementation. See MENTOR_PLAN_REVIEW.md. No RTL, constraints or
hardware changed for that review. Three of its four diagnostic headings describe
real limitations (terminal mismatch, capture sensitivity, parity eligibility);
single versus 128 cores is a scope/comparison gap, not an established bias cause.
One-shot, dynamic parity and dual arbiters are unproven architecture variants.
The plan contains six concrete mistakes: independent clocks in one slice,
XOR/XNOR losing winner direction, FF LOCK_PINS misuse, malformed FIXED_ROUTE,
omitting 32 LUT3s from core resource arithmetic, and calling same-die diversity
inter-device uniqueness. First-after-enable is not first-after-excitation at an
80ns wait. The claimed 5–15ps variation and <15ps requirement are not established.
Current 3-LUT stage vs authors' unknown physical mapping and diagnostic loads
remain material gaps. Do not implement all proposed changes as automatic fixes.

User explicitly requested stopping here because credits are running out.
Resume only when the user returns. Read this file before repeating work.

## Goal and preferences

Implement the paper's CBDC-PUF correctly on Basys 3, with faithful logic and
controlled physical routing, then demonstrate meaningful repeatable hardware
responses. Do not invent a different architecture, insert arbitrary delay gates,
hash away bias, or choose timings merely because outputs appear balanced.
User is a beginner, prefers simple explanations and Vivado GUI steps. They want
mentor-facing hardware results, not an endless stream of diagnostic tests.

Workspace: C:/BTech/Semester_5/DCMOS/Project. Vivado 2025.2 at
C:/AMDDesignTools/2025.2/Vivado/bin. Bundled Python at
C:/Users/Surya Karthik/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe.
Paper: ResearchPaper.pdf, all 17 pages reviewed previously. Figure 1 is the
reference for D=Qu, falling clock=Qb, CE=Latch; nearby prose has inconsistencies.

## Current hardware/build

- Board Basys 3, xc7a35tcpg236-1, system clock 100 MHz, UART last used COM5.
- Most recently user programmed build_m1/timing_diagnostic/cbdc_timing_diagnostic.bit.
- Board state after this pause is not guaranteed. Powering off loses this JTAG
  configuration; reprogram this exact bitstream before further serial tests.
- No FPGA programming or baseline RTL changes were performed during the latest
  arbiter review. All new arbiter positions remain separate offline experiments.
- Core is one instrumented 16-stage-per-chain instance: 66 LUT2 + 32 LUT3,
  one FDCE arbiter plus two edge-monitor FFs. DIAGNOSTIC=1 changes loading.
- Current matched layout upper X21, lower X25, head Y100, stages Y101..116.
  Arbiter remains BFF at SLICE_X23Y116. Qu/Qb monitors X21/X25Y117 AFF.
- Forty-eight internal route pairs match; 64 sink delay estimates match in the
  slow-maximum model. This is not complete end-to-end equality or zero silicon
  variation. Three controller output wires were rerouted in the timing firmware;
  all runtime timing settings use one bitstream. It preserves 114 core/challenge
  nets and 120 placements. See TIMING_DIAGNOSTIC.md.
- Timing build fully routed 721/721 nets, zero routing errors. Conventional
  setup/hold slack +3.458 / +0.053 ns. Known loop/gated-clock DRC warnings and
  three TIMING-17 asynchronous sequential-cell critical warnings remain.

## Main results for mentor

MENTOR_RESULTS.md is ready: implementation/scope, routing evidence, main hardware
statistics, limitations, and a short presentation conclusion. The main results
are the matched physical layout AND its measured CRPs, not routing alone.
Describe this as an experimental single-core implementation with unresolved bias
and capture sensitivity, not a fully reproduced/certified/secure PUF. The paper's
128-core SHA-3/BCH framework is outside the implemented milestone.

Full datasets in build_m1/measurements:

| Run | Ones / 5120 | Mixed challenges / 256 |
|---|---:|---:|
| Original serial run01 | 606 | 9 |
| Original serial run02 | 605 | 8 |
| matched_run01 | 685 (13.38%) | 12 |
| matched_run02 | 679 (13.26%) | 13 |

Each uses the same selected 256 odd-parity challenges, 20 repetitions, plus a
rejected all-zero control. Both flags appeared in every accepted query. Across
the matched runs 241 challenges stayed the same through all 40 trials; union of
mixed challenges=15. Matching internal routing did not solve bias/instability.

## Runtime timing experiments already completed

Firmware top cbdc_puf_serial_timing, controller cbdc_puf_ctrl_timing. Original
RTL tops remain unchanged. Request A6, lo, hi, wait, capture, XOR; reply 5A, lo,
hi, wait, capture, flags, response, XOR. Wait/capture 1..255 cycles, zero rejected.
Accepted with both flags = 37 hex; rejected control = 30. Existing A5 collector
is incompatible; use collect_timing_crps.ps1. Timing echoes checked.

1. capture01 under build_m1/measurements/timing: 18 selected diagnostic
   challenges x 50 repeats x 10 settings = 9000 accepted. Wait 8/16/32 cycles,
   capture 4/8/16 cycles; repeated 8/8 at end. No missing flags. At 32/16,
   17 challenges always one and 8000 always zero (850/900 ones); not a fix.
   First/last 8/8: 271/241 ones, 12/8 mixed challenges. Strong timing dependence.

2. Completed narrow scan directory:
   build_m1/measurements/timing/capture_scan_fe20e89e459249f59ff6d5d3288abfde
   Six challenges 0001,0002,8000,0007,106A,007C; 20 repeats; 40 wait positions
   10..400 ns with 10 ns capture, plus beginning/end 80/80 references.
   All 5040 accepted queries checked; no duplicate keys or malformed flags.
   Both edge flags in all 120 queries at waits 10/40/70 ns; intervening windows
   often see no edges. At 10 and 40 ns all responses zero. At 70 ns 0002 returns
   one in all 20 trials; others zero. At wait400ns all flags absent and zeros:
   these may be cleared bits, not valid race decisions. There were 10 replies
   with response1 but Qb flag0: monitors are imperfect near window boundaries.
   Beginning/end 8/8 reference counts 48/45 ones; only 0007 changes (8->5 ones).

CAPTURE_SCAN_FINDINGS.md has details and paper interpretation: recurring edges
are compatible with the paper's square-wave description; it does NOT prescribe
capturing the first edge. Do not wrongly declare repeated edges themselves a bug.
Numerical extraction: build_m1/timing_diagnostic/capture_scan_analysis.json/.txt.

run_capture_scan.ps1 now uses unique GUID names and preserves existing folders.
Old capture_scan01/02 contain metadata only after board-off timeouts. Do not
delete or overwrite results. Host-only mocked scan verified all 42 settings.

## Latest next-step review COMPLETED before pause

Read ARBITER_REVIEW.md. Exported original full routed model and separate core
model with SDF, script scripts/export_arbiter_timing.tcl. Focused simulation:
sim/tb_arbiter_core_timing.v and scripts/run_arbiter_timing_sim.ps1.

Successful focused traces:
build_sim/arbiter_timing/core_fast_min and core_slow_max.
Both SDF annotations succeeded, six evaluations each: challenges 0001/0002 at
1/1, 8/8, 32/16 settings. Ideal external controls; actual internal core routes.
Excludes UART/controller and their outside input routes; not a full-system or
chip-specific manufacturing/noise/metastability model. Only two representative
corners, not a complete four-combination signoff.

All modeled responses zero. Enabled falling-clock counts per challenge:
fast/min 1,3,7 for the three settings; slow/max 0,2,3. At enabled clock falls,
D is already zero, its last transition 56 ps earlier fast/min, 72 ps earlier
slow/max. Hardware 0002 at 8/8 returns one, so the generic model cannot predict
actual chip behavior. Do not report model zero as a hardware finding.

Full-system internally forced stimulus attempts produced invalid controller
traces; one complete UART timing run was stopped for runtime. Those are not
RTL-fault evidence. Superseded full harness removed. Ignored fast_min outputs
are invalid; use only core_* outputs with TRACE_COMPLETE and SDF success.

Terminal modeled wire delays (ps):
Qu->D: slowmax776, slowmin643, fastmax314, fastmin263.
Qb->C: slowmax848, slowmin724, fastmax369, fastmin319.
Differences 72,81,55,56 ps. Largest over four values=81 ps. Flip-flop setup/hold
aperture is additional; this is not a measured silicon margin.

## Arbiter-position experiment — finished, NOT promoted

scripts/experiment_arbiter_bel.tcl varied only FF BEL in same slice, held core
LUTs and route trunks, tried to keep clock/enable/reset routes and checked
feedback/monitor delays. No hardware programmed and no new bitstream selected.

| BEL | Worst absolute D/C wire mismatch across four modeled values | Protected delay values unchanged? |
|---|---:|---|
| Current BFF | 81 ps | yes |
| AFF | 145 ps | no |
| CFF | 144 ps | no |
| DFF | 306 ps | no |

All tested alternatives were worse. Keep BFF. This is a local comparison, not
proof that no other physical layout can work. Changing a data branch can also
change common-trunk RC delay even if trunk geometry is constrained.

AFF files: build_m1/arbiter_bel/. CFF/DFF:
build_m1/arbiter_bel_round2/comparison.csv, protected_delay_comparison.txt,
CFF/ and DFF/ routed checkpoints/reports. Log ends
ARBITER_BEL_EXPERIMENT_COMPLETE, exited 3 Nov 2026 01:35:16 local. No active
experiment needs to be left running. The first run stopped after rejecting AFF;
second run completed CFF and DFF without treating them as accepted corrections.

ARBITER_REVIEW.md was written before final CFF/DFF completion; update it with
the final table on resume rather than rerunning these expensive experiments.

## Where to resume

1. Tell user the local BEL alternatives did not improve the model, so the
   measured BFF build remains intact. Show MENTOR_RESULTS.md as the main result.
2. No validated logical correction has been identified. Do not swap D/C,
   change edge polarity or add arbitrary gates just to change the bit histogram.
3. Decide the next focused physical/core validation logically. Remaining issues
   include the paper's unpublished primitive/hard-macro mapping (our 3-LUT stage
   is not its published resource inventory), diagnostic loading vs baseline,
   real rise/fall/pulse behavior and actual arbiter margin. Generic SDF cannot
   replace per-chip fine-time measurements. Do not promise exact silicon delays
   from these flags or select long biased windows as a solution.
4. Avoid repeating all acquisitions or asking the user to run more scans without
   a specific discriminating hypothesis. User wants progress toward a correct
   implementation, not endless debugging. Keep any next variant separate and
   preserve the already measured build/data.

## Workspace caution

No commits/pushes were done. Several new files are untracked. Pre-existing user
changes include constraints/basys3_serial.xdc, dfx_runtime.txt and the untracked
Vivado serial project. Do not reset or overwrite those. Newly authored docs:
PUF_REAUDIT_2026-11-02.md, MATCHED_ROUTING_GUIDE.md, TIMING_DIAGNOSTIC.md,
CAPTURE_SCAN_FINDINGS.md, MENTOR_RESULTS.md, ARBITER_REVIEW.md, this checkpoint.
New diagnostic/analysis scripts and tests are in rtl/, scripts/, sim/; build
artifacts are ignored under build_m1/ and build_sim/.

The user requested this pause. Do not continue experiments until they return.
