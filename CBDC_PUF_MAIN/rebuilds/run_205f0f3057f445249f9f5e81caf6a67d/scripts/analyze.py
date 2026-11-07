"""Validate complete array frames and report raw per-core/word observations."""
import argparse, collections, csv, json
from pathlib import Path

def analyze(path):
    meta = json.loads(Path(str(path)+'.metadata.json').read_text(encoding='utf-8-sig'))
    matrix = json.loads(Path(str(path)+'.challenges.json').read_text(encoding='utf-8-sig'))
    if isinstance(matrix, dict): matrix=[matrix]
    assert meta['variant']=='paper_array8_and_ce' and meta['cores']==8
    rows=list(csv.DictReader(path.open(encoding='utf-8-sig')))
    assert len(rows)==meta['patterns']*meta['repeats']*8, 'Incomplete capture'
    frames=collections.defaultdict(dict);groups=collections.defaultdict(list)
    for row in rows:
        p,t,c=map(int,(row['pattern'],row['trial'],row['core']))
        assert 0<=p<meta['patterns'] and 1<=t<=meta['repeats'] and 0<=c<8
        assert c not in frames[p,t], 'Duplicate frame/core observation'
        assert row['variant']==meta['variant'] and row['flags_hex']=='61'
        assert row['mode']==meta['mode'] and int(row['excite_cycles'])==meta['excite_cycles']
        assert int(row['challenge_hex'],16)==matrix[p]['challenges'][c]
        assert row['response'] in ('0','1') and row['qb_edge_seen']==row['qu_edge_seen']==''
        assert int(row['challenge_hex'],16).bit_count()%2==1
        assert 0<=int(row['response_word_hex'],16)<256
        assert int(row['response'])==(int(row['response_word_hex'],16)>>c)&1
        frames[p,t][c]=row;groups[c,p].append(int(row['response']))
    histogram=collections.Counter()
    for frame in frames.values():
        assert set(frame)==set(range(8)) and len({x['response_word_hex'] for x in frame.values()})==1
        histogram[sum(int(x['response']) for x in frame.values())]+=1
    cores=[]
    for c in range(8):
        gs=[groups[c,p] for p in range(meta['patterns'])]
        assert all(len(v)==meta['repeats'] for v in gs)
        ones=sum(map(sum,gs));trials=sum(map(len,gs))
        cores.append(dict(core=c,observations=trials,ones=ones,ones_percent=100*ones/trials,
          mixed_patterns=sum(0<sum(v)<len(v) for v in gs),ties=sum(2*sum(v)==len(v) for v in gs),
          smaller_count=sum(min(sum(v),len(v)-sum(v)) for v in gs),
          activity_measurements_available=False))
    return dict(input=str(path),sha256=meta['sha256'],mode=meta['mode'],excite_cycles=meta['excite_cycles'],frames=len(frames),cores=cores,
       word_ones_histogram=dict(sorted(histogram.items())),
       interpretation='Finite raw observations; no certified reliability, entropy, uniqueness or equivalence to 128-bit paper metrics.')

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('csv',type=Path);args=p.parse_args()
    result=analyze(args.csv);out=Path(str(args.csv)+'.analysis.json')
    if out.exists():raise SystemExit('Analysis output exists; preserve it')
    out.write_text(json.dumps(result,indent=2)+'\n')
    for c in result['cores']:print(c)
    print('Saved',out)
