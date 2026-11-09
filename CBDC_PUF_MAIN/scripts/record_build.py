"""Fail closed on missing structural, routing or simulation evidence."""
import csv,hashlib,json,re
from pathlib import Path
r=Path(__file__).resolve().parents[1];b=r/'build_matched';out=r/'BUILD_RECORD.json'
if out.exists():raise SystemExit('Preserve existing release record')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest().upper()
status=(b/'route_status.rpt').read_text()
assert re.search(r'nets with routing errors\.+\s*:\s*0',status)
full=int(re.search(r'fully routed nets\.+\s*:\s*(\d+)',status)[1]);needed=int(re.search(r'# of routable nets\.+\s*:\s*(\d+)',status)[1]);assert full==needed
fixed=int(re.search(r'nets with fixed routing\.+\s*:\s*(\d+)',status)[1]);assert fixed==768
for kind in ('Setup','Hold'):assert re.search(kind+r'\s*:\s*0\s+Failing Endpoints',(b/'timing.rpt').read_text())
assert (b/'structure.txt').read_text().count('PASS: one falling-edge FF')==8
assert 'PASS: all 800' in (b/'placement_verified.txt').read_text()
assert 'PASS: real Latch-controlled capture' in (r/'sim/result.log').read_text()
groups={i:{} for i in range(8)};boundary=[]
for row in csv.DictReader((b/'net_delays.csv').open()):
    source,target=row['driver'],row['sink']
    if target.endswith(('/u_arbiter_dff/D','/u_arbiter_dff/C','u_head_gate/I0','u_head_gate/I1')):boundary.append(row)
    m=re.match(r'gen_core\[(\d)\].u_engine/u_core/u_chain_(upper|lower)/',source)
    if not m:continue
    token='u_chain_'+m[2]
    if token not in target or not(source.endswith('u_head_gate/O') or 'gen_style_p.u_' in source and source.endswith('/O')):continue
    groups[int(m[1])].setdefault((source.replace(token,'PAIR'),target.replace(token,'PAIR')),{})[m[2]]=row
summaries=[]
for i,g in groups.items():
    assert len(g)==64 and all(set(v)=={'upper','lower'} for v in g.values()),(i,len(g))
    data={corner:max(abs(float(v['upper'][corner])-float(v['lower'][corner])) for v in g.values()) for corner in ('slow_max_ps','fast_min_ps')}
    assert data['slow_max_ps']==data['fast_min_ps']==0,(i,data)
    summaries.append(dict(core=i,internal_pairs=64,max_internal_net_mismatch_ps=data))
record=dict(status='Corrected Figure 1 interpretation; hardware acceptance pending; not an exact paper reproduction',
 bitstream='build_matched/paper_array8.bit',sha256=sha(b/'paper_array8.bit'),cores=8,core_response_ffs=8,fully_routed_nets=full,fixed_internal_nets=fixed,
 internal_net_audit=summaries,boundary_net_estimates=boundary,
 limitations=['Remaining boundary net mismatch','Three-LUT stage mapping interpretation; paper reports two LUT2s/stage','Fixed AND accepts odd parity only; full paper challenge coverage unresolved','Different FPGA','No activity monitors or live firmware hash attestation','SHA3/BCH/128-core framework deferred'],
 files={str(p.relative_to(r)).replace('\\','/'):sha(p) for folder in ('rtl','scripts','sim','constraints') for p in (r/folder).glob('*') if p.is_file() and p.suffix!='.vvp'},
 evidence={p.name:sha(p) for p in b.iterdir() if p.is_file() and p.suffix in ('.rpt','.txt','.csv','.dcp','.bit')},
 layout_sha256=sha(r/'layout.tcl'),template_sha256=sha(r/'internal_route_template.tcl'))
out.write_text(json.dumps(record,indent=2)+'\n');print('PASS: eight one-FF cores, 512 matching internal arc pairs at both corners, 768 fixed nets, placement, simulation, route legality and ordinary timing.');print('Bitstream SHA256:',record['sha256'])
