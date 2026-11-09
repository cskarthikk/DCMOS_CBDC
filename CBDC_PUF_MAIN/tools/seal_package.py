"""Create the initial accidental-change integrity manifest; not a signature."""
import hashlib,json
from datetime import datetime,timezone
from pathlib import Path
root=Path(__file__).resolve().parents[1];target=root/'PACKAGE_MANIFEST.json'
if target.exists():raise SystemExit('Refusing to reseal an existing package; investigate changed files instead')
excluded={'reports','validation','rebuilds'}
files={}
for p in sorted(root.rglob('*')):
    if not p.is_file():continue
    relative=p.relative_to(root)
    if relative.parts[0] in excluded or '__pycache__' in relative.parts or p.suffix=='.pyc':continue
    if relative.parts[0]=='measurements' and len(relative.parts)>1 and relative.parts[1] in ('new','validation'):continue
    if relative.name=='PACKAGE_MANIFEST.json':continue
    files[relative.as_posix()]=hashlib.sha256(p.read_bytes()).hexdigest().upper()
target.write_text(json.dumps(dict(schema=1,created_utc=datetime.now(timezone.utc).isoformat(),
 note='Frozen package integrity only; generated outputs are excluded. This is not signed firmware attestation.',files=files),indent=2)+'\n')
print('Sealed',len(files),'files.')
