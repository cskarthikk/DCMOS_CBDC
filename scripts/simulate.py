import argparse
import json
import subprocess
import sys
import uuid
from pathlib import Path

p=argparse.ArgumentParser();p.add_argument('--project-root',type=Path);p.add_argument('--icarus-bin',type=Path,default=Path('C:/iverilog/bin'));p.add_argument('--refresh-stage-evidence',action='store_true');args=p.parse_args()
root=args.project_root.resolve() if args.project_root else Path(__file__).resolve().parents[1]
compiler=args.icarus_bin/'iverilog.exe';runner=args.icarus_bin/'vvp.exe'
if not compiler.is_file() or not runner.is_file():raise SystemExit('Icarus missing; supply -IcarusBin to run.ps1. Hardware collection does not require Icarus.')
if args.refresh_stage_evidence and (root/'BUILD_RECORD.json').exists():raise SystemExit('Cannot refresh frozen release evidence; use an isolated rebuild stage')
out=root/'reports'/('s_'+uuid.uuid4().hex[:8]);out.mkdir(parents=True)
primitives=root/'sim/sim_unisim_primitives.v'
tests=[('tb_array64',[primitives,*sorted((root/'rtl').glob('*.v')),root/'sim/tb_array64.v']),
       ('tb_chain_truth',[primitives,root/'rtl/cbdc_puf_element.v',root/'rtl/cbdc_puf_chain.v',root/'sim/tb_chain_truth.v'])]
for top,files in tests:
    binary=out/(top+'.vvp')
    binary.touch(exist_ok=False)
    # Normalize executable paths for the Windows Icarus helper-path resolver.
    command=[compiler.as_posix(),'-g2012','-s',top,'-o',binary.name,*map(str,files)]
    (out/(top+'.command.json')).write_text(json.dumps(dict(command=command,cwd=str(out)),indent=2))
    a=subprocess.run(command,cwd=out,stdin=subprocess.DEVNULL,capture_output=True,text=True,timeout=120)
    (out/(top+'.compile.log')).write_text(f'exit={a.returncode}\n'+a.stdout+a.stderr,encoding='utf-8')
    if a.returncode:raise SystemExit(f'Compile failed ({a.returncode}); log: {out/(top+".compile.log")}\n'+a.stdout+a.stderr)
    b=subprocess.run([runner.as_posix(),binary.name],cwd=out,stdin=subprocess.DEVNULL,capture_output=True,text=True,timeout=180)
    (out/(top+'.log')).write_text(b.stdout+b.stderr,encoding='utf-8')
    if b.returncode or 'PASS:' not in b.stdout:raise SystemExit(b.stdout+b.stderr)
    print(b.stdout.splitlines()[0])
    if args.refresh_stage_evidence:
        target='result.log' if top=='tb_array64' else 'chain_truth.log'
        (root/'sim'/target).write_text(b.stdout+b.stderr,encoding='utf-8')
print('Simulation reports:',out)
