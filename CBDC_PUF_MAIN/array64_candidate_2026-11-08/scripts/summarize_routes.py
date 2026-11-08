from pathlib import Path
import csv,json,re,collections
r=Path(__file__).resolve().parents[1];b=r/'build'
rows=list(csv.DictReader((b/'net_delays.csv').open(newline='')))
groups={};boundaries=collections.defaultdict(list)
for row in rows:
    source,target=row['driver'],row['sink']
    if 'u_arbiter_dff/' in target or 'u_head_gate/I0' in target or 'u_head_gate/I1' in target:
        m=re.search(r'gen_core\[(\d+)\]',source)
        if m:boundaries[int(m[1])].append(row)
    if not (source.endswith('u_head_gate/O') or ('gen_style_p.u_' in source and source.endswith('/O'))):continue
    for side in ('upper','lower'):
        token='u_chain_'+side
        if token in source and token in target:
            key=(source.replace(token,'u_chain_PAIR'),target.replace(token,'u_chain_PAIR'))
            pair=groups.setdefault(key,{})
            if side in pair and any(pair[side][k]!=row[k] for k in ('slow_max_ps','fast_min_ps')):raise ValueError('Conflicting arc')
            pair[side]=row
pairs=[]
for (source,target),p in sorted(groups.items()):
    if set(p)!={'upper','lower'}:raise ValueError('Missing paired arc')
    d=dict(driver=source,sink=target)
    for corner in ('slow_max_ps','fast_min_ps'):
        d['upper_'+corner]=float(p['upper'][corner]);d['lower_'+corner]=float(p['lower'][corner])
        d['difference_'+corner]=d['upper_'+corner]-d['lower_'+corner]
    pairs.append(d)
if len(pairs)!=4096:raise ValueError(f'Expected 4096 internal paired arcs, got {len(pairs)}')
boundary_skews={}
for core in range(64):
    rr=boundaries[core];checks={
        'launch':[v for v in rr if v['sink'].endswith('u_head_gate/I0')],
        'feedback':[v for v in rr if v['sink'].endswith('u_head_gate/I1')],
        'arbiter':[v for v in rr if v['sink'].endswith(('u_arbiter_dff/D','u_arbiter_dff/C'))]}
    if any(len(v)!=2 for v in checks.values()):raise ValueError(f'Incomplete boundary audit: core {core}')
    boundary_skews[core]={kind:{corner:abs(float(v[0][corner])-float(v[1][corner])) for corner in ('slow_max_ps','fast_min_ps')} for kind,v in checks.items()}
with (b/'paired_arcs.csv').open('w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(pairs[0]));w.writeheader();w.writerows(pairs)
summary=dict(paired_internal_arcs=len(pairs),nonzero_slow=sum(p['difference_slow_max_ps']!=0 for p in pairs),
             nonzero_fast=sum(p['difference_fast_min_ps']!=0 for p in pairs),
             max_slow_skew_ps=max(abs(p['difference_slow_max_ps']) for p in pairs),
             max_fast_skew_ps=max(abs(p['difference_fast_min_ps']) for p in pairs),boundaries=dict(boundaries),boundary_skews=boundary_skews,
             limitation='Modeled net delays; not proof of analog symmetry, entropy or hardware reliability.')
(b/'route_summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print({k:v for k,v in summary.items() if k not in ('boundaries','boundary_skews')})
print('Boundary maximum slow skew (ps):',{k:max(v[k]['slow_max_ps'] for v in boundary_skews.values()) for k in ('launch','feedback','arbiter')})
