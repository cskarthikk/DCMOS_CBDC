"""Local enrollment/validation for the frozen eight-core measurement profile.

Only file identity is hashed. Raw responses are never whitened or encrypted.
"""
import argparse
import collections
import csv
import hashlib
import json
import re
import shutil
import sys
import uuid
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
VARIANT = 'paper_array8_and_ce'
POLICY = 'all_enrollment_trials_identical_minimum_20'
SOURCE = ROOT/'measurements/paper8_0fcd36dbe06545a2bb3941b4976b5848.csv'
MODEL = ROOT/'enrollment/baseline/model.json'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest().upper()


def read_json(path):
    return json.loads(Path(path).read_text(encoding='utf-8-sig'))


def write_json(path, data):
    path = Path(path)
    require(not path.exists(), f'Preserve existing output: {path}')
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2)+'\n', encoding='utf-8')


def matrix_id(matrix):
    return hashlib.sha256(json.dumps(matrix, sort_keys=True, separators=(',', ':')).encode()).hexdigest().upper()


def capture(path):
    path = Path(path).resolve()
    meta = read_json(str(path)+'.metadata.json')
    require(meta.get('variant') == VARIANT and meta.get('cores') == 8, 'Wrong capture variant/core count')
    require(meta.get('mode') in ('Parallel', 'Sequential'), 'Invalid activation mode')
    for field, high in [('patterns',4096), ('repeats',1000), ('excite_cycles',127)]:
        require(type(meta.get(field)) is int and 1 <= meta[field] <= high, f'Invalid {field}')
    require(re.fullmatch(r'[0-9A-Fa-f]{64}', meta.get('sha256','')) is not None, 'Missing bitstream identity')
    matrix = read_json(str(path)+'.challenges.json')
    if isinstance(matrix, dict): matrix = [matrix]
    require(isinstance(matrix, list) and len(matrix) == meta['patterns'], 'Configuration matrix length mismatch')
    for i, vector in enumerate(matrix):
        require(vector.get('pattern') == i and len(vector.get('challenges',[])) == 8, 'Invalid configuration vector')
        require(all(type(c) is int and 0 <= c <= 65535 and c.bit_count()%2 == 1 for c in vector['challenges']), 'Unsupported configuration/parity')
    with path.open(encoding='utf-8-sig', newline='') as file:
        rows = list(csv.DictReader(file))
    require(len(rows) == meta['patterns']*meta['repeats']*8, 'Incomplete capture')
    frames, groups, times = collections.defaultdict(dict), collections.defaultdict(list), []
    for row in rows:
        p,t,c = int(row['pattern']),int(row['trial']),int(row['core'])
        require(0 <= p < meta['patterns'] and 1 <= t <= meta['repeats'] and 0 <= c < 8, 'Invalid frame/core index')
        require(c not in frames[p,t], 'Duplicate frame/core observation')
        require(row['variant'] == VARIANT and row['flags_hex'] == '61', 'Invalid firmware status')
        require(row['mode'] == meta['mode'] and int(row['excite_cycles']) == meta['excite_cycles'], 'Condition label mismatch')
        require(re.fullmatch(r'[0-9A-Fa-f]{4}', row['challenge_hex']) is not None, 'Malformed configuration')
        require(int(row['challenge_hex'],16) == matrix[p]['challenges'][c], 'Configuration differs from matrix')
        require(row['response'] in ('0','1'), 'Invalid raw bit')
        require(row['qb_edge_seen'] == row['qu_edge_seen'] == '', 'Activity was not instrumented')
        require(re.fullmatch(r'[0-9A-Fa-f]{2}', row['response_word_hex']) is not None, 'Invalid word')
        word = int(row['response_word_hex'],16)
        require(int(row['response']) == ((word >> c)&1), 'Raw bit/word mismatch')
        stamp = datetime.fromisoformat(row['utc'].replace('Z','+00:00'))
        require(stamp.tzinfo is not None, 'Timestamp must identify a timezone')
        times.append(stamp)
        frames[p,t][c] = word
        groups[p,c].append(int(row['response']))
    require(len(frames) == meta['patterns']*meta['repeats'], 'Missing frames')
    require(all(set(frame)==set(range(8)) and len(set(frame.values()))==1 for frame in frames.values()), 'Incomplete/inconsistent response word')
    require(len(groups) == meta['patterns']*8 and all(len(v)==meta['repeats'] for v in groups.values()), 'Missing trials')
    return dict(path=path, meta=meta, matrix=matrix, groups=groups, frames=frames,
                rows=len(rows), sha256=digest(path), first=min(times), last=max(times))


