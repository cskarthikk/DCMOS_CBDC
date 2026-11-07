"""Synthesis-only scaling model. Never used to program or replace the measured release."""
from pathlib import Path
root=Path(__file__).resolve().parents[1];main=root.parents[1]
s=(main/'rtl/cbdc_array8_serial.v').read_text()
s=s.replace('module cbdc_array8_serial #(parameter integer UART_CLKS=868)', 'module cbdc_array_resource #(parameter integer UART_CLKS=868, CORE_COUNT=128)')
s=s.replace('reg [1:0] state=0;', '''localparam integer CONFIG_BYTES=2*CORE_COUNT;
 localparam integer WORD_BYTES=CORE_COUNT/8;
 localparam integer FLAGS_INDEX=CONFIG_BYTES+2;
 localparam integer RESPONSE_BEGIN=CONFIG_BYTES+3;
 localparam integer REPLY_BYTES=4+CONFIG_BYTES+WORD_BYTES;
 localparam integer INDEX_WIDTH=$clog2(REPLY_BYTES+1);
 localparam integer CORE_WIDTH=$clog2(CORE_COUNT);
 reg [1:0] state=0;''')
s=s.replace('reg [4:0] parser=0,index=0;reg [127:0] challenge=0;', 'reg [INDEX_WIDTH-1:0] parser=0,index=0;reg [16*CORE_COUNT-1:0] challenge=0;')
s=s.replace('reg [7:0] control=0,crc=0,txcrc=0,start=0,done_mask=0,result=0,flags=0;', 'reg [7:0] control=0,crc=0,txcrc=0,flags=0;reg [CORE_COUNT-1:0] start=0,done_mask=0,result=0;')
s=s.replace('reg [2:0] active_core=0;', 'reg [CORE_WIDTH-1:0] active_core=0;')
s=s.replace('wire [7:0] valid,error,busy,response,parity;wire [127:0] configuration;', 'wire [CORE_COUNT-1:0] valid,error,busy,response,parity;wire [16*CORE_COUNT-1:0] configuration;')
s=s.replace('g<8','g<CORE_COUNT').replace('k<8','k<CORE_COUNT')
s=s.replace('state==0,result}', 'state==0,result[7:0]}')
s=s.replace('parser<=17','parser<=CONFIG_BYTES+1')
s=s.replace("start<=control[0]?8'h01:8'hff", "start<=control[0]?{{(CORE_COUNT-1){1'b0}},1'b1}:{CORE_COUNT{1'b1}}")
s=s.replace('active_core<7','active_core<CORE_COUNT-1').replace("start<=8'b1<<(active_core+1)","start<={{(CORE_COUNT-1){1'b0}},1'b1}<<(active_core+1)")
s=s.replace('index==21','index==REPLY_BYTES')
s=s.replace("18:begin td<=flags;txcrc<=txcrc^flags;end", "FLAGS_INDEX:begin td<=flags;txcrc<=txcrc^flags;end")
s=s.replace("19:begin td<=result;txcrc<=txcrc^result;end", '')
s=s.replace('20:td<=txcrc;', 'REPLY_BYTES-1:td<=txcrc;')
s=s.replace('default:begin td<=configuration[(index-2)*8+:8];txcrc<=txcrc^configuration[(index-2)*8+:8];end', '''default:begin
        if(index>=RESPONSE_BEGIN) begin td<=result[(index-RESPONSE_BEGIN)*8+:8];txcrc<=txcrc^result[(index-RESPONSE_BEGIN)*8+:8];end
        else begin td<=configuration[(index-2)*8+:8];txcrc<=txcrc^configuration[(index-2)*8+:8];end
       end''')
s=s.replace('// Request AC, control, 16 configuration bytes, XOR (19 bytes).', '// RESOURCE MODEL ONLY: extended-length frame; not the installed host protocol.')
out=root/'rtl/cbdc_array_resource.v'
if out.exists():raise SystemExit('Preserve existing generated model')
out.write_text(s)
tb=(main/'sim/tb_paper_array8.v').read_text().replace('cbdc_array8_serial #(.UART_CLKS(8))','cbdc_array_resource #(.UART_CLKS(8),.CORE_COUNT(8))')
(root/'rtl/tb_resource_8.v').write_text(tb)
print(out)
