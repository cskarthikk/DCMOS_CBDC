from pathlib import Path
import hashlib,json
r=Path(__file__).resolve().parents[1]; main=r.parent
s=(main/'reports/feasibility_128_2026-11-07/rtl/cbdc_array_resource.v').read_text()
s=s.replace('cbdc_array_resource','cbdc_array64_serial').replace('CORE_COUNT=128','CORE_COUNT=64')
s=s.replace('// RESOURCE MODEL ONLY: extended-length frame; not the installed host protocol.', '// 64-core candidate: request A6/control/128 config bytes/XOR; reply D6/control/128 actual config bytes/status/8 response bytes/XOR.')
s=s.replace("8'hac","8'ha6").replace("8'h5c","8'hd6")
(r/'rtl/cbdc_array64_serial.v').write_text(s)
records={}
for p in (r/'rtl').glob('*.v'):
    records[p.name]=hashlib.sha256(p.read_bytes()).hexdigest()
(r/'SOURCE_SNAPSHOT.json').write_text(json.dumps(records,indent=2)+'\n')
