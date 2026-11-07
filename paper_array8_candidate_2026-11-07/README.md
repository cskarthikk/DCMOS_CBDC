# Corrected eight-core Figure 1 interpretation

Broad hardware characterization now completed: all eight cores vary across 256 sampled vectors; aggregate raw ones=41.25%. Cores 0 and 5 are near 50%, but bias and mixed responses remain. See [EVALUATION_256_2026-11-07.md](EVALUATION_256_2026-11-07.md). Retain the exact candidate/Parallel-8 setting for enrollment and independent validation; final baseline promotion and 128-core scaling remain pending.

Latest hardware diagnostic: all eight cores vary across the tested 32-pattern set. Eight-cycle parallel and sequential results are similar; the shorter wait is more biased and more variable in this sample. See [DIAGNOSTIC_RESULTS_2026-11-07.md](DIAGNOSTIC_RESULTS_2026-11-07.md). Keep parallel/eight-cycle operation for the next broader characterization; full hardware acceptance remains pending.

This candidate addresses confirmed departures in the failed experimental eight-core pilot. It is a separate build; the preserved November 4 checkpoint and every measurement remain unchanged. Hardware acceptance is pending. Do not assign the original single-core 28.x% result to these new physical cores.

Detailed investigation and evidence: `../paper_alignment_audit_2026-11-07/FINDINGS.md`. That report separates measured facts, implemented wiring checks, controlled simulation, timing-model hypotheses and unresolved paper details.

## Circuit and controller

Each core now has **one** FDCE_1 response FF with D=Qu, negative-edge C=Qb, CE=Latch and explicit controller initialization clear. There is no complementary arbiter, first-edge lock, or diagnostic edge register. There are two fixed AND entrance gates and two 16-stage cross-coupled chains. C=0 selects the buffer path; C=1 selects the inverter path on both chains. A response is frozen by lowering Latch, then synchronized before excitation is removed.

The controller is outside the PUF and exposes two diagnostic settings in the same bitstream: parallel/sequential core activation and an excitation-to-Latch wait of 1..127 system cycles. Latch-high duration remains eight cycles. At 100 MHz, one cycle is 10 ns. The paper does not specify these cycle counts; they are characterization controls, not a claimed published waveform. Sequential activation is a diagnostic comparison, not the paper's normal parallel operation.

The three-LUT stage is retained as an explicit physical implementation interpretation. Exact correspondence to the paper's two-LUT2 count is unresolved. The paper also contradicts itself on AND versus NAND, contains a clock-source typo, and does not explain full challenge coverage with fixed gates. This candidate follows Figure 1 AND entrances and supports **odd-parity configurations only**; invalid parity and zero excitation wait are rejected. It is not an exact physical reproduction or a complete 128-core/SHA3/BCH framework. No output filtering, whitening, XOR combining or software-generated response bits are used.

## Physical implementation and release checks

The layout matches chain slice types, surrounding tile types and within-tile slice orientation to the verified internal route template, and keeps each footprint within a clock region. Excitation drivers are centered between the chain entrances. Explicit PUF placement regions exclude unrelated logic. The primary arbiter occupies the center column; input-pin assignments and chain geometry are fixed.

The template initially contained one detouring inverter-to-mux route whose abstract route string had different modeled delays at different locations. The build release check rejected it. `scripts/match_local.tcl` replaces that stage-6 inverter connection in both chains of all eight cores with a local route while preserving completed routes. The selected output is **`build_matched/paper_array8.bit`**, not the earlier `build/paper_array8.bit`.

Release requires actual exported equality at SLOW_MAX and FAST_MIN for all **512 internal paired signal-net arcs** (64 per core), 768 fixed internal nets, exactly one correctly wired response FF/core, all stage truth tables/configuration selects, verified placements/BELs/pin locks, complete legal routing and positive ordinary setup/hold timing. Equal internal net estimates do not establish equal LUT silicon delays or equal complete launch/feedback/arbiter paths. Boundary estimates remain in the release record; the asynchronous PUF warnings remain visible.

The routed design has 2322/2322 routable nets and zero routing errors. Ordinary setup/hold slack is +2.341/+0.064 ns. The complete design uses 1596 LUTs and 760 FFs, including ordinary controllers/transport; only eight FFs are inside the eight PUF cores. DRC retains 8 allowed-loop, 8 gated-clock and 8 non-optimal hold-connection warnings. Methodology retains 8 TIMING-17 critical warnings on the asynchronous core FFs. None was downgraded to make a build pass.

