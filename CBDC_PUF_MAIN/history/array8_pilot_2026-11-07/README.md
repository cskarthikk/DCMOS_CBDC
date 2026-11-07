# Eight-core pilot derived from the preserved November 4 checkpoint

**Hardware status:** the broad 256-vector characterization failed the PUF-quality gate: six cores were constant and one was nearly constant. Do not scale this build to 128 cores. See [EVALUATION_256_2026-11-07.md](EVALUATION_256_2026-11-07.md). The implementation and smoke checks below describe limited checks, not successful replication of eight useful PUF cores.

Follow-up investigation: `../paper_alignment_audit_2026-11-07/FINDINGS.md` documents implemented configuration wiring, a controlled proof of the first-edge/Latch mismatch and the limited routed-delay model. The separate corrected Figure 1 interpretation is in `../paper_array8_candidate_2026-11-07`; this historical pilot and its data are retained unchanged.

This is the next hardware milestone towards a 128-core framework. It contains eight physical CBDC-PUF cores, eight independent 16-bit configurations and eight raw primary response bits per query. No response whitening, XOR combination, enrollment filtering, BCH or challenge hashing is implemented. The source single-core bitstream remains preserved; its 28.x% results must not be assigned to the array before measurement.

## Preserved architecture

Six utility/controller/core RTL files are byte-identical to the preserved checkpoint. The serial engine module is extracted unchanged from its original wrapper. Each of eight instances retains its own controller and diagnostics: AUTO_PARITY=1, CAPTURE_MODE=1, DUAL_ARBITER=1, DIAGNOSTIC=1, two 16-stage cross-coupled chains and the original buffer/inverter/mux implementation. Each core has four race-related FFs: primary arbiter, complementary arbiter, and two edge locks. Only the primary arbiter is returned. All eight controllers start together; response and diagnostic masks are recorded after each completes.

This deliberately extends the best observed implementation chosen by the user. It retains that implementation's differences from the paper's Figure 1 single-arbiter/Latch-controlled interpretation. It is not an exact reproduction of the paper. Replicating the module is not equivalent to possessing the authors' original hard macro.

## Physical implementation

The released build directory is `build_v2`. The first attempt stopped because a translated site was absent from this part and produced no bitstream. `sites.csv` inventories the actual device sites; `scripts/plan_layout.py` selected eight separated footprints matching the original footprint's site types and saved them in `layout.tcl`. The corrected placement/routing succeeded: 2182/2182 routable nets, zero routing errors, ordinary setup/hold slack +3.238/+0.119 ns. Routed utilization is 1456 LUTs and 798 FFs for the complete pilot, including controllers and serial transport. PUF-related DRC warnings remain (8 allowed loops, 16 gated-clock and 16 non-optimal hold-connection checks); these are not hidden by changing severities.

`build_v2/placement.csv` lists all eight placements. Core 0 keeps the previous chain/arbiter coordinates; other instances use the same relative chain spacing, LUT BELs, input-pin assignments, arbiter positions and edge-lock offsets in separate regions. Every intentional loop is acknowledged individually. The build checks four FFs per core before placement, exports actual routed net delays, verifies stage truth tables and falling-edge arbiters, reports routing and conventional timing, and writes a separate bitstream. It does not indiscriminately unroute the chip or suppress new DRC errors.

Placement symmetry does not establish routing symmetry. The original preserved snapshot did not include a routed DCP from which the exact known-good routes could be cloned. Therefore these are independently routed replicas with paired geometry, not identical routed copies of the original. `BUILD_RECORD.json` reports the actual per-core mismatch of 64 corresponding internal net arcs. Its creation requires complete legal routing, zero failing ordinary setup/hold endpoints, preserved source hashes, eight verified core structures and passing serial simulation. This does not certify analog race timing, silicon balance, reliability or security. Asynchronous-loop/clock warnings must be retained in the reports.

The eight concurrently excited circuits may behave differently from a single isolated core. Their hardware results, per-core balance and repeated response words must be evaluated before expanding. An eight-bit response word is not the paper's 128-bit response metric, and more cores do not guarantee 50% ones.

