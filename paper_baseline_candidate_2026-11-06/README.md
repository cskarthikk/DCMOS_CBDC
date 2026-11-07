# Figure 1 single-core candidate

Latest hardware decision: [BOUNDARY_EVALUATION_2026-11-07.md](BOUNDARY_EVALUATION_2026-11-07.md). Boundary v3 improved observed balance but worsened within-run consistency; final checkpoint selection awaits one independent confirmation.

Latest routing work and exact next hardware steps: [ROUTING_UPDATE_2026-11-07.md](ROUTING_UPDATE_2026-11-07.md). The measured checkpoint is `build_internal_matched_v2`; the new physical candidate is `build_boundary_v3`, with its own `collect_boundary.ps1`. Use the build record to verify release completion before programming. The initial build instructions below remain historical/reproducibility context.

This is a separate candidate implementation, not yet the project's final hardware baseline. Original project RTL and the preserved checkpoint are untouched. No array, BCH, or hash sources are included.

## Explicit architecture

The serial wrapper explicitly selects 16 stages, cross-coupling, fixed AND entrances (`GATE_INIT=8`, `AUTO_PARITY=0`), Latch-enabled capture (`CAPTURE_MODE=0`), one arbiter (`DUAL_ARBITER=0`) and no diagnostic FFs (`DIAGNOSTIC=0`). The primary arbiter is D=Qu and falling-edge C=Qb. No first-edge lock is elaborated. The build asserts exactly one FF under the core hierarchy.

The reusable core files retain their original parameter options for traceability; the explicit wrapper overrides determine this build. Do not build another top or rely on the reusable core's default parameters. The old parameter comments are historical and do not establish compliance or guarantee oscillation.

This follows Figure 1 and Section 3.1's AND-gate and Latch sequence interpretation. It deliberately accepts only odd-parity challenges. Even parity is rejected by the controller, including 0000 and FFFF. The paper lists NAND2 in Section 4.1 and implies 65536 configurations; this inconsistency remains unresolved. Full challenge coverage and exact paper reproduction are NOT established.

The three-LUT stage logically implements the described buffer/inverter selector. The paper's resource table implies two LUT2s per stage but does not supply the exact mapping. Substituting a buffer-plus-XOR decomposition just to match the count would be another interpretation, not evidence of identical physical paths. This mapping remains a documented reproduction limitation.

Clear timing, excitation wait, Latch window and synchronized readout retain the existing engineering cycle counts (4/4/8/8/4 at 100 MHz). The paper does not provide FPGA-ready cycle counts. UART and button conditioning are board infrastructure. Explicit asynchronous clear is an implementation choice supporting repeatable initialization.

## Protocol and collection

This candidate uses **A6 requests and 59 replies**, with XOR checksums and the same byte layout as the historical UART. Flags: bit0 accepted, bit5 candidate marker, bit7 timeout. All other bits are reserved zero. The activity-monitor FFs were removed to avoid adding terminal loads: there are no measured activity flags. Empty edge columns in candidate CSVs mean unavailable, not zero edges.

Use only `scripts/collect_candidate.ps1` after explicitly programming this candidate. The original A5/5A collector must not be used. Candidate data must not be fed to an analyzer that interprets absent activity values as successful activity checks. The collector chooses deterministic unique odd-parity challenges, including a fixed smoke prefix, and records a local bitstream hash. That hash does not identify active FPGA firmware.

No candidate hardware measurements have been taken. Do not infer liveness from UART acceptance: accepted means the controller completed its sequence.

## Validation

- Artificial-delay UART test: accepted odd challenges, rejected even/zero challenges, protocol marker, checksums, corrupted frames and recovery.
- Controlled-terminal capture test: Latch gating, negative-edge capture, multiple captures while enabled and hold afterward. Forced terminal signals test arbiter semantics, not analog races.
- Vivado build: `scripts/build.tcl`; output confined to `build/`. It refuses to replace an existing candidate bitstream. See generated logs/reports for actual completion and warnings.
- Physical audit: per-net slow/fast delays and cell locations are exported by `scripts/audit_routes.tcl`. Paired placement alone is not matched routing. The route-delay audit must be assessed before final-baseline designation.

The board has not been programmed by the assistant. This is a combined Figure-1 reconstruction candidate. If its hardware results differ from the old baseline, the cause cannot be assigned to any single changed feature without separate controlled variants.

## Remaining acceptance gates

1. Successful synthesis, placement, routing and bitstream generation with reviewed reports and exactly one core arbiter.
2. Assess paired internal paths, launch skew, terminal loading and arbiter data/clock routes. Record residual asymmetry; do not claim it was eliminated from equal coordinates or route strings alone.
3. Document the AND/NAND and LUT-mapping ambiguities as departures/interpretations; source RTL from the paper's authors would be needed to resolve their exact implementation.
4. One finite hardware evaluation and independent confirmation of this candidate on accepted challenges, comparing only overlapping challenges with historical datasets.
5. Freeze the selected bitstream, sources, reports and measurements only after those checks. This baseline can be a defensible adaptation of the paper on Basys 3, not an unsupported claim of perfect reproduction.
