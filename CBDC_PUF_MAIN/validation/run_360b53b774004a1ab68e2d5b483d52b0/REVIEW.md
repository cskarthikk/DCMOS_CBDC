# Review of independent confirmation

The supplied capture and frozen enrollment were independently recounted. Capture/model hashes match the report and enrollment-bound metadata. Package verification still passes all 1387 frozen files. The enrollment mask was not changed using this confirmation.

| Quantity | Observed result |
|---|---:|
| Enrollment positions retained before validation | 1854/2048 (90.5273%) |
| Validation readings at retained positions | 37080 |
| Disagreements with frozen reference bits | 109 (0.293959%) |
| Observed retained-bit agreement | 99.706041% |
| Retained positions with at least one disagreement | 44/1854 |
| Retained positions whose 20-reading majority changed | 0/1854 |
| Retained positions tied in validation | 0 |
| Frames containing any retained-bit error | 107/5120 |
| Frames with every retained bit correct | 5013/5120 (97.910156%) |

There are still residual errors: the worst retained position (pattern 135, core 3) disagreed on 9/20 readings; another (pattern 171, core 6) disagreed on 8/20. Thus a previously constant enrollment position can become marginal. Preserve these failures; do not remove them after inspecting validation and then describe the revised mask as independently validated.

Per-core retained-bit agreement ranges from 99.4444% (core 2) to 99.8908% (core 4). Core 5 combines high enrollment yield (244/256 positions retained), near-balanced raw responses (48.6914% ones in validation) and 99.8770% retained-bit agreement. These are observations on this sample, not a universal ranking.

Raw ones ratio across all 40960 observations is 41.1768%, compared with 41.25% in enrollment. All eight cores still return both values across the vectors. This broadly consistent distribution does not imply unbiased outputs or entropy. Retained-bit agreement is measured only on the preselected positions; it is not the agreement rate of all raw positions. Word agreement refers to each frame's retained subset, not an unmasked eight-bit word or a 128-bit key.

Recommendation: retain this exact eight-core implementation, operating profile and enrollment as the current development checkpoint with one independent confirmation. The data justify advancing to larger-array placement/resource feasibility and reconstruction/error-correction design, rather than more blind routing or unchanged acquisitions. No formal product acceptance threshold was specified, so this is an engineering recommendation, not certified qualification. Temperature/voltage robustness, broader reprogramming/device evidence, raw bias/entropy assessment and full-width reconstruction remain separate requirements.

The 109 observed errors are real raw validation errors; no BCH was applied. Corrected output must later be evaluated separately, with grouping and helper-data/reconstruction rules fixed before testing. Do not infer error-free key generation or 128-core feasibility from this eight-core bit agreement.
