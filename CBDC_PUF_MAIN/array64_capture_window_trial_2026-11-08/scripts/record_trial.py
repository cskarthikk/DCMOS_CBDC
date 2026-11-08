from pathlib import Path
import hashlib,json,re
r=Path(__file__).resolve().parents[1];b=r.parent/'array64_candidate_2026-11-08'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest().upper()
ss=json.loads((r/'SOURCE_SNAPSHOT.json').read_text())
for name,h in ss['files'].items():assert sha(r/name)==h.upper(),name
for n in ('cbdc_puf_core.v','cbdc_puf_chain.v','cbdc_puf_element.v','cbdc_puf_ctrl.v'):
 assert (r/'rtl'/n).read_bytes()==(b/'rtl'/n).read_bytes(),n
assert 'Changed endpoint/PIP fingerprints: 0' in (r/'build/physical_identity.txt').read_text()
assert 'PASS:' in (r/'sim/result.txt').read_text()
assert len(re.findall(r'Core \d+ PASS:',(r/'build/structure.txt').read_text()))==64
assert (r/'build/boundary_comparison.json').exists()
bit=r/'build/paper_array64.bit';assert bit.is_file()
files=[*sorted((r/'rtl').glob('*.v')),r/'basys3_serial.xdc',r/'layout.tcl',r/'layout.json',r/'sim/result.txt',
 *[r/'build'/s for s in ('routed.dcp','route_status_final.rpt','timing.rpt','drc_final.rpt','physical_identity.txt','boundary_comparison.json','structure.txt')],r/'scripts/collect.ps1']
record=dict(bitstream='build/paper_array64.bit',sha256=sha(bit),variant='paper_array64_latch64_trial',cores=64,latch_cycles=64,raw_only=True,
 baseline_bitstream_sha256=ss['baseline_bitstream_sha256'],
 note='Diagnostic only. Core geometry and all6272 PUF signal trees/endpoints preserved. Ordinary control routing changes are quantified. Internal modeled-delay equality evidence inherited from baseline only after exact physical identity verification, not freshly re-extracted for all4096 pairs.',
 files={str(p.relative_to(r)).replace('\\','/'):sha(p) for p in files})
(r/'BUILD_RECORD.json').write_text(json.dumps(record,indent=2)+'\n');print('Recorded diagnostic bitstream:',record['sha256'])
