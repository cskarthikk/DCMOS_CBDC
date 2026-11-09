# 64-core implementation review — 8 November 2026

The working eight-core PUF circuit was copied without changing its element, chain, core, controller or engine RTL. This candidate scales the physical instances and transport to 64 cores; it does not add SHA, BCH, response balancing or key generation.

| Item | Eight-core reference | 64-core candidate |
|---|---|---|
| Physical cores | 8 | 64 |
| Stages per chain | 16 | 16, unchanged |
| Response arbiters | One negative-edge Latch-enabled FF/core | Same |
| Stage mapping | Buffer LUT2 + inverter LUT2 + selector LUT3 | Byte-identical |
| Configurations | Fixed AND, supported odd parity | Same |
| Control sequence | Clear, settle, excite, Latch, hold, synchronize, read | Same independent controller/core |
| Configuration bus | 128 bits | 1,024 bits |
| Raw response bus | 8 bits | 64 bits |
| UART headers | AC / 5C | A6 / D6 |
| UART request/reply | 19 / 21 bytes | 131 / 140 bytes |
| Placement reservation | Five-column macro rectangles | Separate chain columns and arbiter/excitation sites |
| New hardware measurements | Existing measured reference | Pending board programming and characterization |

The compact layout uses same-family SLICEL columns for the two chains of each core. A dynamic-programming search minimizes pair separation while respecting available sites and preventing overlap. A maximum separation of six columns permits 62 compatible macros; eight permits 68. The selected 64 locations span the device's usable regions. Arbiter/excitation sites are centered horizontally and moved into rows outside the chain columns to avoid collisions.

Synthesis uses 11,202 / 20,800 LUTs and 4,356 / 41,600 registers. Final implementation uses 11,008 LUTs (52.92%) and 4,356 registers (10.47%). Actual placement and routing succeed. All 14,789 routable nets are fully routed, with 6,144 fixed internal nets and zero routing errors. The 100-MHz synchronous control paths meet setup/hold with +0.438 / +0.029 ns slack. These constraints do not time-certify the asynchronous PUF race.

The initial full routed audit exposed 803 nonzero internal paired arc differences, up to 164 ps. Legal translations of the original horizontal-detour routes did not preserve their delays across the new tile neighborhoods. That first result is preserved in `first_route_audit/`.

The refinement changes 1,110 internal nets, preserving the remaining fixed routes. Right-side tile interstage nets use same-column NN2/SR1 paths; three nonlocal inverter routes in CLBLM_R columns use local BYP paths instead. RTL and capture behavior are unchanged. The complete second audit passed: all 4,096 internal pairs have zero reported SLOW_MAX and FAST_MIN skew. Final authoritative results are in `build/route_summary.json` and `build/paired_arcs.csv`.

Residual modeled boundary skews remain: the largest slow-corner differences are 292 ps at excitation, 340 ps at cross-feedback and 517 ps between the arbiter D/C connections. These can contribute to bias and must be assessed using per-core hardware data. The candidate is ready for experimental evaluation after bitstream finalization, not declared a fully balanced or reliable final baseline.

The implemented structural checks verify all 64 arbiters, their D/C/CE/CLR connections and falling edge, fixed-AND entrance wiring and placement, 6,144 stage LUTs and 128 entrance LUTs with intended truth tables/sites/BELs/input pins, every cascade connection, and every configuration selector.

Digital simulation uses controlled Qu/Qb waveforms to verify Latch capture rather than an earlier transition, all configuration and response bits, parallel and sequential scheduling, excite waits 1/8/127, unsupported configurations, checksums and parser recovery. It is not an analog oscillation or randomness model. Host tests exercise full 64-bit words, including bit 63, and reject incomplete/duplicate/truncated synthetic captures.

Default DRC retains 64 allowed-loop, 64 gated-clock and 64 non-optimal hold-connection warnings. Methodology retains 64 TIMING-17 critical warnings for asynchronous arbiters. They are documented rather than downgraded. Entrance, feedback and arbiter modeled delay mismatches remain separately reported; matching internal routes is not proof of complete analog symmetry.

This preserves the existing Figure 1 interpretation. It does not resolve the paper's AND/NAND discrepancy, unpublished exact two-LUT stage mapping, or full configuration-space coverage. It also uses 64 cores rather than the paper's 128. Board balance, per-core variation, correlation and independent-session repeatability must be measured before promotion to a final experimental baseline. Completion status is not a measured activity flag.
