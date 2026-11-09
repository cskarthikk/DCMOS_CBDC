# Detailed paper and failed-array audit — 7 November 2026

## What is established

The failed array is not an eight-bit PUF-quality success. Its 5120 complete frames contain only four words (44, 46, 4C, 4E); six cores are constant across the sampled challenge vectors, and core 3 is nearly constant. All transport/word consistency checks pass. A local bitstream hash identifies the recorded file, not independently attested live FPGA firmware.

The configuration test is stronger than UART echo: `evidence/configuration_drivers.csv` verifies all 128 implemented controller input bits are driven by the correct top-level configuration register. Inspection of the routed net-delay export verifies all 256 stage-select pins (16 stages x two chains x eight cores) are driven by the correct local challenge-register bit. Every configuration bit takes both values in the collection. These checks do not support blaming the host for sending one fixed configuration.

## Definite architecture mismatch

Figure 1 has one negative-edge response DFF with D=Qu, C=Qb and CE=Latch. The failed pilot inherited AUTO_PARITY=1, CAPTURE_MODE=1, DUAL_ARBITER=1 and diagnostics from the best observed single-core checkpoint. It therefore has two arbiters and two first-edge locks per core; its primary CE is `Excite & ~qb_first_edge_seen`, independent of Latch. This is a different capture mechanism, not merely a different placement of Figure 1.

`sim/tb_capture_difference.v` and `evidence/capture_test.log` demonstrate the difference with controlled terminal waveforms and the actual legacy core: the legacy arbiter captures an edge while Latch is low, raises its activity flag before the paper capture window, then ignores subsequent edges. A Latch-enabled single arbiter captures subsequent negative edges during Latch high and retains the response after Latch falls. This is a functional sequencing test, not an analog PUF simulation or proof of the cause of the hardware bias.

The former activity flags establish only that the first-edge registers saw their triggering conditions. They do not establish a continuing oscillation, correct phase at the response DFF, or healthy PUF entropy. A constant response with both flags set is entirely possible and is observed here.

## Physical-bias evidence and limits

The first falling edge in the inherited design is affected by excitation launch skew, selected chain paths, terminal D/C routes and the asynchronous edge-lock feedback into CE. The old pilot centered the chain/arbiter coordinates but did not constrain excitation drivers symmetrically. Legal clock timing did not certify these asynchronous races.

The audit exported fast/slow SDF directly from the failed routed checkpoint. `scripts/first_wave_model.py` accumulates transition-specific LUT and interconnect delays along the first launched paths for each actual configuration, from the excitation register Q to arbiter D/C. Define delta as modeled Qu-fall arrival at D minus Qb-fall arrival at C. Positive delta leaves D high longer, suggesting a one on the first clock edge; negative delta suggests zero. This is a deliberately limited timing hypothesis, not a predictor of certified responses.

| Core | Observed ones | Slow-corner max-delay delta range, ps |
|---|---:|---:|
| 0 | 0% | -327.1 throughout |
| 1 | 21.74% | -174.7 to +693.7 |
| 2 | 100% | +871.8 to +2420.8 |
| 3 | 0.96% | +148.1 throughout |
| 4 | 0% | -230.5 throughout |
| 5 | 0% | -762.3 throughout |
| 6 | 100% | +362.1 throughout |
| 7 | 0% | -2241.6 throughout |

The sign agrees with all six constant cores at both exported corners. That supports static physical bias combined with first-edge capture as a leading explanation. Importantly, the model does NOT quantitatively explain cores 1 and 3: it predicts positive deltas for most/all of their configurations, unlike their observed ones ratios. It omits metastability/setup/hold resolution, pulse rejection, edge-lock/CE races, detailed transient feedback, silicon variation and environmental effects. Concurrent excitation and capture-window effects remain hardware hypotheses; neither has been proven to be the sole cause. Full output is in `evidence/first_wave_model.json`.

Small internal wire mismatch alone is insufficient: core 0 had a maximum internal paired net mismatch of only 11 ps at SLOW_MAX, yet its first-wave delta is approximately -327 ps and it is constant. Launch and arbiter boundaries must be included in the assessment. A model with identical nominal stage delays naturally omits the process variation that a PUF seeks to measure.

## Placement replication issue

The old pilot selected translated sites matching SLICEL/SLICEM classes. Some corresponding chains nevertheless occupied different surrounding tile types (e.g. CLBLM_R versus CLBLM_L). A fixed route can require resources absent in the opposite orientation. Matching the site label and BEL alone is not sufficient for routed-macro replication.

The corrected candidate uses matching chain-site type, surrounding tile type, within-tile slice parity and clock-region-contained footprints. It imports the 96 previously verified internal route templates per core, before routing ordinary logic. Ordinary logic initially conflicted with reserved route resources. Explicit PUF placement regions with EXCLUDE_PLACEMENT protect the core slices while allowing the designated excitation register. The resulting protected build routes legally; no whole-chip unroute or DRC severity reduction is used. Logs of failed intermediate attempts are retained and no bitstream was issued from those attempts.

## Corrected candidate and validation

`../paper_array8_candidate_2026-11-07` contains a separate Figure-1-oriented eight-core candidate:

