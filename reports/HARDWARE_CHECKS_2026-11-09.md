# 64-core rebuild, power, latency and security-note review

Base revision: be56b6e. Assessment date: 9 November 2026. The selected working image remains `bitstream/paper_array64.bit`, SHA256 `98266A06F5CA5EAE25EAFC507E1B4D81EC55CD21B48980969AF0A7CFF23C1517`. Newly rebuilt images are separate candidates, not automatically replacements for enrolled hardware.

## Rebuild

**PASS:** fresh-source synthesis, 64-core digital tests, placement, routing/refinement, all 64 structural checks, all 4,096 internal pairs at both delay corners, DRC/timing gates and bitstream generation completed. All 14,789 routable nets are routed with zero routing errors. Resource counts match the selected implementation: 11,008 LUTs and 4,356 registers. All 8,960 extracted modeled arcs also match the original delays. **The configuration data from the sync word onward is byte-identical to the original selected bitstream.** The complete .bit hashes differ because bytes before the sync word differ; the original selected file remains unchanged.

The repaired `scripts/rebuild.ps1` stages the 64-core RTL, physical layout, constraints and the historical 64-core build scripts in an isolated canonical layout. It runs the actual 64-core serial testbench and the exhaustive 65,536-configuration chain truth test. It then runs synthesis, placement, routing and route refinement, performs four final-checkpoint delay-extraction audits, checks 4,096 internal paired arcs, and gates bitstream generation on the structural, DRC and synchronous timing checks.

The first test run was deliberately stopped after its routed checkpoint was saved because an old script had begun a redundant serial delay export. The run resumed from that checkpoint for refinement and the parallel final audit. The permanent route script now avoids that redundant export. Staged input fingerprints are recorded in REBUILD_INPUTS.json. This describes an actual fresh-source build with checkpoint resume, not a claim of byte-identical reproduction of the old image.

Commands:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File scripts/rebuild.ps1
# Optional recovery from an initially routed stage, before refinement:
powershell.exe -NoProfile -ExecutionPolicy Bypass -File scripts/rebuild.ps1 -ResumeRoutedStage <stage-folder>
```

Rebuilding is intentionally separate from programming: the board was reloaded with the original selected image for the serial timing test, not the rebuilt candidate. A rebuilt image with different configuration data requires new hardware characterization before reusing enrollment; this tested rebuild reproduced the original configuration data exactly.

## Power of the selected working design

| Quantity | Vivado vectorless estimate | Paper Section 4.1, XPower estimate |
|---|---:|---:|
| Dynamic FPGA power | **0.044 W** | 0.427 W |
| Device static power | **0.072 W** | 0.089 W |
| Total on-chip power | **0.116 W** | 0.516 W |

These are **not physically measured board-power values**. Vivado used the selected routed checkpoint with no SAIF file or measured PUF switching activity. Its displayed confidence is Medium, and it warned that assumed high-fanout reset activity may make the estimate inaccurate. Defaults include 25 C ambient, a medium heat sink, 250 LFM airflow and a medium board model; these do not establish the actual Basys 3 thermal environment. Real asynchronous oscillation activity and query duty cycle are not characterized here.

Use the presentation label **“Vivado vectorless estimated on-chip power: 0.116 W, default activity assumptions.”** Do not claim measured consumption or a verified power-efficiency improvement over the paper. Different FPGA sizes, core counts and CPU/FPGA partitioning also prevent a direct comparison.

Reproduce with Vivado batch `-source scripts/assess_hardware.tcl -tclargs <output-folder>`. This is read-only checkpoint analysis, not hardware programming.

## Three different meanings of latency

| Measurement | Result | Scope |
|---|---:|---|
| Controller accepted start to response-valid | **440 ns / 44 clocks**, all 64 cores | RTL simulation at 100 MHz, controlled Qu/Qb stimuli |
| Excitation wait / capture window | **220 ns / 80 ns** | Same simulation confirms the 22/8 operating profile |
| Excitation rise to response-valid | **360 ns** | Excludes initialization, includes capture and synchronization/finalization |
| Real host UART request/reply round trip | **32.24621 ms average**, 50 queries | 29.9275 ms minimum; 40.3572 ms maximum |
| Nominal UART wire-time lower bound | **23.52431 ms** | (131 request + 140 reply) bytes, 10 serial bits/byte, 115200 baud |
| Intrinsic physical PUF propagation latency | **Not measured** | Requires an appropriate silicon timing/observation experiment |

The live UART benchmark reused the existing 64-core query function and checked its frame response. An initial timeout and a transient port-access error were resolved by reloading the known image and retrying; all 50 final queries succeeded. Host round-trip time includes USB/serial buffering, software overhead, communication and FPGA processing. Concurrent system load can affect it.

The paper reports 10.627 ns computation latency and 92.799 MHz maximum frequency. Our deliberate multi-cycle controller wait, UART round trip and the paper's reported latency are not equivalent measurements. Likewise, our working 100 MHz controller clock is not a measured PUF Fmax. The simulation test proves clock-cycle behavior, not physical race delay, metastability behavior or randomness.

Live benchmark command, with the selected board image already loaded:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File scripts/measure_uart_latency.ps1 -Port COM5 -Output <new-results.json>
```

## What your friend wrote about security

The notes are in `reports/CBDC_PUF_REPLICATION_REPORT.md` (helper-data leakage and code-offset sections), README, and `scripts/audit_helper_leakage.py`. The existing audit ran successfully and recovered the 16-candidate set containing its generated test response. That supports the old implementation-leakage finding.

The report currently states that the replacement provides full independent entropy per block and 256-bit secrecy across eight challenges. Those statements need qualification: a code-offset construction requires enough conditional entropy in the PUF responses, with correlations and helper-data leakage accounted for. Random software secrets and a 256-bit hash output alone do not prove that guarantee for this biased, correlated physical array. A simple illustrative constant-zero PUF response makes its public code-offset helper equal the encoded secret, which can be decoded without the PUF. This illustrates the missing assumption; it is not evidence that our measured board has zero entropy.

Suggested presentation wording: **“We identified helper-data leakage in our initial ECC software and investigated code-offset extraction. Quantifying retained entropy and cross-challenge correlations is future work.”** This is a defensible project finding/research question. The repository alone does not establish a novel flaw in the paper or a new cryptographic construction. The existing batch analyzer still evaluates the legacy scheme, so its correction statistics do not validate the replacement extractor.

## Evidence

Detailed power reports, the generated timing-instrumented testbench, simulation log, UART samples, leakage audit output and entropy-assumption illustration are under the folder recorded by `reports/LATEST_HARDWARE_ASSESSMENT.txt`. Full rebuild products are in the isolated stage recorded by `rebuilds/LATEST.txt`; they are excluded from Git to avoid replacing the selected release inadvertently. The summary below names the actual paths and final audit outcome once complete.


Actual evidence folder: `C:\BTech\Semester_5\DCMOS\Project\reports\hardware_assessment_1c1a25a5c80a483faba46935fbe42c71`. Isolated rebuild stage: `C:\BTech\Semester_5\DCMOS\Project\rebuilds\run_3a0da09a099046f5b2de0823904d2849`.

Selected .bit SHA256: `98266A06F5CA5EAE25EAFC507E1B4D81EC55CD21B48980969AF0A7CFF23C1517`. Rebuilt .bit SHA256: `E68231950ED335EFDBF496DD0EBD79B13BDD70255E9C75044C95E250E13BA54B`. See `rebuild_comparison.json` for payload comparison and `REBUILD_RESULT.json` / `REBUILD_INPUTS.json` for provenance.
