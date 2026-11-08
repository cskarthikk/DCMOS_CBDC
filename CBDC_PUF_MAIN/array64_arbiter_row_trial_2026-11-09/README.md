# Arbiter row and slot diagnostic

This is a diagnostic variant, not the selected baseline. It starts from the exact original 64-core synthesized checkpoint, retaining all logical RTL and controller cycle counts. All 64 arbiters move from head+17 BFF to head+16 AFF, next to the chain-end row. All 6144 internal chain-output route trees are preserved. The 128 last-stage output trees may reroute their arbiter and feedback branches. Six ordinary controller flip-flops are released from old sites to free the new arbiter tiles.

The first attempt at head+16 BFF failed with 18 unrouted arbiter D pins: data-entry routing resources overlapped locked neighboring-chain resources. The AFF variant completed routing, structural checks, physical route-identity checks, and synchronous controller timing (setup +0.438 ns, hold +0.029 ns). The asynchronous PUF paths remain outside ordinary synchronous timing closure; those controller slack numbers do not prove analog PUF correctness.

The implemented artifact was produced with scripts/implement.tcl through its placed checkpoint, followed by scripts/resume_aff.tcl, scripts/review.py, scripts/finalize.tcl, and scripts/record.py. The initial failed BFF attempt remains in route_resume.log. The current implement.tcl expresses the final AFF placement for a future fresh attempt; it is not a claim that a fresh rerun will reproduce the identical candidate bitstream.

Physical review: 6650 constrained reference cells checked after excluding the six released controller cells, all 6144 internal signal trees/endpoints identical. The arbiter median modeled skew changes 169 to 164 ps, but the worst changes 517 to 589 ps. Launch skew is unchanged and feedback median changes 150.5 to 151.5 ps. This is not uniformly better boundary routing.

Experiments/run_ba0a46a2f65f4f54a159ec60a30ccfb6 holds the bracketed original → trial → original comparison, with exactly the same 64 vectors and 20 repeats per condition. All 64 raw cores and all trials are retained. RESULTS.json and per_core.csv contain the completed comparisons. The run script restores the original bitstream in a finally block.

Early wait8 results were about 50.55% aggregate ones, but per-core rates ranged from 2.03% to 100%, with 13 cores outside 10–90%. Thus the aggregate percentage does not establish that the individual cores have been repaired. The wait127 result was about 63.57%; excitation-time dependence remained. Keep this evidence, but do not promote the variant simply because its total is nearer 50%.
