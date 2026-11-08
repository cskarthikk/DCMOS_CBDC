from pathlib import Path
import csv,json,argparse,hashlib
p=argparse.ArgumentParser();p.add_argument('directory',type=Path);a=p.parse_args();run=a.directory.resolve()
r=Path(__file__).resolve().parents[1];base=r.parent/'array64_candidate_2026-11-08';record=json.loads((r/'BUILD_RECORD.json').read_text())
matrix=json.loads((r/'matrix64.json').read_text());loaded={};summaries=[]
def load(path,window):
 path=Path(path);m=json.loads(Path(str(path)+'.metadata.json').read_text(encoding='utf-8-sig'))
 assert m['cores']==64 and m['repeats']==20 and m['patterns']==64 and m['mode']=='Parallel'
 assert json.loads(Path(str(path)+'.challenges.json').read_text(encoding='utf-8-sig'))==matrix
 expected=record['sha256'] if window==64 else record['baseline_bitstream_sha256'];assert m['sha256'].upper()==expected
 if window==64:assert m['latch_cycles']==64
 counts=[[0]*64 for _ in range(64)];seen=set();words={}
 for row in csv.DictReader(path.open(newline='',encoding='utf-8-sig')):
  pat,trial,core,bit=[int(row[k]) for k in ('pattern','trial','core','response')];k=pat,trial,core
  assert k not in seen and 0<=pat<64 and 1<=trial<=20 and 0<=core<64 and bit in (0,1);seen.add(k)
  assert row['flags_hex']=='61' and int(row['challenge_hex'],16)==matrix[pat]['challenges'][core]
  assert int(row['excite_cycles'])==m['excite_cycles'] and row['variant']==m['variant']
  w=int(row['response_word_hex'],16);assert (w>>core)&1==bit and words.setdefault((pat,trial),w)==w
  counts[pat][core]+=bit
 assert len(seen)==81920
 maj=[[None if n==10 else int(n>10) for n in rr] for rr in counts]
 return dict(counts=counts,majority=maj,meta=m,source=str(path),file_sha256=hashlib.sha256(path.read_bytes()).hexdigest())
entries=json.loads((run/'INDEX.json').read_text(encoding='utf-8-sig'));entries=entries if isinstance(entries,list) else [entries]
for e in entries:
 d=load(e['csv'],e['latch_cycles']);loaded[e['label']]=d
 ones=sum(map(sum,d['counts']));minor=sum(min(n,20-n) for rr in d['counts'] for n in rr)
 summaries.append(dict(label=e['label'],wait=e['excite_cycles'],window=e['latch_cycles'],close_cycle=e['excite_cycles']+e['latch_cycles'],ones=ones,ones_percent=ones/81920*100,minority_percent=minor/81920*100,source=d['source'],file_sha256=d['file_sha256']))
def compare(x,y):
 a=x['majority'];b=y['majority'];n=changed=up=down=0
 for p in range(64):
  for c in range(64):
   if a[p][c] is None or b[p][c] is None:continue
   n+=1;changed+=a[p][c]!=b[p][c];up+=a[p][c]==0 and b[p][c]==1;down+=a[p][c]==1 and b[p][c]==0
 return dict(comparable=n,majority_changes=changed,change_percent=changed/n*100,zero_to_one=up,one_to_zero=down)
comparisons={}
for name,x,y in [('baseline_repeat','baseline_before_wait8','baseline_after_wait8'),('trial_repeat','trial_step0_wait8','trial_step4_wait8'),('trial_wait8_vs127','trial_step0_wait8','trial_step3_wait127'),('baseline8_vs_trial8','baseline_before_wait8','trial_step0_wait8')]:
 if x in loaded and y in loaded:comparisons[name]=compare(loaded[x],loaded[y])
old=json.loads((base/'reports/all_core_design_review_2026-11-08/SWEEP_LONG_INDEX.json').read_text(encoding='utf-8-sig'))
for wait,label in [(64,'trial_step0_wait8'),(127,'trial_step2_wait71')]:
 if label in loaded:
  e=next(e for e in old if e['excite_cycles']==wait);d=load(e['csv'],8)
  comparisons[f'equal_close_old_wait{wait}_window8_vs_{label}']=dict(compare(d,loaded[label]),old_ones_percent=sum(map(sum,d['counts']))/81920*100)
rows=[]
for c in range(64):
 row=dict(core=c)
 for label,d in loaded.items():
  row[label+'_ones_percent']=sum(rr[c] for rr in d['counts'])/1280*100
  row[label+'_minority_percent']=sum(min(rr[c],20-rr[c]) for rr in d['counts'])/1280*100
 rows.append(row)
with (run/'per_core.csv').open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
result=dict(conditions=summaries,comparisons=comparisons,complete=len(entries)==7,limitations=['Ordinary excitation/CE routing changes are quantified in build/boundary_comparison.json.','Equal-close reference captures are from the earlier same-board session, not interleaved; bracketed baseline runs quantify session variation.','Majority differences between timing profiles are not BER against a known noiseless response.'])
(run/'RESULTS.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
