# CBDC_PUF_MAIN: Core Engineering Workspace

This directory houses the complete, self-contained implementation of the **64-core Configurable Butterfly Delay Chain PUF (CBDC-PUF)**, cryptographic preprocessing, error-correcting codes, modeling-attack resilience evaluations, and NIST statistical test suites replicating **Yanjiang Liu et al. (ACM TODAES 2023)**.

---

## 📂 Directory Layout

- **[`array64_candidate_2026-11-08/`](array64_candidate_2026-11-08/)**  
  Synthesized and implemented 64-core physical PUF bitstream (`build/paper_array64.bit`), layout records, placement constraints (`basys3_serial.xdc`), and Verilog HDL source modules.
- **[`array64_clock_profile_2026-11-09/`](array64_clock_profile_2026-11-09/)**  
  Active operating profile (Parallel mode, Excite=22 cycles, Latch=8 cycles) achieving 48.64% bit uniformity on Basys 3 silicon, with raw physical validation datasets (`runs/run_5f39ce9b7e164e1ca23263e278aa4265/validation_1.csv`).
- **[`scripts/`](scripts/)**  
  Complete verification and evaluation suite:
  - `crypto_engine.py`: Multi-block BCH(31, 16, 3) codec + NIST SHAKE-256 preprocessor.
  - `crypto_ml_attack.py`: Evaluates SVM, RBFNN, and GRNN modeling attacks (Table 3 & Fig 9).
  - `crypto_nist_test.py`: NIST SP 800-22 9-test statistical randomness suite (Table 2).
  - `crypto_unstable_bits.py`: Silicon stability and noise concentration analyzer (Fig 5, 6, 7).
  - `generate_presentation_plots.py`: High-resolution plot generator for presentation slides.
  - `crypto_demo.ps1` & `crypto_batch_sweep.ps1`: Live hardware CLI demo and 50-challenge sweep.
- **[`reports/`](reports/)**  
  Academic documentation:
  - [`CBDC_PUF_REPLICATION_REPORT.md`](reports/CBDC_PUF_REPLICATION_REPORT.md): Comprehensive replication report with detailed comparison tables against the paper.
  - [`figures/`](reports/figures/): Publication-quality figures comparing ML attack resistance, NIST pass rates, and core noise.
- **[`docs/`](docs/)**  
  Course specifications, design review records, architecture guides, and reference paper.
- **[`runtime/python/`](runtime/python/)**  
  Bundled standalone Python 3.12 embedded runtime (zero external pip packages required).
- **[`history/`](history/)**  
  Preserved historical snapshots from early 1-core and 8-core exploratory milestones.

---

## ⚡ Execution Commands

Run all scripts directly using the bundled Python binary:

```powershell
# Verify BCH codec and SHAKE-256
.\runtime\python\python.exe scripts\crypto_engine.py

# Run Table 3 & Figure 9 ML modeling attacks (SVM, RBFNN, GRNN)
.\runtime\python\python.exe scripts\crypto_ml_attack.py --mode both

# Run Table 2 NIST SP 800-22 statistical suite (9 tests on silicon bitstream)
.\runtime\python\python.exe scripts\crypto_nist_test.py

# Run Figures 5, 6, 7 unstable bit map & stability analysis
.\runtime\python\python.exe scripts\crypto_unstable_bits.py

# Generate presentation figures
.\runtime\python\python.exe scripts\generate_presentation_plots.py
```
