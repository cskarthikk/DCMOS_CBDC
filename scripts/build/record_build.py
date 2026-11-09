from pathlib import Path
import hashlib,json,re
r=Path(__file__).resolve().parents[1]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest().upper()
sources=json.loads((r/'SOURCE_SNAPSHOT.json').read_text())
for name,h in sources.items():
 if sha(r/'rtl'/name)!=h.upper():raise ValueError('Source changed after snapshot: '+name)
for name in ('cbdc_puf_core.v','cbdc_puf_chain.v','cbdc_puf_element.v','cbdc_puf_ctrl.v','cbdc_serial_engine.v'):
 if sha(r/'rtl'/name)!=sha(r.parent/'rtl'/name):raise ValueError('Measured core/controller changed: '+name)
s=json.loads((r/'build/route_summary.json').read_text())
if s['paired_internal_arcs']!=4096 or s['nonzero_slow'] or s['nonzero_fast']:raise ValueError('Internal paired-route matching incomplete')
if 'PASS:' not in (r/'sim/result.log').read_text():raise ValueError('Functional simulation missing')
bit=r/'build/paper_array64.bit'
if not bit.is_file():raise ValueError('Bitstream missing')
files=[*sorted((r/'rtl').glob('*.v')),r/'basys3_serial.xdc',r/'internal_route_template.tcl',r/'layout.tcl',r/'layout.json',
    *[r/'scripts'/n for n in ('synthesize.tcl','implement.tcl','route.tcl','refine_routes.tcl','audit.tcl','audit_structure.tcl','export_delays.tcl','export_shard.tcl','review_shard.tcl','finalize.tcl','collect.ps1','analyze.py','program.tcl','merge_delays.py','summarize_routes.py','plan_compact.py')],
    r/'run.ps1',r/'build/routed.dcp',r/'build/route_status_final.rpt',r/'build/drc_final.rpt',r/'build/utilization_final.rpt',r/'build/timing.rpt',r/'build/methodology.rpt',r/'build/route_summary.json',r/'build/net_delays.csv',r/'build/paired_arcs.csv',r/'build/structure.txt',r/'sim/tb_array64.v',r/'sim/result.log',r/'sim/host_result.log']
record=dict(variant='paper_array64_and_ce',part='xc7a35tcpg236-1',cores=64,stages=16,bitstream='build/paper_array64.bit',sha256=sha(bit),
 raw_only=True,physical_measurements_available=False,core_and_controller_rtl_unchanged=True,
 implementation_flow='Synthesis, compact constrained placement, fixed routing, then refine_routes.tcl; full structural and four-part delay audit repeated on routed_refined.dcp before promotion to routed.dcp.',
 protocol=dict(request_header='A6',reply_header='D6',request_bytes=131,reply_bytes=140,configuration_bits=1024,response_bits=64),
 files={str(p.relative_to(r)).replace('\\','/'):sha(p) for p in files},
 limitations=['Figure 1 interpretation retains the baseline three-LUT stage and odd-parity restriction; not an exact published LUT mapping.',
 'Compact placement changes physical boundaries and uses several tile families; new hardware characterization/enrollment required.',
 'Net-delay matching and digital tests do not establish analog symmetry, bias, entropy, environmental reliability or security.'])
(r/'BUILD_RECORD.json').write_text(json.dumps(record,indent=2)+'\n')
print('Recorded candidate:',record['sha256'])
