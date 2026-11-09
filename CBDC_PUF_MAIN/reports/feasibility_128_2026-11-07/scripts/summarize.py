import csv,hashlib,json,re
from pathlib import Path
r=Path(__file__).resolve().parents[1];main=r.parents[1]
text=(r/'utilization_128.rpt').read_text()
def resource(label):
 for line in text.splitlines():
  fields=[p.strip() for p in line.split('|')]
  if len(fields)>5 and fields[1].rstrip('*')==label:
   return dict(used=int(fields[2].replace(',','')),available=int(fields[5].replace(',','')))
 raise ValueError(label)
lut=resource('Slice LUTs');ff=resource('Slice Registers');placement=json.loads((r/'placement_capacity.json').read_text())
result=dict(luts=lut,registers=ff,placement=placement,
 synthesis_scope='Independent 128-core scaling model with existing per-core controllers, 2048-bit configuration/readback and raw 128-bit UART serialization; no BCH/SHA3. Synthesis only.',
 decision='Do not implement 128 unchanged protected macros on this board. Plan a 16-core prototype or a separately redesigned compact macro/controller architecture.',
 files={p.relative_to(r).as_posix():hashlib.sha256(p.read_bytes()).hexdigest().upper() for p in r.rglob('*') if p.is_file() and p.suffix in ('.v','.tcl','.py','.rpt','.csv','.log','.dcp')})
(r/'RESULTS.json').write_text(json.dumps(result,indent=2)+'\n')
report=f'''# 128-core feasibility assessment - 7 November 2026

**Decision: a direct 128-copy expansion of the current protected design is not feasible on the Basys 3.** Keep the measured eight-core release and frozen enrollment intact. A 16-core prototype is the sensible next hardware milestone if we retain this physical macro.

## Actual synthesis estimate

| Resource | 128-core model | Target available | Utilization |
|---|---:|---:|---:|
| LUTs | {lut['used']} | {lut['available']} | {100*lut['used']/lut['available']:.2f}% |
| Flip-flops | {ff['used']} | {ff['available']} | {100*ff['used']/ff['available']:.2f}% |

This is a separately generated scaling model, not a multiplication of the eight-core utilization table. It retains 128 independent PUFs, per-core controllers, actual configuration readback, parallel/sequential control and a widened UART serializer. Simulation checks the eight-core-compatible behavior and the full 2048-bit configuration /128-bit raw response transport at N=128. These are digital tests with artificial/controlled responses, not silicon evidence.

No placement, routing, bitstream generation or board programming was attempted for 128 cores. A synthesis resource estimate alone cannot prove physical fit, clock/routing closure, balance or reliability. BCH and SHA3 logic are absent and would need a further budget. A shared controller could change the logic budget; its implementation is not evaluated here.

The estimated LUT use exceeds the part limit by **{lut['used']-lut['available']} LUTs**, even before BCH/SHA3. Synthesis retained all 128 FDCE response registers and reported intentional timing-loop critical warnings (Synth 8-295); completing synthesis is not an implementation pass. The full warning log is retained. Per-core controller duplication and the widened configuration/response interface contribute to the logic budget; no claim is made that every possible 128-core architecture would exceed it.

## Physical footprint is a separate hard limit

The frozen macro reserves a 5-column x17-row exclusion region: 85 slice sites per core. Vivado's site inventory and utilization report expose 8150 slice sites, while the part's available LUT/register counts are 20800/41600; do not infer LUT availability by multiplying the slice-site inventory by four.

128 disjoint copies of the current protected rectangle would reserve **10880 sites**, exceeding even that optimistic 8150-site inventory before external logic is considered. Its area-only upper bound is 95 rectangles, not a routability promise. This alone excludes 128 unchanged protected copies.

The stricter search also holds the current chain tile type, slice type, within-tile orientation, 4-column chain separation and clock-region-contained footprint fixed. It finds 417 translated candidate origins. These origins overlap and are not 417 usable cores. The compatible x strips form independent components in which every pair of 5-column intervals overlaps; maximum non-overlapping equal-height interval scheduling yields **18 non-overlapping footprint slots** under these assumptions. The guarded plan also has 18 and preserves the existing eight origins. This is a limit for the specified profile, not a universal maximum number of PUFs on the device.

No candidate placement plan has been passed through a new complete place/route flow. Router-node conflicts, control placement and timing could reduce the practical number. Existing evidence shows that matching site/BEL labels is insufficient; actual delays and route legality must be rechecked after building.

## Recommended next step

Use `candidate_16_layout.tcl` / `candidate_16_placement.csv` as the starting plan for a separate **16-core candidate**. It preserves the current eight macro coordinates and adds eight checked geometric locations. There are two unused slots in the guarded plan, rather than committing to its edge. This is a plan, not a tested 16-core bitstream. Extending the design can change routes and responses even at unchanged coordinates, so the 16-core candidate needs its own characterization/enrollment/confirmation.

Reaching 128 physical cores would require one or more of: a more compact/interleaved validated macro and reservation policy, reduced duplicated control/serialization logic, or a larger FPGA. Those are new implementation choices and need their own paper traceability and physical/hardware validation. Do not silently remove placement protection or matched routes just to force utilization to fit. Eight or sixteen cores queried repeatedly do not constitute 128 physical cores as used by the paper.

Keep the current eight-core implementation as the working, independently confirmed development checkpoint. Preserve its real 109/37080 selected-bit disagreement result for later reconstruction/error-correction design; this feasibility exercise does not change or correct those measurements.

## Reproducible evidence

- `rtl/cbdc_array_resource.v`, `scripts/generate_model.py`: resource-estimation model and derivation from frozen source.
- `utilization_128.rpt`, `hierarchy_128.rpt`, `resource_128.dcp`, `synthesis.log`: Vivado synthesis evidence.
- `device_capacity.rpt`, `site_availability.csv`: actual target checkpoint resource/site inspection.
- `scripts/placement_capacity.py`, `placement_capacity.json`: explicit search assumptions and geometry results.
- `guarded_placement_plan.csv`, `candidate_16_layout.tcl`, `candidate_16_placement.csv`: candidate-only layouts.
- `model8_test.log`, `model128_test.log`: digital simulation evidence; no hardware claims.
- `RESULTS.json`: resource numbers and hashes of analysis sources/evidence.

All artifacts are under the main folder's generated reports area. No frozen RTL, bitstream, mask, package manifest or enrollment data was edited. No board interaction was needed.
'''
(r/'FEASIBILITY_REPORT.md').write_text(report,encoding='utf-8')
print('128-core synthesis:',lut,ff)
print('Report:',r/'FEASIBILITY_REPORT.md')
