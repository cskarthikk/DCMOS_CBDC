# Verification record - 2026-10-31

## Result

The corrected single-instance baseline passes the code-level checks below and
is ready for the next controlled Vivado synthesis/netlist-review stage.
It is not yet validated for placement/routing, bitstream generation or physical
PUF operation. Exact reproduction of unspecified paper implementation details
cannot be certified. See README.md for the explicit paper/engineering boundary.

## Executed successfully

Tool: installed AMD Vivado Simulator 2025.2 (xvlog/xelab/xsim only).

| Check | Result | Evidence under build_sim/ |
|---|---|---|
| Artificial models, RTL and testbench compile | PASS | compile.log |
| Exhaustive LUT2/LUT3 INIT indexing, both element styles | PASS | tb_cbdc_units-run.log |
| Falling-edge arbiter, enable, clear priority, unknown controls and reset/clock coincidence | PASS | tb_cbdc_units-run.log |
| Independent positive/negative/equality equation examples and automatic profile updates | PASS | tb_cbdc_units-run.log |
| Transport versus inertial short-pulse behavior and unequal edge delays | PASS | tb_cbdc_units-run.log |
| AND/NAND admission, phase durations, hold/synchronizer readout, repeated requests, busy-ignore, reset abort | PASS | tb_cbdc_ctrl-run.log |
| Original seven stages, strengthened assertions | PASS, 0 errors | tb_cbdc_puf_m1-run.log |
| All 65,536 challenges for both fixed gate variants | PASS; 32,768 active in each variant | tb_cbdc_puf_m1-run.log |
| Reject HOLD_CYCLES=2 | PASS (expected fatal, not a normal successful simulation) | tb_invalid_params-run.log |
| Actual AMD primitive compilation, isolated from custom models | PASS | vendor/compile.log |
| Integrated top elaboration against AMD primitives | PASS | vendor/top-elaborate.log |
| Actual AMD element truth tables and FDCE_1 polarity/enable/clear | PASS | vendor/run.log |
| PowerShell runner parsing | PASS | Parser check performed locally |
| Tcl command/bracket completeness | PASS, syntax completeness only | check_tcl.tcl |
| git diff --check | PASS | No whitespace errors |

The sweep checks BOTH chain outputs during initialization, per-challenge
activity classification, multiple edges in the latch window for eligible
challenges, and a captured zero for its known upper-faster delay profile.
It does not mean the default AND core supports all 65,536 challenges. Separate
delay profiles check both response signs across 18 profile/challenge cases.

## Additional defects found and corrected during testing

- Old transport-delay events remained scheduled when switching to the compact
  exhaustive-sweep profile. The test now disables excitation and drains the old
  profile before changing delays.
- A stage-level success message could print despite an earlier error in the
  same sweep. The message now checks the stage error baseline.
- Conservative DFF unknown handling needed to distinguish uncertain falling
  edges from clear release coincident with a rising edge; both are now tested.
- XSim can exit with process status zero after an HDL fatal. The runners inspect
  the log and require a completion marker, rather than trusting exit status alone.

The installed Icarus compiler exited abnormally even on a trivial smoke program;
its generated artifacts are not used as successful compiler evidence. Final
results above come from AMD's installed simulator. Its generated-C compilation
required execution outside the restricted sandbox; no synthesis was run.

## Not executed / still required

- The synthesis Tcl script has been statically reviewed, not executed against a
  synthesized design. Its strict mapping/name/property checks need validation
  on the first synthesis run; do not treat syntax completeness as runtime proof.
- No synth_design, opt_design, place_design, route_design, write_bitstream,
  hardware-manager operation or FPGA programming was performed.
- No physical placement/routing symmetry, timing closure, CDC MTBF, pulse
  survival, capture-window duration, randomness, uniqueness, repeatability or
  environmental robustness has been established.
- The paper's AND/NAND discrepancy, undisclosed two-LUT mapping and claim of
  full challenge-domain operation remain documented ambiguities.
- The single arbiter has no extra hardware capture-occurrence monitor. Adding
  one would change the critical Qb loading and the paper's one-DFF structure.
  Response-valid is protocol completion; physical capture availability remains
  a next-stage acceptance criterion.
- Board pins, I/O standards, input conditioning, communication, SHA-3, BCH and
  the 128-instance framework are not part of this raw-core milestone.

Reproduce the successful checks with scripts/run_sim.ps1 and
scripts/run_vendor_sim.ps1. Both place generated files under ignored build_sim/.
