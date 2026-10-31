# Single-instance CBDC-PUF: Milestone 1

This project follows Figure 1 and Equations (1)-(3) of Liu et al.,
"CBDC-PUF: A Novel Physical Unclonable Function Design Framework Utilizing
Configurable Butterfly Delay Chain Against Modeling Attack", ACM TODAES (2023),
DOI: https://doi.org/10.1145/3588435.

## Supported baseline and paper ambiguities

The baseline has two cross-coupled, 16-element chains, AND entrance gates,
and a negative-edge arbiter with D=Qu, C=Qb, CE=Latch. Style P uses a buffer
LUT2, inverter LUT2 and selector LUT3 for each element. The selected mux arc
and routing are part of the effective path delay. This is an FPGA engineering
interpretation, not a claim to reproduce the authors' undisclosed LUT netlist.

The paper specifies AND gates in Figure 1/Section 3.1, but NAND2 primitives
in Section 4.1. Its resource totals imply two LUT2s per element without giving
their INIT values/interconnections. Its prose also refers to falling Qu as the
capture event, whereas the figure clocks the arbiter with Qb. We follow the
figure, timing captions and equations. FDCE_1 is a legacy primitive supported
by the installed AMD retarget library (FDCE with inverted C).

**Challenge domain:** the AND baseline accepts only odd-parity 16-bit challenges
(32,768 values). Even-parity challenges initialize to Qu=Qb=0 and cannot launch
the intended race. The experimental NAND configuration accepts even parity.
These complementary experiments do not provide 65,536 usable races in one
fixed configuration. No undocumented parity remapping or gate-switching scheme
is inserted to conceal this inconsistency with the paper's full-domain claim.

Style 2LUT (buffer followed by XOR) and same-side feedback remain explicit
experiments. Neither is the baseline or established as equivalent to the paper.
SHA-3, 128 instances, BCH correction and board communication are outside this
single raw-response milestone. No modeling-attack resistance is claimed.

## RTL interfaces

- `rtl/cbdc_puf_top.v`: controller/core integration; use this for integration
  checks. It shares GATE_INIT between the core and admission policy, and fixes
  Style P/cross-coupling. It is not a Basys 3 switch/button/pin wrapper.
- Inputs `start_i`, `challenge_i`, and synchronous active-low `rst_n` must meet
  the system clock's setup/hold requirements. Pulse start for one clock while idle.
- Supported requests latch the challenge, assert busy, clear and initialize the
  arbiter, excite the chains, enable capture, disable capture, flush the response
  synchronizer, then emit a one-cycle `resp_valid_o` with `resp_bit_o`.
- Unsupported challenges emit one-cycle `request_error_o`; busy stays low and
  no valid response is emitted. The previous response bit may remain on the bus;
  consumers must honor valid/error. Requests while busy are ignored.
- `resp_valid_o` denotes completion of the supported timed protocol. It does not
  prove a physical Qb edge occurred. No extra monitor loads are added to Qu/Qb.
  Capture availability is checked hierarchically in simulation and must be
  investigated later for the placed/routed circuit.
- Cycle parameters must be 1..65,536, with HOLD_CYCLES at least 3. Default hold
  is 4 cycles. ASYNC_REG and SHREG_EXTRACT attributes mark the two readout flops.
  Physical CDC/timing checks remain necessary; synchronizers reduce, not remove,
  metastability risk. Unsupported parameter values fail HDL simulation.

## Reproducible HDL checks (no synthesis)

From PowerShell at the project root:

```powershell
.\scripts\run_sim.ps1
.\scripts\run_vendor_sim.ps1
```

Both accept `-VivadoBin` to override the installed simulator directory.
Outputs go to ignored `build_sim/`. These scripts invoke xvlog, xelab and xsim
only; they do not launch synthesis, implementation, hardware manager or Vivado GUI.
XSim may return exit code zero after HDL `$fatal`; the runners also inspect logs
and require explicit completion markers.

The artificial suite covers exhaustive LUT truth tables, both element styles,
arbiter edge/enable/clear/unknown behavior, independent equation examples,
controller admission/readout/reset, invalid parameter rejection, and all 65,536
challenges for BOTH fixed gate variants. The sweep checks initial states,
quiescence for unsupported parity and multiple capture edges plus response zero
under its known upper-faster artificial profile. Other profiles exercise both
response signs. It does not measure physical uniqueness or randomness.

The isolated vendor suite uses AMD's actual LUT2/LUT3/FDCE/FDCE_1/glbl sources.
It checks element truth tables and arbiter edge/enable/clear, and elaborates the
integrated top. It intentionally does not run a zero-delay feedback race.
Custom primitive models are never mixed into that library/work directory.

## Simulation model limitations

Default LUT models use artificial transport delays. Optional TRANSPORT=0 uses
continuous-assignment inertial delays; rise_extra_ps/fall_extra_ps allow edge
asymmetry experiments. A unit test demonstrates a short pulse being transported
by one model and rejected by the other. Neither model is calibrated to silicon.
There is no analog metastability, routing, slew, loading or setup/hold model.
Previously scheduled events retain their old delay: stop excitation and drain
the old profile before loading a new one.

The reference model implements the equation sums plus explicit mux delays.
Set mux arrays to zero if phi/psi already include them. Array changes trigger
automatic recalculation. Wait for initialized_o before loading profiles.
Unknown challenges propagate unknown results. startup_eligible_o is a startup
classification, not an oscillation prediction. The complete cross-coupled loop
has even inversion parity and admits stable states; physical pulse survival and
the usable latch window remain unresolved by Boolean logic.
Equation (3)'s equality convention is zero mathematically, not a physical
guarantee for a zero/near-zero delay difference.

## Next stage: controlled Vivado synthesis audit

When beginning that stage, run:

```powershell
vivado -mode batch -source scripts/run_m1_vivado.tcl
```

The script defaults to Style P. Add `-tclargs --compare-2lut` only for the
experimental resource comparison. Each variant has its own in-memory project.
It targets xc7a35tcpg236-1, reads RTL only, checks counts, INITs, connectivity
and arbiter polarity, writes reports/netlist/checkpoint, then separately
synthesizes the integrated top with a 100 MHz controller clock constraint.
Strict structural checks fail if Vivado maps unexpected names/cells: inspect
that netlist rather than weakening checks without evidence.

Expected core-only Style P count: 66 LUT2 + 32 LUT3 + one FDCE (possibly a
retarget clock inverter before optimization). Style 2LUT: 66 LUT2 + one FDCE.
Controller logic is not included in these core counts.

The script has NOT yet been validated by a synthesis run. Generated loop/CDC/DRC
reports require review. No blanket combinational-loop waiver or fabricated clock
on Qu/Qb is supplied. DONT_TOUCH does not provide symmetric placement or routing.

Before place-and-route/bitstream: inspect mapped structure and clock polarity,
choose explicit placement/routing/pin constraints, analyze intentional feedback
and CDC, and add a proper Basys 3 board wrapper with synchronized user inputs.
Before claiming a working PUF: measure capture availability, bias, repeatability,
environmental behavior and multi-instance/device variation on actual hardware.
Code-level checks alone cannot establish those properties or exact reproduction
of the paper's unspecified physical implementation.
