# CBDC-PUF re-audit — 2 November 2026

## Conclusion

The default core follows the central circuit in the paper's Figure 1: two 16-stage configurable chains, cross-coupled feedback, and a falling-edge arbiter with D=Qu, C=Qb, CE=latch. The LUT truth tables and default control sequence do not reveal a deterministic logic error that explains the measured zero bias.

The physical implementation is **not yet a demonstrated reproduction of the paper's matched-routing implementation**. Placement constraints are present; matched routing, arbiter placement/capture-margin validation, and a hardware measurement of relative edge arrival are missing. The UART build adds loads to the timing-sensitive signals. These are material gaps, even though implementation and bitstream generation succeed.

The observed toggling challenges are real repeated-response disagreements in the CSV. A small physical timing margin is one possible cause; the existing evidence does not distinguish it from capture-window effects or other asynchronous dynamics. No exact physical cause has been established.

No RTL, XDC, project settings, or programmed hardware was changed during this re-audit. The only new items are this report and analysis files under ignored build directories. Existing uncommitted files were left alone.

## Evidence and scope

- Source paper: `ResearchPaper.pdf`, all 17 PDF pages, with visual checks of Figures 1 and 2. Page references below use PDF page numbers.
- RTL, all six constraint files, simulation models/testbenches, build/acquisition scripts, and project documentation listed below.
- Measured data: `build_m1/measurements/run01.csv` and `run02.csv`.
- Routed diagnostic checkpoint: `vivado/cbdc_serial_diagnostic/cbdc_serial_diagnostic.runs/impl_1/cbdc_puf_serial_routed.dcp`.
- Additional read-only checkpoint analysis: `build_sim/reaudit_paths.tcl`; generated timing reports and endpoint properties in `build_m1/reaudit/`.

The checkpoint was opened in Vivado; challenge values and temporary timing-report constraints were applied only in memory. No checkpoint was overwritten, and no synthesis, placement, routing, bitstream generation, or board programming was performed. The analysis describes the available routed checkpoint. A filename alone does not cryptographically establish which bitstream produced each CSV.

## Paper-to-code comparison

| Paper item | Current implementation | Finding |
|---|---|---|
| Pages 1–3: motivation, comparison with existing PUFs | A single experimental raw-response core | Motivation is compatible; security and comparative claims are not inherited from the paper. |
| Page 4, Figure 1: upper/lower chains, feedback crosses | `cbdc_puf_core.v`, `CROSS_COUPLE=1` | Matches the drawing. Same-side feedback option is explicitly experimental. |
| Pages 4–5: selectable buffer/inverter stage | `cbdc_puf_element.v`, default `ELEMENT_STYLE=0` | Buffer LUT2 INIT A, inverter LUT2 INIT 5, mux LUT3 INIT CA implement the correct selection. Truth tables were independently enumerated. |
| Page 5: 16-bit challenge and two equal-length chains | Default `N_STAGES=16`; same challenge applied to both | Matches the single-instance structure. Challenge bits are held throughout evaluation. |
| Figures 1–2: DFF arbiter | `FDCE_1`, D=Qu, C=Qb, CE=latch | Correct negative-edge interpretation of the drawing. Local Vivado primitive model confirms falling-edge behavior. |
| Initialization, excitation, capture phases | Controller clear, settle, excite, latch, freeze/hold | Qualitatively follows the sequence. Explicit asynchronous clear is an engineering addition. Exact cycle lengths are ours; the paper does not establish these values for this board. |
| Equations 1–3: selected path delays and response sign | `sim/cbdc_puf_ref_model.v`; edge-sensitive primitive simulations | Mathematical and logical checks are useful, but their assumed delays do not measure the FPGA. |
| Page 7, Section 4.1: fixed placement and routing made approximately equal; reused hard macro | Paired LOC/BEL/LOCK_PINS assignments | **Incomplete:** no demonstrated matched routes or reusable routed core macro; arbiter is not explicitly placed. |
| Section 4.1 resource table | Default one core: 66 LUT2, 32 LUT3, one arbiter FF | The default separate buffer/inverter/mux realization does not reproduce the table's per-instance primitive inventory. The paper does not publish a complete primitive netlist/INIT mapping. The 2-LUT variant is an experiment, not a proven reconstruction. |
| Paper FPGA | Basys 3 XC7A35T-1CPG236 | Paper uses XC7A200T-2FGG484. Placement coordinates, routing, and delay values cannot transfer directly. |
| SHA-3 expansion, 128 instances, BCH(31,16,3) | Absent from the current single-core milestone | Intentional scope limitation, but the complete paper system has not been implemented. BCH can correct some response errors; it does not repair raw-core bias or diagnose timing. |
| Pages 8–12: response statistics and repeated measurements | Two 256-challenge, 20-repeat runs of one instrumented instance | Different population and protocol. The paper's selected 128-bit response vectors and reported balance cannot be directly compared with our one-bit-across-challenges percentage. |
| Later discussion, conclusion, and references | No equivalent validation yet | Single-board data do not establish inter-device uniqueness, environmental reliability, or modeling-attack resistance. The paper's relocated-instance experiment is not proof of our cross-device behavior. |

