"""Raw silicon diagnostics. No filtering, correction or hardware changes."""
from pathlib import Path
import csv,json,math,hashlib,argparse,statistics
root=Path(__file__).resolve().parents[2];out=Path(__file__).resolve().parent
p=argparse.ArgumentParser();p.add_argument('primary',type=Path);p.add_argument('--comparison',type=Path);p.add_argument('--label',default='');a=p.parse_args()
assert all(c.isalnum() or c=='_' for c in a.label),'Invalid output label'
suffix='_'+a.label if a.label else ''
def load(path):
 path=path.resolve();meta=json.loads(Path(str(path)+'.metadata.json').read_text(encoding='utf-8-sig'))
 matrix=json.loads(Path(str(path)+'.challenges.json').read_text(encoding='utf-8-sig'))
 counts=[[0]*64 for _ in matrix];seen=set();words={}
 for row in csv.DictReader(path.open(encoding='utf-8-sig',newline='')):
  pat,trial,core,bit=(int(row[k]) for k in ('pattern','trial','core','response'))
  k=(pat,trial,core);assert k not in seen;seen.add(k)
  assert 0<=pat<len(matrix) and 1<=trial<=meta['repeats'] and 0<=core<64 and bit in (0,1)
  assert int(row['challenge_hex'],16)==matrix[pat]['challenges'][core] and row['flags_hex']=='61'
  w=int(row['response_word_hex'],16);assert (w>>core)&1==bit
  assert words.setdefault((pat,trial),w)==w
  counts[pat][core]+=bit
 assert len(seen)==len(matrix)*64*meta['repeats']
 majority=[[None if 2*n==meta['repeats'] else int(2*n>meta['repeats']) for n in rr] for rr in counts]
 return dict(path=str(path),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),meta=meta,matrix=matrix,counts=counts,majority=majority,words=words)
def corr(x,y):
 mx=statistics.mean(x);my=statistics.mean(y)
 den=math.sqrt(sum((v-mx)**2 for v in x)*sum((v-my)**2 for v in y))
 return None if den==0 else sum((xx-mx)*(yy-my) for xx,yy in zip(x,y))/den
d=load(a.primary);rep=d['meta']['repeats'];n=len(d['counts'])
route=json.loads((root/'build/route_summary.json').read_text());layout=json.loads((root/'layout.json').read_text())
rows=[]
for core in range(64):
 rr=dict(layout[core]);rr['ones_percent']=100*sum(v[core] for v in d['counts'])/(n*rep)
 rr['majority_ones']=sum(v[core]==1 for v in d['majority']);rr['majority_zeros']=sum(v[core]==0 for v in d['majority']);rr['ties']=sum(v[core] is None for v in d['majority'])
 rr['mixed_patterns']=sum(0<v[core]<rep for v in d['counts'])
 rr['minority_observations']=sum(min(v[core],rep-v[core]) for v in d['counts'])
 b=route['boundaries'][str(core)]
 for kind,endings in [('arbiter',('u_arbiter_dff/D','u_arbiter_dff/C')),('launch',('u_head_gate/I0',)),('feedback',('u_head_gate/I1',))]:
  vv=[v for v in b if v['sink'].endswith(endings)];assert len(vv)==2
  if kind=='arbiter':vv.sort(key=lambda v:0 if v['sink'].endswith('/D') else 1)
  else:vv.sort(key=lambda v:0 if 'u_chain_upper/' in v['sink'] else 1)
  for corner in ('slow_max_ps','fast_min_ps'):
   # Arbiter: D minus C. Launch/feedback: upper entrance minus lower entrance.
   rr[kind+'_'+corner+'_signed']=float(vv[0][corner])-float(vv[1][corner])
 rows.append(rr)
correlations={k:corr([r[k] for r in rows],[r['ones_percent'] for r in rows]) for k in rows[0] if k.endswith('_signed')}
summary=dict(primary=dict(path=d['path'],sha256=d['sha256'],mode=d['meta']['mode'],patterns=n,repeats=rep),correlations_with_ones_percent=correlations,
 per_core=rows,limitations=['Correlations across 64 placed cores are observational and do not establish causality.','No response bits filtered or corrected. Within-session majority is not an independent reliability reference.'])
if a.comparison:
 e=load(a.comparison);assert e['matrix']==d['matrix'],'Configuration matrices differ'
 for key in ('sha256','excite_cycles','repeats','cores'):assert e['meta'][key]==d['meta'][key],key
 changes=ties=minor=0
 for core,r in enumerate(rows):
  r['comparison_ones_percent']=100*sum(v[core] for v in e['counts'])/(n*rep)
  r['comparison_minus_primary_pp']=r['comparison_ones_percent']-r['ones_percent']
  r['majority_changes']=0;r['comparable_positions']=0
  for pat in range(n):
   v,w=d['majority'][pat][core],e['majority'][pat][core]
   if v is None or w is None:ties+=1;continue
   changes+=v!=w;r['majority_changes']+=v!=w;r['comparable_positions']+=1
  minor+=sum(min(v[core],rep-v[core]) for v in e['counts'])
 summary['comparison']=dict(path=e['path'],sha256=e['sha256'],mode=e['meta']['mode'],majority_changes=changes,comparable_positions=n*64-ties,ties_excluded=ties,
   mean_ones_percent=statistics.mean(r['comparison_ones_percent'] for r in rows),minority_observations=minor,
   per_core_balance_correlation=corr([r['ones_percent'] for r in rows],[r['comparison_ones_percent'] for r in rows]),
   median_absolute_balance_change_pp=statistics.median(abs(r['comparison_minus_primary_pp']) for r in rows),
   max_absolute_balance_change_pp=max(abs(r['comparison_minus_primary_pp']) for r in rows))
with (out/('per_core_diagnostics'+suffix+'.csv')).open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
(out/('RESULTS'+suffix+'.json')).write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k!='per_core'},indent=2))
print('Most biased cores (majority counts):',[(r['core'],r['majority_ones'],r['majority_zeros'],r['ties']) for r in sorted(rows,key=lambda v:min(v['ones_percent'],100-v['ones_percent']))[:12]])
