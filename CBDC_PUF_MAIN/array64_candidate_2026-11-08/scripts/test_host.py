"""Synthetic parser/transport checks, never hardware measurements."""
from pathlib import Path
import csv,json,subprocess,sys,tempfile
r=Path(__file__).resolve().parents[1]
for f in (r/'scripts').glob('*.py'):compile(f.read_text(),str(f),'exec')
with tempfile.TemporaryDirectory(prefix='array64_host_',dir=r/'sim') as tmp:
 p=Path(tmp)/'synthetic.csv'
 fields='utc,variant,mode,excite_cycles,pattern,trial,core,challenge_hex,response,response_word_hex,qb_edge_seen,qu_edge_seen,flags_hex'.split(',')
 matrix=[dict(pattern=i,challenges=[1<<(c%16) for c in range(64)]) for i in range(2)]
 meta=dict(cores=64,patterns=2,repeats=3,mode='Parallel',excite_cycles=8,synthetic=True,variant='paper_array64_and_ce')
 Path(str(p)+'.metadata.json').write_text(json.dumps(meta));Path(str(p)+'.challenges.json').write_text(json.dumps(matrix))
 rows=[]
 for pat in range(2):
  for trial in range(1,4):
   word=(0x8123456789ABCDEF if pat==0 else 0xFEDCBA9876543210)
   if trial==3:word^=1<<63
   for core in range(64):
    rows.append(dict(zip(fields,['synthetic','paper_array64_and_ce','Parallel',8,pat,trial,core,f'{matrix[pat]["challenges"][core]:04X}',(word>>core)&1,f'{word:016X}','','','61'])))
 def write(rr):
  with p.open('w',newline='') as f:
   w=csv.DictWriter(f,fieldnames=fields);w.writeheader();w.writerows(rr)
 def run():return subprocess.run([sys.executable,'-B','-I',str(r/'scripts/analyze.py'),str(p)],capture_output=True,text=True)
 write(rows);v=run();assert v.returncode==0,v.stderr
 report=json.loads(Path(str(p)+'.analysis.json').read_text());assert report['raw_bits']==384 and report['per_core'][63]['mixed_patterns']==2
 write(rows[:-1]);assert run().returncode!=0,'Incomplete capture accepted'
 write(rows+[rows[0]]);assert run().returncode!=0,'Duplicate capture accepted'
 rows[0]['response_word_hex']='0';write(rows);assert run().returncode!=0,'Truncated response accepted'
print('PASS: 64-bit high-bit handling; complete synthetic capture; incomplete/duplicate/truncated capture rejection; Python syntax.')
