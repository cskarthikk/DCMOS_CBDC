# Investigation of 64-core bias — 8 November 2026

## Completed controlled experiment

The original bitstream was retained, with the same 256 configuration vectors, 20 repeats and eight excitation cycles. Two new full hardware captures were collected on COM5, without reprogramming, RTL edits, filtering, SHA or correction. Capture completeness, configuration readback, response-word consistency and matching matrices were checked.

| Condition | Capture | Ones | Ones percentage |
|---|---|---:|---:|
| Original Parallel | `array64_d6b683d0f03d41c7913043d136cb1ac6.csv` | 117860 | 35.9680% |
| Sequential | `array64_14d52da92d9d4ac5974e90a816bba236.csv` | 117962 | 35.9991% |
| Repeat Parallel | `array64_2968e152ce2d4b4ea46fc1d0e6510e91.csv` | 117795 | 35.9482% |

Each capture contains 5120 frames / 327680 raw core observations. All files and their exact matrices/metadata are under `../../measurements/new/`. SHA256 file identities and detailed results are preserved in the `RESULTS_*.json` files in this directory.

The per-core balance correlation between original Parallel and Sequential is 0.99957. Median absolute balance change is 0.430 percentage points; the maximum is 2.852 points. Between the two Parallel sessions the correlation is 0.99986, median change 0.264 points and maximum 1.133 points.

There are 158 strict-majority changes across 16312 comparable core/vector positions between original Parallel and Sequential. The two Parallel captures also have 121 majority changes across 16309 comparable positions. Sequential versus repeat Parallel has 138 across 16305. Tied positions are excluded explicitly. These counts are not certified reliability or error rates against a known noiseless reference.

**Conclusion:** severe per-core bias is persistent and is not explained mainly by exciting all 64 cores simultaneously in this experiment. Small mode effects remain possible: the mode comparisons have somewhat larger differences than the Parallel repeat. A sequential implementation should not be presented as the bias fix.

## Physical evidence

All 4096 internal paired net-delay comparisons in the saved implementation match at the two reported corners. Boundary paths were not fully balanced. Across the 64 core locations, signed excitation imbalance correlates with ones percentage at r=0.8174; signed arbiter D-minus-C imbalance correlates at r=0.7945. The corresponding Sequential correlations are 0.8130 and 0.7913. These associations are observational, with placement/tile/process confounders, not proof of causality.

| Core | Original Parallel ones | Sequential ones | Arbiter D−C slow delay | Upper−lower excitation slow delay |
|---|---:|---:|---:|---:|
| 30 | 0.4297% | 0.3906% | −517 ps | −25 ps |
| 13 | 0.8008% | 1.2891% | −215 ps | −93 ps |
| 41 | 1.5820% | 1.8359% | −256 ps | −25 ps |
| 48 | 92.3633% | 92.8320% | +31 ps | +292 ps |
| 61 | 87.9492% | 87.9102% | +51 ps | +281 ps |

Core 30 has a majority-one response for only one of the 256 tested vectors in both the original Parallel and Sequential captures. Core 13 has only two majority-one vectors in the original capture. Thus, the rare ones do not imply useful, well-balanced challenge sensitivity. No claim of measured oscillation liveness is made.

## Next hardware correction

The next implementation experiment should address excitation and arbiter boundary routing, retaining the complete 64-core circuit and existing 6144 fixed internal nets. `boundary_route_targets.csv` ranks all 192 boundary comparisons by the worse reported timing-corner mismatch, independently of measured response balance. Core 30's arbiter connection is the first target. Excitation imbalance at cores 48 and 61 also needs explicit attention; adjusting only arbiter position would leave that separate issue unresolved.

Build the correction as a separate candidate. Preserve this bitstream and all captures as the comparison checkpoint. Change only boundary routing or associated physical locations, retain one arbiter/core, the same RTL and capture timing, and recheck structure, all internal pairs, route legality and synchronous timing. Keep boundary residuals visible. Select route alternatives using physical-delay evidence, not response inversion, balanced-output filtering or output-based choice of challenges. Then compare the candidate on the saved matrix and a separate fresh challenge set before enrollment.

**Status:** the controlled diagnosis and physical target ranking are complete. Boundary rerouting and its hardware validation are not implemented in this investigation. The current bitstream remains the working comparison checkpoint, not a qualified final PUF baseline.
