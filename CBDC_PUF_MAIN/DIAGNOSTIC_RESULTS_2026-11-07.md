# Three-condition hardware diagnostic

All captures passed full-frame/configuration/condition/word consistency checks. Each has 32 vectors x10 trials x8 cores =2560 raw observations; all three use the identical configuration matrix and record the selected bitstream hash, which matches the local file. The collector checks actual controller-latched configuration readback; live firmware identity remains operator-attested. No activity flags are instrumented or inferred from blank fields.

| Core | Parallel, 8 cycles: ones % (mixed patterns/32) | Sequential, 8 cycles | Parallel, 1 cycle |
|---|---:|---:|---:|
| 0 | 41.5625 (2) | 40.9375 (1) | 27.1875 (2) |
| 1 | 31.8750 (3) | 32.1875 (2) | 13.4375 (4) |
| 2 | 34.6875 (5) | 37.5000 (5) | 14.3750 (2) |
| 3 | 37.5000 (0) | 37.1875 (1) | 21.5625 (3) |
| 4 | 37.5000 (4) | 39.3750 (4) | 13.4375 (2) |
| 5 | 37.5000 (3) | 38.4375 (2) | 22.5000 (5) |
| 6 | 17.8125 (3) | 16.8750 (3) | 5.9375 (2) |
| 7 | 70.0000 (2) | 70.9375 (2) | 53.1250 (8) |
| Aggregate | 38.5546875% | 39.1796875% | 21.4453125% |

All eight cores have both response values across these patterns. The constant-output failure seen in six legacy-pilot cores is absent in this sample. Most patterns per core are constant within their ten readings, so this is not simply every challenge returning a continuously varying bit. Nevertheless, these are finite observations, not certified reliability, entropy or uniqueness. The old pilot used a different challenge domain, set size, architecture and physical implementation; this diagnostic cannot isolate which correction caused the improvement or establish numerical superiority by comparing aggregate percentages.

## Operating-condition comparison

Eight-cycle parallel versus eight-cycle sequential: aggregate differs by 0.625 percentage points. Three strict majorities change among 252 comparable core/pattern pairs; four pairs involving ties are excluded. Mixed core/pattern counts are 22 versus 20 out of 256; smaller-response-count sums are 51 versus 45. This does not support simultaneous activation as the dominant issue in this corrected candidate under these test conditions. It does not exclude subtler concurrency or environmental effects, nor prove what caused the legacy failure.

Eight-cycle versus one-cycle parallel: 40 strict majorities change among 250 comparable pairs, excluding six involving ties. One-cycle capture has 28 mixed core/pattern pairs versus 22, four ties versus two, and a smaller-response-count sum of 77 versus 51. The recorded shorter wait materially affects the response distribution and shows more within-run variation in this sample. The comparison was collected sequentially in time, so unmeasured conditions remain a limitation. It supports retaining the eight-cycle setting for the next characterization, not claiming that it is universally optimal.

Observed distinct response words: 46, 44 and 34 respectively. These counts include within-pattern variation and are not independent entropy estimates. The aggregate percentages are eight-core sample summaries, not the paper's 128-bit response-word balance distribution.

## Decision

Retain the same bitstream, parallel activation and eight-cycle excitation wait. Do not tune toward 50% or switch to the shorter wait on this evidence. Advance from the diagnostic pool to one 256-vector x20-trial collection (5120 frames, 40960 raw responses) with this fixed condition. Assess core 6's low ones ratio and core 7's high ones ratio separately, along with mixed patterns, ties and response-word behavior. Do not mask or omit these cores to improve the aggregate.

No new RTL or programming is required if this same bitstream remains powered and loaded. This broader characterization and subsequent independent validation are acceptance steps before baseline promotion or 128-core scaling, not open-ended repetitions of an unchanged single core.

Sources:

- Parallel/8: `measurements/paper8_b13dbc9e22b74ed49e1139d87f036204.csv`.
- Sequential/8: `measurements/paper8_ec8e7a6f77b54e168343bb3708740dd6.csv`.
- Parallel/1: `measurements/paper8_8c005c2ce7cf4e658a6fd43dbac969cf.csv`.

Each has a saved `.analysis.json`. Combined comparison: `measurements/diagnostic_comparison_2026-11-07.json`.