### Ambiguities in the paper that must not become code changes by guesswork

1. Figure 1 uses AND entrance gates; the resource table names NAND2. AND with an odd number of selected inversions supports the intended launch; NAND changes that parity requirement. The current default AND/odd-parity policy is deliberate.
2. Some prose describes capture using Qu even though Figure 1 connects Qb to the arbiter clock. Figure 2 and the response-sign interpretation also contain inconsistent wording/inequalities. The implementation follows the diagram's D=Qu, falling C=Qb connection.
3. Claims about all 65,536 challenges are not reconciled with the illustrated circuit's parity-dependent initialization. With AND gates, the even-parity settled state does not produce the same intended race. The controller therefore rejects those challenges rather than treating the cleared response as a PUF result.
4. Unequal individual gate delays do not mathematically guarantee a nonzero sum difference; terms can cancel. Equation 4 also needs a buffer-difference intercept if its stated delta-tau contains only the entrance-gate difference. Equations 1–2 provide the safer explicit reference.
5. The paper does not supply enough implementation files to claim an exact physical reproduction. Matching the diagram and matching a primitive count are different checks.

## Findings needing attention

### 1. High: paired placement has not established matched physical delays

`puf_paired_placement.xdc` and `puf_swapped_placement.xdc` place corresponding LUTs in adjacent columns and lock pins. They do not fix matched routing. The swapped diagnostic checkpoint has upper stages at X21 and lower stages at X20, head Y100 and elements Y101–Y116.

The actual arbiter is at `SLICE_X7Y97`, BEL `SLICEL.BFF`, outside that paired-chain area. The Qb flag FF is at X7Y97/AFF and the Qu flag FF at X7Y96/AFF. The terminal routes therefore form part of the effective race and cannot be ignored.

The endpoint net-delay objects report slow-corner maximum values of 2.000 ns for Qu→arbiter D and 1.733 ns for Qb→arbiter C. These are routed-device-model values, not oscilloscope readings. Their 0.267 ns difference is **not** an established physical race margin: edge-specific delays, the preceding paths, phase history, and the arbiter aperture still matter.

One selected chain report has 4.092 ns logic delay and 27.708 ns routing delay: roughly 87% routing. This makes routing review especially relevant. It does not prove routing alone causes the measured bias.

**Needed:** inspect corresponding selected routes, entrance skew, both terminal routes, feedback arcs, and arbiter placement together. Establish a repeatable physical implementation before interpreting gate mismatch statistically. Do not add a guessed delay solely to force a 50/50 result.

### 2. High: capture timing has not been demonstrated safe or phase-independent

At 100 MHz the default excitation wait and capture-enable window are each 80 ns. Latch/CE changes on the controller clock, whereas the arbiter's clock is asynchronous Qb. CE opening/closing is therefore not guaranteed to satisfy timing relative to every Qb edge.

