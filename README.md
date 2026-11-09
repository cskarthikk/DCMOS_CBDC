# CBDC-PUF: Configurable Butterfly Delay Chain Physical Unclonable Function

An authentic, fully verified silicon implementation and academic replication of the **CBDC-PUF** on the **Digilent Basys 3** FPGA (`xc7a35tcpg236-1`, AMD/Xilinx Artix-7) using **Vivado 2025.2**.

Based on the research paper:
> **Yanjiang Liu, Junwei Li, Tongzhou Qu, Zibin Dai**,  
> *"CBDC-PUF: A Novel Physical Unclonable Function Design Framework Utilizing Configurable Butterfly Delay Chain Against Modeling Attack,"*  
> **ACM Transactions on Design Automation of Electronic Systems (TODAES)**, Vol. 28, No. 5, Article 78, September 2023.  
> DOI: [10.1145/3588435](https://doi.org/10.1145/3588435). Reference PDF: [`ResearchPaper.pdf`](ResearchPaper.pdf).

---

## 📌 Project Architecture & Navigation

The repository is organized into a clean, flat top-level structure:

```
.
├── bitstream/                          # Synthesized & placed 64-core FPGA bitstream (Basys 3)
│   ├── paper_array64.bit               # Hardware bitstream for Artix-7 xc7a35t
│   ├── BUILD_RECORD.json               # Silicon build provenance and timing records
│   ├── PROFILE.json                    # Operating profile definition (Excite=22, Latch=8)
│   └── HOST_CHECK.json                 # Host communication self-test validation
├── build/                              # Vivado checkpoints, reports, netlists & delay data
│   ├── synthesized.dcp                 # Synthesized design checkpoint
│   ├── placed.dcp                      # Placed design checkpoint
│   ├── routed.dcp                      # Routed design checkpoint
│   ├── routed_refined.dcp              # Locked & matched route checkpoint
│   ├── implemented.v                   # Implemented structural Verilog netlist
│   ├── net_delays.csv                  # Extracted per-arc routing delays
│   ├── paired_arcs.csv                 # Symmetric butterfly delay pairs
│   ├── timing.rpt                      # Timing summary report
│   ├── utilization.rpt                 # Hierarchical resource utilization report
│   ├── drc.rpt                         # Design rule check report
│   └── methodology.rpt                 # Methodology check report
├── constraints/                        # Physical constraints and pin mapping
│   └── basys3_serial.xdc               # Placement LOCs, clocking, and UART pin assignments
├── docs/                               # Course project specifications & research paper
│   ├── CBDC_PUF_PROJECT_SPEC.md        # Course project specifications & academic guidelines
│   └── ResearchPaper.pdf               # Liu et al. reference paper
├── layout/                             # 64-core physical placement and routing floorplans
│   ├── layout.json                     # Core site locations & BEL assignments
│   ├── layout.tcl                      # Vivado placement constraint script
│   ├── sites.csv                       # SLICE sites for all 64 cores
│   ├── placement.csv                   # Cell-to-BEL placement table
│   └── internal_route_template.tcl     # Manual route lock template
├── measurements/                       # Authentic physical silicon datasets from Basys 3
│   ├── validation_1.csv                # 327,680-bit silicon measurement capture
│   ├── validation_2.csv                # Independent repeat capture
│   ├── validation_matrix.json          # 256-vector physical challenge matrix
│   ├── validation_per_core.csv         # Per-core silicon uniformity & bias summary
│   ├── VALIDATION_RESULTS.json         # Summary of 327,680-bit silicon validation
│   ├── calibration/                    # Clock excitation sweep captures (wait=20, 22, 24)
│   ├── ml_attack_results.json          # Machine learning attack results across models
│   └── nist_test_results.json          # NIST SP 800-22 test scores across 9 tests
├── reports/                            # Comprehensive academic reports & publication plots
│   ├── CBDC_PUF_REPLICATION_REPORT.md  # Detailed paper replication report & comparison tables
│   ├── HARDWARE_CHECKS_2026-11-09.md   # Hardware assessment, power, timing & latency report
│   ├── IMPLEMENTATION_REVIEW.md        # Implementation fidelity & architecture audit
│   ├── REPORT_CLOCK_PROFILE.md         # Clock profile analysis (20 vs 22 vs 24 cycles)
│   └── figures/                        # High-resolution charts (ML attack, NIST, core stability)
├── rtl/                                # Synthesizable Verilog HDL modules
│   ├── cbdc_array64_serial.v           # 64-core top-level serial interface
│   ├── cbdc_puf_core.v                 # 16-stage butterfly delay chain PUF core
│   ├── cbdc_puf_chain.v                # Configurable delay elements & cross-coupled latch
│   ├── cbdc_puf_element.v              # Single configurable delay element (CDE)
│   ├── cbdc_puf_ctrl.v                 # Excitation & latch timing state machine
│   ├── cbdc_uart.v                     # 115200 baud UART transmitter/receiver
│   ├── cbdc_button.v                   # Debounced reset button handler
│   └── cbdc_serial_engine.v            # Command interpreter & response packager
├── runtime/python/                     # Bundled self-contained Python 3.12 environment
├── scripts/                            # Verification, ML attacks, NIST tests, and demo CLI
│   ├── collect.ps1                     # Authentic 64-core physical data collector
│   ├── analyze.py                      # 64-core multi-metric silicon analyzer
│   ├── rebuild.ps1                     # End-to-end Vivado synthesis, placement, route & bitstream
│   ├── measure_uart_latency.ps1        # Real-time hardware UART latency benchmark
│   ├── audit_silicon_entropy.py        # NIST SP 800-90B Most Common Value min-entropy assessor
│   ├── audit_uniqueness_filtering.py   # Spatial inter-core uniqueness & 50k filtering analysis
│   ├── audit_helper_leakage.py         # Helper data leakage auditor (kernel dimension proof)
│   ├── crypto_engine.py                # Multi-block BCH(31,16,3) + Dodis Code-Offset + SHAKE-256
│   ├── crypto_ml_attack.py             # ML attack suite: Hardware, End-to-End, and Eq. 4 model
│   ├── crypto_nist_test.py             # Table 2: NIST SP 800-22 9-test statistical suite
│   ├── crypto_unstable_bits.py         # Fig 5, 6, 7: Unstable bit map & noise analyzer
│   ├── crypto_demo.ps1                 # Live hardware end-to-end enrollment demo
│   ├── crypto_batch_sweep.ps1          # Live 50-challenge batch evaluation
│   ├── crypto_batch_analysis.py        # Statistical analyzer for batch captures & validation CSVs
│   ├── generate_presentation_plots.py  # Presentation figure generator
│   ├── program_board.ps1               # Automated Vivado bitstream programmer
│   ├── program.tcl                     # Vivado hardware programming script
│   ├── build/                          # Vivado synthesis, implementation & routing scripts
│   └── calibration/                    # Excitation clock profile calibration scripts
├── sim/                                # Verilog simulation testbenches & primitives
│   ├── tb_array64.v                    # 64-core top-level serial testbench
│   ├── tb_chain_truth.v                # Delay chain truth verification testbench
│   └── sim_unisim_primitives.v         # Artix-7 UNISIM simulation models (LUT, FDRE, LDCE)
├── run.ps1                             # Master execution & verification entry point
├── BUILD_RECORD.json                   # Silicon build provenance & checksum manifest
├── PROFILE.json                        # Selected operating profile (wait22, latch8)
├── CBDC_PUF_PROJECT_SPEC.md            # Course project specifications & guidelines
├── ResearchPaper.pdf                   # Liu et al. reference paper
└── README.md                           # Main repository overview (this document)
```

---

## 🔬 Key Results & Replication Highlights

| Evaluation Dimension | Paper Baseline (Liu et al. 2023) | Our Basys 3 Hardware Result | Verification Status |
|---|---|---|---|
| **Array Architecture** | 16 stages/core, CDE cross-coupled | 64 parallel cores (1,024 CDEs) | Scaled to XC7A35T |
| **Core LUT Utilization** | 32 LUTs/core (delay line) | 32 LUTs (delay) / ~147 LUTs (engine)| 11,008 LUTs total chip (52.9%)|
| **Bit Uniformity** | 50.00% (Ideal) | **49.56%** (Batch) / **48.83%** (Unfiltered) | Near-ideal physical balance |
| **Cross-Core Distance (HD)**| 49.80% (Inter-device) | **50.23%** (Across 2,016 core pairs) | Independent challenges |
| **Silicon Min-Entropy** | 1.000 bit/core (Assumed ideal) | **0.423 bits/core** (NIST 99% CI) | Measured physical lower bound |
| **Total On-Chip Power** | 0.516 W (Estimated on XC7A200T) | **0.116 W** (Vivado Vectorless Est.)| 0.044W dyn, 0.072W static |
| **Controller Core Latency** | Not isolated | **440 ns (44 cycles @ 100 MHz)** | 220ns excite + 80ns latch |
| **Raw Silicon BER** | ~1.5% – 2.0% | **1.11%** (Voted) / **2.28%** (Single-shot)| Matches physical silicon noise |
| **Mean Silicon Stability** | 99.4% (Fig 5) | **98.55%** (64,000 physical bits) | Section 4.2 replicated |
| **Post-BCH WER** | 0.00% (Reliable Key Agreement) | **0.0000% (100.0000% Key Agreement)** | 256/256 64-bit patterns (Voted) |
| **Dodis Code-Offset Recovery**| Not implemented in Paper | **100.0000% (Voted) / 98.44% (Raw)** | Eliminates helper data leakage |
| **Unprotected ML Attack** | 98.4% SVM / 97.2% RBFNN | **96.7% SVM / 97.9% RBFNN** | Section 4.3.1 ablation proved |
| **Protected ML Attack (SHA-3)**| ~50.0% (Random Guess) | **50.2% SVM / 51.9% RBFNN / 46.8% GRNN**| Table 3 & Fig 9 replicated |
| **NIST SP 800-22 Suite** | 9/9 Tests Pass (With 77.6% filter)| **9/9 Tests Pass (100% Unfiltered Silicon)**| Table 2 replicated (FFT: 98.4%) |

---

## 🚀 Quick Start & Verification Guide

All commands run self-contained out-of-the-box using the bundled Python 3.12 runtime and standard PowerShell scripts (zero pip dependencies or external tools required).

### 1. Verify 64-Core Hardware Design & Timing Profile
Verifies bitstream presence, SHA-256 checksums, and timing profile parameters (Excite=22, Latch=8 cycles):
```powershell
powershell -ExecutionPolicy Bypass -File .\run.ps1 -Action Verify
```

### 2. Verify 64-Core Hardware Collector
Tests the serial communication protocol and challenge vector generation against the 64-core bitstream without opening the physical COM port:
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\collect.ps1 -Port COM5 -VerifyOnly
```

### 3. Analyze Authentic 64-Core Silicon Measurements
Analyzes 327,680 real physical bits across all 64 parallel cores from the Basys 3 capture:
```powershell
.\runtime\python\python.exe .\scripts\analyze.py measurements\validation_1.csv
```

### 4. Test Cryptographic Engine & Code-Offset Fuzzy Extractor
Validates both the **Cryptographically Secure Dodis Code-Offset Fuzzy Extractor** (256-bit entropy) and the legacy BCH(31,16,3) channel ECC codec across 1,000 randomized test vectors:
```powershell
.\runtime\python\python.exe scripts\crypto_engine.py
```

### 5. Audit Helper Data Information Leakage (Vulnerability Demonstration)
Empirically proves that naive 15-bit parity helper data collapses the 64-bit search space to only 16 candidate keys, demonstrating why the Dodis Code-Offset construction is required for cryptographic security:
```powershell
.\runtime\python\python.exe scripts\audit_helper_leakage.py
```

### 6. Audit NIST SP 800-90B Silicon Min-Entropy & Secrecy Retention
Computes the empirical Most Common Value (MCV) min-entropy across all 64 physical cores from `validation_1.csv` and derives exact challenge accumulation requirements under Dodis helper data leakage:
```powershell
.\runtime\python\python.exe scripts\audit_silicon_entropy.py
```

### 7. Audit Spatial Inter-Core Uniqueness & Candidate-Filtering
Evaluates spatial Hamming Distance across all 2,016 physical core pairs (50.23% mean HD) and contrasts our 100% unfiltered natural silicon (passing 9/9 NIST tests) with the paper's 77.6% pre-selection filtering:
```powershell
.\runtime\python\python.exe scripts\audit_uniqueness_filtering.py
```

### 8. Full 64-Core Hardware Validation Sweep (Legacy vs Dodis Code-Offset)
Evaluates 16,384 physical bits across independent captures (`validation_1.csv` vs `validation_2.csv`), verifying 100.0000% key agreement (0.0000% WER) with 20-trial voting:
```powershell
.\runtime\python\python.exe scripts\crypto_batch_analysis.py
```

### 9. Run Machine Learning Modeling Attack Suite (Table 3 & Figure 9)
Evaluates Support Vector Machine (SVM), Radial Basis Function Neural Network (RBFNN), and General Regression Neural Network (GRNN). Supports four operational modes:

- **End-to-End External Challenge Attack (SHA-3 Protected Workflow):**
  ```powershell
  .\runtime\python\python.exe scripts\crypto_ml_attack.py --source end-to-end
  ```
- **Real FPGA Silicon Attack (16,384 Authentic CRPs across 64 cores):**
  ```powershell
  .\runtime\python\python.exe scripts\crypto_ml_attack.py --source hardware
  ```
- **Theoretical Delay Simulation (Replicating Paper Table 3 across N = 100 to 5,000):**
  ```powershell
  .\runtime\python\python.exe scripts\crypto_ml_attack.py --source simulation --mode both
  ```
- **All Evaluations Combined:**
  ```powershell
  .\runtime\python\python.exe scripts\crypto_ml_attack.py --source all
  ```

### 10. Run NIST SP 800-22 Randomness Tests (Table 2)
Evaluates 128 independent physical bitstreams (16,384 silicon bits) across all 9 statistical tests:
```powershell
.\runtime\python\python.exe scripts\crypto_nist_test.py
```

### 11. Run Unstable Bit Mapping & Core Noise Analysis (Figures 5, 6, 7)
Analyzes bit flip concentration across repeated physical trials:
```powershell
.\runtime\python\python.exe scripts\crypto_unstable_bits.py
```

### 12. Full Hardware Rebuild & Implementation Pipeline
Rebuilds the complete 64-core FPGA design through Vivado synthesis, placement, routing, route refinement, DRC, and bitstream generation:
```powershell
powershell -ExecutionPolicy Bypass -File scripts\rebuild.ps1
```

### 13. Generate Presentation Visuals & Publication Charts
Generates high-resolution PNG plots in `reports/figures/`:
```powershell
.\runtime\python\python.exe scripts\generate_presentation_plots.py
```

### 14. Live Hardware Demo (Basys 3 on COM5)
If connected to a physical Basys 3 board loaded with the 64-core bitstream (`bitstream/paper_array64.bit`):
```powershell
# Optional: Program board via Vivado
powershell -ExecutionPolicy Bypass -File scripts\program_board.ps1

# Run live enrollment & reconstruction demo (Cryptographically Secure Dodis Code-Offset, 256-bit key)
powershell -ExecutionPolicy Bypass -File scripts\crypto_demo.ps1 -Port COM5 -Mode secure -KeyBits 256

# Optional: Run live enrollment in legacy Paper Channel ECC benchmark mode
powershell -ExecutionPolicy Bypass -File scripts\crypto_demo.ps1 -Port COM5 -Mode legacy
```

---

## 📊 Documentation & Reports

- **Detailed Academic Replication Report:** [`reports/CBDC_PUF_REPLICATION_REPORT.md`](reports/CBDC_PUF_REPLICATION_REPORT.md)
- **Publication Figures:**
  - [ML Attack Resistance (Table 3 & Fig 9)](reports/figures/Fig_Table3_ML_Attack_Comparison.png)
  - [NIST Randomness Suite Pass Rates (Table 2)](reports/figures/Fig_Table2_NIST_Pass_Rates.png)
  - [Silicon Core Stability & Noise Concentration (Fig 5, 6, 7)](reports/figures/Fig_Core_Stability_Noise.png)
