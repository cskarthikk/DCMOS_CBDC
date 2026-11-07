# Best preserved empirical checkpoint found — 7 November 2026

The saved folder the user remembered is `best_so_far_single_puf_2026-11-04`. Its original folder and ZIP are stored on local Git branch `main`. The accessible exact copy in the current Version-2 workspace is:

`C:\BTech\Semester_5\DCMOS\Project\continuation_single_puf_2026-11-06\reference\best_so_far_single_puf_2026-11-04`

Use this preserved bitstream to reproduce that checkpoint, without rebuilding:

`C:\BTech\Semester_5\DCMOS\Project\continuation_single_puf_2026-11-06\reference\best_so_far_single_puf_2026-11-04\build_m1\pulled_single\cbdc_pulled_single.bit`

SHA256: `5DCC2151205DE1C92A79DC5EAFF657A57885A6715FD1DEAA62ECA8B8A497F111`.

Fresh verification: all 34 reference manifest entries pass; all 35 non-directory ZIP members match this copy byte for byte. No branch checkout or FPGA programming was performed. The mutable main-project `build_m1/pulled_single/cbdc_pulled_single.bit` has a DIFFERENT hash (`AD7427A3D3A2494F3975167B0611073D2E407AF6C83DE12AF41E63593B0B023F`) and must not be substituted for the preserved file.

## Measurement evidence

| Saved implementation/run | Responses | Ones percentage | Mixed challenges |
|---|---:|---:|---:|
| Original preserved run_ab2cc0e61c854380a2e9dec91f7b500f.csv | 5120 | 28.84765625% | 12/256 |
| run2_verify.csv, same recorded original hash | 5120 | 28.76953125% | 10/256 |
| Continuation run_665126d9012444b28afbfd686a578ce1.csv | 5120 | 28.41796875% | 14/256 |
| Continuation run_6e85693e1279403fb2f6d2bb2a21fef4.csv | 5120 | 28.359375% | 12/256 |
| Figure 1 internal-matched candidate | 5120 | 23.515625% | 11/256 |
| Figure 1 boundary v3, first run | 5120 | 27.109375% | 18/256 |
| Figure 1 boundary v3, confirmation | 5120 | 26.953125% | 17/256 |

The original run contains 1477 ones and 244 challenges constant across 20 readings (65 always one, 179 always zero). These finite-run counts do not certify reliability. Later repeats include majority changes or ties; do not describe this as perfect repeatability. Metadata identifies recorded files and operator confirmation, not independently identified live firmware.

The audit scanned 84 CSV files with raw response/acceptance/challenge fields in saved measurement locations, excluding generated analysis folders and simulation/fixture directories. Other full-size hardware results include original run01/run02 ~11.8%, matched routing ~13.3%, X22 ~1.45%, X24 ~22.79%, and center-launch ~28.67%. Small smoke tests, captures, different experiment modes, and simulation results are not evidence of a superior broadly tested PUF. The inventory is `continuation_single_puf_2026-11-06/all_saved_measurements_audit_2026-11-07.json`; duplicate preserved copies are listed but are not independent experiments.

## Decision and scope

Keep the November 4 preserved version as the best saved empirical comparison checkpoint identified by this audit: it has the closest-to-50% balance among the full 256x20 runs found, useful repeat-run evidence, and fully preserved sources/bitstream. This corrects the earlier recommendation that considered only the recent Figure 1 candidates when choosing a development checkpoint. Do not discard the original or automatically replace it with the 23.52% version.

This is not a declaration of best security, entropy, or exact paper fidelity. The original uses one PUF with AUTO_PARITY=1, CAPTURE_MODE=1, DUAL_ARBITER=1 and diagnostic/edge-lock registers; only primary arbiter A is collected. Its extra registers and capture behavior depart from the single-arbiter Latch-controlled Figure 1 interpretation. The newer candidates are closer to those structural details but do not surpass the original's observed raw balance.

The original samples both challenge parity groups; the newer candidates sample odd parity only. Consequently, this table identifies the saved 28.x% checkpoint and summarizes observed runs; it is not an isolated proof of architectural superiority. The already documented shared-set comparison (126 odd challenges) also favored original balance: 29.2857% versus 27.0635% for the internal-matched candidate, with 5 versus 4 mixed challenges. Preserve the empirical checkpoint and paper-oriented candidates as distinct, labeled implementations.
