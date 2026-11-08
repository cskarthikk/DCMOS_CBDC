"""Inspect available column profiles before choosing new translated macros."""
from pathlib import Path
import csv,collections,json
r=Path(__file__).resolve().parents[1]
rows=list(csv.DictReader((r/'sites.csv').open()))
byx=collections.defaultdict(list)
for s in rows: byx[int(s['x'])].append(s)
summary=[]
for x,ss in sorted(byx.items()):
    summary.append(dict(x=x,types=sorted(set(s['type'] for s in ss)),tiles=sorted(set(s['tile_type'] for s in ss)),ys=len(ss)))
(r/'column_profiles.json').write_text(json.dumps(summary,indent=2))
for s in summary:print(s)
