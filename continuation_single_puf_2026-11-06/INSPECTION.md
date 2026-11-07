# Single-PUF inspection, 6 November 2026

The preserved checkpoint is intact. A later repeat measurement already exists. The friend's continuity report contains useful filenames but several unsupported or incorrect conclusions. No RTL, constraints, existing scripts, recorded measurements, FPGA configuration, Git branch, or Git history was changed during this inspection. New inspection files are confined to this folder. No build or hardware collection was run.

## Repository and preservation

- Current branch: `Version-2`, HEAD `a6a2fe50f8fdf8d36b11defabac1df607ce7e1a5`.
- Local `main`: `7317e15`, containing `7c36aa7` and `7317e15`; it is two commits ahead of the locally recorded `origin/main`. No fetch or push was performed, so this does not establish the live remote state.
- `ca05b0e` from the friend's report is not an object in this local repository.
- Initial working tree had seven untracked Tcl scripts: `build_matched_single.tcl`, `check_launch.tcl`, `check_slice_and_stages.tcl`, `check_wire_delays.tcl`, `get_route_strings.tcl`, `program.tcl`, and `program_matched.tcl`, all under `scripts/`. Thus it was not clean.
- The checkpoint and its ZIP are tracked on `main`, absent from the checked-out `Version-2` tree. Their Git objects were read without checking out another branch.
- An exact-byte reference copy of all 35 checkpoint files is in `reference/best_so_far_single_puf_2026-11-04/`. All 34 `FILE_HASHES.json` entries pass. All seven RTL files also match the tested build's source manifest. Each of the 35 tracked files has an identical member in the archived ZIP.
- The original bitstream hash is `5DCC2151205DE1C92A79DC5EAFF657A57885A6715FD1DEAA62ECA8B8A497F111`.
- The current main-project `build_m1/pulled_single/cbdc_pulled_single.bit` has hash `AD7427A3D3A2494F3975167B0611073D2E407AF6C83DE12AF41E63593B0B023F`. It is a different file. Its name does not make it the preserved original.
- COM3, COM4, and COM5 are present. Registry mapping identifies COM3/4 as Bluetooth modem ports and COM5 as `VCP0`. This is consistent with the expected USB UART; it does not identify active FPGA firmware. CIM device-name lookup was unavailable.

## Architecture established by files

One PUF core, two cross-coupled chains, 16 configurable stages per chain. `AUTO_PARITY=1`, `CAPTURE_MODE=1`, `DUAL_ARBITER=1`, `ELEMENT_STYLE=0`. Two arbiters are inside that one core. UART returns primary A and activity flags only, with no secondary bit or `race_valid` readout.

The current `rtl/cbdc_puf_core.v` is byte-identical to the preserved core. It defaults to `DUAL_ARBITER=1`; the serial wrapper does not override it. Both the preserved and current implementation reports explicitly name the reverse arbiter. The friend's assertion that all dual-arbiter changes were reverted is contradicted by these files. The captured results of B are not available, so complementary outcomes or any benefit from B cannot be assessed.

Primary A uses D=Qu and the falling edge of Qb. Mode 1 enables capture using excitation and then disables further captures through edge-lock feedback. This is not the earlier experiment that armed capture one system-clock cycle before excitation. Comments calling it a true first wavefront are design intent, not proof that the FPGA always captures the intended edge.

The build reads seven RTL files only. No array, BCH, response assembly, or hash module is included. Automatic parity chooses AND for odd parity and NAND for even parity. The collector accepts both groups and zero.

The preserved build script constrains paired locations and LUT pins: chains X21/X25, entrance Y100, stages Y101..116, A at X23Y116/BFF, B at X23Y118/BFF, edge locks X25Y117/AFF and X21Y117/AFF. It selects exact cells and acknowledges the intentional loop on the exact head-output net. It does not fix matched routes. No new routing analysis was performed on the preserved implementation, and no routed DCP is included in the snapshot.

## Reports and simulation

The preserved routed utilization report says **360 LUTs / 290 FFs for the design**, and **105 LUTs / 4 FFs for the PUF core**. These differ from the first handoff's 368/106 counts. Treat them as saved-report counts; this inspection did not regenerate utilization from the tested bitstream.

The route report confirms 639/639 routable nets fully routed and zero routing errors. The timing report gives setup/hold slack +3.928/+0.128 ns for the conventional timing analysis.