Release verification completed. Bitstream SHA256: `2C599CF6FE7EF8EAFE34C1546C1877B78C4E9999AE21A9E46DB646A2CFEAB533`. The independent checkpoint audit passed all 816 planned site/BEL placements and all 784 LUT pin locks. `BUILD_RECORD.json` contains the bitstream identity and source/evidence hashes; Windows PowerShell collector verification passed without opening COM5. No pilot hardware measurements have yet been taken by the assistant.

Remaining internal net mismatches (largest absolute difference among 64 paired arcs per core):

| Core | SLOW_MAX ps | FAST_MIN ps |
|---|---:|---:|
| 0 | 11 | 28 |
| 1 | 298 | 122 |
| 2 | 333 | 245 |
| 3 | 20 | 3 |
| 4 | 11 | 28 |
| 5 | 36 | 36 |
| 6 | 49 | 49 |
| 7 | 143 | 143 |

This is a legal pilot with documented asymmetry, not a perfectly matched final macro. A bounded targeted fixed-route experiment in `build_v3` failed because a copied route required an IMUX resource unavailable on the opposite switch-matrix orientation. It generated no replacement bitstream and is not the release. No whole-chip unroute was used. Keep the successful `build_v2`; characterize all eight cores before deciding whether further placement/routing changes are useful. The table covers internal net arcs, not LUT delays or complete feedback/arbiter/launch symmetry. Methodology also retains 32 TIMING-17 non-clocked-sequential-cell critical warnings for the asynchronous core registers.

## Wire protocol

Stop-and-wait, COM port at 115200 8N1. Request: A8, 16 bytes of configurations (core 0 low/high, through core 7 low/high), XOR of preceding 17 bytes. Reply: 58, echo of 16 bytes, status, primary response mask, Qb activity mask, Qu activity mask, XOR of preceding 21 bytes (22 bytes total). Core 0 is bit 0 of each mask. Status 41 means all eight completed; C0 indicates timeout or engine failure. Activity flags are diagnostic observations, not certified oscillation or uniqueness. Corrupt requests do not launch measurements; incomplete requests expire. There is no pipelining.

The serial simulation uses artificial primitive delays and forced readout masks to verify independent configurations, ordering, framing, checksum and recovery. It does not predict silicon outputs. Analyzer fixtures check tie handling, bit-to-word consistency and incomplete captures.

## First hardware test

Only use a build after `BUILD_RECORD.json` exists and the collector's verification passes. Program the following exact file in Vivado Hardware Manager (probes empty):

`C:\BTech\Semester_5\DCMOS\Project\array8_pilot_2026-11-07\build_v2\array8.bit`

After programming succeeds, run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\BTech\Semester_5\DCMOS\Project\array8_pilot_2026-11-07\scripts\collect.ps1" -Port COM5 -BitstreamLoaded -Patterns 4 -Repeats 3
```

Expected collection size: 12 frames, 96 individual core observations. No particular response word or ones count is promised. The initial four configurations are 0000, 0001, 8000 and FFFF, each applied to all eight cores to expose configuration/parity and bit-order problems. Later vectors use deterministic independent values per core. Metadata and the complete configuration matrix are saved with each CSV. `-VerifyOnly -Port COM5` verifies the build and generates the matrix without opening the port; it does not program the board. `-BitstreamLoaded` is operator confirmation, and a local file hash does not identify live firmware.

Inspect the smoke results and activity observations before a 256-vector x 20-repeat run (5120 frames, 40960 raw core observations). Use this collector only; the original single-core collector has a different protocol. `scripts/analyze.py` validates complete frames and configurations, reports per-core ones/mixed patterns/ties and the raw word Hamming-weight distribution, and saves `<capture>.analysis.json`. Mixed patterns must remain visible. Hold separate data for later enrollment validation.

## Reproduction

Run Vivado 2025.2 batch with `scripts/build.tcl` from an empty build output directory. Existing outputs are protected from overwriting. Run `scripts/record_build.py` with Python only after simulation and implementation have passed. The release record records source/evidence hashes and the precise bitstream identity. Rebuilding or relocating cores can change the PUF responses. Do not use a regenerated file as though it were the preserved measured checkpoint.

