"""Validate saved implementation evidence before enabling its collector."""
import hashlib
import json
import re
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

root = Path(__file__).resolve().parents[1]
build = root / 'build_boundary_v3'
record_path = root / 'BOUNDARY_BUILD_RECORD.json'
if record_path.exists():
    raise SystemExit('Refusing to overwrite the reviewed build record')

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()

old = json.loads((root / 'BUILD_RECORD.json').read_text())
for name, expected in old['files'].items():
    if name.startswith('rtl/'):
        assert sha(root / name) == expected.upper(), f'RTL changed: {name}'
assert sha(root / 'build_internal_matched_v2/candidate.bit') == 'EA95455975095342B43FBEDF5592B7CC4592D20A0E328B1E9C795A5C516AB8E6'
subprocess.run([sys.executable, str(root / 'scripts/summarize_routes.py'), build.name], check=True, capture_output=True)
comparison = json.loads(subprocess.check_output([sys.executable, str(root / 'scripts/compare_route_variants.py'), 'build_internal_matched_v2', build.name]))
before, after = comparison['build_internal_matched_v2'], comparison[build.name]
assert after['internal_pairs'] == 64
assert after['internal_slow_skew_max_ps'] == after['internal_fast_skew_max_ps'] == 0
for kind in ('launch', 'feedback', 'arbiter'):
    for corner in ('slow_max_ps', 'fast_min_ps'):
        assert after['boundaries'][kind][corner]['absolute_difference'] < before['boundaries'][kind][corner]['absolute_difference']
route = (build / 'final_route_status.rpt').read_text()
assert re.search(r'fully routed nets\.+\s*:\s*630', route)
assert re.search(r'nets with routing errors\.+\s*:\s*0', route)
assert re.search(r'nets with fixed routing\.+\s*:\s*99', route)
timing = (build / 'final_timing.rpt').read_text()
for kind in ('Setup', 'Hold'):
    assert re.search(kind + r'\s*:\s*0\s+Failing Endpoints', timing)
structure = (build / 'structure_checks.txt').read_text()
assert structure.count('PASS:') == 7
files = list((root / 'rtl').glob('*.v')) + list((root / 'constraints').glob('*.xdc'))
files += list((root / 'scripts').glob('*boundary*'))
files += [root / 'scripts/verify_core_structure.tcl', root / 'scripts/audit_routes.tcl', root / 'scripts/summarize_routes.py', root / 'scripts/compare_route_variants.py']
files += [p for p in build.iterdir() if p.is_file()]
record = {
    'recorded_utc': datetime.now(timezone.utc).isoformat(),
    'status': 'Implementation verified; hardware comparison pending; not final baseline',
    'physical_variant': 'boundary_v3',
    'selected_bitstream': 'build_boundary_v3/candidate.bit',
    'bitstream_sha256': sha(build / 'candidate.bit'),
    'parent_bitstream_sha256': sha(root / 'build_internal_matched_v2/candidate.bit'),
    'rtl_unchanged': True,
    'selection': 'Modeled boundary net symmetry only; no hardware response selection',
    'comparison': comparison,
    'limitations': ['Remaining boundary mismatch', 'Net models do not establish silicon or LUT-arc symmetry', 'Paper gate and LUT mapping ambiguities', 'Different FPGA', 'No activity monitors', 'Asynchronous PUF warnings remain'],
    'files': {str(p.relative_to(root)).replace('\\', '/'): sha(p) for p in files},
}
record_path.write_text(json.dumps(record, indent=2) + '\n')
print('PASS: RTL preservation, route symmetry, routing legality, setup/hold and structure evidence.')
print('Bitstream SHA256:', record['bitstream_sha256'])
