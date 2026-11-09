# Review of pulled changes at badb1da

9 November 2026. Scope: changes since be56b6e, retained hardware evidence, evaluation source code and report claims. Application/evaluation code was not modified. The added hardware-assessment evidence is consistent with the prior completed rebuild/power/latency work; the newly added statistical evaluations require corrections below.

## Findings, ordered by importance

### 1. Entropy and key-strength conclusions are unsupported

`scripts/audit_silicon_entropy.py:45–66` computes per-core empirical bias scores from 256 trial-1 observations, adds them to obtain joint block entropy, subtracts 15 and scales across challenges. Marginal min-entropies cannot generally be added for correlated cores or challenges. For example, 31 identical copies of one fair bit each have a marginal score of one bit, but together contain only one bit of entropy, not 31.

The code also omits the confidence adjustment in NIST SP 800-90B Section 6.3.1. Its score is not the claimed NIST measured lower bound. NIST's estimator uses an upper confidence bound on the most-common probability; a full source assessment has additional requirements. Random-challenge statistics on one fixed PUF are not automatically a conditional secrecy bound for known challenges and public helpers.

Therefore the reported 5.14 retained bits/challenge, 25-challenge AES-128 and 50-challenge AES-256 requirements are not established. Extraction also needs an explicit security/error budget; hashing alone does not supply it. The report's own conclusion that entropy/correlations remain future work contradicts its tables calling these bounds verified.

There is an implementation/report mismatch too: `scripts/crypto_demo.ps1:118` and `scripts/crypto_engine.py:255–256` still use eight challenges for a 256-bit output, not the newly claimed fifty. Merely changing eight to fifty would not repair the missing entropy proof.

Required correction: label bias scores as exploratory, remove guaranteed key-strength claims, assess joint/conditional entropy and dependence under an explicit threat model, then align accumulation/extraction with a justified bound.

Reference: [NIST SP 800-90B, Section 6.3.1](https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-90b.pdf).

### 2. The new external-challenge ML result is still simulation

`scripts/crypto_ml_attack.py:275–301` creates random Gaussian delay coefficients and noise; `--source end-to-end` calls it at line 478. No physical FPGA query or real external-challenge/response dataset is used in that mode. About 50% prediction on this generated model does not establish immunity or mathematical security of the board. Because challenge preprocessing is public, attacks that compute configuration features from external challenges must also be considered.

Required correction: label those results simulated; acquire and preserve actual external challenge strings, configurations, core identities and measured responses; evaluate held-out challenges with appropriate bias baselines and documented model implementations. A failed attack is not proof of immunity.

### 3. Spatial HD is computed with different inputs

`scripts/audit_uniqueness_filtering.py:31–54` aligns responses by pattern position, not by matching per-core configurations. The actual validation data have only **17 identical configurations among 516,096 compared pattern/core-pair inputs**. The observed 50.23% HD is descriptive for these sequences, not controlled same-input inter-PUF uniqueness or proof of independent/orthogonal manufacturing variation. The 2,016 pairs also share cores and are not statistically independent experiments.

Required correction: collect the same 16-bit configurations on compared cores, or compare independent complete macro implementations under the same full challenges. Preserve the current result only with its actual scope stated.

### 4. The custom NIST suite contains a confirmed FFT formula error

`scripts/crypto_nist_test.py:178` divides by `sqrt((n/2)*0.95*0.05)`. NIST SP 800-22 Rev.1a uses `sqrt(n*0.95*0.05/4)`. This inflates the current p-values. On the existing 128 streams, independently applying the standard formula changes **128/128 passes to 126/128**; all 128 computed p-values differ. This checks the formula, not the adequacy of short streams for the full standard.

`audit_uniqueness_filtering.py:92` prints a fixed nine-test success claim without running any NIST test. Neither a near-50% mean nor that fixed message proves randomness or security. The other custom tests and sample requirements still need validation against reference methods. Filtering is an enrollment method to disclose and independently evaluate, not evidence that the paper's authors behaved improperly.

Required correction: fix and validate the suite, enforce test prerequisites, compute verdicts from actual results, then regenerate tables and figures.

Reference: [NIST SP 800-22 Rev.1a, spectral test](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-22r1a.pdf).

### 5. Error-correction improvement is real but overgeneralized

I reran `crypto_batch_analysis.py --csv1 measurements/validation_1.csv --csv2 measurements/validation_2.csv`:

| Comparison | Raw disagreement | Legacy correct recovery | Code-offset correct recovery |
|---|---:|---:|---:|
| First trial, 256 response words | 2.28271484375% | 255/256 = 99.609375% | 252/256 = 98.4375% |
| Twenty-trial majority per capture | 1.11083984375% | 256/256 = 100% | 256/256 = 100% |

This is a useful offline reconstruction result from independent captures. It is not 100% single-shot reliability, a measured 256-bit master-key success rate across eight/fifty challenges, or proof of helper secrecy. Code-offset checks two 31-bit blocks, excluding response bits 62 and 63. Twenty-reading ties are assigned one, unlike the older tie-excluded comparison. These methodological choices must be stated.

The loader has no full status/configuration/duplicate-row validation; duplicate observations can overwrite one another. Its lines 260–262 print a fixed 100%/leakage-eliminated conclusion even if future measured results differ. Required correction: validate complete captures and metadata, compute conclusions dynamically, and report the exact unit/denominator and enrollment/voting policy.

### 6. Documentation still overstates or miscopies evidence

- `reports/CBDC_PUF_REPLICATION_REPORT.md:56,69` says 32 LUTs/core. The selected mapping has 96 stage LUTs plus two entrance LUTs = 98 fixed PUF LUT sites/core, 6,272 total. Full-design physical LUT occupancy is 11,008.
- Line 88 calls 0.116 W measured and infers efficiency. It is a vectorless estimate with default activity/thermal settings and a warning. Component figures are also miscopied: the saved report lists clocks 0.020 W, logic 0.010 W, signals 0.009 W and I/O 0.005 W.
- The 440 ns figure is accepted-start to response-valid in controlled RTL simulation. It is not physically measured intrinsic PUF delay or the entire UART command latency. The generated testbench is in the hardware-assessment folder, not the referenced root sim path.
- Labels including “Verified Secure,” “Immune,” “Mathematically Proven,” “Measured Lower Bound” and “proves orthogonal variation” are not supported by these tests.

## What passed

- Root `run.ps1 -Action Verify` passes; hardware/RTL/image files were not changed by the new statistical-evaluation commits.
- Existing crypto-engine self-tests complete successfully. This establishes tested correction functionality, not key secrecy.
- New entropy and spatial scripts run, but their interpretation has the problems above.
- The new code-offset/legacy offline comparison reproduces its numerical correction results. Logs and JSON are stored in this folder.
- Existing rebuild/configuration-payload comparison and routed utilization/timing evidence remain available. No FPGA programming or RTL modification was needed for this review.

## Recommendation

Keep the working hardware and useful measurements. Correct the evaluation methodology, regenerate affected results, and rewrite the comparison table before presentation. This review does not find a need to redesign the 64-core array based on these new files; the main blockers are unsupported statistical/security conclusions and mismatched measurement scopes.
