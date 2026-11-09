from pathlib import Path
r=Path(__file__).resolve().parents[1]
s=(r.parent/'sim/tb_paper_array8.v').read_text()
s=s.replace('tb_paper_array8','tb_array64').replace('cbdc_array8_serial','cbdc_array64_serial')
s=s.replace("reg [7:0] expected_word=8'h96", "reg [63:0] expected_word=64'h963CA5F081E74269")
s=s.replace('g<8','g<64').replace('h<8','h<64').replace('busy_count==8','busy_count==64')
s=s.replace('reply[0:20]', 'reply[0:139]').replace('input [127:0] c','input [1023:0] c')
s=s.replace('j<16','j<128').replace('j<21','j<140').replace('j<20','j<139')
s=s.replace('reply[20]','reply[139]').replace('reply[18]','reply[130]')
s=s.replace("8'hac", "8'ha6").replace("8'h5c", "8'hd6")
s=s.replace('if(reply[19]!==expected_word)', 'for(j=0;j<8;j=j+1) if(reply[131+j]!==expected_word[8*j+:8])')
s=s.replace("128'h00800040002000100008000400020001", 'configs').replace("128'h00010002000400080010002000400080", '~configs')
# Complement preserves odd parity for a 16-bit configuration.
s=s.replace("expected_word=8'h69", "expected_word=64'h69C35A0F7E18BD96")
s=s.replace('initial begin\n  #400;', '''reg [1023:0] configs;integer c;
 initial begin
  for(c=0;c<64;c=c+1) begin
   configs[c*16+:16]=(c*16'h9e37)^16'h1234;
   if (!(^configs[c*16+:16])) configs[c*16]=~configs[c*16];
  end
  #400;''')
s=s.replace('query(configs,2,1);','query(configs,2,1);\n  query(configs,254,1);\n  query(configs,255,1);')
s=s.replace('#1000000;', '#10000000;')
s=s.replace('128-bit configuration readback, eight raw bits', '1024-bit configuration readback, 64 raw bits')
(r/'sim/tb_array64.v').write_text(s)
