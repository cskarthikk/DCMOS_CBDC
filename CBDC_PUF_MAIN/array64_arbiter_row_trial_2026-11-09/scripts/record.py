from pathlib import Path
import hashlib,json,re
r=Path(__file__).resolve().parents[1];b=r.parent/'array64_candidate_2026-11-08';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest().upper()
assert 'Changed endpoint/PIP fingerprints: 0' in (r/'build/physical_identity.txt').read_text()
assert len(re.findall(r'Core \d+ PASS:',(r/'build/structure.txt').read_text()))==64
files=[r/'scripts/collect.ps1',r/'scripts/implement.tcl',r/'scripts/audit_structure.tcl',r/'scripts/verify_physical.tcl',r/'layout.tcl',
 r/'scripts/resume_aff.tcl',*[r/'build'/s for s in ('routed.dcp','route_status_final.rpt','timing.rpt','drc_final.rpt','physical_identity.txt','boundary_comparison.json','structure.txt')]]
record=dict(bitstream='build/paper_array64.bit',sha256=sha(r/'build/paper_array64.bit'),baseline_bitstream_sha256='98266A06F5CA5EAE25EAFC507E1B4D81EC55CD21B48980969AF0A7CFF23C1517',
 baseline_synthesized_checkpoint_sha256=sha(b/'build/synthesized.dcp'),variant='paper_array64_arbiterrow_trial',latch_cycles=8,arbiter_head_y_offset=16,arbiter_bel='AFF',cores=64,raw_only=True,
 note='Exact baseline synthesized netlist. 64 response arbiters moved one row toward chain ends and from BFF to AFF. All 6144 internal route trees preserved; terminal/feedback and ordinary routes reimplemented. Six ordinary controller flip-flops released from former locations to free the reserved arbiter tiles. Initial BFF attempt failed routing. Diagnostic, not automatically promoted.',
 files={str(p.relative_to(r)).replace('\\','/'):sha(p) for p in files})
(r/'BUILD_RECORD.json').write_text(json.dumps(record,indent=2)+'\n');print(record['sha256'])