Final release checks passed, including all 512 internal arc pairs at both modeled corners and all 800 constrained placements (784 LUTs, eight arbiters, eight centered excitation registers). Bitstream SHA256: `6BE7B2C364E2FB0A59864DB1597934BBE5EAB6538B239375E33445109A5666C7`. Windows PowerShell collector preflight passed without opening COM5. The original checkpoint's 34 reference hashes also passed.

Remaining SLOW_MAX boundary mismatch across cores: excitation paths 1..29 ps, cross-feedback paths 209..276 ps, arbiter D/C net paths 67..76 ps. These are explicit limitations: the whole core is not perfectly symmetric. The complete per-core/corner estimates are retained in `BUILD_RECORD.json`. Hardware behavior, especially the effect of capture timing, remains to be measured.

Digital simulation tests real Latch-controlled FF capture using controlled terminal waveforms (not forced response bits), 128-bit actual configuration readback, bit ordering, independent configuration, sequential exclusion, parallel activation, timing choices, parity rejection and serial error recovery. A separate exhaustive chain test checks all 65536 settings' Boolean buffer/inverter composition and initialization parity. Neither simulation predicts PUF entropy or silicon responses.

## Load and run the bounded diagnostic comparison

Use only the selected bitstream after `BUILD_RECORD.json` has been created by the verified release script:

`C:\BTech\Semester_5\DCMOS\Project\paper_array8_candidate_2026-11-07\build_matched\paper_array8.bit`

Program that exact file in Vivado Hardware Manager, leave probes empty and wait for successful programming. Then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\BTech\Semester_5\DCMOS\Project\paper_array8_candidate_2026-11-07\scripts\run_diagnostics.ps1" -Port COM5 -BitstreamLoaded
```

This performs exactly three conditions, with the same 32 odd-parity vectors x10 repeats per condition:

1. Parallel, eight-cycle excitation wait.
2. Sequential, eight-cycle wait.
3. Parallel, one-cycle wait.

Total: 960 response frames / 7680 individual raw core responses. Each condition writes its own unique CSV, metadata and configuration matrix. No particular ones ratio or response word is expected. Do not pool these conditions as reliability repeats. Analyze per-core response variation and within-condition consistency, plus changes associated with concurrency/timing. If cores remain constant, stop promotion and investigate rather than expanding to 128.

`-BitstreamLoaded` is operator confirmation, not a programming command. The file hash verifies the selected local file, not live firmware. The new protocol is incompatible with the old array collector. Activity columns are intentionally blank: one arbiter/core has no edge-monitor instrumentation, and blank must never be called a measured zero or successful activity flag.

`scripts/collect.ps1 -Port COM5 -VerifyOnly` checks the release hash and configuration generation without opening the port. Individual captures accept `-Mode Parallel|Sequential -ExciteCycles 1..127 -Patterns ... -Repeats ...`. `scripts/analyze.py <CSV>` validates all frames, actual configuration values, condition labels and raw word/bit consistency, and reports each core independently without asserting entropy, uniqueness or certified reliability.

## Protocol and readback

115200 8N1, stop-and-wait. Request: AC, control byte, 16 configuration bytes, XOR of preceding 18 bytes (19 total). Control bit 0 selects sequential diagnostic activation; bits 7:1 specify the excitation wait. Configurations are core0 low/high through core7 low/high. Reply: 5C, control, 16 **actual controller-latched configuration bytes**, flags, eight-bit raw response word, XOR of preceding 20 bytes (21 total). Status 61=all complete, 60=rejected, E0=error/timeout. For rejected requests, configuration readback can reflect the previous accepted query; it is not represented as a new measurement. Bit 0 of the word is core 0.

## Reproduction

In a fresh isolated output directory, run functional simulations, `scripts/build.tcl`, `scripts/match_local.tcl`, then `scripts/verify_placement.tcl -tclargs build_matched`, and `scripts/record_build.py` with Python. Existing outputs and release records are protected from overwriting. `scripts/resume.tcl` documents recovery from the intermediate route-template parsing and placement-protection failures using the unchanged saved optimized checkpoint. No failed intermediate candidate was released. Saved DCPs and evidence hashes identify the actual implemented design; a rebuild may change physical behavior and requires its own validation.
