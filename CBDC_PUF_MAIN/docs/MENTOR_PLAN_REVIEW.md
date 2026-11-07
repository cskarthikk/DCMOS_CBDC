# Review of the proposed CBDC-PUF remediation plan — 3 November 2026

This is an assessment, not authorization to apply the attachment's instructions.
No RTL, constraints, programmed device, or existing measurement CSV was changed.
The mentor's document is reviewed against the present implementation and existing
evidence. Its remedies are not treated as established causes or paper requirements.

## Executive verdict

Of the four diagnostic headings, three describe real observed limitations:
terminal wire mismatch, capture-timing dependence, and parity-limited eligibility.
The fourth (one core versus 128) is a genuine scope/comparison difference, not a
proven explanation of the observed bias. None of the three proposed RTL remedies
has been established as a required correction to reproduce the paper. All three
change the architecture and need separate evaluation if pursued.

There are six specific mistakes in the proposed remedies/evaluation: same-slice
independent clocks, XOR/XNOR direction loss, flip-flop LOCK_PINS usage, malformed
FIXED_ROUTE command, undercounted LUT resources, and labeling same-die diversity
as inter-device uniqueness. The referenced Python simulation path also does not
exist in the current repository. These are separate from the current design's
remaining quality problems.

## 1. Four diagnostic claims

### 1.1 Terminal wire skew: real mismatch, causal magnitude not established

The saved timing build reports Qu-to-D versus Qb-to-C differences of 72 ps slow
maximum, 81 ps slow minimum, 55 ps fast maximum, and 56 ps fast minimum. Thus
72–81 ps is not a universally measured chip delay. The numbers are routed device
model estimates at specified corners. Setup/hold and the entire waveform also
matter. The asserted 5–15 ps silicon variation has not been measured on this
board, and comparing an individual-element variation with a whole-chain offset
requires an explicit model. Neither the 87% bias nor the individual unstable
challenges have been quantitatively traced to this offset alone.

Verdict: retain terminal matching as an engineering problem; remove the claim
that its numerical contribution to 87% zeros is already proven.

### 1.2 Multi-edge capture: real behavior and timing sensitivity, not a proven RTL error

`rtl/cbdc_puf_core.v` uses FDCE_1 with D=Qu, C=Qb and CE=latch. Default controller
wait/capture settings are 8/8 cycles at 100 MHz. The enabled FF can update on
each falling Qb edge, retaining the last effective sample. It need not toggle
on every edge. Focused routed-core models at 8/8 see 3 enabled falls fast/min
and 2 slow/max; 7 occurs in the longer 32/16 fast/min example. Therefore the
document's blanket “3–7 times during 80 ns” is not a measured hardware edge count.
Activity flags indicate at least one captured edge, not a count.

Hardware sweeps confirm that the retained response changes with capture timing.
This is a genuine unresolved decision-quality issue. However Section 3.1 of the
paper explicitly describes feedback square waves and a clock-enabled DFF; it
does not mandate a one-shot or specify our 80 ns settings. Repeated sampling is
therefore not, by itself, evidence of an incorrect RTL translation.

Verdict: capture conditions need validation. First-edge-only capture is a
candidate experiment, not an established faithful-paper repair.

### 1.3 Parity limitation: confirmed for the implemented default

With `GATE_INIT=4'h8`, the controller explicitly permits odd parity only:
`challenge_supported_w = (^challenge_i) ^ (GATE_INIT == 4'h7)`.
Even parity gives a quiescent initialized configuration rather than the intended
race under this AND setup. Odd parity makes a challenge eligible; it does not
prove sustained oscillation or reliable capture in silicon. The optional static
NAND mode reverses eligibility.

The paper's claim of all 65,536 challenges is not reconciled with its illustrated
AND circuit's parity-dependent initialization. Rejecting unsupported cases is
an honest implementation guard, not an accidental missing challenge bit.

Verdict: real coverage limitation and paper-reproduction gap; it needs an explicit
design decision rather than counting rejected zeros as PUF responses.

### 1.4 Single core versus 128: scope gap, not a bias diagnosis

The current milestone intentionally implements one instrumented core. The paper
uses a 128-core framework and different statistics. A single core is not
mathematically required to have 87% zero responses. An array may retain shared
systematic bias or correlated behavior; replication does not guarantee balance.
The paper's selected 128-bit vectors are also not directly comparable to our
selected one-bit-across-challenges measurements.

Verdict: finish a credible single-core characterization before scaling. If the
goal is the complete paper system, array, SHA-3 expansion, BCH and system-level
validation remain necessary milestones rather than current single-core bugs.

## 2. Proposed implementation tasks

