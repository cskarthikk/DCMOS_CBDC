from pathlib import Path
import json,csv,hashlib
r=Path(__file__).resolve().parents[1];base=r.parent/'array64_candidate_2026-11-08'
identity=(r/'build/physical_identity.txt').read_text()
assert 'Checked constrained primitives:6656'.replace(':',': ') in identity
assert 'Checked PUF signal routes:6272'.replace(':',': ') in identity
assert 'Changed endpoint/PIP fingerprints:0'.replace(':',': ') in identity
old=json.loads((base/'build/route_summary.json').read_text())
oldrows={(v['driver'],v['sink']):v for rr in old['boundaries'].values() for v in rr}
new=list(csv.DictReader((r/'build/boundary_delays.csv').open()));assert len(new)==512
differences=[];report={}
for row in new:
 p=oldrows[row['driver'],row['sink']]
 kind='launch' if row['sink'].endswith('u_head_gate/I0') else 'feedback' if row['sink'].endswith('u_head_gate/I1') else 'arbiter' if row['sink'].endswith(('u_arbiter_dff/D','u_arbiter_dff/C')) else 'latch_enable' if row['sink'].endswith('/CE') else 'clear'
 d=dict(row,kind=kind)
 for corner in ('slow_max_ps','fast_min_ps'):d['change_'+corner]=float(row[corner])-float(p[corner])
 differences.append(d)
for kind in ('launch','feedback','arbiter','latch_enable','clear'):
 rr=[v for v in differences if v['kind']==kind]
 report[kind]={corner:max(abs(v['change_'+corner]) for v in rr) for corner in ('slow_max_ps','fast_min_ps')}
assert all(report[k][corner]==0 for k in ('feedback','arbiter') for corner in ('slow_max_ps','fast_min_ps')),'PUF boundary delays changed despite physical-route identity'
(r/'build/boundary_comparison.json').write_text(json.dumps(dict(maximum_absolute_delay_change_ps=report,arcs=differences),indent=2)+'\n')
print('Physical identity verified; boundary delay changes:',report)
