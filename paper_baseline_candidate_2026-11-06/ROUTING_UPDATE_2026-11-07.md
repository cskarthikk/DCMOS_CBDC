# Boundary routing update — 7 November 2026

Selected physical candidate: `build_boundary_v3/candidate.bit`. This is a routing refinement of the measured Figure 1 candidate, not a new logical architecture. Hardware improvement is **not yet established**. The verified release hash and implementation evidence are recorded in `BOUNDARY_BUILD_RECORD.json` when final checks pass.

Release completed: Vivado generated the bitstream successfully and all release-record checks passed. SHA256: `22721F79215EEAC8596E2CBC7E4EB6EF3D4F2C9169537E6B11E8B3FF98DFD718`. Final setup/hold slack is +3.437/+0.131 ns; 630/630 routable nets are fully routed, with zero routing errors. PowerShell 5.1 `collect_boundary.ps1 -Port COM5 -VerifyOnly` passed without opening the port. Offline execution of its challenge-selection block reproduced all 256 measured challenges in order. The board has not been programmed by the assistant.

## What changed

Targeted branch routing reduced the excitation and cross-feedback imbalance. The original 96 fixed internal nets, all primitive placements, and unrelated routes were preserved. The selected three boundary nets are also frozen in the final checkpoint (99 fixed routable nets). No whole-chip unroute, arbiter duplication, response inversion, output filtering, array, hash or BCH was used.

Absolute modeled net-delay differences, in picoseconds:

| Connection pair | Measured candidate SLOW_MAX | New SLOW_MAX | Measured candidate FAST_MIN | New FAST_MIN |
|---|---:|---:|---:|---:|
| Excitation into the two gates | 278 | 158 | 102 | 60 |
| Cross-feedback | 210 | 38 | 74 | 48 |
| Chain outputs into arbiter D/C | 67 | 65 | 51 | 49 |
| Each of 64 corresponding internal net arcs | 0 | 0 | 0 | 0 |

The arbiter change is negligible; do not present it as a substantial improvement. The feedback improvement is the main reason to test this candidate. These are Vivado estimates at two corners, not measurements of silicon delay, proof of LUT-arc equality, or a prediction of response balance. D and C are different flip-flop inputs, so equal wire delays would not establish equal overall sampling behavior either.

## Selection and verification

`build_boundary_v1` reduced feedback mismatch but slightly worsened arbiter SLOW_MAX mismatch. `build_boundary_v2` did not improve both feedback corners. Neither was released for hardware testing. A bounded six-budget D-branch refinement in v3 returned the same route for all six settings. The selected route improves all six reported boundary mismatch measures relative to the measured candidate, although the arbiter improvement is only 2 ps.

Vivado could not satisfy some requested minimum interconnect delays. Those warnings are retained in the experiment logs. Acceptance uses the actual exported delays and route legality, not the requested targets or merely a successful command return. No response bits were used to select routes.

`verify_core_structure.tcl` checks the implemented design: exactly one core FDCE, falling-edge clock, D=Qu, C=Qb, CE=Latch, controller clear, fixed AND entrance gates, cross-feedback, 16 paired buffer/inverter/selector stages, and matching primitive/BEL/input-pin assignments. `record_boundary.py` requires unchanged seven RTL hashes, 64 matched internal net arcs, improvements at both reported boundary corners, 630 fully routed nets, zero routing errors, 99 fixed nets, and zero failing ordinary setup/hold endpoints before creating the release record. Previous functional simulations remain applicable to the unchanged RTL; they do not simulate silicon PUF quality.

Final reports must be read with their limitations: the intentional loop, gated clock, non-optimal hold connection and two loadless helper nets retain DRC warnings; the asynchronous PUF clock retains a TIMING-17 critical warning. No warning severity was lowered to make this build pass. Conventional clock timing does not certify the asynchronous race.

## Paper alignment recheck

Figure 1's two cross-coupled chains, 16-bit shared configuration, one negative-edge arbiter and Latch-controlled capture remain in place. The controller initializes, excites with Latch low, enables capture, freezes the arbiter and waits before reading the synchronized result. The cycle counts are engineering choices, not published paper constants.

The paper's approximately equal differential routing is better approximated at the feedback and excitation boundaries. It is still not exact. The paper calls the entrance gate AND in Figure 1/prose and NAND2 in its implementation section. Its precise LUT mapping is unavailable: our explicit buffer/inverter/mux stage is logically consistent with the drawing but uses three LUTs rather than the reported two-LUT2 count per stage. Changing to an invented mapping solely to match resource counts would not resolve that ambiguity. The fixed-AND candidate accepts odd-parity challenges only; full paper challenge coverage remains unresolved. Basys 3 also uses a different FPGA from the paper.

The paper's 128-bit response-word metrics are not the same statistic as the ones percentage of this single core across challenges. A closer routing model cannot guarantee 50% raw ones, reliability, uniqueness or modeling resistance. This remains a documented Figure 1 interpretation, not a certified exact reproduction or final project baseline.

## Next hardware step

1. In Vivado Hardware Manager, program **this exact file**, with probes empty:

   `C:\BTech\Semester_5\DCMOS\Project\paper_baseline_candidate_2026-11-06\build_boundary_v3\candidate.bit`

2. Wait for programming success/DONE. From `C:\BTech\Semester_5\DCMOS\Project`, run:

   ```powershell
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\paper_baseline_candidate_2026-11-06\scripts\collect_boundary.ps1 -Port COM5 -BitstreamLoaded -Challenges 256 -Repeats 20
   ```

   This uses the same deterministic 256 odd-parity challenges, in the same order, as `run_5b97cf3273a1484c8f8a4e6621df6989.csv`. A new uniquely named `boundary_*.csv` and metadata identify this physical variant. `-BitstreamLoaded` is your confirmation, not a programming command. The hash checks the local file; it does not identify the firmware currently running on the FPGA. Activity is not instrumented and remains blank.

3. Compare against that saved candidate run, not the older mixed-parity design. Use `analyze_candidate.ps1 -InputCsv <new CSV> -ReferenceCsv <saved candidate CSV>` or send the collection output for analysis. Assess raw ones balance and within-run variation together. A changed response between different physical implementations is not temporal unreliability. Retain all challenges, including mixed responses and ties.

One collection is the next engineering comparison, not a claim of reliability. If the physical candidate is suitable, one independent reprogrammed repeat is the acceptance check before deciding which version to freeze. Do not continue unchanged runs or chase a desired 50% sample indefinitely.

## Preservation

Original checkpoint verification passed all 34 reference file hashes. The measured internal-matched bitstream retains SHA256 `EA95455975095342B43FBEDF5592B7CC4592D20A0E328B1E9C795A5C516AB8E6`. Its CSVs remain unchanged. Changes remain in the isolated candidate folder on Version-2; no tracked baseline RTL was changed and nothing was pushed.
