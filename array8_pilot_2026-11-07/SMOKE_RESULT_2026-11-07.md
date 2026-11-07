# First eight-core hardware smoke test

Validated `measurements/array8_07fabfd14bc6478bb835ee85c225663c.csv`: 12 complete frames, 96 individual core observations, all eight core indices per frame, correct configuration matrix, binary responses, correct word/bit mapping and expected 41 status. Metadata records the release bitstream hash, which matches the local file; operator attestation is the firmware-loading evidence. All 96 observations have both activity flags set. These flags do not certify oscillation frequency or security.

| Configuration applied to every core | Three raw response words (hex) |
|---|---|
| 0000 | 46, 46, 46 |
| 0001 | 46, 46, 46 |
| 8000 | 46, 46, 46 |
| FFFF | 44, 44, 44 |

No within-configuration changes occurred in these three readings. Total ones=33/96 (34.375%); this tiny deliberately selected set is not a balance estimate comparable to the earlier 256-challenge runs. Core 1 changed across configurations. Cores 2 and 6 returned one for all four configurations; cores 0,3,4,5,7 returned zero. Seven constant cores across four configurations warrant broader challenge testing, not a declaration of stuck outputs or healthy PUF quality. First-edge diagnostic flags alone do not resolve that question.

Decision: transport and basic sequence/activity smoke checks passed. Proceed once to 256 vectors x20 repeats using the same programmed build; analyze per-core variation and consistency, especially cores 1,2,7 with known modeled route mismatches. Do not scale to 128 cores until this characterization establishes useful challenge-dependent behavior. If cores remain constant or strongly biased over the broader set, investigate their physical implementation before scaling. Preserve all cores and raw responses in the report rather than hiding poor cores through selection.

Machine-readable analysis is saved beside the CSV as `.analysis.json`. This is hardware smoke evidence, not certified reliability, uniqueness, entropy or paper-equivalent metrics.
