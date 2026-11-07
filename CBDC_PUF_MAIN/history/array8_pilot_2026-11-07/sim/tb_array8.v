`timescale 1ns/1ps
module tb_array8;
 reg clk=0,btnU=0,uart_rx=1;wire uart_tx;wire [15:0] led;
 always #5 clk=~clk;
 cbdc_array8_serial #(.UART_CLKS(8)) dut(.*);
 task put(input [7:0] b);
 integer i;begin @(negedge clk);uart_rx=0;#80;
 for(i=0;i<8;i=i+1) begin uart_rx=b[i];#80;end uart_rx=1;#80;end
 endtask
 task get(output [7:0] b);
 integer i;begin @(negedge uart_tx);#120;
 for(i=0;i<8;i=i+1) begin b[i]=uart_tx;#80;end
 if(uart_tx!==1) $fatal(1,"TX stop");end
 endtask
 reg [7:0] reply[0:21];reg [7:0] check;integer j;
 task query(input [127:0] c,input [7:0] expected);
 begin
 check=8'ha8;put(8'ha8);
 for(j=0;j<16;j=j+1) begin put(c[j*8+:8]);check=check^c[j*8+:8];end
 put(check);
 for(j=0;j<22;j=j+1) get(reply[j]);
 check=0;for(j=0;j<21;j=j+1) check=check^reply[j];
 if(reply[0]!==8'h58 || reply[17]!==8'h41 || reply[21]!==check) $fatal(1,"Header/status/checksum");
 for(j=0;j<16;j=j+1) if(reply[j+1]!==c[j*8+:8]) $fatal(1,"Core configuration echo");
 if(reply[18]!==expected || reply[19]!==8'hff || reply[20]!==8'hff) $fatal(1,"Raw response/edge masks");
 if(dut.gen_core[0].u_engine.challenge!==c[15:0] || dut.gen_core[7].u_engine.challenge!==c[127:112]) $fatal(1,"Core ordering");
 #300;
 end endtask
 initial begin
 #400;
 // Force only readout wires: tests bit ordering and UART, not analog PUF behavior.
 force dut.response=8'h96;force dut.qb=8'hff;force dut.qu=8'hff;
 query(128'hffff8003a8587fff001f000200010000,8'h96);
 force dut.response=8'h69;
 query(128'h123456789abcdef00008000700030002,8'h69);
 put(8'ha8);for(j=0;j<16;j=j+1) put(0);put(0);#4000;
 if(dut.state!==0) $fatal(1,"Bad CRC accepted");
 put(8'ha8);put(8'h55);#4000;
 if(dut.parser!==0) $fatal(1,"Truncation recovery");
 query(128'h00010002000400080010002000400080,8'h69);
 $display("PASS: eight engines, independent configs, raw bit order, checksum, corrupt/truncated recovery");$finish;
 end
 initial begin #250000; $fatal(1,"Watchdog");end
endmodule