The five final DRC warnings are one allowed combinatorial loop, two gated-clock checks, and two nonoptimal connections that could affect hold timing. The methodology report additionally lists four **TIMING-17 Critical Warnings**, 17 missing I/O delay warnings, one combinatorial-loop warning, and two inefficient-query warnings. Neither ordinary timing closure nor those route counts certify the asynchronous race.

The preserved serial testbench was compiled and rerun with Icarus Verilog 12.0 and its supplied artificial-delay primitive models, with outputs in `simulation/`. It passed. This checks the supplied simulated UART/control behavior and selected challenges. It does not model physical routing, analog metastability, or establish hardware reliability. It was not a Vivado simulation rerun. An initial PowerShell launch failed; rerunning the unchanged sources through Python subprocess succeeded.

## Collector and verified measurements

The collector begins with `0000, 0001, 0002, 0003, 0007, 0008, 8000, FFFF, 001F, 7FFF, 8003, FFFE`, then draws unique 16-bit integers using `[Random]::new(20261101)`. Its computed parity variable does not filter challenges. It performs 20 consecutive trials of each challenge before moving to the next. The generated 256-challenge list exactly matches the original CSV in set and order; the newer full runs also match that order. `expected_challenges_256.txt` records it. Future execution should check this match in the chosen PowerShell runtime rather than relying only on a seed.

The three runs below each contain 5,120 accepted rows, exactly 256 challenges, trial IDs 1..20 exactly once per challenge, binary responses, consistent `17` status flags, and zero missing activity rows.

| Dataset | Ones / 5,120 | Ones percentage | Constant challenges | Mixed challenges | Sum of smaller response counts |
|---|---:|---:|---:|---:|---:|
| Preserved original `run_ab2cc0e61c854380a2e9dec91f7b500f.csv` | 1,477 | 28.8477% | 244 | 12 | 39 |
| `run2_verify.csv` | 1,473 | 28.7695% | 246 | 10 | 37 |
| `run_restored_baseline.csv` | 1,450 | 28.3203% | 243 | 13 | 50 |

The original has 65 always-one challenges and 179 always-zero challenges. Its smoke run has 24 accepted rows, 21 ones, seven always-one challenges, one always-zero challenge (FFFF), and zero missing activity flags. These reproduce the original handoff's measurement counts. The friend's 1,475 baseline count is incorrect.

For original versus `run2_verify.csv`:

- Metadata records the original bitstream hash for both runs. That supports file provenance but does not prove which firmware was programmed. The user supplied a friend's handoff rather than independently confirming that programming event.
- All **255 challenges with strict majorities in both runs have the same majority**. `18F5` changes from 16/20 ones to 10/20 ones, giving no strict majority in the repeat. It must be excluded explicitly, not silently resolved by a tie-break rule.
- **243/256 challenges are constant with the same bit across all 40 observations.** Nine are mixed in both runs; three original mixed challenges become constant in the repeat; one original constant challenge (`F85B`, 20 ones) becomes mixed (19 ones).
- The 37 repeat responses differing from the original majority are descriptive mismatches. They do not establish a certified error rate or 100% raw reliability.

For original versus `run_restored_baseline.csv`:

- Recorded hashes differ. Do not combine this with the original as an exact-original-file repeat.
- `F416` changes strict majority from 13/20 ones to 7/20 ones; `18F5` is again tied.
- There is **one strict-majority change among 255 comparable challenges**, and 241 challenges are constant in both runs. The friend's claim of zero consensus changes is contradicted by the CSV.

Other later runs are separate experimental records:

| Dataset | Ones | Ones percentage | Mixed challenges | Recorded bitstream hash prefix |
|---|---:|---:|---:|---|
| `run_x22.csv` | 74 | 1.4453% | 2 | `50D9B5DD1837` |
| `run_x24.csv` | 1,167 | 22.7930% | 8 | `5FA59383B013` |
| `run_center_launch.csv` | 1,468 | 28.6719% | 13 | `90DE39AD971E` |

Their filenames and measurements are consistent with placement experiments, but the causal claims about wire distances or an optimal location need exact build provenance and route data. Those explanations are hypotheses, not established mechanisms from CSVs. Different `.bit` hashes prove different file bytes; they alone do not establish whether the routed circuits differ because bitstream headers can also differ.

