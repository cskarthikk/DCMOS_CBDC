from pathlib import Path
import csv,json,argparse,hashlib
p=argparse.ArgumentParser();p.add_argument('directory',type=Path);a=p.parse_args();run=a.directory.resolve()
r=Path(__file__).resolve().parents[1];record=json.loads((r/'BUILD_RECORD.json').read_text());matrix=json.loads((r/'matrix64.json').read_text())
idx=json.loads((run/'INDEX.json').read_text(encoding='utf-8-sig'));assert len(idx)==5
loaded={};summary=[]
for e in idx:
 path=Path(e['csv']);m=json.loads(Path(str(path)+'.metadata.json').read_text(encoding='utf-8-sig'))
 assert m['cores']==64 and m['repeats']==20 and m['patterns']==64 and m['mode']=='Parallel' and m['excite_cycles']==e['excite_cycles']
 assert json.loads(Path(str(path)+'.challenges.json').read_text(encoding='utf-8-sig'))==matrix
 assert m['sha256'].upper()==record['sha256' if e['label'].startswith('trial_') else 'baseline_bitstream_sha256']
 counts=[[0]*64 for _ in range(64)];seen=set();words={}
 for row in csv.DictReader(path.open(newline='',encoding='utf-8-sig')):
  pat,trial,core,bit=[int(row[k]) for k in ('pattern','trial','core','response')];key=pat,trial,core
  assert key not in seen and 0<=pat<64 and 1<=trial<=20 and 0<=core<64 and bit in (0,1);seen.add(key)
  assert row['flags_hex']=='61' and int(row['challenge_hex'],16)==matrix[pat]['challenges'][core]
  assert int(row['excite_cycles'])==m['excite_cycles'] and row['variant']==m['variant']
  word=int(row['response_word_hex'],16);assert (word>>core)&1==bit and words.setdefault((pat,trial),word)==word
  counts[pat][core]+=bit
 assert len(seen)==81920
 pc=[sum(rr[c] for rr in counts)/1280*100 for c in range(64)]
 d=dict(counts=counts,per_core=pc);loaded[e['label']]=d
 summary.append(dict(label=e['label'],wait=e['excite_cycles'],ones_percent=sum(map(sum,counts))/81920*100,
  minority_percent=sum(min(n,20-n) for rr in counts for n in rr)/81920*100,per_core_range=[min(pc),max(pc)],mean_core_distance_from_50=sum(abs(v-50) for v in pc)/64,
  cores_outside_10_90=[i for i,v in enumerate(pc) if v<10 or v>90],source=str(path),sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
def compare(x,y):
 changes=ties=up=down=0
 for a,b in zip(loaded[x]['counts'],loaded[y]['counts']):
  for u,v in zip(a,b):
   if u==10 or v==10:ties+=1;continue
   changes+=(u>10)!=(v>10);up+=u<10 and v>10;down+=u>10 and v<10
 return dict(majority_changes=changes,comparable=4096-ties,change_percent=changes/(4096-ties)*100,ties_excluded=ties,zero_to_one=up,one_to_zero=down)
comparisons={name:compare(x,y) for name,x,y in [('baseline_repeat','baseline_before_wait8','baseline_after_wait8'),('trial_repeat','trial_step0_wait8','trial_step2_wait8'),('trial_wait8_vs127','trial_step0_wait8','trial_step1_wait127'),('baseline8_vs_trial8','baseline_before_wait8','trial_step0_wait8')]}
rows=[dict(core=c,**{k+'_ones_percent':v['per_core'][c] for k,v in loaded.items()}) for c in range(64)]
with (run/'per_core.csv').open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
result=dict(conditions=summary,comparisons=comparisons,limitations=['Same baseline synthesized logic and all 6144 internal chain route trees retained. Arbiter row and flip-flop BEL changed together; six ordinary controller flip-flops also moved. This is a bounded physical variant, not a one-variable causal test.','Counts use all 64 cores and all observations. Within-capture minority rate is descriptive, not certified BER.'])
(run/'RESULTS.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
