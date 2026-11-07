"""Count feasible translations of the CURRENT protected routed footprint.

The count is not a proof of routability or a bound for redesigned macros.
"""
import csv,json
from pathlib import Path
r=Path(__file__).resolve().parents[1];main=r.parents[1]
sites={row['site']:row for row in csv.DictReader((main/'history/paper_alignment_audit_2026-11-07/evidence/site_tiles.csv').open())}
footprint=[(x,y) for x in (0,4) for y in range(17)]
template={(dx,dy):(sites[f'SLICE_X{21+dx}Y{100+dy}']['site_type'],sites[f'SLICE_X{21+dx}Y{100+dy}']['tile_type']) for dx,dy in footprint}
candidates=[]
for y in range(150):
 for x in range(1,66,2):
  if y//50 != (y+16)//50:continue
  rectangle=[f'SLICE_X{xx}Y{yy}' for xx in range(x,x+5) for yy in range(y,y+17)]
  if not all(s in sites for s in rectangle):continue
  if not all((sites[f'SLICE_X{x+dx}Y{y+dy}']['site_type'],sites[f'SLICE_X{x+dx}Y{y+dy}']['tile_type'])==t for (dx,dy),t in template.items()):continue
  candidates.append((x,y))
# Build a conservative guarded plan with the same guard rule as the current layout.
plan=[(21,100)]
for x,y in sorted(candidates,key=lambda p:(p[1],p[0])):
 if any(not(x+6<a or a+6<x or y+20<b or b+20<y) for a,b in plan):continue
 plan.append((x,y))
# Exact rectangle-capacity count when candidate x strips are disjoint.
xs=sorted({x for x,y in candidates});components=[]
for x in xs:
 if not components or x-components[-1][-1]>=5:components.append([x])
 else:components[-1].append(x)
cliques=all(max(c)-min(c)<5 for c in components)
exact_plan=[]
if cliques:
 for component in components:
  last=-1000
  for y,x in sorted((y,x) for x,y in candidates if x in component):
   if y>=last+17:exact_plan.append((x,y));last=y
actual_sizes=[]
for line in (main/'layout.tcl').read_text().splitlines():
 x,y=map(int,line.strip('{} ').split());actual_sizes.append(sum(f'SLICE_X{xx}Y{yy}' in sites for xx in range(x,x+5) for yy in range(y,y+17)))
assert actual_sizes==[85]*8
result=dict(device_slice_sites=len(sites),protected_sites_per_current_core=85,
 current_128_reserved_sites=128*85,optimistic_disjoint_area_bound=len(sites)//85,
 compatible_translation_count=len(candidates),compatible_x_strips=xs,
 exact_nonoverlapping_rectangles_for_current_tile_profile=len(exact_plan) if cliques else None,
 guarded_plan_count=len(plan),guarded_plan=plan,unguarded_area_optimal_plan=exact_plan,
 note='The 85-site exclusion rectangle and matching chain tile/slice orientation are held fixed. Bounds do not apply to a redesigned/interleaved/compacted macro. Candidate plans are not routed or hardware-validated.')
(r/'placement_capacity.json').write_text(json.dumps(result,indent=2)+'\n')
with (r/'guarded_placement_plan.csv').open('w',newline='') as f:
 w=csv.writer(f);w.writerow(['core','upper_x','lower_x','head_y','arbiter_x']);w.writerows((i,x,x+4,y,x+2) for i,(x,y) in enumerate(plan))
print(json.dumps(result,indent=2))
