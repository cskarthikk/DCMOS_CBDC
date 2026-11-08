from pathlib import Path
import json
out=Path(__file__).resolve().parent;c=out.parents[1];m=c.parent
eight=json.loads((m/'measurements/paper8_0fcd36dbe06545a2bb3941b4976b5848.csv.challenges.json').read_text(encoding='utf-8-sig'))[:64]
sixtyfour=json.loads((out/'first64_vectors.json').read_text())
mapping={0:50,1:0,3:10,4:12,6:21,7:23}
for p,row in enumerate(eight):
 for old,new in mapping.items():row['challenges'][old]=sixtyfour[p]['challenges'][new]
(out/'eight_matched_vectors.json').write_text(json.dumps(eight,indent=2)+'\n')
(out/'restore_smoke_vectors.json').write_text(json.dumps(sixtyfour[:4],indent=2)+'\n')
print('Prepared 64 vectors for eight cores; six locations receive exactly the same configurations as their 64-core counterparts.')