While CE is high, the arbiter can capture on **each** falling Qb edge; the retained result comes from its final effective capture. Neither a successful controller completion nor two edge flags proves a clean, unique decision. The output synchronizer helps transfer the retained bit to the controller; it cannot retroactively fix an ambiguous arbiter event.

**Needed:** controlled excitation-wait and capture-window sweeps on the same physical core. A systematic response change with window position/length would implicate capture phase or transient dynamics. Rebuilding separately for every setting could change routing and confound that comparison, so runtime control or a controlled fixed-core implementation is preferable.

### 3. Medium: diagnostic monitoring changes the measured PUF

`cbdc_puf_serial.v` instantiates `DIAGNOSTIC=1`. Two additional falling-edge FFs load Qu and Qb. Loading both sides does not establish electrically identical effects: terminal fanout, endpoint pins, and routes differ.

These flags mean only that at least one falling edge was captured while CE was enabled. They do not measure delay, count edges, prove sustained oscillation, establish arrival order, or detect metastability.

**Needed:** keep instrumented and baseline results separate. For a later production/baseline UART build, preserve a reviewed core placement and routes and read its retained response through the normal controller. Simply removing the flags and recompiling can change the physical core.

### 4. Medium: validation currently supports a smaller claim than “paper reproduced”

The default raw core is a plausible architecture implementation. Its current resource mapping, board, capture timing, and physical routing differ from or are not fully specified by the paper. The 128-core SHA-3/BCH system is absent. Documentation must retain these limitations.

### 5. Low: collection metadata and ordering limit diagnosis

The CSV records a generic instrumented-build label, timestamps, challenge, trial, response, and flags. It does not bind rows to a bitstream hash, routed-checkpoint hash, board identifier, temperature, or timing settings. Twenty consecutive trials of each challenge can also confound challenge identity with slow time drift.

**Needed:** preserve these runs; add immutable build identity and test settings to future acquisitions; interleave challenge order and include rejected/timeout queries in the audit record. Do not silently filter edge failures. The current analyzer correctly includes all accepted rows.

## File review inventory

| Files | Assessment |
|---|---|
| `rtl/cbdc_puf_element.v`, `cbdc_puf_chain.v` | Default LUT functions, stage order, and entrance gate are consistent with Figure 1. Extra implementation modes are experimental. Physical LUT mapping is not the paper's published netlist. |
| `rtl/cbdc_puf_core.v` | Cross-feedback and arbiter connection correct. Diagnostic loading and explicit clear are documented additions. The opening comment saying no debug loads is stale for DIAGNOSTIC=1; the generate block is authoritative. |
| `rtl/cbdc_puf_ctrl.v` | Challenge hold, eligibility check, clear/settle/capture/freeze/read sequence, and default synchronizer wait reviewed. No obvious stale-read bug at defaults. Async CE capture margin remains unvalidated. |
| `rtl/cbdc_puf_top.v`, `cbdc_puf_basys3.v`, `cbdc_button.v` | Wrapper, LED mapping, synchronization/debounce reviewed. No identified switch/wrapper fault explains UART challenge behavior. |
| `rtl/cbdc_uart.v`, `cbdc_puf_serial.v` | Framing, checksum, challenge byte order/echo, completion flags, and response path reviewed. No identified deterministic transport bug explains the zero bias. Serial top deliberately enables monitoring. |
| `constraints/basys3.xdc`, `basys3_serial.xdc` | Basys 3 clock and I/O constraints reviewed. The existing serial LED LVCMOS33 correction is present; it was not changed this audit. |
| `constraints/puf_paired_placement.xdc`, `puf_swapped_placement.xdc` | Corresponding placements and pin locks; mutually exclusive experiments. Neither establishes matched routing or arbiter location. |
| `constraints/puf_feedback_acknowledge.xdc` | Narrow loop acknowledgment. ALLOW_COMBINATORIAL_LOOPS permits implementation; it is not a correctness or timing guarantee. |
| `constraints/controller_ooc.xdc` | Controller-only timing context; does not validate asynchronous core timing. |
| `sim/sim_unisim_primitives.v`, `cbdc_puf_ref_model.v` | Useful logical/artificial-delay models. They do not model calibrated silicon variation, analog metastability, all pulse filtering, or full capture-aperture behavior. |
| `sim/tb_cbdc_puf_m1.v`, `tb_cbdc_units.v`, `tb_cbdc_ctrl.v`, `tb_cbdc_basys3.v`, `tb_cbdc_serial.v`, `tb_vendor_primitives.v`, `tb_invalid_params.v` | Tests cover the intended logic/protocol and selected synthetic timing cases. Passing them cannot establish physical race quality. No HDL simulations were rerun during this unchanged-source re-audit. |
| `scripts/run_sim.ps1`, `run_vendor_sim.ps1`, `run_board_sim.ps1`, `run_serial_sim.ps1`, `run_m1_vivado.tcl` | Build/test orchestration reviewed; simulation success and implementation success must remain separate from PUF performance claims. |
| `scripts/collect_crps.ps1`, `analyze_crps.ps1` | Acquisition/checksum/echo checks and per-challenge counts reviewed. Current acquisition uses a fixed generated challenge set and grouped repetitions; targeted arbitrary lists and timing sweeps need added support. |
| `README.md`, `VERIFICATION.md`, `CBDC_PUF_PROJECT_SPEC.md`, `BOARD_BRINGUP.md`, `PHYSICAL_IMPLEMENTATION.md`, `DIAGNOSTIC_SWAPPED.md`, `SERIAL_DIAGNOSTIC.md` | Scope and bring-up context reviewed. This audit qualifies earlier placement preparation: it is a first layout, not completed matched-routing reproduction. |

