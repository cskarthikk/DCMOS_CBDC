# Basys 3 board integration

Files added: rtl/cbdc_button.v, rtl/cbdc_puf_basys3.v,
constraints/basys3.xdc, constraints/puf_feedback_acknowledge.xdc,
sim/tb_cbdc_basys3.v, scripts/run_board_sim.ps1.

Pin source: Digilent's official Basys-3-Master.xdc:
https://github.com/Digilent/digilent-xdc/blob/master/Basys-3-Master.xdc
Clock W5, centre button U18, up button T18, switches and LEDs follow its indices.
The XDC uses LVCMOS33, CONFIG_VOLTAGE=3.3, CFGBVS=VCCO.

## Interface

Set SW15..SW0, wait at least 50 ms (LD4 ready), then press BTNC.
Keep switches fixed while pressing. Button levels and the switch bus must remain
stable for 10 ms after synchronization. Multi-bit switch changes are not atomic;
the readiness indication and user procedure are necessary. One held centre-button
press creates one request. Requests while busy are ignored, not queued.
BTNU clears status and resets the controller after debounce. Reset aborts a query.
Release both buttons before submitting again.

LEDs: LD0 last response; LD1 completed response (sticky); LD2 request error
(sticky); LD3 busy (usually too brief to see); LD4 switches settled. LD15..LD5 off.
Completion and error clear on the next accepted button press or reset.
The response bit can legitimately be zero, so use LD1 to distinguish completion.
LD1 means protocol completion, not a physical capture-occurrence guarantee.
Even-parity challenges produce LD2 under the default AND architecture.

## Validation performed

2026-10-31: scripts/run_board_sim.ps1 passed using AMD xvlog/xelab/xsim 2025.2
and artificial PUF primitive delays. It exercises startup, short bounce rejection,
one request for a held button, challenge capture, switch changes after capture,
odd-parity completion, even-parity rejection, persistent status, reset and restart.
The hardware-default 10 ms interval is shortened by a parameter in simulation.
No synthesis, placement, routing, bitstream generation or hardware testing was
performed for this board wrapper. Existing user-created Vivado project files were
not edited by this change.

## Next GUI checkpoint

1. Add cbdc_button.v and cbdc_puf_basys3.v as design sources (no copies).
2. Set cbdc_puf_basys3 as top. The existing five RTL files stay in the project.
3. Remove controller_ooc.xdc from the PROJECT only (keep the disk file).
4. Add constraints/basys3.xdc. Do not add the optional feedback acknowledgement yet.
5. Keep flatten_hierarchy=none. Run synthesis; accept resetting the old run if asked.
6. Open synthesized design and inspect reports. Core path is now u_puf/u_core.
   Expected core count: 66 LUT2, 32 LUT3, one FDCE. Board totals increase.
7. Save DRC, timing summary and synthesized netlist under build_m1/board_synth.
   The 98-LUT feedback and LUT-driven arbiter clock warnings may remain.
   NSTD-1, UCIO-1 and CFGBVS-1 should be resolved. Constraint-object matching
   warnings require investigation. LED output paths remain externally untimed
   because the LEDs do not have an external sampling clock.

Stop for review before implementation. No board connection is needed yet.

## Physical constraints and limits

The board XDC constrains pins and cuts asynchronous inputs ONLY to the first
synchronizer stages; it does not waive the PUF loop or declare a fictitious Qb
clock. Timing between synchronizer stages remains enabled.

puf_feedback_acknowledge.xdc is staged separately for later deliberate use after
reviewing the board-top loop. It acknowledges one exact feedback net and does
not alter DRC severity. It is not a placement or routing constraint.

No arbitrary LOC/BEL/route assignments have been invented. The paper's symmetric
placement and approximately equal routing require device-view site selection and
routed-path inspection. Ordinary automatic implementation can demonstrate tool
feasibility but cannot establish a paper-equivalent physical PUF. Plan and review
the matched placement/routing before accepting a physical experiment or bitstream.
