# CBDC-PUF Project: AI Handoff & Continuity Report

> **Project:** Configurable Butterfly Delay Chain Physical Unclonable Function (CBDC-PUF)  
> **Course:** Digital CMOS (5th Semester B.Tech)  
> **Target Hardware:** Digilent Basys 3 (`xc7a35tcpg236-1`), Vivado 2025.2  
> **Reference Paper:** Yanjiang Liu et al., *"CBDC-PUF: A Novel Physical Unclonable Function Design Framework Utilizing Configurable Butterfly Delay Chain Against Modeling Attack,"* ACM TODAES, Sept 2023.  
> **Repository:** `https://github.com/cskarthikk/DCMOS_CBDC` on branch `Version-2`  
> **Date of Report:** November 6, 2026  

---

## 1. System Setup & Operating Environment

- **Remote Hardware Architecture:**
  - Hardware is physically connected to collaborator Surya Karthik's laptop on serial port **`COM5`** (115,200 baud, 8N1).
  - Controlled remotely via **OpenSSH over Tailscale** (`friendssh@100.99.101.4`).
  - Active Remote Working Directory: `C:\BTech\Semester_5\DCMOS\Project`.
  - Local Workspace: `C:\Users\Hemant Jagnani\OneDrive\Desktop\College\5th Semester\DCMOS\DCMOSProject`.
- **Git Discipline Rules:**
  - **NEVER PUSH TO `main` AUTONOMOUSLY.** All work must strictly stay on branch `Version-2`.
  - Non-interactive SSH sessions fail on GUI `wincredman` credential helpers; avoid unnecessary HTTPS pushes from the remote machine. Code edits can be made locally, committed to `Version-2`, and pulled on the remote machine.
- **Hardware Programming:**
  - The Basys 3 uses an internal Power-On Reset (`por`) in `cbdc_puf_serial.v`. Physical board button presses are **not required**.
  - Program remotely using batch Vivado via `scripts/program.tcl`.

---

## 2. Current Status of the Codebase & Hardware

| Parameter | State | Description |
|---|---|---|
| **Git Commit** | `ca05b0e` (matching `a6a2fe5`) | Clean working tree (`git status` clean). |
| **RTL Code** | **100% Untouched & Clean** | Identical to baseline in `rtl/`. Zero artificial hacks. |
| **Core Architecture** | **1 Isolated PUF Core** | 16 stages per chain. Strictly 1 core (No 128-core array). |
| **Arbiter Architecture** | **Strictly 1 Arbiter** | Single `FDCE_1` at `SLICE_X23Y116 BFF` (100% faithful to Figure 1). |
| **Cryptographic Blocks** | **Omitted** | No SHA-3 hash, No BCH error correction (isolated to silicon). |
| **Active Bitstream** | `build_m1/pulled_single/cbdc_pulled_single.bit` | Currently running on the Basys 3 FPGA on COM5. |

---

## 3. Hardware Measurement Results (The Ground Truth)

### A. Multi-Day Temporal Stability (Nov 4 vs Nov 6)
Testing identical 256 challenges $\times$ 20 repeats = 5,120 queries across days and cold power reboots:

| Run / File | Date | Total Queries | Ones Count | Ones % | Edge Misses | Consensus BER |
|---|---|---|---|---|---|---|
| `run_ab2cc0e61c854380a2e9dec91f7b500f.csv` | Nov 4 | 5,120 | 1,475 | **28.81%** | 0 | Baseline |
| `run2_verify.csv` | Nov 6 | 5,120 | 1,473 | **28.77%** | 0 | **0.00% (0 / 256 flips)** |
| `run_restored_baseline.csv` | Nov 6 | 5,120 | 1,450 | **28.32%** | 0 | **0.00% (0 / 256 flips)** |

- **Reliability:** **100.0% consensus bit repeatability across days**. The 28.3% – 28.8% ones ratio is an authentic, fixed silicon physical signature of this die, not random thermal noise.
- **Liveness:** **0 missed edge flags across >15,360 hardware queries** (100% active oscillation on both chains).

### B. Empirical Placement Delay Curve (Arbiter Physical Column Sweep)
By shifting the physical column of the arbiter between the Upper Chain ($X=21$) and Lower Chain ($X=25$):

