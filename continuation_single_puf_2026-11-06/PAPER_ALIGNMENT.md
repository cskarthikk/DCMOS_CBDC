# Paper alignment decision, 6 November 2026

Decision: stop repeating the unchanged 256-challenge baseline for now. It has established useful observed behavior. Next work is a separate, documented implementation comparison against Figure 1 and Section 3.1, followed by a bounded hardware validation. Preserve the current checkpoint and all measurement files.

## Latest measurement verified

`measurements/run_6e85693e1279403fb2f6d2bb2a21fef4.csv` was reanalyzed using `compare_saved_runs.ps1`: 5120 accepted rows, 1452 ones (28.3594%), 12 mixed challenges, zero missing activity rows. Against the original: 241 challenges constant in both runs, two strict-majority changes among 255 comparable challenges, and one tie. All three affected challenges were already mixed in the original: 18F5 (16 -> 9 ones), 8E62 (14 -> 7), F416 (13 -> 10). This is not evidence of paper equivalence, but additional identical baseline collections are not the immediate development priority.

## Traceability

| Topic | Paper evidence | Current implementation | Assessment |
|---|---|---|---|
| Core structure | Figure 1 / Section 3.1: two cross-coupled configurable chains | Two cross-coupled chains | Conceptual match |
| Stages/control | Section 4.1: 16-bit control | 16 stages per chain, shared challenge | Match at this level |
| Stage function | Section 3.1: buffer for 0, inverter for 1 | Buffer LUT, inverter LUT, selector LUT | Logical match; exact FPGA mapping is our interpretation |
| Arbiter connections | Figure 1: D=Qu, negative-edge clock=Qb | Same primary connections | Match |
| Number of arbiters | Figure 1: one response DFF | Two arbiters, only A read out | Departure |
| Capture timing | Section 3.1: excitation with Latch low; subsequent latching with Latch high | CAPTURE_MODE=1 captures on excitation with first-edge lock | Important departure |
| Entrance gate | Section 3.1/Figure 1: AND; Section 4.1/Table 1: NAND2 | Challenge-parity-controlled AND/NAND | Experimental extension; paper ambiguity must be recorded |
| Physical symmetry | Section 4.1: adjusted routing approximately equal | Paired placement and input pins; no demonstrated matched routes | Requirement not established |
| Controller | Initialization/excitation/latching sequence described | Extra explicit clear, fixed cycle counts and synchronous UART readout | Engineering choices; exact timing not supplied by paper |
| Framework | 128-core array and 128-bit response | One raw response bit per query | Deliberately incomplete framework |
| Hash/error correction | Challenge hashing and BCH in full framework | Excluded from this build | Deliberately out of scope |
| Platform | XC7A200T-2FGG484 | XC7A35T CPG236-1, Basys 3 | Different FPGA; identical physical reproduction unavailable |

Source RTL: `rtl/cbdc_puf_core.v`, `rtl/cbdc_puf_chain.v`, `rtl/cbdc_puf_element.v`, `rtl/cbdc_puf_ctrl.v`, `rtl/cbdc_puf_serial.v`. The serial wrapper inherits the core defaults. Source build: `scripts/build_pulled_single.tcl`.

Paper text is internally inconsistent about AND versus NAND and one sentence's arbiter clock source. Use the Figure 1 wiring and document that decision. Neither selectable RTL mode names nor their comments establish paper compliance or physical correctness.

## What the percentages mean

Our 28.3594% is 1452 ones among 5120 repeated one-core observations. A challenge-weighted majority balance would be another statistic. The paper's Figure 3 and Section 4.2 concern ones within 128-bit response words across challenges, including selection of words with 48.4..51.6% balance. A 128-bit word can have, for example, 64 ones and 64 zeros; a single response bit cannot have a within-word balance near 50%.

A full comparison must use corresponding response widths, challenge mapping, selection policy, repetitions and environmental conditions. Keep unselected raw results, and report selection yield and selected results separately. Aggregating 128 different challenges through one PUF is not equivalent to 128 physical cores. Adding 128 copies does not guarantee a balanced result. Hashing measured bits to make them look balanced does not establish raw PUF quality; the paper describes SHA-3 in the challenge configuration path. BCH corrects errors and is not a bias-removal mechanism.

## Finite development sequence

1. Freeze the present design as the measured baseline. This milestone is complete for starting further development; it is not exhaustive characterization.
2. Prepare a separate Figure-1-oriented single-core implementation. Document AND/odd-parity as the initial Figure-1 interpretation; do not silently assume the paper explains all 65536 challenges. Study the fixed-NAND interpretation separately rather than disguising automatic gate switching as specified by the paper.
3. Use explicit configuration values. Resolve the extra arbiter and capture timing with separate controlled comparisons: first remove B while retaining current capture behavior; then replace first-edge locking with Latch-controlled capture. Fixed-gate behavior is a further separate comparison. Keep the stage mapping unchanged initially; its logical function is already aligned. Mode 0 is a candidate for the described capture behavior, not a certified reproduction. Diagnose data/clock/enable loading and physical route changes for each build; changing FF count or placement can change routing, so differences cannot be assigned solely to Boolean behavior.
4. For each candidate, verify simulation sequencing, synthesized hierarchy, implementation warnings and relevant route delays before programming. Compile to a new output folder, never the original bitstream path. Conduct one fixed hardware collection plus one independent confirmation for the chosen candidate. Investigate failures with a named hypothesis; avoid open-ended sweeps seeking a desired ones percentage. Compare baseline and variants on overlapping accepted challenge sets and report parity restrictions.
5. Record the accepted single-core architecture, unresolved paper ambiguities and physical limitations. That is the exit criterion for this single-core phase, not an exact target percentage. A candidate with worse measurements should not replace the preserved baseline merely because it looks closer in a diagram.
6. The later full-framework phase would use multiple physical cores, raw multi-bit UART readout, per-core and per-word metrics, then independently validated BCH and challenge hashing. The earlier instruction to keep the array/BCH/hash out of the current phase remains in force. Plan resource usage and macro placement before attempting 128 cores on the smaller Basys 3 FPGA. Multi-core behavior, selection, environmental tests and comparisons across instances are needed for the corresponding paper metrics. Do not claim cross-device uniqueness from one instance.

This audit prepares the implementation decision. It changes no architecture and starts no new Vivado build or hardware measurement. The next development task is the isolated single-core variant and its validation, not another unchanged-baseline collection.
