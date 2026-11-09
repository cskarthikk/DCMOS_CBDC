# 64-core raw CBDC-PUF candidate

This is a separate candidate inside the main project. The measured eight-core release, its enrollment and the existing cryptographic demo remain unchanged. This candidate contains no challenge hashing, BCH, response filtering or key derivation.

Implemented control-clock timing: 100 MHz, setup slack +0.438 ns, hold slack +0.029 ns. All 14,789 routable nets are fully routed, with 6,144 fixed internal nets and zero routing errors. The structural audit passed for all 64 cores. Default DRC reports 64 allowed-loop, 64 gated-clock and 64 non-optimal hold-connection warnings; methodology retains 64 TIMING-17 critical warnings for the asynchronous response arbiters. These are visible limitations, not synchronous timing failures or proof of PUF stability. Final paired-delay results and bitstream identity are recorded separately after completion.

The complete refined audit passed: **4,096/4,096 internal paired arcs have zero reported SLOW_MAX and FAST_MIN skew**. This required a routing refinement after the initial audit found 803 mismatches. Boundary delays are not all matched: maximum reported slow-corner skew is 292 ps at excitation, 340 ps at feedback and 517 ps at the arbiter. Per-core values remain in `build/route_summary.json`. These residual differences are a reason to characterize every core on the board; no good aggregate balance or per-core quality is assumed from implementation success.

## Design contract

- 64 physical instances of the existing `cbdc_puf_core`: two fixed-AND entrances, 16 stages per chain, one negative-edge FDCE response arbiter enabled by Latch.
- The element, chain, core, controller and serial-engine RTL files are byte-identical to the working eight-core implementation. The three-LUT element and odd-parity configuration restriction are retained. The paper's exact two-LUT mapping remains unspecified; this is the existing Figure 1 interpretation, not a claim of exact reproduction.
- One independent controller per core preserves both parallel operation and sequential diagnostics. Synthesis fits without changing or sharing controllers.
- 1,024 independently configurable bits and 64 raw response bits. UART request/reply headers are A6/D6 to distinguish this protocol from the eight-core AC/5C interface. Existing eight-core software is incompatible with this candidate.
- Compact placement reserves chain columns and dedicated arbiter/excitation sites instead of five-column rectangles. Upper/lower chains within a core use the same slice/tile family and locked LUT pins. Arbiter and excitation sites lie on the horizontal midpoint, respectively one row beyond the chain end and one row before the entrance. Multiple tile families are used; boundary routing must be measured and reported.
- Internal route templates derive from the measured eight-core topology, including its stage-six correction. Template translations and modeled net-delay equality must pass actual routing checks; geometry alone does not certify them.

## Verification and first board check

The candidate is ready for programming only when `BUILD_RECORD.json` exists and the following verification succeeds:

```powershell
cd 'C:\BTech\Semester_5\DCMOS\Project\CBDC_PUF_MAIN\array64_candidate_2026-11-08'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Verify
```

Program the exact `build/paper_array64.bit` through Vivado, or use the explicit programming action with the board powered and connected:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Program
```

After successful programming, collect a small smoke capture:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Smoke -Port COM5 -BitstreamLoaded
```

Expected size: 12 accepted frames / 768 raw core responses. `-BitstreamLoaded` confirms the operator has programmed the file; it does not program or read firmware identity. Completion flags indicate controller completion, not measured oscillation activity.

If the smoke capture succeeds, collect the complete raw characterization:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Collect -Port COM5 -BitstreamLoaded -Patterns 256 -Repeats 20
```

Expected size: 5,120 frames / 327,680 raw response bits, taking several minutes. The collector saves a new CSV, the exact configuration matrix and metadata under `measurements/new/`. It checks reply framing, XOR checksum, completion status and every actual configuration byte before accepting a frame. No observations are filtered.

Smoke and Collect automatically run the raw per-core analysis after a complete capture. Powering the board off loses the volatile programmed candidate; program the exact candidate again after a power cycle unless a separate persistent-configuration procedure has been established.

Analyze the returned CSV with:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\run.ps1 -Action Analyze -InputCsv 'FULL_PATH_TO_NEW_CSV'
```

Use `-Mode Sequential` with the same saved matrix via `-ChallengeFile` for a controlled parallel/sequential comparison if the raw results identify a reason to investigate. Independent power-cycle repeats should replay the same matrix. Existing eight-core enrollment/helper data cannot be reused.

## Evidence

`build/utilization_synth.rpt` reports the actual synthesis resource count. `sim/result.log` records full-width digital capture/transport tests with controlled arbiter waveforms, not analog PUF measurements. `build/structure.txt`, `route_status.rpt`, `timing.rpt`, `drc.rpt`, `paired_arcs.csv` and `route_summary.json` describe the implemented candidate when those steps complete. Intentional asynchronous-loop/gated-clock warnings remain visible.

No balance, repeatability, entropy or modeling-resistance result is claimed for 64 cores until the board is measured. A compiled and routed bitstream alone does not establish those properties.
