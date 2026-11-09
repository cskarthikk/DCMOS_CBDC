from pathlib import Path
import argparse,hashlib,json
p=argparse.ArgumentParser();p.add_argument('run',type=Path);a=p.parse_args();run=a.run.resolve()
root=Path(__file__).resolve().parents[1];main=root.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest().upper()
source=json.loads((run/'SELECTED_SOURCE.json').read_text(encoding='utf-8-sig'))
selected=json.loads((run/'SELECTION.json').read_text());validation=json.loads((run/'VALIDATION_RESULTS.json').read_text())
project=Path(source['source_project']);assert project.parent==main and source['latch_cycles']==8
assert project.name=='array64_candidate_2026-11-08'
assert sha(Path(source['bitstream']))==source['bitstream_sha256']
assert sha(project/'BUILD_RECORD.json')==source['source_record_sha256']
assert selected['chosen']['clock']==validation['chosen_clock']
relrun=run.relative_to(root).as_posix()
window=main/'array64_capture_window_trial_2026-11-08/experiments/run_8ca2f2a5986c46808aa476759f9fa56c/RESULTS.json'
arb=main/'array64_arbiter_row_trial_2026-11-09/experiments/run_ba0a46a2f65f4f54a159ec60a30ccfb6/RESULTS.json'
wr=json.loads(window.read_text());ar=json.loads(arb.read_text())
clock=validation['chosen_clock'];rawdiff=validation['aligned_trial_raw_disagreements'];total=validation['raw_comparable_bits']
changes=validation['majority_changes'];positions=validation['comparable_positions'];lo,hi=validation['per_core_range_first']
text=f'''# Selected raw 64-core operating profile

The original 64-core physical design is retained. Neither diagnostic trial established a complete fix for the excitation-time dependence. As authorized, this package selects a fixed clock setting using a development pool, then checks it on a separate challenge pool without changing the selection.

**Selected settings: Parallel, Excite={clock} cycles, Latch=8 cycles, 64 cores, all raw responses retained.** At the 100 MHz controller clock, these are {clock*10} ns and 80 ns respectively. The FPGA image is unchanged; the host sends the excitation count with each request. It is a calibrated operating point, not proof that the physical imbalance has been repaired.

## Investigation and bounded fix attempts

All 64 structural checks pass. The original implementation has 4096 modeled internal upper/lower delay-pair matches; that does not make every boundary connection or analog delay symmetric. Earlier same-board measurements also showed timing dependence in the 8-core design. There is no basis to promise perfect paper equivalence or identify a single cause in every core.

1. **Capture-window trial:** increased Latch from 8 to 64 cycles. Simulation checked late-edge capture. Physical comparison preserved all 6272 PUF signal trees and 6656 referenced cell placements. A window change also required some ordinary controller routing changes, documented in the trial. Hardware balance moved toward 60–63%, and responses still depended on timing. Equal closing-time profiles agreed much more closely: the old wait64/window8 and new wait8/window64 comparison changed 54/4082 majority positions. This supports elapsed closing time as an important factor; actual oscillator waveforms were not measured. The trial was rejected as a complete fix.
2. **Arbiter placement trial:** moved all arbiters from head+17 to the chain-end row, head+16. The BFF placement encountered routing-resource conflicts at 18 data pins while the validated chain routes were locked. Using AFF at that row routed successfully and passed controller timing and structural checks. All 6144 internal chain trees stayed identical; arbiter/feedback routes were allowed to change, and six ordinary controller flip-flops moved. Median modeled arbiter skew changed from 169 to 164 ps, but the worst changed from 517 to 589 ps. Hardware results below determine whether it helped; a favorable aggregate percentage alone is insufficient.

| Arbiter experiment condition | Excite cycles | Raw ones | Within-capture minority count rate |
|---|---:|---:|---:|
'''
for c in ar['conditions']:text+=f"| {c['label']} | {c['wait']} | {c['ones_percent']:.4f}% | {c['minority_percent']:.4f}% |\n"
text+='\nThe original physical design was selected for the calibrated profile; the arbiter variant did not establish a uniformly better boundary layout or eliminate timing dependence. Both trials and their raw captures remain saved.\n\n## Clock calibration\n\nThe following candidate clock counts were declared before this calibration run. The same 64 development vectors and 20 repeats were used at each count. Selection minimizes aggregate distance from 50%, with minority rate and then clock count as tie breakers. No cores, challenges or response bits were discarded or inverted.\n\n| Excite cycles | Development raw ones | Within-capture minority count rate |\n|---:|---:|---:|\n'
for c in selected['candidates']:text+=f"| {c['clock']} | {c['ones_percent']:.4f}% | {c['minority_percent']:.4f}% |\n"
text+=f'''
## Independent validation

After selecting {clock} cycles, a fresh 256-vector pool was generated from seed 20261109 using only configuration values. Each core's configurations are distinct within this pool and do not overlap its development configurations. The choice was frozen before either validation capture. All 64 cores were measured 20 times per vector, giving 327680 raw bits per capture and 655360 in total. Replay uses the supplied matrix; the original collector's legacy seed field is unused for replays. The matrix itself and its file hash identify the configurations actually used.

| Metric | First capture | Repeat capture |
|---|---:|---:|
| Raw ones | {validation['first_ones_percent']:.4f}% | {validation['repeat_ones_percent']:.4f}% |
| Within-capture minority count rate | {validation['first_minority_percent']:.4f}% | {validation['repeat_minority_percent']:.4f}% |

Strict-majority responses changed at **{changes}/{positions}** comparable core/configuration positions; **{validation['ties_excluded']}** positions with a tie in either capture were excluded from this majority comparison only. They remain in the raw datasets. Comparing corresponding trials directly gives **{rawdiff}/{total} raw bit disagreements ({rawdiff/total*100:.4f}%)** across the two captures.

Individual core ones percentages still span **{lo:.4f}%–{hi:.4f}%** in the first capture. Cores outside 10–90%: **{validation['cores_outside_10_90']}**. See [{relrun}/validation_per_core.csv]({relrun}/validation_per_core.csv). Aggregate balance does not certify per-core balance, entropy, modeling-attack resistance, inter-device uniqueness, or voltage/temperature/cold-boot reliability. Minority counts are fitted within each capture, not certified BER. Activity is not instrumented; serial status 61 confirms protocol/configuration checks, not measured oscillator activity. No SHA or error correction was added or used.

## Use this profile

From this folder:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\\run.ps1 -Action Verify
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\\run.ps1 -Action Program
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\\run.ps1 -Action Collect -Port COM5 -BitstreamLoaded
```

`Program` loads the selected original 64-core bitstream. `Collect` fixes the selected timing count automatically. Powering the board off loses the volatile image; program again after power-on. An identity hash here checks a file, not a PUF hash or encryption operation. Raw CSV paths are in [{relrun}/VALIDATION_INDEX.json]({relrun}/VALIDATION_INDEX.json), with analysis in [{relrun}/VALIDATION_RESULTS.json]({relrun}/VALIDATION_RESULTS.json). The captures were obtained after explicitly programming this image in the recorded calibration session.

The profile entry point also passed Verify and a live 12-frame/768-bit Smoke capture with the raw analyzer. This checks host integration; that small sample is separate from the independent validation. Evidence is in HOST_CHECK.json.

Source project: `{project.name}`. Bitstream SHA256: `{source['bitstream_sha256']}`. Original 8-core and 64-core designs are preserved. The next hardware evidence needed is the same frozen profile across a cold restart and relevant operating conditions; this package does not claim those tests have happened. Enrollment and software cryptography remain a separate later step.
'''
(root/'REPORT.md').write_text(text,encoding='utf-8')
(root/'README.md').write_text(f'''# Raw 64-core profile

Use `run.ps1` in this folder. Selected excitation: **{clock} cycles**; capture window: **8 cycles**; mode: **Parallel**. All 64 response bits are retained, without SHA or error correction.

The physical image is the original 64-core bitstream. Two investigated changes did not provide a complete fix. This is a calibrated operating point. [Investigation, validation results and commands](REPORT.md).

Independent fresh-pool raw ones: **{validation['first_ones_percent']:.4f}%** and **{validation['repeat_ones_percent']:.4f}%**. Individual cores remain biased; read the per-core results before making security claims.
''',encoding='utf-8')
files=[root/'run.ps1',root/'REPORT.md',root/'README.md',root/'HOST_CHECK.json',*[root/'scripts'/n for n in ('calibrate.ps1','calibration.py','finalize_profile.py')],*[run/n for n in ('SELECTED_SOURCE.json','OPERATING_PROFILE.json','SELECTION.json','VALIDATION_RESULTS.json','validation_per_core.csv','validation_matrix.json','DEV_INDEX.json','VALIDATION_INDEX.json','program.log')]]
profile=dict(source_project_relative=project.relative_to(main).as_posix(),source_record_sha256=source['source_record_sha256'],bitstream_sha256=source['bitstream_sha256'],
 excite_cycles=clock,latch_cycles=8,mode='Parallel',cores=64,raw_only=True,validation_run=relrun,
 selection='Calibrated fixed operating point; no proven complete physical fix.',files={f.relative_to(root).as_posix():sha(f) for f in files})
(root/'PROFILE.json').write_text(json.dumps(profile,indent=2)+'\n')
(main/'CURRENT_64_PROFILE.md').write_text(f'''# Current raw 64-core profile

Use [array64_clock_profile_2026-11-09/run.ps1](array64_clock_profile_2026-11-09/run.ps1). It keeps all 64 raw response bits and fixes Excite={clock}, Latch=8 cycles, Parallel mode. The selected bitstream is the original `array64_candidate_2026-11-08/build/paper_array64.bit`.

Independent validation: {validation['first_ones_percent']:.4f}% and {validation['repeat_ones_percent']:.4f}% aggregate ones. This is a calibrated operating point, not a complete physical fix or proof of security. [Investigation and complete results](array64_clock_profile_2026-11-09/REPORT.md).

The original root `run.ps1` remains the frozen 8-core package entry point. No SHA/BCH changes were made in this investigation.
''',encoding='utf-8')
print(root/'PROFILE.json')
