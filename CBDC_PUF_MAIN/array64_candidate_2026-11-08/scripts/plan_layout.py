from pathlib import Path
import csv,json,re
r=Path(__file__).resolve().parents[1]
rows=list(csv.DictReader((r.parent/'history/paper_alignment_audit_2026-11-07/evidence/site_tiles.csv').open()))
sites={tuple(map(int,re.fullmatch(r'SLICE_X(\d+)Y(\d+)',s['site']).groups())):s for s in rows}
used=set();plan=[]
for y in (1,22,51,72,101,122):
    pairs=[]
    for x in range(1,66,2):
        for z in range(x+2,min(x+17,66),2):
            if any((a,b) not in sites for a in (x,z) for b in range(y,y+17)): continue
            if sites[x,y]['tile_type']!=sites[z,y]['tile_type']:continue
            ax=(x+z)//2
            if any((ax,b) not in sites for b in (y-1,y+17)):continue
            footprint={(a,b) for a in (x,z) for b in range(y,y+17)}|{(ax,y-1),(ax,y+17)}
            pairs.append((z-x,x,z,ax,footprint))
    for _,x,z,ax,footprint in sorted(pairs):
        if used&footprint:continue
        used|=footprint
        plan.append(dict(core=len(plan),upper_x=x,lower_x=z,head_y=y,arbiter_x=ax,tile_type=sites[x,y]['tile_type']))
print('Compatible compact macros:',len(plan))
if len(plan)<64:raise SystemExit('Insufficient compatible non-overlapping sites')
# Spread the 64 selected macros across the full proposed device area.
indices=[i*(len(plan)-1)//63 for i in range(64)]
plan=[dict(plan[j],core=i) for i,j in enumerate(indices)]
(r/'layout.json').write_text(json.dumps(plan,indent=2))
(r/'layout.tcl').write_text('\n'.join('{%s %s %s %s %s}'%(s['upper_x'],s['lower_x'],s['head_y'],s['arbiter_x'],s['tile_type']) for s in plan)+'\n')
with (r/'placement.csv').open('w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(plan[0]));w.writeheader();w.writerows(plan)
print('64 macros, unchanged core RTL, disjoint chain/arbiter/excitation sites.')
