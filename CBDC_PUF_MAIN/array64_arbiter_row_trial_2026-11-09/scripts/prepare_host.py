from pathlib import Path
r=Path(__file__).resolve().parents[1];b=r.parent/'array64_candidate_2026-11-08'
s=(b/'scripts/collect.ps1').read_text().replace('paper_array64_and_ce','paper_array64_arbiterrow_trial')
s=s.replace('activity_measurements_available=$false;', 'activity_measurements_available=$false;latch_cycles=8;arbiter_head_y_offset=16;')
(r/'scripts/collect.ps1').write_text(s)
(r/'scripts/finalize.tcl').write_text((b/'scripts/finalize.tcl').read_text())
(r/'matrix64.json').write_bytes((b/'reports/all_core_design_review_2026-11-08/first64_vectors.json').read_bytes())
# Reuse safe baseline/trial/baseline orchestration, with the trial's actual8-cycle window.
s=(r.parent/'array64_capture_window_trial_2026-11-08/scripts/run_experiment.ps1').read_text()
s=s.replace('$waits=@(8,32,71,127,8)', '$waits=@(8,127,8)').replace(' 64}\n', ' 8}\n')
s=s.replace(' # Equal closing times:8+64 ==64+8;71+64 ==127+8.',' # Same timing; only physical arbiter position changes.')
(r/'scripts/run_experiment.ps1').write_text(s)
