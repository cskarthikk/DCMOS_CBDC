# CBDC-PUF main project

This folder is the single working entry point for the **current eight-core project**. It includes the selected measured bitstream, FPGA sources and physical constraints, reproducible build scripts/checkpoints, raw measurements, analysis, frozen enrollment, independent validation tooling, simulations, the reference paper and labeled historical checkpoints. Earlier folders are preserved; use this folder for new work.

## What is already completed

- Hardware: eight Figure-1-oriented cores, one Latch-controlled response arbiter per core, fixed AND entrances and explicit odd-parity configuration support.
- Selected measured bitstream: `build_matched/paper_array8.bit`, SHA256 `6BE7B2C364E2FB0A59864DB1597934BBE5EAB6538B239375E33445109A5666C7`.
- Implemented evidence: 2322/2322 nets routed, zero routing errors, 768 fixed internal nets, 512 internal paired arc comparisons equal at both reported corners. Ordinary setup/hold slack +2.341/+0.064 ns. Boundary mismatches/asynchronous warnings remain documented.
- Broad raw measurement: 256 vectors x20 repeats x8 cores; 40960 bits, 41.25% ones. Per-core bias and mixed responses remain visible in `EVALUATION_256_2026-11-07.md`.
- Enrollment: already frozen from that measurement. **1854/2048 core/vector positions** agreed in all 20 enrollment readings; **194 excluded positions remain in the data and report**. This is a pre-validation selection rule, not certified stability. No response balancing was performed.

## Do this next

1. Check the package from PowerShell:

   ```powershell
   cd "C:\BTech\Semester_5\DCMOS\Project\CBDC_PUF_MAIN"
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Status
   ```

2. In Vivado Hardware Manager, reprogram the Basys 3 with **this exact file**, with probes empty:

   ```text
   C:\BTech\Semester_5\DCMOS\Project\CBDC_PUF_MAIN\build_matched\paper_array8.bit
   ```

   Wait for successful programming. This starts a separate confirmation session; the internal power-on reset initializes the design. No physical button press is required. A file hash verifies the local file and does not identify firmware actually loaded into the FPGA.

3. Collect and automatically evaluate the independent confirmation:

   ```powershell
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action CollectValidation -Port COM5 -BitstreamLoaded
   ```

   This replays the **exact frozen 256 configuration vectors** with Parallel/8 timing, collects 20 readings (40960 raw bits), checks actual configuration readback, and compares only the preselected positions with their frozen references. It does not alter the enrollment mask. All excluded positions are still collected and reported.

   New raw files go into `measurements/validation/`. The command prints the observed disagreement counts and the location of `validation/run_.../REPORT.md`. Send that output for review. Failed/incomplete captures are retained but cannot silently pass validation.

Do not rerun enrollment using that confirmation to improve its score. If the result is unsuitable, preserve it and investigate before making a new, separately identified enrollment experiment.

## One command entry point

`run.ps1` works from any working directory when invoked by its absolute path. Verification is run before each action.

| Action | Purpose |
|---|---|
| Status | Verify package and show hardware/enrollment/validation state |
| Verify | Check frozen files and bitstream identity; no board connection |
| CollectValidation | Exact replay and automatic independent validation report |
| Validate -InputCsv path | Evaluate a previously captured, enrollment-bound confirmation |
| Analyze -InputCsv path | Complete raw per-core analysis, no filtering |
| Smoke -Port COM5 -BitstreamLoaded | Four odd-parity vectors x3 readings |
| Collect -Port COM5 -BitstreamLoaded | General capture; defaults 256 vectors x20, Parallel/8 |
| Diagnostics -Port COM5 -BitstreamLoaded | The bounded three-condition diagnostic |
| Test | Software integrity/enrollment/validation regression tests; no board |
| Simulate | Digital capture/UART and exhaustive chain simulations; no board |
| Enroll -InputCsv path | A new separate enrollment experiment; never replaces the frozen baseline |
| Program | Explicit optional batch programming of the selected bitstream |
| PrepareRebuild | Stage a fresh, isolated hardware rebuild without running Vivado |
| Rebuild | Simulate and rebuild in that new isolated directory; never replace the measured release |

For collection, `-BitstreamLoaded` is your confirmation that you loaded the specified file, not a programming command. A different COM port can be supplied. No action connects to serial hardware unless it is a collection action; no programming occurs unless you choose Program or operate Vivado yourself.

The bundled Python standard library runs the analysis and tests. No pip installation, cloud access or Codex-specific runtime path is needed. FPGA programming/rebuilding still requires the installed Vivado 2025.2 and the board; simulations require Icarus (`C:\iverilog\bin` by default). Override `-VivadoPath` or `-IcarusBin` when needed. Runtime DLLs and the Python license are under `runtime/python/`.

## Folder map

| Folder/file | Contents |
|---|---|
| rtl/, constraints/, layout.tcl, internal_route_template.tcl | Active HDL and physical implementation inputs |
| build/, build_matched/ | Actual saved checkpoints, reports and selected bitstream; do not rebuild in place |
| scripts/ | Collection, analysis, enrollment/validation, build/programming and verification |
| sim/, tests/ | Digital testbenches, saved original simulation evidence and workflow tests |
| measurements/ | Preserved diagnostic/broad data; new captures go into new/ or validation/ |
| enrollment/baseline/ | Frozen model, selection mask/references, exact matrix and preserved enrollment input |
| validation/, reports/ | New confirmation results and generated reports; initially no real validation result |
| history/ | Original checkpoint ZIP/reference, older candidates and failed pilot, detailed audit and legacy measurements |
| docs/ | Reference paper and earlier project documents; historical instructions are not the current entry point |
| runtime/python/ | Local Windows analysis interpreter and standard library |
| BUILD_RECORD.json, HARDWARE_PROVENANCE.json | Original hardware-build provenance; host packaging tools were subsequently extended |
| PACKAGE_MANIFEST.json | Hashes of the consolidated frozen package, including adapted host tools and frozen enrollment |

Original measurement metadata can contain historical absolute file paths. They remain provenance records. The current workflow resolves all required files inside this folder and compares bitstream/configuration identities; it does not require those old paths.

## What happens after confirmation

Review per-core selected-bit disagreement, positions with any disagreement, word errors, selection yield and the raw excluded data. Good agreement in one run is limited evidence, not environmental/security certification. Preserve any failures. Only then decide whether to freeze the eight-core baseline and assess larger-array placement/resources. **128 cores, BCH, SHA3 challenge preprocessing and cryptographic key reconstruction are not implemented in this package yet.**

The paper's exact LUT mapping and full configuration coverage remain unresolved; this is the documented Figure 1 interpretation on a different FPGA, not a certified exact reproduction. See `history/paper_alignment_audit_2026-11-07/FINDINGS.md` for the detailed traceability, hypotheses and limitations. A functioning end-to-end measurement/enrollment/validation workflow does not by itself establish an eight-bit key's entropy or uniqueness.