| Arbiter Site | Upper Net Distance | Lower Net Distance | Ones Ratio | Physical Mechanism |
|---|---|---|---|---|
| **`SLICE_X22Y116` (Left)** | 1 column | 3 columns | **1.4% ones** | Upper net wire too short; Upper chain arrives first 98.6% of trials. |
| **`SLICE_X23Y116` (Center)** | 2 columns | 2 columns | **28.3% – 28.8%** | **The Optimal Physical Sweet Spot on this die.** |
| **`SLICE_X24Y116` (Right)** | 3 columns | 1 column | **22.8% ones** | Switch-matrix internal track pairing adds asymmetry; pulls balance back down. |

### C. Dynamic Parity Symmetry (`AUTO_PARITY=1`)
- **Odd Parity Challenges:** **29.4% ones**
- **Even Parity Challenges:** **29.2% ones**
- Difference is < 0.2%, proving the dynamic entrance gate (`8'h87`) provides 100% challenge space coverage without introducing structural bias.

---

## 4. Key Lessons Learned & Dead Ends to Avoid

1. **Do NOT Attempt Indiscriminate `FIXED_ROUTE` Across All Nets:**
   - In `build_matched_single.tcl`, locking all 48 stage nets simultaneously after an `unroute_design` locked switch-matrix nodes needed by the UART and controller registers (`timeout_reg[30]` and `q_sync2_r_reg`).
   - This caused Vivado `Route 35-8` unrouted pin errors. Avoid unrouting the whole chip to lock routes.
2. **"Modeled Matched Routing" Worsened Physical Balance:**
   - As documented in `MENTOR_RESULTS.md`, forcing 0 ps modeled wire mismatch across internal stages caused balance to drop from 28% to **13.3%**.
   - Why: When internal variations were eliminated, the terminal wire mismatch into the arbiter flip-flop (Lower net ~72 ps faster) dominated completely.
3. **Do NOT Add a Second Arbiter:**
   - Adding Arbiter B (`q_comp_o`) allows complementary 50% averaging, but violates **Figure 1 of Liu et al. (ACM TODAES 2023)** which specifies strictly **ONE** arbiter.
   - The user explicitly requested 100% fidelity to the paper. All dual-arbiter modifications were reverted.

---

## 5. Critical Reference Paper Insights (ACM TODAES 2023)

When evaluating the PUF against the paper:
1. **Raw Silicon Randomness in the Paper (Page 8–9, Figure 3):**
   - The paper's own hardware PUF responses range from **27.3% to 61.7%**!
   - Our measured **28.3% – 28.8%** baseline is directly within the paper's raw silicon distribution.
2. **How the Paper Obtains 49.6% Randomness:**
   - **128-Core Macro Array:** The paper does NOT use 1 core; it uses 128 parallel cores across 4,568 slices.
   - **CRP Enrollment Filtering:** The authors tested 50,000 challenges and **filtered out the outliers**, keeping only the **11,202 candidate CRPs** that fell within 48.4% – 51.6% (Section 4.2).
   - **SHA-3 & BCH:** Cryptographic post-processing diffuses the raw bits into uniform 50% keys.

---

## 6. Command Cheatsheet for Continuing Work

### Remote Session Execution (on Surya's laptop via SSH):

```powershell
# 1. Run CRP Collection (256 challenges, 20 repeats = 5,120 queries)
$run = 'build_m1/measurements/pulled_single/run_' + [Guid]::NewGuid().ToString('N') + '.csv'
powershell.exe -ExecutionPolicy Bypass -File .\scripts\collect_pulled_single.ps1 -Port COM5 -Challenges 256 -Repeats 20 -Output $run

# 2. Analyze CRP Data
powershell.exe -ExecutionPolicy Bypass -File .\scripts\analyze_crps.ps1 -InputCsv $run

# 3. Rebuild Bitstream (if ever needed, ~2 mins)
& "C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat" -mode batch -notrace -nolog -nojournal -source scripts/build_pulled_single.tcl

# 4. Program FPGA Remotely
& "C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat" -mode batch -notrace -nolog -nojournal -source scripts/program.tcl
```

---

## 7. Immediate Next Recommended Steps

1. **Option A: CRP Candidate Enrollment Script (Paper Section 4.2):**
   - Write a PowerShell script that sweeps a larger pool of challenges (e.g. 1,000 or 2,000 challenges) and extracts the candidate subset that exhibits ~50% ones, exactly following the paper's candidate selection protocol.
2. **Option B: Course Submission Documentation:**
   - Compile the final course project report and presentation slides incorporating the placement curve data, multi-day temporal stability tables, and paper traceability comparisons.