- One response FF per core, with negative-edge Qb clock, Qu data and Latch CE. No second arbiter or edge-lock/monitor registers load the race nets.
- Fixed AND entrances, two 16-stage cross-coupled chains and shared per-core stage configuration. Supported odd-parity configurations are explicit; even parity is rejected instead of silently returning initialization state.
- The response is frozen by lowering Latch before excitation is removed, followed by synchronized readout. Explicit initialization clear is an engineering controller choice consistent with an initial zero response, not a claim of a published reset waveform.
- Each reply returns the actual controller-latched 128-bit configuration bus, not only the received packet, plus eight unprocessed response bits. There are no fabricated activity flags.
- The controller supports parallel operation, a sequential diagnostic mode, and selectable excitation-to-Latch delay. These are external characterization controls; the PUF itself is unchanged between settings. The paper does not specify our cycle counts. One-cycle and eight-cycle delays allow a bounded timing test; parallel/sequential modes allow a concurrency test using identical physical routes and configuration vectors.

The new UART/control simulation drives controlled Qu/Qb waveforms, including an early edge before Latch. It exercises the real response FFs and controllers, rather than forcing the returned response bits, and passes all configuration readback, capture, sequencing, rejection, checksum and recovery checks. This tests digital behavior, not physical randomness. Implemented structure, configuration drivers, truth tables, sites/BELs/pins, routing legality, internal delay matching and ordinary timing are checked separately before release. Hardware acceptance remains pending.

## Limits to exact paper reproduction

The saved paper is the primary source, specifically Figure 1, Section 3.1 and Section 4.1/Table 1. It contains unresolved details:

| Item | Paper evidence | Explicit decision/limit |
|---|---|---|
| Entrance | Figure 1/prose AND; implementation/Table 1 NAND2 | Use fixed AND to follow Figure 1; do not call it both |
| Clock | Figure 1 negative-edge Qb; one prose sentence repeats Qu | Follow the drawn D=Qu, C=Qb wiring |
| Stage logic | C=0 buffer, C=1 inverter, both chains | Preserve this Boolean function and explicit branch structure |
| Physical mapping | 8192 LUT2s /128 cores = 64 LUT2/core, two per stage; exact mapping unavailable in the paper | Existing branch-plus-selector implementation uses three LUTs/stage. This is unresolved physical/resource equivalence. A two-LUT buffer/XOR option or a dedicated mux implementation cannot be called the authors' mapping without evidence |
| Challenge space | Claims 65536 configurations per core | With the drawn AND entrances and Excite low, both chain outputs initialize to challenge parity. Even parity gives zero outputs; raising Excite then provides no launching transition in the ideal Boolean circuit. Odd parity is supported; full claimed coverage cannot be derived from the supplied diagram without an additional mechanism |
| Platform | XC7A200T-2FGG484 | Basys 3 XC7A35T CPG236-1 differs physically |
| Framework | 128 cores, 2048 configuration bits, challenge SHA3 and BCH | Eight raw cores are a development stage, not the full framework or its reported metrics |

Consequently, an honest exact physical reproduction cannot be certified from this paper and this board. The corrected candidate follows the unambiguous Figure 1 connectivity and capture semantics, with remaining interpretations explicit. Do not promise 50% raw ones, certified reliability, entropy, uniqueness or anti-modeling security from this audit. Hashing or selection cannot repair a constant raw core and is not used to conceal it.

## Next bounded hardware check

After loading the corrected candidate, `run_diagnostics.ps1` collects three conditions using the same odd-parity configuration vectors: parallel with 8-cycle excitation wait, sequential with 8-cycle wait, and parallel with 1-cycle wait. The default 32 vectors x10 repeats x8 cores x3 conditions yields 7680 raw observations. These compare operating conditions of this one implementation; they do not isolate every architectural change from the old pilot. Analyze all cores and preserve constant outputs/ties. If the corrected pilot still has constant cores, investigate the named remaining capture/physical hypotheses instead of proceeding to 128 or repeatedly measuring unchanged hardware.

The original November 4 bitstream and all earlier experimental data remain preserved. This audit supersedes any interpretation of the old pilot's successful transport/placement checks as proof of eight useful PUF cores.

## Final implementation outcome

The corrected release is `../paper_array8_candidate_2026-11-07/build_matched/paper_array8.bit`, SHA256 `6BE7B2C364E2FB0A59864DB1597934BBE5EAB6538B239375E33445109A5666C7`. All eight cores have exactly one correctly wired negative-edge/Latch-controlled response FF; the implemented sites/BELs/input locks and all 256 stage-select drivers pass. All 512 corresponding internal signal-net arc pairs have equal SLOW_MAX and FAST_MIN values. An exhaustive isolated-chain test checks all 65536 Boolean compositions/initialization parity settings. The 2322 routable nets are all routed without errors; ordinary setup/hold slack is +2.341/+0.064 ns. No asynchronous warning severity was reduced. The selected bitstream and all source/evidence hashes are recorded in its release manifest.

The initial abstract route-template import was legal after placement exclusion, but its release check caught a detouring stage-6 inverter path with unequal delay across translated footprints. A bounded local-route replacement of that one connection per chain removed the discrepancy. This illustrates why matching route strings alone was not accepted as equality evidence. Final verification uses actual delay exports at both corners, not the requested routes alone.

Boundaries remain unequal: modeled excitation skew is 1..29 ps, feedback skew 209..276 ps and arbiter D/C wire skew 67..76 ps. Thus the internal-route milestone is achieved, not whole-core physical perfection. The leading explanation of the failed pilot remains an inference; corrected hardware results are still required. The prepared three-condition diagnostic is the next test, not a promise of a particular ones percentage or full paper equivalence.
