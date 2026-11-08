"""Rank physical boundary mismatches, independently of measured output balance."""
from pathlib import Path
import json,csv
r=Path(__file__).resolve().parents[2];out=Path(__file__).resolve().parent
d=json.loads((r/'build/route_summary.json').read_text());layout=json.loads((r/'layout.json').read_text());targets=[]
for core in range(64):
 for kind in ('launch','arbiter','feedback'):
  s=d['boundary_skews'][str(core)][kind]
  targets.append(dict(core=core,boundary=kind,slow_skew_ps=s['slow_max_ps'],fast_skew_ps=s['fast_min_ps'],
      worst_corner_skew_ps=max(s.values()),upper_x=layout[core]['upper_x'],lower_x=layout[core]['lower_x'],head_y=layout[core]['head_y'],
      tile_type=layout[core]['tile_type']))
targets.sort(key=lambda r:r['worst_corner_skew_ps'],reverse=True)
with (out/'boundary_route_targets.csv').open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=list(targets[0]));w.writeheader();w.writerows(targets)
print('Largest physical boundary mismatches:',targets[:6])
