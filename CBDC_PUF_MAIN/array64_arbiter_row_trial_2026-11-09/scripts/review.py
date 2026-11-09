from pathlib import Path
import csv,json,re,statistics
r=Path(__file__).resolve().parents[1];b=r.parent/'array64_candidate_2026-11-08'
identity=(r/'build/physical_identity.txt').read_text();assert 'Checked PUF signal routes: 6144' in identity and 'Changed endpoint/PIP fingerprints: 0' in identity
old=json.loads((b/'build/route_summary.json').read_text());rows=list(csv.DictReader((r/'build/boundary_delays.csv').open()));assert len(rows)==512
result=[]
for core in range(64):
 rr=[v for v in rows if v['driver'].startswith('gen_core['+str(core)+'].')];item=dict(core=core)
 for kind,end in [('launch',('u_head_gate/I0',)),('arbiter',('u_arbiter_dff/D','u_arbiter_dff/C')),('feedback',('u_head_gate/I1',))]:
  pp=[v for v in rr if v['sink'].endswith(end)];assert len(pp)==2
  pp.sort(key=lambda v:0 if (v['sink'].endswith('/D') if kind=='arbiter' else 'u_chain_upper/' in v['sink']) else 1)
  for corner in ('slow_max_ps','fast_min_ps'):item[kind+'_'+corner]=float(pp[0][corner])-float(pp[1][corner])
 result.append(item)
summary={kind:dict(old_median_abs_ps=statistics.median(v[kind]['slow_max_ps'] for v in old['boundary_skews'].values()),
  new_median_abs_ps=statistics.median(abs(v[kind+'_slow_max_ps']) for v in result),old_max_abs_ps=max(v[kind]['slow_max_ps'] for v in old['boundary_skews'].values()),new_max_abs_ps=max(abs(v[kind+'_slow_max_ps']) for v in result)) for kind in ('launch','arbiter','feedback')}
(r/'build/boundary_comparison.json').write_text(json.dumps(dict(summary=summary,per_core=result),indent=2)+'\n');print(summary)