`smoke_verify.csv` is header-only and is not a successful test. `smoke_verify2.csv` has 24 rows, 21 ones and no missing activity. Measurement metadata is written before collection opens the serial port, so a metadata file alone does not establish completed measurements.

## Paper and interpretation

The local `ResearchPaper.pdf` is the 17-page Liu, Li, Qu and Dai ACM TODAES 2023 paper, DOI 10.1145/3588435. Text was freshly extracted from that PDF and relevant pages were rendered and visually checked; this was not inferred from the handoffs or old `paper_text.txt`.

What it explicitly specifies:

- Figure 1 shows one DFF, D=Qu and a negative-edge clock from Qb, with Latch driving CE. Section 3.1 describes initialization, excitation with Latch low, then latching with both controls high.
- Section 3.1 describes AND entrance gates, while Section 4.1 names NAND2 primitives. A prose sentence on page 5 also names Qu as both data and falling-edge source, unlike Figure 1. These inconsistencies require documented interpretation.
- Section 4.1 uses 16-bit control per core, a 128-core framework, approximately equal manually adjusted differential routing, and an FPGA different from Basys 3. It describes SHA-3 producing challenge-configuration data. Section 4.2 identifies response width as 128 bits.
- Section 4.2 reports a 27.3..61.7% distribution and selects 11,202 of 50,000 CRPs whose response balance lies within 48.4..51.6%.

What that does **not** establish for this project:

- Figure 3 describes the balance inside 128-bit response words, whereas our 28.85% is one core's response across different challenges. These are different measurements. Falling within the same numerical range is not evidence of compliance or equivalence.
- Selecting an approximately equal number of known zero and one single-core outputs would balance the selected dataset by construction. It would not correct the raw PUF or reproduce the paper's per-word selection. Selecting challenges whose repeated one-bit readings are near 50% instead would favor unstable challenges.
- The paper's hash is used in the challenge path; its description does not justify saying that SHA-3 and BCH whiten our raw output. BCH is described as error correction. No such blocks are included in this isolated design.
- Automatic parity selection, the three-LUT stage mapping, controller timings/clear, first-edge locks and extra arbiter are our implementation choices or experiments, not fully specified equivalents of the paper. No claim of 100% paper fidelity is supported.

Original parity breakdown: even 739/2,600 = **28.4231%**; odd 738/2,520 = **29.2857%**, a **0.8626 percentage-point** difference. Repeat: even 736/2,600 = 28.3077%; odd 737/2,520 = 29.2460%, a 0.9383-point difference. This contradicts the friend's stated less-than-0.2-point difference. Regardless of the difference, 256 selected challenges do not establish behavior for all 65,536, and similar group means do not prove absence of structural bias.

Activity flags record at least one monitored falling edge under the enable conditions. They do not measure sustained oscillation, frequency, correct first-edge arbitration, or analog race validity. The secondary response and `race_valid` are not exposed. Stable measurements on one board do not isolate manufacturing variation from routing effects or establish cross-device uniqueness, entropy, security, cold-reboot behavior, or environmental robustness. The CSVs and supplied metadata do not log power cycles or voltage/temperature.

## Continue from here

The immediate next task is to establish programming provenance, not to enlarge the dataset or select a balanced subset. The exact preserved file remains available in the reference copy. If a fresh baseline is needed, program that file explicitly and collect the same 256 challenges and order to a unique new filename outside the reference folder. Record the programming path/hash, whether power was cycled, and known ambient conditions. Do not rebuild first. See `NEXT_MEASUREMENT.md` for exact steps.

To reproduce the already-completed comparison, from the project folder:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\continuation_single_puf_2026-11-06\compare_saved_runs.ps1
```

Expected: hashes match, 1,473 ones, 10 mixed challenges, zero missing activity rows, zero strict-majority changes out of 255 comparable challenges, one tie (`18F5`), and 243 challenges constant in both runs. The script does not access the board or write to the datasets. Python and PowerShell independently reproduced these comparison counts.

Machine-readable evidence is in `reference_verification.json`, `baseline_summary.json`, `discovered_measurements.json`, and `baseline_vs_run2_verify.csv`. Measurements in the main project were read without alteration; their inspected CSV SHA-256 values and metadata are recorded in `discovered_measurements.json`.