## What the measurements establish

Both full runs contain 5,120 accepted queries: 256 supported challenges × 20 trials. All accepted rows have both edge flags. Run 02 has 605 ones (11.8164%) and 4,515 zeros (88.1836%): a pronounced raw response bias for this challenge sample and instrumented instance.

Run 01 has 9 mixed-response challenges; run 02 has 8; the union is 10. All 256 majority response bits agree between the two runs. That is encouraging short-term consistency, but does not establish environmental or device-to-device reliability. There are 33 run-02 responses differing from the corresponding run-01 majority, or 0.6445% against that short-term reference. This aggregate hides very unreliable individual challenges.

| Challenge | Run 01 ones / 20 | Run 02 ones / 20 | Interpretation |
|---|---:|---:|---|
| 0008 | 19 | 17 | Mostly 1, occasionally 0 |
| 0A76 | 19 | 19 | Mostly 1, occasionally 0 |
| CA25 | 19 | 20 | Mixed in first run only |
| F01A | 19 | 20 | Mixed in first run only |
| 1126 | 11 | 11 | Close to evenly split; particularly poor raw repeatability |
| 1DC7 | 17 | 16 | Repeated disagreements |
| 314E | 5 | 4 | Mostly 0, occasionally 1 |
| D582 | 2 | 1 | Mostly 0, occasionally 1 |
| 29D2 | 15 | 13 | Repeated disagreements |
| 1DE5 | 0 | 4 | Mixed in second run only |

Twenty clean trials do not prove a challenge is permanently stable. Conversely, a changing response to a fixed challenge is not desirable “extra randomness” for a repeatable PUF identifier.

## Can actual delays identify the unstable challenges?

### What was extracted from Vivado

Challenge-specific case analysis selects the buffer or inverter route in each stage of the already-routed checkpoint. The generated reports start at a chain entrance gate's excitation input I0, use a rising launch, and end at the opposite chain's feedback input I1 with a falling arrival. They include that chain's selected path and feedback wire. They are not a complete dynamic analysis of the cross-coupled loop, and the I0 entrance arc is not the same as every later feedback I1 arc.

