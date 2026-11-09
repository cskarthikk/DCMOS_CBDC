# Longer capture-window diagnostic

This is an experiment, not the selected project baseline. It overrides only the controller instantiation's LATCH_CYCLES from8 to64. PUF element, chain, core, controller definition, protocol and excitation settings are retained. No SHA, BCH, output inversion or selection is used.

The simulator confirms640ns Latch enable and captures a late edge across all64 controllers. Place/route succeeds, with15039/15039 routable nets routed, zero routing errors, setup slack +0.677ns and hold +0.029ns. The same asynchronous warnings remain documented.

Physical review verifies6656 referenced cell locations/pin mappings and6272 PUF signal-route trees/endpoints against the original64 checkpoint. All internal signal paths and terminal/feedback paths are preserved. The old4096-pair numeric net-delay audit is reused only on that physical-identity basis; it is not a new4096-pair extraction. Ordinary routing changes remain: up to14ps at excitation and122ps at Latch enable; reset clear changes by up to2ps. See build/boundary_comparison.json.

## Hardware result

The experiment directory is experiments/run_8ca2f2a5986c46808aa476759f9fa56c. All conditions use the same64 configuration vectors and20 repeats. It contains seven full captures,573440 raw bits, exact matrices, metadata and programming logs. RESULTS.json and per_core.csv contain the validated analysis.

| Wait | Capture window | Closing time after excitation, in cycles | Ones |
|---:|---:|---:|---:|
|8 baseline before|8|16|36.768%|
|8|64|72|59.725%|
|32|64|96|61.307%|
|71|64|135|62.444%|
|127|64|191|63.490%|
|8 repeat|64|72|59.606%|
|8 baseline restored|8|16|36.918%|

The long-window wait8 versus wait127 comparison has163 majority changes/4087 comparable positions (3.988%). Its wait8 repeat has38/4087 (0.930%). This does not demonstrate timing independence.

Equal-stop-time comparisons are informative. The old short-window setting wait64/window8 also closes at72 cycles and yielded59.879% ones. Its majority responses differ from wait8/window64 in54/4082 positions (1.323%), with24 zero-to-one and30 one-to-zero changes. Old wait127/window8 closes at135 cycles and yielded62.579%; it differs from wait71/window64 in58/4078 positions (1.422%), with24 zero-to-one and34 one-to-zero changes.

These results support the interpretation that elapsed observation/closing time accounts for much of the effect. They do not establish that missing falling edges in the old window are the primary cause. Actual waveforms remain unmeasured, and the small control-route differences and separate capture sessions limit causal certainty.

**Decision: do not promote this as a complete fix or as a near-balanced setting.** The original64 bitstream was restored and replayed after this experiment. Preserve this diagnostic for evidence. A separate arbiter-row placement trial is being investigated before the user's requested fixed-clock calibration fallback.
