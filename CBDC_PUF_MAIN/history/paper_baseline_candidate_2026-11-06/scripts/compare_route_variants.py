"""Report physical estimates only; never select using observed response bits."""
import json
import sys
from pathlib import Path

root = Path(__file__).resolve().parents[1]
names = sys.argv[1:] or ['build_internal_matched_v2', 'build_boundary_v1']
result = {}
for name in names:
    summary = json.loads((root / name / 'route_summary.json').read_text())
    arcs = summary['launch_and_arbiter_arcs']
    pairs = {
        'launch': [next(r for r in arcs if f'u_chain_{side}/' in r['to_pin'] and r['to_pin'].endswith('u_head_gate/I0')) for side in ('upper', 'lower')],
        'feedback': [next(r for r in arcs if f'u_chain_{side}/' in r['from_pin'] and r['to_pin'].endswith('u_head_gate/I1')) for side in ('upper', 'lower')],
        'arbiter': [next(r for r in arcs if r['to_pin'].endswith('u_arbiter_dff/' + pin)) for pin in ('D', 'C')],
    }
    result[name] = {
        'internal_pairs': summary['paired_internal_arcs'],
        'internal_slow_skew_max_ps': summary['largest_absolute_slow_max_skew_ps'],
        'internal_fast_skew_max_ps': max(abs(float(p['upper_minus_lower_fast_min_ps'])) for p in __import__('csv').DictReader((root / name / 'paired_arcs.csv').open())),
        'boundaries': {kind: {corner: {'first': float(pair[0][corner]), 'second': float(pair[1][corner]),
                          'absolute_difference': abs(float(pair[0][corner]) - float(pair[1][corner]))}
                          for corner in ('slow_max_ps', 'fast_min_ps')} for kind, pair in pairs.items()},
    }
print(json.dumps(result, indent=2))
