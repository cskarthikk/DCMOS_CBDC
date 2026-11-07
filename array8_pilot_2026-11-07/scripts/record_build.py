import csv,hashlib,json,re,sys
from pathlib import Path
root=Path(__file__).resolve().parents[1];variant=sys.argv[1] if len(sys.argv)>1 else 'build_v2'
assert variant in ('build_v2','build_v3');build=root/variant
ref=root.parent/'continuation_single_puf_2026-11-06/reference/best_so_far_single_puf_2026-11-04'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest().upper()
out=root/'BUILD_RECORD.json'
if out.exists():raise SystemExit('Preserve existing release record')
for name in ('cbdc_uart','cbdc_button','cbdc_puf_element','cbdc_puf_chain','cbdc_puf_core','cbdc_puf_ctrl'):
 assert sha(root/'rtl'/f'{name}.v')==sha(ref/'rtl'/f'{name}.v'),name
engine=(root/'rtl/cbdc_serial_engine.v').read_text().replace('\r\n','\n').strip()
original=(ref/'rtl/cbdc_puf_serial.v').read_text()
assert engine.startswith(original[:original.index('endmodule')+9].strip())
route=(build/'route_status.rpt').read_text()
assert re.search(r'nets with routing errors\.+\s*:\s*0',route)
full=int(re.search(r'fully routed nets\.+\s*:\s*(\d+)',route)[1])
needed=int(re.search(r'# of routable nets\.+\s*:\s*(\d+)',route)[1]);assert full==needed
timing=(build/'timing.rpt').read_text()
for kind in ('Setup','Hold'):assert re.search(kind+r'\s*:\s*0\s+Failing Endpoints',timing),kind
assert (build/'structure.txt').read_text().count('FFs (2 arbiters and 2 edge locks)')==8
assert 'PASS: all 816' in (build/'placement_verified.txt').read_text()
assert 'PASS:' in (root/'sim/result.log').read_text()
groups={i:{} for i in range(8)}
for row in csv.DictReader((build/'net_delays.csv').open()):
 source,target=row['driver'],row['sink']
 m=re.match(r'gen_core\[(\d)\].u_engine/u_core/u_chain_(upper|lower)/',source)
 if not m:continue
 i,side=int(m[1]),m[2];token='u_chain_'+side
 if token not in target:continue
 if not (source.endswith('u_head_gate/O') or ('gen_style_p.u_' in source and source.endswith('/O'))):continue
 key=(source.replace(token,'PAIR'),target.replace(token,'PAIR'))
 groups[i].setdefault(key,{})[side]=row
summaries=[]
for i,group in groups.items():
 assert len(group)==64 and all(set(v)=={'upper','lower'} for v in group.values()),(i,len(group))
 skews={corner:[abs(float(v['upper'][corner])-float(v['lower'][corner])) for v in group.values()] for corner in ('slow_max_ps','fast_min_ps')}
 summaries.append(dict(core=i,paired_internal_arcs=64,**{k:dict(max_skew=max(v),nonzero_pairs=sum(x!=0 for x in v)) for k,v in skews.items()}))
record=dict(status='8-core pilot; hardware validation pending',bitstream=f'{variant}/array8.bit',sha256=sha(build/'array8.bit'),
 cores=8,core_ffs=32,fully_routed_nets=full,source_checkpoint_sha256=sha(ref/'build_m1/pulled_single/cbdc_pulled_single.bit'),
 internal_net_audit=summaries,layout_sha256=sha(root/'layout.tcl'),site_inventory_sha256=sha(root/'sites.csv'),placement='Paired relative geometry from saved core; independently routed. Not an exact routed hard-macro copy.',
 limitations='Preserved experimental architecture; not exact paper Figure 1. Async warnings remain. No measured pilot responses yet.',
 files={str(p.relative_to(root)).replace('\\','/'):sha(p) for folder in ('rtl','constraints','scripts','sim') for p in (root/folder).glob('*') if p.is_file() and p.suffix not in ('.vvp',)},
 evidence={p.name:sha(p) for p in build.iterdir() if p.is_file() and p.suffix in ('.rpt','.txt','.csv','.dcp','.bit')})
out.write_text(json.dumps(record,indent=2)+'\n');print(json.dumps({k:record[k] for k in ('sha256','fully_routed_nets','internal_net_audit')},indent=2))
