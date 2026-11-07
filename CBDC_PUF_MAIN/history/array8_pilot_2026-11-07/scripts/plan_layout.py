"""Find real translated footprints with the original relative site types."""
import csv,re
from pathlib import Path
root=Path(__file__).resolve().parents[1]
sites={}
for row in csv.DictReader((root/'sites.csv').open()):
 m=re.fullmatch(r'SLICE_X(\d+)Y(\d+)',row['name'])
 if m:sites[tuple(map(int,m.groups()))]=row['type']
footprint=[(x,y) for x in (0,4) for y in range(18)]+[(2,16),(2,18)]
template={(dx,dy):sites[21+dx,100+dy] for dx,dy in footprint}
layout=[(21,100)]
for x,y in sorted(sites,key=lambda p:(p[1],p[0])):
 if len(layout)==8:break
 if any(not (x+6<a or a+6<x or y+20<b or b+20<y) for a,b in layout):continue
 if all(sites.get((x+dx,y+dy))==typ for (dx,dy),typ in template.items()):layout.append((x,y))
assert len(layout)==8, 'No eight legal footprints found; reconsider geometry explicitly'
target=root/'layout.tcl'
if target.exists():raise SystemExit('Preserve existing layout')
target.write_text('\n'.join('{%d %d}'%p for p in layout)+'\n')
print('Valid, separated translated footprints:',layout)
