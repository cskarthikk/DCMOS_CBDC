# CBDC-PUF: Configurable Butterfly Delay Chain Physical Unclonable Function

An authentic, reproducible FPGA implementation of the **CBDC-PUF** on the **Digilent Basys 3** (`xc7a35tcpg236-1`) using **Vivado 2025.2**.

Based on the research paper:
> **Yanjiang Liu, Junwei Li, Tongzhou Qu, Zibin Dai**, *"CBDC-PUF: A Novel Physical Unclonable Function Design Framework Utilizing Configurable Butterfly Delay Chain Against Modeling Attack,"* ACM Transactions on Design Automation of Electronic Systems (TODAES), Vol. 28, No. 5, Article 78, September 2023. DOI: [10.1145/3588435](https://doi.org/10.1145/3588435). Reference PDF: [`ResearchPaper.pdf`](ResearchPaper.pdf).

---

## 📌 Project Navigation & Primary Entry Points

| Resource | Description |
|---|---|
| **[`CBDC_PUF_MAIN/START_HERE.md`](CBDC_PUF_MAIN/START_HERE.md)** | **🔥 ACTIVE ENTRY POINT.** The consolidated 8-core CBDC-PUF implementation, tested bitstream, frozen enrollment, and validation workflow. |
| **[`CBDC_PUF_PROJECT_SPEC.md`](CBDC_PUF_PROJECT_SPEC.md)** | Complete project requirements, course specifications (Digital CMOS), academic guidelines, and non-negotiable engineering rules. |
| **[`BEST_SAVED_VERSION.md`](BEST_SAVED_VERSION.md)** | Empirical hardware performance comparison across all measured checkpoints and physical placement iterations. |
| **[`CBDC_PUF_MAIN/EVALUATION_256_2026-11-07.md`](CBDC_PUF_MAIN/EVALUATION_256_2026-11-07.md)** | Hardware evaluation across 40,960 raw queries (256 vectors $\times$ 20 repeats $\times$ 8 cores) achieving **41.25% ones**. |
| **[`CBDC_PUF_MAIN/DIAGNOSTIC_RESULTS_2026-11-07.md`](CBDC_PUF_MAIN/DIAGNOSTIC_RESULTS_2026-11-07.md)** | Operating condition diagnostics (Parallel vs. Sequential, 8-cycle vs. 1-cycle excitation wait). |
| **[`CBDC_PUF_MAIN/history/paper_alignment_audit_2026-11-07/FINDINGS.md`](CBDC_PUF_MAIN/history/paper_alignment_audit_2026-11-07/FINDINGS.md)** | Technical audit detailing exact adherence to Figure 1 of the paper and resolution of legacy pilot discrepancies. |

---

## 🚀 Quick Start (Working Directory: `CBDC_PUF_MAIN`)

All active scripts, constraints, RTL, bitstreams, and Python validation tools reside inside `CBDC_PUF_MAIN`:

```powershell
# Navigate to the active working folder
cd CBDC_PUF_MAIN

# Check package status and hardware enrollment
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Status

# Run software regression and digital simulation tests (no board required)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Test
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Simulate

# When hardware is connected (e.g. COM5) with bitstream loaded:
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action CollectValidation -Port COM5 -BitstreamLoaded
```

---

## 🔬 Target Hardware & Architectural Scope

- **Target FPGA:** Digilent Basys 3 featuring AMD/Xilinx Artix-7 `xc7a35tcpg236-1` (5,200 slices).
- **Core Architecture:** 16-stage cross-coupled butterfly delay chains strictly matching **Figure 1** of Liu et al.
  - Dedicated AND entrance gates gated by `Excite`.
  - Negative-edge D-type flip-flop (`FDCE_1`) with $D = Q_u$, $C = Q_b$, and clock enable $CE = Latch$.
  - Symmetrical manual placement and matched internal routing across all 8 parallel cores.
- **Reference Paper Fidelity:**
  - In the paper, a 128-core array requires 4,568 slices (~88% of the entire Basys 3 FPGA).
  - The project maintains an 8-core parallel macro array as a verified intermediate hardware milestone, with raw silicon data and frozen enrollment.
  - BCH(31, 16, 3) error correction and SHA-3 challenge preprocessing are designed to post-process raw enrolled PUF responses.
