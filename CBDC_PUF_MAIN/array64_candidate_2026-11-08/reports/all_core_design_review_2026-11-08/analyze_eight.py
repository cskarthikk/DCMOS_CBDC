from pathlib import Path
import json,csv
out=Path(__file__).resolve().parent
entries=json.loads((out/'EIGHT_SWEEP_INDEX.json').read_text(encoding='utf-8-sig'))
if not isinstance(entries,list):entries=[entries]
matrix=json.loads((out/'eight_matched_vectors.json').read_text());results=[];percore=[dict(core=i) for i in range(8)];baseline=None
for step,e in enumerate(entries):
 p=Path(e['csv']);meta=json.loads(Path(str(p)+'.metadata.json').read_text(encoding='utf-8-sig'))
 assert json.loads(Path(str(p)+'.challenges.json').read_text(encoding='utf-8-sig'))==matrix
 assert meta['cores']==8 and meta['repeats']==20 and meta['excite_cycles']==e['excite_cycles']
 counts=[[0]*8 for _ in range(64)];seen=set()
 for r in csv.DictReader(p.open(newline='',encoding='utf-8-sig')):
  pat,trial,core,bit=[int(r[k]) for k in ('pattern','trial','core','response')];k=pat,trial,core
  assert k not in seen and 0<=pat<64 and 1<=trial<=20 and 0<=core<8 and bit in (0,1);seen.add(k)
  assert int(r['challenge_hex'],16)==matrix[pat]['challenges'][core] and r['flags_hex']=='61'
  assert int(r['excite_cycles'])==e['excite_cycles'] and (int(r['response_word_hex'],16)>>core)&1==bit
  counts[pat][core]+=bit
 assert len(seen)==10240
 maj=[[None if n==10 else int(n>10) for n in rr] for rr in counts]
 if baseline is None:baseline=maj
 comparable=sum(baseline[p][c] is not None and maj[p][c] is not None for p in range(64) for c in range(8))
 changes=sum(baseline[p][c]!=maj[p][c] for p in range(64) for c in range(8) if baseline[p][c] is not None and maj[p][c] is not None)
 result=dict(step=step,wait=e['excite_cycles'],ones_percent=sum(map(sum,counts))/10240*100,
  minority_percent=sum(min(n,20-n) for rr in counts for n in rr)/10240*100,majority_changes_vs_first8=changes,comparable_positions=comparable,source=str(p))
 results.append(result)
 for c in range(8):
  percore[c][f'step{step}_wait{e["excite_cycles"]}_ones_percent']=sum(rr[c] for rr in counts)/1280*100
  percore[c][f'step{step}_majority_changes']=sum(baseline[p][c]!=maj[p][c] for p in range(64) if baseline[p][c] is not None and maj[p][c] is not None)
timing=json.loads((out/'TIMING_RESULTS.json').read_text());comparisons=[]
for old,new in {0:50,1:0,3:10,4:12,6:21,7:23}.items():
 r=dict(reference_core=old,candidate_core=new,eight_ones_percent=percore[old]['step0_wait8_ones_percent'],sixtyfour_ones_percent=timing['per_core'][new]['step0_wait8_ones_percent'])
 r['sixtyfour_minus_eight_pp']=r['sixtyfour_ones_percent']-r['eight_ones_percent'];comparisons.append(r)
summary=dict(conditions=results,per_core=percore,matched_challenge_location_comparisons=comparisons,
 limitations=['Same-day same physical board; six core pairs have identical input configurations but different relative physical geometry and array context.','Timing sensitivity is demonstrated in both images. These results do not establish actual oscillation periods, missed-edge rates or the cause of every biased core.'])
(out/'EIGHT_TIMING_RESULTS.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary,indent=2))
