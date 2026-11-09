"""Analyze all raw 64-core observations; no selection, hashing or correction."""
from pathlib import Path
import argparse,csv,json,collections
p=argparse.ArgumentParser();p.add_argument('csv',type=Path);a=p.parse_args();src=a.csv.resolve()
meta=json.loads(Path(str(src)+'.metadata.json').read_text(encoding='utf-8-sig'))
matrix=json.loads(Path(str(src)+'.challenges.json').read_text(encoding='utf-8-sig'))
if meta['cores']!=64 or meta['variant']!='paper_array64_and_ce' or len(matrix)!=meta['patterns']:raise ValueError('Not a complete 64-core matrix')
stats=collections.defaultdict(list);frames={};n=0
with src.open(newline='',encoding='utf-8-sig') as f:
 for row in csv.DictReader(f):
  pat,trial,core,bit=(int(row[k]) for k in ('pattern','trial','core','response'))
  if row['variant']!=meta['variant']:raise ValueError('Variant mismatch')
  if not(0<=pat<meta['patterns'] and 1<=trial<=meta['repeats'] and 0<=core<64 and bit in (0,1)):raise ValueError('Invalid index/bit')
  if int(row['challenge_hex'],16)!=matrix[pat]['challenges'][core] or row['flags_hex']!='61':raise ValueError('Configuration/status mismatch')
  if row['mode']!=meta['mode'] or int(row['excite_cycles'])!=meta['excite_cycles']:raise ValueError('Timing profile mismatch')
  word=int(row['response_word_hex'],16)
  if len(row['response_word_hex'])!=16 or (word>>core)&1!=bit:raise ValueError('Invalid 64-bit word')
  k=(pat,trial);entry=frames.setdefault(k,dict(word=word,seen=set()))
  if entry['word']!=word or core in entry['seen']:raise ValueError('Duplicate/inconsistent frame')
  entry['seen'].add(core);stats[pat,core].append(bit);n+=1
if n!=meta['patterns']*meta['repeats']*64 or any(len(e['seen'])!=64 for e in frames.values()):raise ValueError('Incomplete capture')
per_core=[]
for core in range(64):
 vals=[stats[pat,core] for pat in range(meta['patterns'])]
 per_core.append(dict(core=core,ones=sum(map(sum,vals)),observations=sum(map(len,vals)),
    ones_percent=100*sum(map(sum,vals))/sum(map(len,vals)),
    mixed_patterns=sum(0<sum(v)<len(v) for v in vals),ties=sum(2*sum(v)==len(v) for v in vals),
    minority_observations=sum(min(sum(v),len(v)-sum(v)) for v in vals)))
 per_core[-1]['constant_across_capture']=per_core[-1]['ones'] in (0,per_core[-1]['observations'])
report=dict(source=str(src),frames=len(frames),raw_bits=n,ones=sum(s['ones'] for s in per_core),
    ones_percent=100*sum(s['ones'] for s in per_core)/n,per_core=per_core,
    limitation='Raw descriptive measurements on one FPGA. Minority counts are within-session variation, not independent-validation BER or certified entropy/uniqueness. No bits filtered or corrected.')
out=Path(str(src)+'.analysis.json');out.write_text(json.dumps(report,indent=2)+'\n')
print(f"Frames={len(frames)}; raw bits={n}; ones={report['ones_percent']:.4f}%")
print('Cores constant across this capture:',[c['core'] for c in per_core if c['constant_across_capture']])
print('Core   Ones%   Mixed patterns   Ties')
for c in per_core:print(f"{c['core']:4d} {c['ones_percent']:8.3f} {c['mixed_patterns']:16d} {c['ties']:6d}")
print('Report:',out)
