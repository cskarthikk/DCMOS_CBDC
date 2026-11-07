# First hardware evaluation of boundary_v3

Decision: retain this physical variant as an experiment; do not promote it to the final baseline. Balance moved towards 50%, while within-run consistency worsened in this sample. One independent reprogrammed confirmation is the next bounded acceptance step. No further routing sweep is justified by this run alone.

New data: `measurements/boundary_7c4639dba1ca47c3814768e9f9375d83.csv`. Reference: `measurements/run_5b97cf3273a1484c8f8a4e6621df6989.csv`. The PowerShell analyzer validated complete collections, odd parity, protocol status, binary responses and trial IDs; independent Python calculations reproduced the statistics. All 256 challenges match in order. The recorded new hash matches the selected bitstream, `22721F79215EEAC8596E2CBC7E4EB6EF3D4F2C9169537E6B11E8B3FF98DFD718`. Operator confirmation remains the programming evidence; the file hash does not identify live firmware.

| Statistic | Internal-matched candidate | Boundary v3 |
|---|---:|---:|
| Accepted responses | 5120 | 5120 |
| Ones | 1204 | 1388 |
| Raw ones percentage | 23.515625% | 27.109375% |
| Challenges constant across 20 readings | 245 | 238 |
| Mixed challenges | 11 | 18 |
| Always zero / always one | 189 / 56 | 178 / 60 |
| Majority ties | 1 | 0 |
| Sum of smaller response counts | 36 | 90 |

Balance improved by 3.59375 percentage points but remains strongly biased towards zero. The smaller-count sum is calculated per challenge as min(ones, zeros); the earlier 10/10 tie contributes 10. Its increase is additional evidence of more within-run variation, not a certified BER against an independently enrolled truth. No ties in the new run does not imply stability: 53EA has 9 ones, and 2E0B has 11 ones out of 20.

New mixed challenges, ones out of 20: 0A76=12, 48A4=17, DE57=16, 53EA=9, E468=15, F01A=7, AF08=2, 1F6F=3, 3818=7, 37A6=17, 106F=3, 2E0B=11, E6DE=7, 22C1=12, 95F4=17, 2AA9=13, AED7=1, 6A25=19.

Nine strict majorities differ among 255 comparable challenges; the reference tie is excluded. These are two different physical implementations, so that count is not temporal unreliability. This controlled routing-only design comparison supports an association between the changed implementation and the changed response distribution; separate collection times and unmeasured environmental conditions prevent attributing all differences solely to routing.

The reported modeled routing symmetry improvement did not produce a clear overall hardware improvement. Matched net estimates do not establish silicon symmetry, LUT delay equality, or equal timing behavior at the arbiter's distinct D and C inputs. Activity is not measured by this single-FF candidate. No cross-device uniqueness, entropy, environmental reliability or paper-equivalent 128-bit response metric follows from these runs.

## Bounded next step

Reprogram the same `build_boundary_v3/candidate.bit` in Vivado, hold supply and temperature as similar as practical, and collect the same 256 x 20 once using `scripts/collect_boundary.ps1`. Compare that confirmation both with this boundary run (same implementation, relevant to repeatability) and with the saved internal-matched candidate. Keep mixed challenges and ties in the evaluation.

After that comparison, choose and document the single-core checkpoint. If the new variant again shows materially more within-run variation, prefer the earlier internal-matched candidate for the next phase; retain its bias explicitly rather than choosing a version solely for a higher ones percentage. If the repeat is inconsistent with this run, investigate that concrete discrepancy before attributing it to routing. Do not continue open-ended routing or measurement sweeps for 50%.

The next development milestone after checkpoint selection is a documented single-core evaluation/enrollment pipeline using separate enrollment and validation data. The paper's full 128-core response-word metrics and framework remain a later, separately scoped phase. Filtering or hashing outputs to force a balanced sample does not establish improved raw PUF quality.

Detailed machine-readable results: `measurements/analysis_28e8431efa6f4a96a05d998d6aa988bc/summary.json` and its per-challenge comparison CSVs. The analyzer labels the specified reference generically as "original" in console output; here that reference is the internal-matched candidate, not the older mixed-parity checkpoint.

## Independent confirmation completed

Confirmation CSV: measurements/boundary_2c82a4abad154a76a18bacef38ae4bca.csv. Validated 5120 accepted responses, identical ordered 256 challenges and recorded boundary_v3 hash. Ones=1380 (26.953125%); constant challenges=239; mixed=17; ties=0; smaller-count sum=72. Five strict majorities changed relative to the first boundary run: F01A 7->17, 3818 7->12, 2E0B 11->7, 22C1 12->4, 2AA9 13->6 (ones out of 20). These are same-implementation repeat comparisons, unlike the earlier cross-variant comparison; the analyzer's generic different-design console label does not apply here. Analysis: measurements/analysis_3c38b67c0651406e8229cdf5cf46b9cc.

Decision: the confirmation again shows more within-run variation than the earlier internal-matched candidate (17 vs 11 mixed challenges; smaller-count sum 72 vs 36). Do not promote boundary_v3. Use build_internal_matched_v2 as the provisional single-core development checkpoint and end this routing experiment. Its superiority in general reliability is not established by one broad run; independently validate enrollment on held-out measurements during the next software evaluation phase. Preserve both variants and all raw responses. The next milestone is evaluation/enrollment tooling and a documented checkpoint, not further boundary routing sweeps or a claim of paper-equivalent 50% responses.
