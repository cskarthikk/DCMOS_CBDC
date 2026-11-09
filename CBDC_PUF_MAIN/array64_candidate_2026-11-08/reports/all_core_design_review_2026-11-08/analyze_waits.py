from pathlib import Path
import csv,json,statistics
out=Path(__file__).resolve().parent
def index(path):
 v=json.loads(path.read_text(encoding='utf-8-sig'));return v if isinstance(v,list) else [v]
entries=index(out/'SWEEP_INDEX.json')
if (out/'SWEEP_LONG_INDEX.json').exists():entries+=index(out/'SWEEP_LONG_INDEX.json')
reference_matrix=json.loads((out/'first64_vectors.json').read_text());results=[];percore=[dict(core=i) for i in range(64)];reference=None
for condition,e in enumerate(entries):
 p=Path(e['csv']);meta=json.loads(Path(str(p)+'.metadata.json').read_text(encoding='utf-8-sig'))
 matrix=json.loads(Path(str(p)+'.challenges.json').read_text(encoding='utf-8-sig'));assert matrix==reference_matrix
 assert meta['excite_cycles']==e['excite_cycles'] and meta['cores']==64 and meta['repeats']==20 and meta['mode']=='Parallel'
 counts=[[0]*64 for _ in range(64)];seen=set()
 for row in csv.DictReader(p.open(newline='',encoding='utf-8-sig')):
  pat,trial,core,bit=[int(row[k]) for k in ('pattern','trial','core','response')]
  key=pat,trial,core;assert key not in seen;seen.add(key)
  assert 0<=pat<64 and 1<=trial<=20 and 0<=core<64 and bit in (0,1)
  assert int(row['challenge_hex'],16)==matrix[pat]['challenges'][core] and row['flags_hex']=='61'
  assert int(row['excite_cycles'])==meta['excite_cycles'] and row['mode']=='Parallel'
  assert (int(row['response_word_hex'],16)>>core)&1==bit
  counts[pat][core]+=bit
 assert len(seen)==81920
 majority=[[None if n==10 else int(n>10) for n in rr] for rr in counts]
 if reference is None:reference=majority
 comparable=sum(reference[p][c] is not None and majority[p][c] is not None for p in range(64) for c in range(64))
 changes=sum(reference[p][c]!=majority[p][c] for p in range(64) for c in range(64) if reference[p][c] is not None and majority[p][c] is not None)
 ones=sum(map(sum,counts));minor=sum(min(n,20-n) for rr in counts for n in rr)
 r=dict(condition=condition,wait=meta['excite_cycles'],ones=ones,ones_percent=ones/81920*100,minority_percent=minor/81920*100,
        mixed_positions=sum(0<n<20 for rr in counts for n in rr),ties=sum(n==10 for rr in counts for n in rr),
        majority_changes_vs_first8=changes,comparable_positions=comparable,source=str(p))
 results.append(r)
 for core in range(64):
  percore[core][f'step{condition}_wait{meta["excite_cycles"]}_ones_percent']=sum(rr[core] for rr in counts)/1280*100
  percore[core][f'step{condition}_minority_percent']=sum(min(rr[core],20-rr[core]) for rr in counts)/1280*100
  percore[core][f'step{condition}_majority_changes']=sum(reference[p][core]!=majority[p][core] for p in range(64) if reference[p][core] is not None and majority[p][core] is not None)
with (out/'all_core_timing_sensitivity.csv').open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=list(percore[0]));w.writeheader();w.writerows(percore)
(out/'TIMING_RESULTS.json').write_text(json.dumps(dict(conditions=results,per_core=percore,limitation='Same 64-vector subset selected by index, not response. Timing-profile sensitivity is not an entropy, liveness or causal routing measurement.'),indent=2)+'\n')
print(json.dumps(results,indent=2))
