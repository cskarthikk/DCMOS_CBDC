# Follow-up review: 4334bb4

## Verdict

Closer to a defensible 64-core course presentation. Hardware verification passes and several important methodological labels have improved. The items below still need correction before describing the package as presentation-ready. No evaluation or hardware source was edited during this review.

## Confirmed improvements

- The spectral/FFT normalization now matches the previously identified standard formula. Rerunning the NIST script reproduces all saved numerical result fields, including FFT 126/128 passes, 98.4375%, average p-value 0.4614779654567527. This validates regeneration and that specific fix, not independent certification of the entire custom suite.
- The marginal MCV calculation includes the 2.576 confidence adjustment. The audit now discloses independence assumptions and explicitly says eight demo challenges do not prove 256 bits of physical secrecy. Its joint-entropy sums remain assumption-based estimates, not generally valid joint entropy upper or lower bounds.
- Cross-core HD is correctly distinguished from same-input uniqueness, with 17 matching inputs acknowledged.
- Main ML sections now identify the protected/end-to-end results as simulations.
- Power is labeled estimated in the main resource comparison. Majority voting is disclosed for the 100% reconstruction observation.

## Remaining blockers

1. **ML executable is broken.** `scripts/crypto_ml_attack.py:1` begins `con` immediately before the opening triple quote. Both AST parsing and `--help` produce SyntaxError. Remove the stray prefix and rerun the documented commands. All other Python files under scripts parse successfully.

2. **Hardware ML numbers do not match the evidence.** Report lines 218–220 claim mean SVM/RBFNN/GRNN prediction scores of 50.1/50.5/50.0%. Saved `measurements/ml_attack_results.json` gives means **59.82/50.54/52.8533%** over its five hardware sample sizes. At N=10,000 the scores are 64.4667/49.2/53.9333%. Regenerate the table from the saved or newly rerun outputs. “Immune,” “Algorithmic Proof” and “prevents linear modeling” remain unjustified. An unsuccessful attack is not a security proof.

3. **Demo output contradicts the new caveat.** `scripts/crypto_demo.ps1:142,145,178` still prints guaranteed/full/provable entropy and immunity to helper leakage. Engine docstrings and its final self-test message likewise claim true 256-bit entropy. Keep output length, tested reconstruction and unknown conditional secrecy distinct throughout scripts, slides and report.

4. **Resource and power details are still wrong.** The report calls the delay line 32 LUTs/core. It has 32 configurable chain elements, each mapped to buffer/inverter/selector LUTs: **96 stage LUT sites plus two entrance gates = 98 fixed PUF LUT sites/core**. Total FPGA occupancy remains 11,008 LUTs. The power report's component estimates are clocks **0.020 W**, logic **0.010 W**, signals **0.009 W**, I/O **0.005 W**, not the values currently copied into the report. Preserve the vectorless/default-activity qualifications.

## Scope limitations to retain rather than promise away

- No same-input inter-device uniqueness or broad voltage/temperature characterization has been demonstrated. Independent macro placements can characterize intra-die variation; that is distinct from inter-device uniqueness.
- The 100% voted recovery is a finite offline 256-pattern observation, not universal single-shot recovery or proof of secure 256-bit master keys. The analyzer's fixed success conclusion remains hardcoded and its input-validation/tie-policy limitations from the previous review remain.
- The filtering audit still prints a fixed NIST-success conclusion without executing NIST tests; balanced averages do not prove randomness. Describe paper candidate selection neutrally and distinguish 128 concatenated statistical samples from native 64-bit responses.
- The sample per-core confidence calculation is not a full SP 800-90B source validation or a conditional PUF secrecy assessment. Multiple-comparison, core/challenge dependence and extraction-security assumptions remain unproved.

## Checks performed

Root Verify passed. All scripts were AST-parsed; only the ML script failed. Changed entropy and distance audits ran. The NIST suite was rerun and its saved non-timing result fields matched exactly. Hardware ML table averages were independently recomputed from its committed JSON. Test logs are in this folder. No FPGA reprogramming, rebuild or new hardware measurements were needed.

The remaining immediate work is software/report consistency and command verification. A new FPGA architecture or 128-core expansion is not necessary merely to present the working 64-core adaptation with limitations stated.
