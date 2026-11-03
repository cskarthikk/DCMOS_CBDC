# Initial physical implementation plan

The paired placement is an engineering starting point, not the authors' hard macro.
Upper/lower use SLICE_X20Y100..116 and SLICE_X21Y100..116 respectively.
Device checkpoint query confirmed SLICEL sites in corresponding CLBLL_L tiles.
Each head uses A6LUT; each element uses A6LUT(buffer), B6LUT(inverter),
C6LUT(mux). Corresponding LUT input positions are locked identically.
All 98 LUTs have LOC/BEL/LOCK_PINS. The arbiter remains placer-selected.
No controller logic is added to the PUF feedback. No routes are locked yet.

Files: constraints/puf_paired_placement.xdc and puf_feedback_acknowledge.xdc.
The latter now uses supported XDC commands only and acknowledges one exact net.
Add both as implementation-only constraints (USED_IN_SYNTHESIS false).
Keep basys3.xdc enabled for both synthesis and implementation.
Run implementation to route_design; do not generate a bitstream at this checkpoint.

Inspect actual placement, route completion, DRC, controller timing and paired route
lengths/delays before accepting this layout. Same-type slices, BELs and input maps
reduce some systematic differences but do not establish matched routing, pulse
survival, a usable arbiter capture window, or a working PUF. Do not bypass a clock
routing failure or other DRC by broad severity changes. Post-route results may
require changing the placement or routing strategy.

## Subsequent routing experiment (2 November 2026)

The device database later showed that X20 and X21 are different slice positions
inside one CLBLL_L tile, with different wire access. Being SLICEL on both sides
was insufficient to establish equivalent routing. A separate experiment now
uses X21 and X25, copies the 48 internal route patterns, and places the arbiter
near the chain ends. See `MATCHED_ROUTING_GUIDE.md` for results, boundaries of the
matching claim, and Vivado viewing/reproduction steps. The original placement
files and project remain the baseline; do not combine their constraints with
the exported experimental constraints.
