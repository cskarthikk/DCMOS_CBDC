from pathlib import Path
import json,csv,random,argparse,hashlib
p=argparse.ArgumentParser();p.add_argument('action',choices=['choose','review']);p.add_argument('run',type=Path);a=p.parse_args();run=a.run.resolve()
def load(path):
 path=Path(path);meta=json.loads(Path(str(path)+'.metadata.json').read_text(encoding='utf-8-sig'));matrix=json.loads(Path(str(path)+'.challenges.json').read_text(encoding='utf-8-sig'))
 n=len(matrix);rep=meta['repeats'];assert meta['cores']==64 and meta['patterns']==n and meta['mode']=='Parallel'
 counts=[[0]*64 for _ in range(n)];seen=set();words={}
 for row in csv.DictReader(path.open(newline='',encoding='utf-8-sig')):
  pat,trial,core,bit=[int(row[k]) for k in ('pattern','trial','core','response')];k=pat,trial,core
  assert k not in seen and 0<=pat<n and 1<=trial<=rep and 0<=core<64 and bit in (0,1);seen.add(k)
  assert row['flags_hex']=='61' and int(row['challenge_hex'],16)==matrix[pat]['challenges'][core]
  word=int(row['response_word_hex'],16)
  assert (word>>core)&1==bit and int(row['excite_cycles'])==meta['excite_cycles'] and words.setdefault((pat,trial),word)==word
  assert row['mode']==meta['mode'] and row['variant']==meta['variant']
  counts[pat][core]+=bit
 assert len(seen)==n*rep*64
 percore=[dict(core=c,ones_percent=sum(rr[c] for rr in counts)/(n*rep)*100,minority=sum(min(rr[c],rep-rr[c]) for rr in counts),mixed=sum(0<rr[c]<rep for rr in counts)) for c in range(64)]
 return dict(path=str(path),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),meta=meta,matrix=matrix,counts=counts,frame_words=words,per_core=percore,
   ones_percent=sum(map(sum,counts))/(n*rep*64)*100,minority_percent=sum(v['minority'] for v in percore)/(n*rep*64)*100)
if a.action=='choose':
 source=json.loads((run/'SELECTED_SOURCE.json').read_text(encoding='utf-8-sig'))
 index=json.loads((run/'DEV_INDEX.json').read_text(encoding='utf-8-sig'));index=index if isinstance(index,list) else [index]
 assert [e['clock'] for e in index]==source['predeclared_clocks']
 stats=[];reference=None
 for e in index:
  d=load(e['csv']);assert d['meta']['excite_cycles']==e['clock']
  assert d['meta']['sha256']==source['bitstream_sha256'] and d['meta']['repeats']==20
  if reference is None:reference=d
  assert d['matrix']==reference['matrix'] and d['meta']['sha256']==reference['meta']['sha256']
  stats.append(dict(clock=e['clock'],ones_percent=d['ones_percent'],minority_percent=d['minority_percent'],source=d['path'],sha256=d['sha256']))
 chosen=min(stats,key=lambda v:(abs(v['ones_percent']-50),v['minority_percent'],v['clock']))
 record=dict(selection='Best among the predeclared tested clock candidates by development-pool aggregate distance from50%, then within-session minority rate. All64 cores and every raw observation retained.',candidates=stats,chosen=chosen,
  limitation='Calibrated operating point, not proof of repaired physical bias, entropy or paper-equivalent performance. Validation data must not retune this choice.')
 (run/'SELECTION.json').write_text(json.dumps(record,indent=2)+'\n')
 used=[{rr['challenges'][c] for rr in reference['matrix']} for c in range(64)];rng=random.Random(20261109);fresh=[]
 for pat in range(256):
  values=[]
  for c in range(64):
   while True:
    lo=rng.getrandbits(15);v=lo|((1^(lo.bit_count()&1))<<15)
    if v not in used[c]:break
   used[c].add(v);values.append(v)
  fresh.append(dict(pattern=pat,challenges=values))
 (run/'validation_matrix.json').write_text(json.dumps(fresh,indent=2)+'\n')
 record['validation_matrix_sha256']=hashlib.sha256((run/'validation_matrix.json').read_bytes()).hexdigest()
 (run/'SELECTION.json').write_text(json.dumps(record,indent=2)+'\n')
 print(chosen['clock'])