def summarize(data):
    cores=[]
    for core in range(8):
        values=[data['groups'][p,core] for p in range(data['meta']['patterns'])]
        ones=sum(map(sum,values)); observations=sum(map(len,values))
        cores.append(dict(core=core, observations=observations, ones=ones, ones_percent=100*ones/observations,
            mixed_patterns=sum(0<sum(v)<len(v) for v in values), ties=sum(2*sum(v)==len(v) for v in values)))
    return dict(frames=len(data['frames']), raw_observations=data['rows'],
                ones_percent=100*sum(c['ones'] for c in cores)/data['rows'], cores=cores,
                note='Finite raw observations; not certified reliability, entropy or uniqueness.')


def enroll(path=SOURCE, output=MODEL):
    data=capture(path); output=Path(output)
    release=read_json(ROOT/'BUILD_RECORD.json')
    require(data['meta']['sha256'].upper()==release['sha256'].upper(), 'Enrollment uses a different bitstream')
    require(data['meta']['mode']=='Parallel' and data['meta']['excite_cycles']==8, 'Enrollment profile must be Parallel/8')
    require(data['meta']['repeats']>=20, 'Enrollment requires at least 20 readings per vector/core')
    require(not output.parent.exists(), 'Enrollment is frozen; choose a new explicit experiment directory instead of overwriting it')
    bits=[]
    for (pattern,core),values in sorted(data['groups'].items()):
        ones=sum(values); count=len(values)
        reference=None if 2*ones==count else int(2*ones>count)
        selected=ones in (0,count)
        bits.append(dict(pattern=pattern,core=core,challenge_hex=f"{data['matrix'][pattern]['challenges'][core]:04X}",
            readings=count,ones=ones,reference=reference,selected=selected,
            reason='all readings agreed' if selected else ('majority tie' if reference is None else 'mixed readings')))
    selected=sum(x['selected'] for x in bits)
    require(selected>0, 'No enrollment positions satisfy the frozen policy')
    # All input validation finishes before creating any enrollment output.
    output.parent.mkdir(parents=True)
    source=output.parent/'source/enrollment_capture.csv'; source.parent.mkdir()
    for suffix in ('','.metadata.json','.challenges.json'):
        shutil.copy2(str(data['path'])+suffix,str(source)+suffix)
    matrix_path=output.parent/'challenge_matrix.json';write_json(matrix_path,data['matrix'])
    model=dict(schema=1,model_id=uuid.uuid4().hex,created_utc=datetime.now(timezone.utc).isoformat(),policy=POLICY,
        profile=dict(variant=VARIANT,cores=8,mode='Parallel',excite_cycles=8,bitstream_sha256=release['sha256']),
        source=dict(csv='source/enrollment_capture.csv',sha256=data['sha256'],metadata_sha256=digest(str(source)+'.metadata.json'),
            last_utc=data['last'].isoformat(),matrix_id=matrix_id(data['matrix'])),
        challenge_matrix='challenge_matrix.json',challenge_matrix_sha256=digest(matrix_path),patterns=data['meta']['patterns'],
        total_positions=len(bits),selected_positions=selected,excluded_positions=len(bits)-selected,
        selection_yield_percent=100*selected/len(bits),bits=bits,
        limits='A selected bit agreed in enrollment only. No validation result, bias correction, error correction, key or certified stability is implied.')
    write_json(output,model)
    with (output.parent/'reference_bits.csv').open('w',newline='',encoding='utf-8') as f:
        writer=csv.DictWriter(f,fieldnames=list(bits[0]));writer.writeheader();writer.writerows(bits)
    summary=summarize(data)
    write_json(output.parent/'enrollment_summary.json',summary)
    (output.parent/'README.md').write_text(
        f'# Frozen enrollment\n\nPolicy: {POLICY}. Selected {selected}/{len(bits)} core/vector positions '
        f'({model["selection_yield_percent"]:.4f}%). Excluded {len(bits)-selected}; all remain in reference_bits.csv and source data.\n\n'
        'This mask is fixed before validation. Validation cannot change it. Positions refer to the complete eight-core configuration vector, '
        'so configurations repeated on one core in different vectors remain separately identified. '
        'No output balancing, hashing, BCH or cryptographic key construction is performed.\n',encoding='utf-8')
    return model