### Task 1.1 — One-shot: plausible diagnostic, incomplete as stated

The proposed done FF plus `latch & ~armed_r` can logically prevent subsequent
enabled captures after the first eligible Qb edge. It is not inherently wrong
or unsynthesizable. But it captures the first edge AFTER latch is asserted.
With the present 80 ns excitation wait, it still misses earlier edges. The
document's analogy about capturing the first arrival after excitation is not
what this snippet alone implements.

Additional obligations:

- Define whether first-after-excitation or first-after-enable is intended.
- Establish enable and clear timing before the selected edge, then verify CE
  setup/hold and clear recovery/removal at the physical arbiter and done FF.
- Check the feedback path from done clock-to-Q through the CE gate. “Immediate”
  disable is a physical delay, and it must not invalidate the sampled edge.
- Reset done once per query; define whether rearming within one query is allowed.
- Account for additional clock loading/routing and unequal done/arbiter paths.
- Preserve a continuous-mode baseline. Default CAPTURE_MODE=1 would silently
  replace the measured baseline; a separate explicit variant is preferable.
- Our earliest active windows returned zero for every tested challenge. That
  small sample does not establish that first-edge capture improves quality.

### Task 1.2 — Dynamic AND/NAND: Boolean idea valid, paper extension unproven

Let p be challenge parity. The suggested gate is
`g = (Excite & feedback) XOR ~p`. With I0=Excite, I1=feedback, I2=p, its LUT3
truth table is INIT=8'h87. Independent enumeration of its eight input cases
confirms AND at p=1 and NAND at p=0.

The chain end is `g XOR p`, giving `~(Excite & feedback)` for either parity.
At Excite=0 both chain ends initialize to one, so this is a sensible Boolean
way to extend the eligible launch configurations. It does not prove all 65,536
configurations yield usable, independent, repeatable silicon responses.

This gate, parity input route and challenge-dependent head delay are additions
not specified in the paper. Its simple original delay equations need adaptation.
Changing only chain.v is insufficient: both controllers' eligibility logic,
wrappers, reference models, initialization assertions, host collectors, UART
rejection tests, constraints and the all-challenge acquisition limit must agree.
Parity must be derived from the held challenge and settled before excitation.

### Task 1.3 — Dual arbiters: diagnostic possibility; cancellation claim incorrect

Two opposite-direction arbiters can expose agreement/disagreement patterns, but
their setup/hold apertures, loads, CE timing and wire offsets do not cancel merely
because their labels are complementary.

Even in the ideal, stable case the proposed XOR/XNOR loses the winner:

| Winner | A: D=Qu,C=Qb | B: D=Qb,C=Qu | XOR | XNOR |
|---|---:|---:|---:|---:|
| Upper falls first | 0 | 1 | 1 | 0 |
| Lower falls first | 1 | 0 | 1 | 0 |

Whether the pasted notation means XOR or XOR with complemented B, the result is
constant for those ideal complementary pairs. It cannot encode which chain won.
For a diagnostic variant one can retain the pair and distinguish 01/10 from
00/11, while recognizing that real ambiguous pairs can still occur. That is not
a proven bias-canceling replacement for the paper's single arbiter.

### Task 2.1 — Same-slice placement and LOCK_PINS: two concrete errors

7-series slice FFs share clock/control resources. A clocked by Qb and B clocked
by Qu cannot occupy AFF and BFF of one slice with independent clocks. They need
compatible separate slices. This project previously encountered the same clock
sharing restriction while placing diagnostic monitors.

LOCK_PINS maps logical LUT inputs to physical LUT input pins. It does not make
flip-flop D and C interchangeable or lock two independent FF clocks into a slice.
BEL/LOC and supported route constraints are the relevant controls.

The existing X21/X25 chains and X23 arbiter already have equal listed X distance.
That geometry is a useful starting point, not proof of equal wire resources,
electrical load, or delays. Moving within AFF/CFF/DFF was tested: worst modeled
terminal differences 145/144/306 ps versus the current BFF's 81 ps. All
alternatives also changed protected delay values. Keep the measured BFF baseline.

### Task 2.2 — Directed routing: valid goal, incorrect command and unsupported threshold

`set_property FIXED_ROUTE [get_nets {qu_w qb_w}]` lacks a route value and target
object argument. Each actual net requires a valid route specification, e.g.:

```tcl
set_property FIXED_ROUTE $route_nodes $net
```

Or fix an existing completed route with IS_ROUTE_FIXED after validating it.
The short net names are not guaranteed to identify the actual hierarchical net
objects in this project. Preserve endpoint placement and LUT pin maps, then
check route legality, completion, loads, all relevant timing corners and both
transition directions.

