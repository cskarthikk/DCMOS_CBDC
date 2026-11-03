# Matched-routing experiment — Basys 3

This experiment changes physical placement and wiring, not the buffer/inverter chain architecture. It operates on the existing UART diagnostic checkpoint and saves separate outputs. It does not program the board or replace the original Vivado project. Its purpose is to reduce avoidable differences in the connections, consistent with the paper's discussion of approximately equal routing.

## Why the old placement was insufficient

The FPGA database shows that SLICE_X20 and SLICE_X21 are two different slice positions inside the same CLBLL_L tile. Their connection resources differ: for example CLBLL_LL_A versus CLBLL_L_A. The earlier placement notes checked that both slices were SLICEL, but that was not enough to establish equivalent wire connections.

In the experiment, upper stages stay at SLICE_X21Y100..116 and lower stages move to SLICE_X25Y100..116. These occupy corresponding slice positions in two CLBLL_L tiles, at tile X14 and X16. The same LUT positions and input-pin assignments are retained.

## What the script does

1. Opens the saved original serial routed checkpoint.
2. Records its internal wire delay estimates.
3. Reads the upper chain's existing internal wire patterns.
4. Removes routing in the in-memory experimental copy.
5. Moves the lower LUTs to matching slice positions.
6. Places the arbiter at SLICE_X23Y116/BFF, near both chain outputs. Places Qu/Qb monitors at corresponding SLICE_X21Y117/AFF and SLICE_X25Y117/AFF. The monitor clocks differ, so the monitors must not share a slice clock.
7. Applies each upper internal route pattern to both corresponding connections using FIXED_ROUTE.
8. Routes the remaining connections, compares the resulting internal patterns, reports routing/DRC/timing/methodology, and saves a separate checkpoint.

The 48 matched pairs comprise one head-to-first-stage connection, 32 buffer/inverter-to-selector connections, and 15 connections between stages. Branches produce 64 corresponding sink connections per chain. Both buffer and inverter routes are included, even when a particular challenge selects only one branch.

**Important boundary:** final chain outputs branch toward feedback, the arbiter, and monitors. Those nets, the shared excitation distribution, and the arbiter's inherently different data/clock inputs are not covered by the 48-pair matching claim. Their estimates are reported separately. Equal internal wire patterns do not establish equal whole-circuit timing, nor should they eliminate the physical manufacturing differences that a PUF uses.

## View the result in Vivado

First candidate results, verified in Vivado 2025.2:

| Check | Result |
|---|---|
| Identical internal route patterns | 48 / 48 pairs |
| Corresponding internal sink delays equal, slow-corner maximum | 64 / 64 |
| Mean absolute internal sink mismatch | 18.656 ps before; 0 ps after |
| Largest absolute internal sink mismatch | 60 ps before; 0 ps after |
| Full design routing | 638 / 638 routable nets; 0 routing errors |
| Fixed nets | 96 |
| Clocked controller setup/hold slack | +4.398 ns / +0.122 ns |
| DRC | No errors or critical warnings; 5 warnings |

The 5 DRC warnings are the acknowledged combinational loop, 2 gated-clock
warnings, and 2 non-optimal clock-connection warnings. Methodology still reports
3 non-clocked sequential cells: the arbiter and monitors have asynchronous
chain clocks, which the controller clock timing checks do not validate. Missing
I/O-delay and combinational-loop methodology warnings also remain.

Boundary wire slow-corner maximum estimates in this first candidate are:
Qu-to-arbiter-D 776 ps; Qb-to-arbiter-C 848 ps; feedback to upper 1427 ps;
feedback to lower 1457 ps; excitation to upper 1473 ps; excitation to lower
1617 ps. These expose remaining unequal connections outside the 48 matched
pairs. In particular, the excitation mismatch is 144 ps, versus 9 ps in the
original build. The first candidate therefore improves internal matching but
must not be described as uniformly better in every part of the circuit.

An optional second candidate moves the excitation register near the entrances.
Reproduce it from a Vivado batch invocation with `-tclargs --center-launch`.
It writes to `build_m1/matched_routing_center_launch`; the normal script run
continues to write the first candidate separately. Moving the register can
unplace associated packed controller LUTs, so this variant runs placement again
before fixing the internal routes and routing the design.