def frozen_model(path):
    path=Path(path).resolve();model=read_json(path)
    require(model.get('schema')==1 and model.get('policy')==POLICY, 'Unknown enrollment policy/schema')
    matrix_path=path.parent/model['challenge_matrix']
    require(digest(matrix_path)==model['challenge_matrix_sha256'], 'Frozen configuration matrix changed')
    matrix=read_json(matrix_path)
    require(matrix_id(matrix)==model['source']['matrix_id'], 'Frozen vector identity changed')
    require(len(model['bits'])==model['patterns']*8, 'Incomplete enrollment references')
    return path,model,matrix


def validate(model_path, path, output):
    model_path,model,matrix=frozen_model(model_path);data=capture(path);meta=data['meta']
    require(data['sha256']!=model['source']['sha256'], 'Enrollment capture cannot validate itself')
    require(meta.get('enrollment_sha256','').upper()==digest(model_path), 'Capture was not bound to this frozen enrollment')
    require(meta.get('challenges_file_sha256','').upper()==model['challenge_matrix_sha256'], 'Capture did not replay the frozen matrix file')
    require(data['matrix']==matrix and matrix_id(data['matrix'])==model['source']['matrix_id'], 'Validation used different configuration vectors')
    profile=model['profile']
    require(meta.get('operator_confirmed_file') is True, 'Validation lacks operator confirmation of programming')
    require(meta['sha256'].upper()==profile['bitstream_sha256'].upper(), 'Different bitstream')
    require(meta['mode']==profile['mode'] and meta['excite_cycles']==profile['excite_cycles'], 'Different operating condition')
    require(data['first']>datetime.fromisoformat(model['source']['last_utc']), 'Validation must be a later capture; check clock or selected input')
    require(meta['repeats']>=20, 'Confirmation requires at least 20 readings')
    refs={(b['pattern'],b['core']):b for b in model['bits']}
    require(len(refs)==model['patterns']*8, 'Duplicate enrollment positions')
    details=[]; totals=collections.Counter(); per_core=[]
    for core in range(8):
        counts=collections.Counter()
        for pattern in range(model['patterns']):
            bit=refs[pattern,core];v=data['groups'][pattern,core]
            mismatch=None if bit['reference'] is None else sum(x!=bit['reference'] for x in v)
            details.append(dict(pattern=pattern,core=core,challenge_hex=bit['challenge_hex'],selected=bit['selected'],
                enrolled_reference=bit['reference'],validation_ones=sum(v),validation_readings=len(v),disagreements=mismatch))
            if bit['selected']:
                require(bit['reference'] in (0,1), 'Selected bit has no reference')
                counts['selected_positions']+=1;counts['observations']+=len(v);counts['disagreements']+=mismatch
                counts['positions_with_any_disagreement']+=int(mismatch>0)
        totals.update(counts)
        per_core.append(dict(core=core,**counts,observed_agreement_percent=100*(counts['observations']-counts['disagreements'])/counts['observations'] if counts['observations'] else None))
    eligible_frames=word_errors=0
    for (pattern,trial),frame in data['frames'].items():
        selected=[b for (p,c),b in refs.items() if p==pattern and b['selected']]
        if not selected:continue
        eligible_frames+=1
        word_errors+=any(((frame[b['core']]>>b['core'])&1)!=b['reference'] for b in selected)
    report=dict(schema=1,model_id=model['model_id'],model_sha256=digest(model_path),validation_csv=str(Path(path).resolve()),
        validation_sha256=data['sha256'],profile=profile,**totals,
        observed_selected_bit_agreement_percent=100*(totals['observations']-totals['disagreements'])/totals['observations'],
        frames_with_selected_positions=eligible_frames,frames_with_any_selected_bit_error=word_errors,
        cores=per_core,raw_summary=summarize(data),
        interpretation='Independent-run agreement with a frozen enrollment mask; not certified reliability, entropy, environmental robustness or a cryptographic key. Exclusions were chosen before this capture.')
    output=Path(output)
    require(not output.exists(), 'Preserve existing validation report')
    output.mkdir(parents=True)
    write_json(output/'report.json',report)
    with (output/'positions.csv').open('w',newline='',encoding='utf-8') as f:
        writer=csv.DictWriter(f,fieldnames=list(details[0]));writer.writeheader();writer.writerows(details)
    lines=['# Independent validation against frozen enrollment','',
        f"Selected positions: {totals['selected_positions']}; raw validation observations at those positions: {totals['observations']}.",
        f"Disagreements: {totals['disagreements']}; observed selected-bit agreement: {report['observed_selected_bit_agreement_percent']:.6f}%.",
        f"Selected positions with any disagreement: {totals['positions_with_any_disagreement']}.",
        f"Frames with any selected-bit error: {word_errors}/{eligible_frames}.",'',
        'The frozen mask was not changed using validation results. Unselected positions and raw statistics remain in the report. '
        'No BCH, response hashing or key reconstruction is implemented. These observations do not certify PUF security or environmental reliability.','',
        '| Core | Selected positions | Observations | Disagreements | Observed agreement % |',
        '|---|---:|---:|---:|---:|']
    for c in per_core:
        lines.append(f"| {c['core']} | {c.get('selected_positions',0)} | {c.get('observations',0)} | {c.get('disagreements',0)} | {c['observed_agreement_percent']} |")
    (output/'REPORT.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
    return report


def verify():
    manifest=read_json(ROOT/'PACKAGE_MANIFEST.json')
    require(manifest['schema']==1, 'Unknown package manifest')
    for name,expected in manifest['files'].items():
        p=(ROOT/name).resolve()
        require(p.is_relative_to(ROOT), 'Unsafe manifest path')
        require(p.is_file() and digest(p)==expected, f'Package file changed or missing: {name}')
    release=read_json(ROOT/'BUILD_RECORD.json')
    require(digest(ROOT/release['bitstream'])==release['sha256'], 'Selected bitstream changed')
    for name,expected in release['files'].items():
        if name.startswith(('rtl/','constraints/')) or name in {
            'scripts/build.tcl','scripts/match_local.tcl','scripts/protect.tcl','scripts/audit.tcl','scripts/verify_placement.tcl','scripts/resume.tcl'}:
            require(digest(ROOT/name)==expected, f'HDL/implementation input differs from measured release: {name}')
    for name,expected in release['evidence'].items():
        require(digest(ROOT/'build_matched'/name)==expected, f'Measured implementation evidence changed: {name}')
    require(digest(ROOT/'layout.tcl')==release['layout_sha256'], 'Measured placement input changed')
    require(digest(ROOT/'internal_route_template.tcl')==release['template_sha256'], 'Measured route template changed')
    print(f"PASS: {len(manifest['files'])} frozen package files and selected bitstream verified.")
    return manifest


def status():
    model_path,model,_=frozen_model(MODEL)
    print('Current hardware: eight raw PUF cores; Parallel / 8-cycle excitation wait.')
    print('Bitstream:',ROOT/read_json(ROOT/'BUILD_RECORD.json')['bitstream'])
    print(f"Frozen enrollment: {model['selected_positions']} / {model['total_positions']} positions selected; {model['excluded_positions']} excluded.")
    print('Validation:', 'report available; inspect validation/' if list((ROOT/'validation').glob('*/report.json')) else 'PENDING: collect a separate replay run.')
    print('128-core scaling, BCH, SHA3 challenge preprocessing and cryptographic key reconstruction remain future work.')


def main():
    parser=argparse.ArgumentParser();sub=parser.add_subparsers(dest='action',required=True)
    sub.add_parser('verify');sub.add_parser('status')
    en=sub.add_parser('enroll');en.add_argument('--input',type=Path,default=SOURCE);en.add_argument('--output',type=Path,default=MODEL)
    va=sub.add_parser('validate');va.add_argument('--input',required=True,type=Path);va.add_argument('--model',type=Path,default=MODEL);va.add_argument('--output',required=True,type=Path)
    an=sub.add_parser('analyze');an.add_argument('--input',required=True,type=Path);an.add_argument('--output',required=True,type=Path)
    args=parser.parse_args()
    try:
        if args.action=='verify':verify()
        elif args.action=='status':status()
        elif args.action=='enroll':
            m=enroll(args.input,args.output);print(f"Frozen enrollment created: {m['selected_positions']}/{m['total_positions']} selected; {m['excluded_positions']} excluded.")
        elif args.action=='validate':
            rep=validate(args.model,args.input,args.output)
            print(f"Validation disagreements: {rep['disagreements']}/{rep['observations']}; observed selected-bit agreement={rep['observed_selected_bit_agreement_percent']:.6f}%.")
            print('Report:',args.output/'REPORT.md')
        elif args.action=='analyze':write_json(args.output,summarize(capture(args.input)));print('Analysis:',args.output)
    except (ValueError,KeyError,TypeError,OSError) as exc:
        print('ERROR:',exc,file=sys.stderr);return 1
    return 0


if __name__=='__main__':
    sys.exit(main())