else:
 sel=json.loads((run/'SELECTION.json').read_text());idx=json.loads((run/'VALIDATION_INDEX.json').read_text(encoding='utf-8-sig'));assert len(idx)==2
 source=json.loads((run/'SELECTED_SOURCE.json').read_text(encoding='utf-8-sig'))
 assert hashlib.sha256((run/'validation_matrix.json').read_bytes()).hexdigest()==sel['validation_matrix_sha256']
 aa,bb=[load(e['csv']) for e in idx];assert aa['matrix']==bb['matrix'] and len(aa['matrix'])==256
 assert aa['matrix']==json.loads((run/'validation_matrix.json').read_text())
 dev_index=json.loads((run/'DEV_INDEX.json').read_text(encoding='utf-8-sig'));dev_index=dev_index if isinstance(dev_index,list) else [dev_index]
 dev_matrix=json.loads(Path(str(dev_index[0]['csv'])+'.challenges.json').read_text(encoding='utf-8-sig'))
 for c in range(64):
  values=[rr['challenges'][c] for rr in aa['matrix']]
  assert len(set(values))==256 and not set(values)&{rr['challenges'][c] for rr in dev_matrix}
 for d in (aa,bb):assert d['meta']['excite_cycles']==sel['chosen']['clock']
 assert aa['meta']['sha256']==bb['meta']['sha256']==source['bitstream_sha256']
 rep=aa['meta']['repeats'];assert rep==bb['meta']['repeats']==20
 changes=ties=0
 for x,y in zip(aa['counts'],bb['counts']):
  for u,v in zip(x,y):
   if 2*u==rep or 2*v==rep:ties+=1;continue
   changes+=(2*u>rep)!=(2*v>rep)
 rows=[]
 for x,y in zip(aa['per_core'],bb['per_core']):
  c=x['core'];pairs=[(u[c],v[c]) for u,v in zip(aa['counts'],bb['counts'])];comparable=[(u,v) for u,v in pairs if u!=10 and v!=10]
  rows.append(dict(core=c,first_ones_percent=x['ones_percent'],repeat_ones_percent=y['ones_percent'],first_mixed=x['mixed'],repeat_mixed=y['mixed'],first_minority=x['minority'],repeat_minority=y['minority'],
   majority_changes=sum((u>10)!=(v>10) for u,v in comparable),comparable_positions=len(comparable),ties_excluded=256-len(comparable),
   aligned_trial_raw_disagreements=sum(((w^bb['frame_words'][key])>>c)&1 for key,w in aa['frame_words'].items())))
 with (run/'validation_per_core.csv').open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
 result=dict(chosen_clock=sel['chosen']['clock'],first_ones_percent=aa['ones_percent'],repeat_ones_percent=bb['ones_percent'],first_minority_percent=aa['minority_percent'],repeat_minority_percent=bb['minority_percent'],
  aligned_trial_raw_disagreements=sum((word^bb['frame_words'][key]).bit_count() for key,word in aa['frame_words'].items()),raw_comparable_bits=327680,
  majority_changes=changes,comparable_positions=16384-ties,ties_excluded=ties,per_core_range_first=[min(v['ones_percent'] for v in aa['per_core']),max(v['ones_percent'] for v in aa['per_core'])],
  mean_per_core_distance_from_50_first=sum(abs(v['ones_percent']-50) for v in aa['per_core'])/64,
  cores_outside_10_90=[v['core'] for v in aa['per_core'] if v['ones_percent']<10 or v['ones_percent']>90],
  source_captures=[dict(path=d['path'],sha256=d['sha256']) for d in (aa,bb)],limitation='All raw bits, no mask or error correction. Majority agreement is measured across these two captures only; bit balance is not entropy or security certification.')
 (run/'VALIDATION_RESULTS.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
