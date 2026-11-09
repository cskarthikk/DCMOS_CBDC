# Selected raw 64-core operating profile

The original 64-core physical design is retained. Neither diagnostic trial established a complete fix for the excitation-time dependence. As authorized, this package selects a fixed clock setting using a development pool, then checks it on a separate challenge pool without changing the selection.

**Selected settings: Parallel, Excite=22 cycles, Latch=8 cycles, 64 cores, all raw responses retained.** At the 100 MHz controller clock, these are 220 ns and 80 ns respectively. The FPGA image is unchanged; the host sends the excitation count with each request. It is a calibrated operating point, not proof that the physical imbalance has been repaired.

## Investigation and bounded fix attempts

All 64 structural checks pass. The original implementation has 4096 modeled internal upper/lower delay-pair matches; that does not make every boundary connection or analog delay symmetric. Earlier same-board measurements also showed timing dependence in the 8-core design. There is no basis to promise perfect paper equivalence or identify a single cause in every core.

1. **Capture-window trial:** increased Latch from 8 to 64 cycles. Simulation checked late-edge capture. Physical comparison preserved all 6272 PUF signal trees and 6656 referenced cell placements. A window change also required some ordinary controller routing changes, documented in the trial. Hardware balance moved toward 60–63%, and responses still depended on timing. Equal closing-time profiles agreed much more closely: the old wait64/window8 and new wait8/window64 comparison changed 54/4082 majority positions. This supports elapsed closing time as an important factor; actual oscillator waveforms were not measured. The trial was rejected as a complete fix.
2. **Arbiter placement trial:** moved all arbiters from head+17 to the chain-end row, head+16. The BFF placement encountered routing-resource conflicts at 18 data pins while the validated chain routes were locked. Using AFF at that row routed successfully and passed controller timing and structural checks. All 6144 internal chain trees stayed identical; arbiter/feedback routes were allowed to change, and six ordinary controller flip-flops moved. Median modeled arbiter skew changed from 169 to 164 ps, but the worst changed from 517 to 589 ps. Hardware results below determine whether it helped; a favorable aggregate percentage alone is insufficient.

| Arbiter experiment condition | Excite cycles | Raw ones | Within-capture minority count rate |
|---|---:|---:|---:|
| baseline_before_wait8 | 8 | 36.7871% | 1.5015% |
| trial_step0_wait8 | 8 | 50.5530% | 1.4075% |
| trial_step1_wait127 | 127 | 63.5681% | 1.1511% |
| trial_step2_wait8 | 8 | 50.5750% | 1.3831% |
| baseline_after_wait8 | 8 | 36.7712% | 1.5173% |

The original physical design was selected for the calibrated profile; the arbiter variant did not establish a uniformly better boundary layout or eliminate timing dependence. Both trials and their raw captures remain saved.

## Clock calibration

The following candidate clock counts were declared before this calibration run. The same 64 development vectors and 20 repeats were used at each count. Selection minimizes aggregate distance from 50%, with minority rate and then clock count as tie breakers. No cores, challenges or response bits were discarded or inverted.

| Excite cycles | Development raw ones | Within-capture minority count rate |
|---:|---:|---:|
| 20 | 49.0417% | 1.5002% |
| 22 | 49.9414% | 1.4185% |
| 24 | 51.5137% | 1.3843% |

## Independent validation

After selecting 22 cycles, a fresh 256-vector pool was generated from seed 20261109 using only configuration values. Each core's configurations are distinct within this pool and do not overlap its development configurations. The choice was frozen before either validation capture. All 64 cores were measured 20 times per vector, giving 327680 raw bits per capture and 655360 in total. Replay uses the supplied matrix; the original collector's legacy seed field is unused for replays. The matrix itself and its file hash identify the configurations actually used.

| Metric | First capture | Repeat capture |
|---|---:|---:|
| Raw ones | 48.6435% | 48.6441% |
| Within-capture minority count rate | 1.5146% | 1.4810% |

Strict-majority responses changed at **142/16302** comparable core/configuration positions; **82** positions with a tie in either capture were excluded from this majority comparison only. They remain in the raw datasets. Comparing corresponding trials directly gives **7610/327680 raw bit disagreements (2.3224%)** across the two captures.

Individual core ones percentages still span **6.5430%–92.0508%** in the first capture. Cores outside 10–90%: **[13, 30, 48, 61]**. See [runs/run_5f39ce9b7e164e1ca23263e278aa4265/validation_per_core.csv](runs/run_5f39ce9b7e164e1ca23263e278aa4265/validation_per_core.csv). Aggregate balance does not certify per-core balance, entropy, modeling-attack resistance, inter-device uniqueness, or voltage/temperature/cold-boot reliability. Minority counts are fitted within each capture, not certified BER. Activity is not instrumented; serial status 61 confirms protocol/configuration checks, not measured oscillator activity. No SHA or error correction was added or used.

## Use this profile

From this folder:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Verify
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Program
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Collect -Port COM5 -BitstreamLoaded
```

`Program` loads the selected original 64-core bitstream. `Collect` fixes the selected timing count automatically. Powering the board off loses the volatile image; program again after power-on. An identity hash here checks a file, not a PUF hash or encryption operation. Raw CSV paths are in [runs/run_5f39ce9b7e164e1ca23263e278aa4265/VALIDATION_INDEX.json](runs/run_5f39ce9b7e164e1ca23263e278aa4265/VALIDATION_INDEX.json), with analysis in [runs/run_5f39ce9b7e164e1ca23263e278aa4265/VALIDATION_RESULTS.json](runs/run_5f39ce9b7e164e1ca23263e278aa4265/VALIDATION_RESULTS.json). The captures were obtained after explicitly programming this image in the recorded calibration session.

The profile entry point also passed Verify and a live 12-frame/768-bit Smoke capture with the raw analyzer. This checks host integration; that small sample is separate from the independent validation. Evidence is in HOST_CHECK.json.

Source project: `array64_candidate_2026-11-08`. Bitstream SHA256: `98266A06F5CA5EAE25EAFC507E1B4D81EC55CD21B48980969AF0A7CFF23C1517`. Original 8-core and 64-core designs are preserved. The next hardware evidence needed is the same frozen profile across a cold restart and relevant operating conditions; this package does not claim those tests have happened. Enrollment and software cryptography remain a separate later step.
