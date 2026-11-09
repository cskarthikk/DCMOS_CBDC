from pathlib import Path
import json,csv,re,statistics,hashlib
out=Path(__file__).resolve().parent;c=out.parents[1];m=c.parent
eight=json.loads((m/'measurements/paper8_0fcd36dbe06545a2bb3941b4976b5848.csv.analysis.json').read_text())
new=json.loads((c/'reports/investigation_2026-11-08/RESULTS_sequential.json').read_text())
layout8=[tuple(map(int,l.strip('{} \n').split())) for l in (m/'layout.tcl').read_text().splitlines() if l.strip()]
layout64=json.loads((c/'layout.json').read_text())
def boundaries(file,cores):
 data=[[] for _ in range(cores)]
 for row in csv.DictReader(file.open()):
  match=re.search(r'gen_core\[(\d+)\]',row['driver'])
  if match and (row['sink'].endswith(('u_arbiter_dff/D','u_arbiter_dff/C','u_head_gate/I0','u_head_gate/I1'))):data[int(match[1])].append(row)
 result=[]
 for core,rows in enumerate(data):
  d=dict(core=core)
  for k,endings in [('arbiter',('u_arbiter_dff/D','u_arbiter_dff/C')),('launch',('u_head_gate/I0',)),('feedback',('u_head_gate/I1',))]:
   rr=[v for v in rows if v['sink'].endswith(endings)];assert len(rr)==2,(core,k)
   rr.sort(key=lambda v:0 if (v['sink'].endswith('/D') if k=='arbiter' else 'u_chain_upper/' in v['sink']) else 1)
   for corner in ('slow_max_ps','fast_min_ps'):d[k+'_'+corner]=float(rr[0][corner])-float(rr[1][corner])
  result.append(d)
 return result
b8=boundaries(m/'build_matched/net_delays.csv',8);b64=boundaries(c/'build/net_delays.csv',64)
rows=[];pairs=[]
for i,r in enumerate(new['per_core']):
 row={k:r[k] for k in ('core','upper_x','lower_x','head_y','arbiter_x','tile_type','ones_percent','comparison_ones_percent','majority_ones','majority_zeros','ties','mixed_patterns')}
 row.update(b64[i]);row['arbiter_y']=r['head_y']+17;row['excite_y']=r['head_y']-1
 row['bias_observation']='below 10% ones' if r['ones_percent']<10 else 'above 90% ones' if r['ones_percent']>90 else '10%-90% ones'
 row['internal_paired_arcs']=64;row['internal_max_reported_skew_ps']=0
 near=[(abs(y-r['head_y']),j,y) for j,(x,y) in enumerate(layout8) if x==r['upper_x'] and x+4==r['lower_x']]
 row['near_reference_core']='';row['near_reference_head_y']='';row['near_reference_ones_percent']=''
 if near:
  delta,j,y=min(near)
  if delta<=1:
   row.update(near_reference_core=j,near_reference_head_y=y,near_reference_ones_percent=eight['cores'][j]['ones_percent'])
   pairs.append(dict(reference_core=j,candidate_core=i,upper_x=r['upper_x'],lower_x=r['lower_x'],old_head_y=y,new_head_y=r['head_y'],
      old_arbiter_y=y+16,new_arbiter_y=r['head_y']+17,old_excite_y=y,new_excite_y=r['head_y']-1,
      old_ones_percent=eight['cores'][j]['ones_percent'],new_ones_percent=r['ones_percent'],
      old_arbiter_signed_ps=b8[j]['arbiter_slow_max_ps'],new_arbiter_signed_ps=b64[i]['arbiter_slow_max_ps'],
      old_launch_signed_ps=b8[j]['launch_slow_max_ps'],new_launch_signed_ps=b64[i]['launch_slow_max_ps']))
 rows.append(row)
for name,rr in [('all_64_cores.csv',rows),('near_reference_geometry.csv',pairs),('eight_core_boundaries.csv',b8)]:
 with (out/name).open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(rr[0]));w.writeheader();w.writerows(rr)
summary=dict(eight=dict(ones_percent=100*sum(r['ones'] for r in eight['cores'])/40960,min_core_ones=min(r['ones_percent'] for r in eight['cores']),max_core_ones=max(r['ones_percent'] for r in eight['cores']),minority_observations=sum(r['smaller_count'] for r in eight['cores']),total=40960),
 sixty_four=dict(ones_percent=statistics.mean(r['ones_percent'] for r in rows),min_core_ones=min(r['ones_percent'] for r in rows),max_core_ones=max(r['ones_percent'] for r in rows),minority_observations=sum(r['minority_observations'] for r in new['per_core']),total=327680),
 boundary_ranges={label:{k:dict(min_abs_ps=min(abs(r[k+'_slow_max_ps']) for r in data),median_abs_ps=statistics.median(abs(r[k+'_slow_max_ps']) for r in data),max_abs_ps=max(abs(r[k+'_slow_max_ps']) for r in data)) for k in ('launch','arbiter','feedback')} for label,data in [('eight',b8),('sixty_four',b64)]},near_reference_pairs=pairs,
 limitations=['The old and new pools differ; per-core balance comparisons are descriptive, not matched-challenge temporal reliability.','The six near-reference pairs retain columns but move chain and arbiter rows; this is not an otherwise-identical controlled placement experiment.','All core classifications describe observations and modeled nets, not a proven per-core root cause.'])
(out/'DESIGN_COMPARISON.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary,indent=2))
