from pathlib import Path
import json,hashlib
out=Path(__file__).resolve().parent;candidate=out.parents[1];main=candidate.parent
src=candidate/'measurements/new/array64_d6b683d0f03d41c7913043d136cb1ac6.csv.challenges.json'
matrix=json.loads(src.read_text(encoding='utf-8-sig'))[:64]
assert len(matrix)==64 and all(len(r['challenges'])==64 for r in matrix)
(out/'first64_vectors.json').write_text(json.dumps(matrix,indent=2)+'\n')
names=['cbdc_puf_element.v','cbdc_puf_chain.v','cbdc_puf_core.v','cbdc_puf_ctrl.v','cbdc_serial_engine.v','cbdc_uart.v','cbdc_button.v']
original=json.loads((main/'BUILD_RECORD.json').read_text())
record={n:dict(equal=(main/'rtl'/n).read_bytes()==(candidate/'rtl'/n).read_bytes(),sha256=hashlib.sha256((candidate/'rtl'/n).read_bytes()).hexdigest()) for n in names}
assert all(r['equal'] for r in record.values())
for n,r in record.items():
 r['matches_eight_core_build_record']=r['sha256'].upper()==original['files']['rtl/'+n].upper()
 assert r['matches_eight_core_build_record'],n
(out/'rtl_comparison.json').write_text(json.dumps(record,indent=2)+'\n')
print('PASS: seven common RTL files byte-identical; first 64 original vectors frozen without response selection.')
