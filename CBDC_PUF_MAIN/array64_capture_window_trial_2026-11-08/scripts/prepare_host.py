from pathlib import Path
r=Path(__file__).resolve().parents[1];b=r.parent/'array64_candidate_2026-11-08'
s=(b/'scripts/collect.ps1').read_text().replace('paper_array64_and_ce','paper_array64_latch64_trial')
s=s.replace('activity_measurements_available=$false;', 'activity_measurements_available=$false;latch_cycles=64;')
s=s.replace("Figure 1 interpretation, one Latch-controlled arbiter/core.","Figure1 interpretation, one arbiter/core; diagnostic LATCH_CYCLES=64.")
(r/'scripts/collect.ps1').write_text(s)
s=(b/'scripts/analyze.py').read_text().replace('paper_array64_and_ce','paper_array64_latch64_trial')
(r/'scripts/analyze.py').write_text(s)
s=(b/'scripts/finalize.tcl').read_text()
(r/'scripts/finalize.tcl').write_text(s)
matrix=b/'reports/all_core_design_review_2026-11-08/first64_vectors.json'
(r/'matrix64.json').write_bytes(matrix.read_bytes())
