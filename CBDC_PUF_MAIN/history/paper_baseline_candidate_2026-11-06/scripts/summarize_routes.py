"""Compare corresponding routed arcs; never infer physical symmetry from LOCs."""
import csv
import json
import sys
from pathlib import Path

root = Path(__file__).resolve().parents[1]
build = root / (sys.argv[1] if len(sys.argv) > 1 else 'build')
rows = list(csv.DictReader((build / 'net_delays.csv').open(newline='')))
groups = {}
special = []
for row in rows:
    source, target = row['from_pin'], row['to_pin']
    if 'u_arbiter_dff/' in target or 'u_head_gate/I0' in target or 'u_head_gate/I1' in target:
        if not any(r['from_pin'] == source and r['to_pin'] == target for r in special):
            special.append(row)
    if not (source.endswith('u_head_gate/O') or 'gen_style_p.u_' in source and source.endswith('/O')):
        continue  # Exclude constant ties and control nets from chain signal matching.
    for side in ('upper', 'lower'):
        token = 'u_chain_' + side
        if token in source and token in target:
            key = (source.replace(token, 'u_chain_PAIR'), target.replace(token, 'u_chain_PAIR'))
            pair = groups.setdefault(key, {})
            if side in pair:
                previous = pair[side]
                if all(previous[k] == row[k] for k in ('slow_max_ps', 'fast_min_ps')):
                    continue  # Hierarchical aliases can expose the same physical arc.
                raise ValueError(f'Conflicting duplicate arc: {key} {side}')
            pair[side] = row

pairs = []
unpaired = []
for key, pair in sorted(groups.items()):
    if set(pair) != {'upper', 'lower'}:
        unpaired.append(key)
        continue
    item = {'from_pin': key[0], 'to_pin': key[1]}
    for corner in ('slow_max_ps', 'fast_min_ps'):
        item['upper_' + corner] = float(pair['upper'][corner])
        item['lower_' + corner] = float(pair['lower'][corner])
        item['upper_minus_lower_' + corner] = item['upper_' + corner] - item['lower_' + corner]
    pairs.append(item)
if len(pairs) != 64 or unpaired:
    raise ValueError(f'Incomplete chain audit: {len(pairs)} paired arcs, {len(unpaired)} unpaired. Expected 64 pairs; check export completion.')
with (build / 'paired_arcs.csv').open('w', newline='') as stream:
    writer = csv.DictWriter(stream, fieldnames=pairs[0])
    writer.writeheader()
    writer.writerows(pairs)
summary = {
    'paired_internal_arcs': len(pairs),
    'unpaired_internal_arcs': unpaired,
    'nonzero_slow_max_skew_arcs': sum(p['upper_minus_lower_slow_max_ps'] != 0 for p in pairs),
    'nonzero_fast_min_skew_arcs': sum(p['upper_minus_lower_fast_min_ps'] != 0 for p in pairs),
    'largest_absolute_slow_max_skew_ps': max(abs(p['upper_minus_lower_slow_max_ps']) for p in pairs),
    'launch_and_arbiter_arcs': special,
    'interpretation': 'Modeled net delays only. No LUT-arc matching, analog equivalence, or hardware bias conclusion follows from these values alone.'
}
(build / 'route_summary.json').write_text(json.dumps(summary, indent=2))
print(json.dumps(summary, indent=2))
