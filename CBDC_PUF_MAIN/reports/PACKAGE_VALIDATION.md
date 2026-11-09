# Main package verification

- 1387 frozen files and the selected bitstream passed integrity verification.
- Active HDL, physical inputs and implementation evidence match the measured hardware release.
- Bundled Python standard library works without Codex runtime paths.
- Seven software tests passed: frozen selection, known injected disagreement counts, no overwrites, train/validation separation, profile/replay identity, tamper detection, incomplete/incorrect data rejection.
- Windows PowerShell frozen-matrix replay preflight passed without opening COM5.
- Top-level Status, Test and PrepareRebuild actions passed; Status also passed from outside the project working directory.
- Corrected UART/capture/readback simulation and exhaustive 65536-setting chain simulation passed using the packaged files. The Icarus tool required an unrestricted process in the Codex Windows environment; no FPGA is used by simulation.
- A fresh isolated hardware rebuild was staged; Vivado synthesis/routing were not rerun for this packaging-only task. The actual existing measured checkpoints/reports and source hashes are included.
- Neither Program nor serial collection was executed during packaging. Real independent hardware validation is PENDING; no simulated test result is represented as a hardware result.

Use START_HERE.md. The next operation is reprogramming the same measured bitstream, followed by CollectValidation. The enrollment mask is already frozen and will not be changed by validation.