| Challenge | Observed behavior | Upper selected path | Lower selected path |
|---|---|---:|---:|
| 0001 | Stable 1 in these runs | 31.800 ns | 32.294 ns |
| 0008 | Mixed | 31.800 ns | 32.294 ns |
| 8000 | Stable 0 in these runs | 31.800 ns | 32.294 ns |
| 1126 | Nearly evenly split | 32.528 ns | 32.999 ns |

These are **maximum-delay estimates at the slow process corner**, not measured per-chip delays. Although report generation requested min_max, the saved single-path reports display the maximum slow-corner path; they must not be presented as measured minimum/maximum ranges. The arbitrary 100 ns reporting constraint makes the paths reportable; its positive slack does not validate the PUF.

Most importantly, 0001, 0008, and 8000 receive the same displayed estimates despite different hardware behavior. Thus these estimates cannot, by themselves, identify unstable challenges or predict the response. An upper-to-arbiter-D report was obtained; the corresponding lower-to-clock report returned no timing paths. That missing path is a tool/report limitation, not a zero delay. Endpoint net-delay values provide only part of the missing information.

### What actually matters

The relevant decision is the arrival of Qu at the arbiter D pin relative to the falling Qb edge at its C pin, during the effective capture window. The setup/hold aperture matters, as do launch skew, feedback dynamics, rise/fall differences, and which edge is finally retained. A near coincidence can produce instability, but no current measurement proves that this is the mechanism for 1126 or any other particular challenge.

### Practical investigation order

1. **Repeat the 10 suspect challenges and a few stable controls more extensively**, with interleaved order on the unchanged bitstream. Record the probability of 1 and changes over time. Preserve every outcome and flag. This maps instability but does not measure delay. The current collector needs an explicit challenge-list mode before this can be done correctly; there is no existing supported argument for an arbitrary list.
2. **Sweep excitation wait and capture-enable timing while preserving the same physical core.** Check whether changing capture timing systematically changes response probabilities. This helps distinguish capture-window sensitivity from a persistent path preference. The current fixed UART protocol does not expose these timings at runtime.
3. **Review and control physical implementation**, including arbiter placement and both complete arrival paths, not just stage coordinates. Measure the new build separately if its physical routes change.
4. **If numerical silicon delays are needed, add a calibrated fine-time measurement experiment.** Possible approaches are a calibrated carry-chain TDC, an appropriately designed phase-sweep measurement, or suitable external instrumentation with controlled output paths. Each introduces loading/routing and calibration issues and needs its own validation. A normal 100 MHz sampled ILA is useful for the FSM but does not directly resolve a sub-nanosecond race. Edge flags and simple frequency counts are not measurements of the arbiter's relative arrival time.

Do not add SHA-3, BCH, or more response hashing to hide the present bias before investigating the raw core. Do not reject all difficult challenges silently and then call the remaining sample unbiased.

## External technical references

- AMD UG903, [Case Analysis](https://docs.amd.com/r/2024.1-English/ug903-vivado-using-constraints/Case-Analysis): selecting constants changes which timing arcs are analyzed.
- AMD UG908, [System ILA](https://docs.amd.com/r/2024.1-English/ug908-vivado-programming-debugging/System-ILA): synchronous sampling and debug use.
- AMD UG474, [Carry-Chain Primitive](https://docs.amd.com/r/en-US/ug474_7Series_CLB/Carry-Chain-Primitive): the dedicated FPGA carry structure; this alone does not establish a calibrated TDC's accuracy.
- [FPGA time-to-digital-converter research](https://arxiv.org/abs/2410.09317): an example of fine-time measurement requiring architecture and calibration, not an accuracy specification for this Basys 3 design.

## Recommended next implementation work

The next useful change is a controlled diagnostic experiment: explicit challenge-list acquisition, immutable build metadata, and adjustable capture timing that leaves the PUF placement/routing fixed. Review its results before selecting a physical correction. There is currently insufficient evidence to promise that swapping chains, moving the arbiter, or inserting a delay will solve both bias and instability.
