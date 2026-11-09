"""Maximum-cardinality, minimum-distance chain pairing; no response-based tuning."""
from pathlib import Path
import csv,json,re,collections,functools,sys
r=Path(__file__).resolve().parents[1]
rows=list(csv.DictReader((r/'sites.csv').open()))
rows=[s for s in rows if s['prohibit'].lower() not in ('1','true')]
sites={tuple(map(int,re.fullmatch(r'SLICE_X(\d+)Y(\d+)',s['site']).groups())):s for s in rows}
for limit in (6,8,10,12,16):
 plan=[];used=set()
 for y in (1,22,51,72,101,122):
  valid={x:sites[x,y]['tile_type'] for x in range(1,66,2) if all((x,b) in sites for b in range(y,y+17))}
  @functools.lru_cache(None)
  def solve(i,cm,am):
   if i>=33:return (0,0,())
   best=solve(i+1,cm>>1,am>>2)
   x=2*i+1
   if cm&1 or x not in valid:return best
   for delta in range(1,limit//2+1):
    z=x+2*delta;ax=x+delta
    if z not in valid or valid[z]!=valid[x] or (cm>>delta)&1 or (am>>delta)&1:continue
    if any((ax,b) not in sites for b in (y-1,y+17)):continue
    n,c,p=solve(i+1,(cm|(1<<delta))>>1,(am|(1<<delta))>>2)
    cand=(n+1,c+2*delta,((x,z,ax),)+p)
    if (cand[0],-cand[1])>(best[0],-best[1]):best=cand
   return best
  for x,z,ax in solve(0,0,0)[2]:
   fp={(a,b) for a in (x,z) for b in range(y,y+17)}|{(ax,y-1),(ax,y+17)}
   if used&fp:raise ValueError('Unexpected footprint overlap')
   used|=fp;plan.append(dict(core=len(plan),upper_x=x,lower_x=z,head_y=y,arbiter_x=ax,tile_type=valid[x]))
 print('Maximum separation',limit,'gives',len(plan),'compatible macros')
 if len(plan)>=64:break
print('Short-distance candidate macros:',len(plan),'max separation:',max(s['lower_x']-s['upper_x'] for s in plan))
if len(plan)<64:raise SystemExit('Insufficient short-distance pairs')
indices=[i*(len(plan)-1)//63 for i in range(64)]
plan=[dict(plan[j],core=i) for i,j in enumerate(indices)]
(r/'layout_compact_proposal.json').write_text(json.dumps(plan,indent=2)+'\n')
if '--apply' in sys.argv:
 if (r/'BUILD_RECORD.json').exists():raise SystemExit('Preserve finalized candidate')
 (r/'layout.json').write_text(json.dumps(plan,indent=2)+'\n')
 (r/'layout.tcl').write_text('\n'.join('{%s %s %s %s %s}'%(s['upper_x'],s['lower_x'],s['head_y'],s['arbiter_x'],s['tile_type']) for s in plan)+'\n')
 with (r/'placement.csv').open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(plan[0]));w.writeheader();w.writerows(plan)
 print('Applied compact layout; no hardware bitstream programmed.')
