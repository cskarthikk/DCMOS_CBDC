# CBDC-PUF: Configurable Butterfly Delay Chain Physical Unclonable Function

An authentic, fully verified silicon implementation and academic replication of the **CBDC-PUF** on the **Digilent Basys 3** FPGA (`xc7a35tcpg236-1`, AMD/Xilinx Artix-7) using **Vivado 2025.2**.

Based on the research paper:
> **Yanjiang Liu, Junwei Li, Tongzhou Qu, Zibin Dai**,  
> *"CBDC-PUF: A Novel Physical Unclonable Function Design Framework Utilizing Configurable Butterfly Delay Chain Against Modeling Attack,"*  
> **ACM Transactions on Design Automation of Electronic Systems (TODAES)**, Vol. 28, No. 5, Article 78, September 2023.  
> DOI: [10.1145/3588435](https://doi.org/10.1145/3588435). Reference PDF: [`ResearchPaper.pdf`](ResearchPaper.pdf).

---

## 📌 Project Architecture & Navigation

The primary active workspace is located in **[`CBDC_PUF_MAIN`](CBDC_PUF_MAIN/)**:

```
.
├── CBDC_PUF_MAIN/
│   ├── array64_candidate_2026-11-08/   # Active 64-core bitstream, layout & placement constraints
│   ├── array64_clock_profile_2026-11-09/ # Calibrated operating profile & physical silicon datasets
│   ├── docs/                           # Paper specs, architectural guides & technical audits
│   ├── reports/                        # Comprehensive replication report & publication plots
│   │   ├── CBDC_PUF_REPLICATION_REPORT.md # Full academic report with replication tables
│   │   └── figures/                    # High-res charts (ML attack, NIST, core stability)
│   ├── rtl/                            # Verilog HDL core modules & UART serial engines
│   ├── runtime/python/                 # Bundled self-contained Python 3.12 runtime environment
│   └── scripts/                        # Verification, ML attacks, NIST tests, and demo CLI
├── CBDC_PUF_PROJECT_SPEC.md            # Course project specifications & academic guidelines
├── ResearchPaper.pdf                   # Liu et al. reference paper
└── README.md                           # Main repository overview (this document)
```

---

## 🔬 Key Results & Replication Highlights

| Evaluation Dimension | Paper Baseline (Liu et al. 2023) | Our Basys 3 Hardware Result | Verification Status |
|---|---|---|---|
| **Array Architecture** | 16 stages/core, CDE cross-coupled | 64 parallel cores (1,024 CDEs) | Verified on Silicon (`xc7a35t`) |
| **Bit Uniformity** | 50.00% (Ideal) | **49.56%** (Batch) / **48.64%** (Profile) | Near-ideal physical balance |
| **Raw Silicon BER** | ~1.5% – 2.0% | **1.875%** (Live) / **1.453%** (64k bits) | Matches physical silicon noise |
| **Mean Silicon Stability** | 99.4% (Fig 5) | **98.55%** (64,000 physical bits) | Section 4.2 replicated |
| **Post-BCH WER** | 0.00% (Reliable Key Agreement) | **0.0000% (100.0000% Key Agreement)** | 1,000/1,000 blocks recovered |
| **Unprotected ML Attack** | 98.4% SVM / 97.2% RBFNN | **97.6% SVM / 97.8% RBFNN** | Section 4.3.1 replicated |
| **Protected ML Attack (SHA-3)** | ~50.0% (Random Guess) | **50.8% SVM / 50.4% RBFNN / 47.7% GRNN** | Table 3 & Fig 9 replicated |
| **NIST SP 800-22 Suite** | 9/9 Tests Pass ($P > 0.01$) | **9/9 Tests Pass (Pass Rate 96.1%–100.0%)** | Table 2 replicated |

---

## 🚀 Quick Start Guide

All commands run self-contained out-of-the-box using the bundled Python 3.12 runtime (zero pip dependencies required).

### 1. Test Cryptographic Engine & BCH Codec
```powershell
cd CBDC_PUF_MAIN
.\runtime\python\python.exe scripts\crypto_engine.py
```

### 2. Run Machine Learning Modeling Attack Suite (Table 3 & Figure 9)
Evaluates Support Vector Machine (SVM), Radial Basis Function Neural Network (RBFNN), and General Regression Neural Network (GRNN) on both protected (SHA-3) and unprotected challenge-response pairs across 100 to 5,000 samples:
```powershell
.\runtime\python\python.exe scripts\crypto_ml_attack.py --mode both
```

### 3. Run NIST SP 800-22 Randomness Tests (Table 2)
Evaluates 128 independent physical bitstreams (16,384 silicon bits) across all 9 statistical tests:
```powershell
.\runtime\python\python.exe scripts\crypto_nist_test.py
```

### 4. Run Unstable Bit Mapping & Core Noise Analysis (Figures 5, 6, 7)
Analyzes bit flip concentration across repeated trials:
```powershell
.\runtime\python\python.exe scripts\crypto_unstable_bits.py
```

### 5. Generate Presentation Visuals & Publication Charts
Generates high-resolution PNG plots in `CBDC_PUF_MAIN/reports/figures/`:
```powershell
.\runtime\python\python.exe scripts\generate_presentation_plots.py
```

### 6. Live Hardware Demo (Basys 3 on COM5)
If connected to a physical Basys 3 board loaded with the 64-core bitstream (`array64_candidate_2026-11-08/build/paper_array64.bit`):
```powershell
powershell -ExecutionPolicy Bypass -File scripts\crypto_demo.ps1 -Port COM5
```

---

## 📊 Documentation & Reports

- **Detailed Academic Replication Report:** [`CBDC_PUF_MAIN/reports/CBDC_PUF_REPLICATION_REPORT.md`](CBDC_PUF_MAIN/reports/CBDC_PUF_REPLICATION_REPORT.md)
- **Publication Figures:**
  - [ML Attack Resistance (Table 3 & Fig 9)](CBDC_PUF_MAIN/reports/figures/Fig_Table3_ML_Attack_Comparison.png)
  - [NIST Randomness Suite Pass Rates (Table 2)](CBDC_PUF_MAIN/reports/figures/Fig_Table2_NIST_Pass_Rates.png)
  - [Silicon Core Stability & Noise Concentration (Fig 5, 6, 7)](CBDC_PUF_MAIN/reports/figures/Fig_Core_Stability_Noise.png)
- **Operating Profile & Silicon Measurements:** [`CBDC_PUF_MAIN/array64_clock_profile_2026-11-09/REPORT.md`](CBDC_PUF_MAIN/array64_clock_profile_2026-11-09/REPORT.md)
