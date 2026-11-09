from pathlib import Path
import csv,sys
r=Path(__file__).resolve().parents[1];b=r/'build';rows=[];seen=set()
src=b/'audit_refined' if '--refined' in sys.argv else b
for i in range(4):
    done=list(map(int,(src/f'net_delays_shard_{i}.complete').read_text().split()))
    rr=list(csv.DictReader((src/f'net_delays_shard_{i}.csv').open(newline='')))
    assert done[0]==i and done[2]==len(rr), 'Incomplete shard'
    for row in rr:
        k=(row['driver'],row['sink'])
        assert k not in seen,'Duplicate shard arc'
        seen.add(k)
    rows+=rr
with (b/'net_delays.csv').open('w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
print('Merged complete delay audit:',len(rows),'unique signal arcs')