**Preferred candidate: matched_routing_center_launch.** The completed second
candidate retains all 48 identical internal route pairs and all 64 equal
modeled internal sink delays. It has 639/639 routable nets fully routed,
0 routing errors, setup slack +4.389 ns and hold slack +0.122 ns. Its DRC has
the same 5 warnings and no errors/critical warnings. Methodology still has the
3 TIMING-17 critical warnings for the asynchronous arbiter/monitor clocks, plus
missing I/O delay and loop warnings. Two XDCB-5 messages concern query runtime,
not wire correctness. This is not complete asynchronous timing signoff.

The excitation register is now at SLICE_X23Y100/AFF. Excitation wire slow-maximum
estimates are 964 ps upper and 976 ps lower: 12 ps mismatch, versus 144 ps in
the first candidate and 9 ps in the original. Terminal-to-arbiter estimates
remain 776/848 ps, giving 72 ps absolute mismatch versus 267 ps originally.
Feedback estimates remain 1427/1457 ps. Different fast-corner values remain;
these slow-maximum comparisons are not measured race margins. The preferred
candidate improves internal and arbiter-wire matching and keeps excitation
matching close to the original; it does not make every boundary route equal.

Use a separate Vivado session so your current project remains available.

1. Launch another Vivado window.
2. In its Tcl Console, open the experimental checkpoint:

   ```tcl
   open_checkpoint {C:/BTech/Semester_5/DCMOS/Project/build_m1/matched_routing_center_launch/experimental_routed.dcp}
   ```

3. Open the Device view. Select the two first-stage buffer output nets:

   ```tcl
   select_objects [get_nets -hier -filter {NAME == "u_puf/u_core/u_chain_upper/gen_elem[0].u_elem/gen_style_p.buf_path_w" || NAME == "u_puf/u_core/u_chain_lower/gen_elem[0].u_elem/gen_style_p.buf_path_w"}]
   ```

4. Zoom to the selected objects. Enable routing-resource display if needed. The two routes occupy different physical locations but follow corresponding connection patterns.
5. Read `build_m1/matched_routing_center_launch/route_comparison.txt`. A successful experiment reports `MATCHED_INTERNAL_PAIRS 48 / 48` and both routes fully routed for every pair.
6. Read `route_status.rpt`, `after_drc.rpt`, and `timing_summary.rpt`. Pattern equality alone is not sufficient: unrouted connections, conflicts, or new design-rule errors invalidate the result.

The generated `experimental_constraints.xdc` is an export from this separate design, not an extra file to add blindly alongside the old placement files. The checkpoint is the complete experimental handoff.

## Reproduce the experiment

In a separate empty Vivado session:

```tcl
set argv {--center-launch}
source {C:/BTech/Semester_5/DCMOS/Project/scripts/experiment_matched_routing.tcl}
```

It requires the existing original serial routed checkpoint at its current project path. It rejects unexpected placement or occupied target positions instead of silently displacing unrelated logic. It can take several minutes and overwrites its experimental output files under `build_m1/matched_routing_center_launch`. For the first candidate, use `set argv {}` before sourcing; that writes under `build_m1/matched_routing`.

After successful completion, summarize the paired internal wire estimates in PowerShell:

```powershell
Set-Location 'C:\BTech\Semester_5\DCMOS\Project'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\summarize_matched_routing.ps1 -Directory .\build_m1\matched_routing_center_launch
```

Picoseconds (ps) are a smaller unit than nanoseconds: 1,000 ps = 1 ns. The summary compares modeled wire delays, not measured manufacturing differences or complete-chain race margins.

## What a board test would establish

A later experimental bitstream needs its own build identity and new measurements. Old CSVs describe the old implementation. A reduction in modeled internal mismatch is evidence of better internal route control; only hardware repetitions establish whether response bias and instability improve. This remains an instrumented single-core implementation, not the complete paper system.

Reference: AMD [Fixed Routing](https://docs.amd.com/r/2025.1-English/ug903-vivado-using-constraints/Fixed-Routing) explains ROUTE, FIXED_ROUTE, and preservation of endpoint placement/pins.