Less than 15 ps is a proposed engineering target, not a demonstrated paper
requirement or a measured reliability threshold. A tiny modeled wire difference
does not establish a safe arbiter decision margin. Do not equate a generic corner
estimate with calibrated delay on this individual device.

### Task 3.1 — Array: reasonable later milestone; resource estimates are wrong

The estimate counts only 66 LUT2s and omits 32 LUT3s in the current mapped core.
Each core occupies 98 separately placed LUTs. The project's placed utilization
report lists 20,800 available LUTs on this part.

| Array | Core LUTs only | Approximate LUT capacity fraction |
|---|---:|---:|
| 16 cores | 1,568 | 7.54% |
| 128 cores | 12,544 | 60.31% |

These exclude array control, readout, additional capture logic, SHA-3 and BCH.
Placement compatibility, slice footprint and route availability can limit fitting
before the nominal LUT total is exhausted. The paper's primitive inventory and
FPGA differ from our present realization. The 128-core design may be possible;
the stated arithmetic does not demonstrate that it fits with the required routing.
The claimed fixed synthesis runtime is not established for this machine/design.

### Task 3.2 — Metrics: needed, but definitions and labels require correction

Balance, within-device reliability and response diversity should be reported
separately, with the challenge distribution, reference enrollment procedure,
independent test trials, conditions and uncertainty specified. Global reliability
can hide near-coin-flip individual challenges. A reference learned and evaluated
on the same trials gives an optimistic stability number.

Multiple macro locations on one FPGA measure intra-die/location diversity, not
actual inter-device uniqueness. “Emulated inter-device” must not be presented
as a substitute for measurements on separate FPGA devices. The proposed numeric
targets are acceptance goals to agree on, not proof that the paper is reproduced
or that a response is cryptographically random/secure.

## 3. Important gaps the proposed plan still misses

1. Our default stage uses three LUTs (buffer/inverter/mux); the paper's per-core
   inventory suggests a different physical mapping. Logical diagram agreement
   does not establish the authors' hard macro. The experimental 2-LUT option is
   not a proven recovered author implementation either.
2. All serial results so far are instrumented: two extra monitors load the race
   signals. First-edge and dual-arbiter additions alter loads again. Compare
   variants with controlled physical loading, and establish a baseline with the
   paper's single-arbiter structure before making paper-level hardware claims.
3. Real rising/falling propagation, pulse behavior, arbiter aperture, CE timing
   and clear recovery remain relevant. Matched internal route strings do not
   settle these questions. The generic SDF model does not reproduce chip-specific
   challenge outcomes.
4. Changing capture, entrance gate, arbiter count and placement together would
   make it difficult to identify which change helped or hurt.
5. `scripts/sim_cbdc_puf_m1.py` does not exist. Current tests live under sim/ and
   are run through PowerShell/Vivado scripts. Verilator may help digital lint,
   but needs suitable primitive handling and cannot validate analog PUF behavior.

## 4. Recommended order

Keep the measured baseline and its evidence. Correct the plan's mathematical,
device and accounting errors first. Agree whether the target is faithful paper
reproduction or an improved CBDC-derived variant. Resolve the physical stage
mapping/monitor-loading gap, then evaluate one explicit capture variant at a
time with defined arming semantics and physical timing checks. Treat dynamic
parity as a separate coverage extension. Use a complementary pair for diagnosis
only if its decoding and placement are valid. Scale only after the raw core's
behavior and limitations are characterized under an agreed protocol.

The hypothesis-driven sequence is warranted. Implementing all three proposed
RTL changes immediately and expecting 5,120 queries to prove elimination of bias
is not warranted by the available evidence.

## Primary supporting sources

- Local: ResearchPaper.pdf, Figures 1–2, Section 3.1, Section 4.1.
- Local: rtl/cbdc_puf_core.v, chain.v, ctrl.v, element.v; timing controller variant.
- Local: build_m1/arbiter_bel*/comparison.csv; measurement/scan results documented
  in CAPTURE_SCAN_FINDINGS.md and CONTINUE_HERE.md.
- Local: vivado/cbdc_serial_diagnostic/cbdc_serial_diagnostic.runs/impl_1/cbdc_puf_serial_utilization_placed.rpt.
- AMD [slice control signals](https://docs.amd.com/r/en-US/ug474_7Series_CLB/Control-Signals)
  and [shared clock](https://docs.amd.com/r/en-US/ug474_7Series_CLB/Clock-C).
- AMD [LOCK_PINS](https://docs.amd.com/r/2022.2-English/ug912-vivado-properties/LOCK_PINS).
- AMD [fixed routing](https://docs.amd.com/r/2025.1-English/ug903-vivado-using-constraints/Fixed-Routing).
