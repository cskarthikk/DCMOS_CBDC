from pathlib import Path
r=Path(__file__).resolve().parents[1];base=r.parent/'array64_candidate_2026-11-08'
s=(base/'sim/tb_array64.v').read_text().replace('tb_array64','tb_long_capture')
old='qu=expected_word[g];qb=1;#2;qb=0;#2;qb=1;'
new='qu=~expected_word[g];qb=1;#2;qb=0;#2;qb=1;#300;qu=expected_word[g];#2;qb=0;#2;qb=1;'
assert old in s;s=s.replace(old,new)
s=s.replace('reg qu=0,qb=1;', 'reg qu=0,qb=1;time latch_start;')
s=s.replace('always @(posedge dut.gen_core[g].u_engine.latch) begin', 'always @(negedge dut.gen_core[g].u_engine.latch) if($time>400 && $time-latch_start!=640) $fatal(1,"Capture width is not640ns");\n  always @(posedge dut.gen_core[g].u_engine.latch) begin latch_start=$time;')
s=s.replace('Capture should follow Latch, not the earlier edge', 'Capture must include the later edge inside the640ns window')
s=s.replace('PASS: real Latch-controlled capture', 'PASS:640ns capture window and late-edge capture across64 cores')
(r/'sim/tb_long_capture.v').write_text(s)
