`timescale 1ns/1ps
module tb_resource_128;
 reg clk=0,btnU=0,uart_rx=1;wire uart_tx;wire [15:0] led;
 always #5 clk=~clk;
 cbdc_array_resource #(.UART_CLKS(4),.CORE_COUNT(128)) dut(.*);
 task put(input [7:0] b);
 integer i;begin @(negedge clk);uart_rx=0;#40;for(i=0;i<8;i=i+1) begin uart_rx=b[i];#40;end uart_rx=1;#40;end
 endtask
 task get(output [7:0] b);
 integer i;begin @(negedge uart_tx);#60;for(i=0;i<8;i=i+1) begin b[i]=uart_tx;#40;end if(uart_tx!==1) $fatal(1,"Stop bit");end
 endtask
 reg [7:0] crc,reply[0:275];reg [15:0] challenge;integer i;
 reg [127:0] expected=128'hFEDCBA98765432100123456789ABCDEF;
 initial begin
  #400;force dut.response=expected;
  crc=8'hac^16;put(8'hac);put(16);
  for(i=0;i<128;i=i+1) begin
   challenge=16'b1<<(i%16);put(challenge[7:0]);put(challenge[15:8]);crc=crc^challenge[7:0]^challenge[15:8];
  end
  put(crc);
  for(i=0;i<276;i=i+1) get(reply[i]);
  crc=0;for(i=0;i<275;i=i+1) crc=crc^reply[i];
  if(reply[0]!==8'h5c || reply[1]!==16 || reply[258]!==8'h61 || reply[275]!==crc) $fatal(1,"128-core frame/status/checksum");
  for(i=0;i<128;i=i+1) begin challenge=16'b1<<(i%16);if({reply[2*i+3],reply[2*i+2]}!==challenge) $fatal(1,"Configuration truncation");end
  for(i=0;i<16;i=i+1) if(reply[259+i]!==expected[8*i+:8]) $fatal(1,"Response truncation");
  $display("PASS: synthesis resource model transports all 2048 configuration bits and all 128 raw response bits; protocol-width test only, not silicon proof");$finish;
 end
 initial begin #1000000;$fatal(1,"Watchdog");end
endmodule
