from pathlib import Path
import hashlib,json
r=Path(__file__).resolve().parents[1];base=r.parent/'array64_candidate_2026-11-08'
p=r/'rtl/cbdc_serial_engine.v';s=p.read_text();old=".AUTO_PARITY(0),.GATE_INIT(4'h8)"
assert old in s;s=s.replace(old,old+',.LATCH_CYCLES(64)');p.write_text(s)
for name in ('cbdc_puf_core.v','cbdc_puf_chain.v','cbdc_puf_element.v','cbdc_puf_ctrl.v'):
 assert (r/'rtl'/name).read_bytes()==(base/'rtl'/name).read_bytes()
record=dict(baseline_bitstream_sha256='98266A06F5CA5EAE25EAFC507E1B4D81EC55CD21B48980969AF0A7CFF23C1517',
 change='Only controller instantiation LATCH_CYCLES override:8 ->64. PUF core/chain/element/controller definitions unchanged.',
 latch_cycles=64,files={str(p.relative_to(r)):hashlib.sha256(p.read_bytes()).hexdigest() for p in (r/'rtl').glob('*.v')})
(r/'SOURCE_SNAPSHOT.json').write_text(json.dumps(record,indent=2)+'\n')
