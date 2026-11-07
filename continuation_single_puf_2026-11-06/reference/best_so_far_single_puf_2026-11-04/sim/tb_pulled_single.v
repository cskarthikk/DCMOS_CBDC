`timescale 1ns/1ps
module tb_pulled_single;
 reg clk=0,btnU=0,uart_rx=1;wire uart_tx;wire [15:0] led;
 always #5 clk=~clk;
 cbdc_puf_serial #(.UART_CLKS(8)) dut(.*);
 task put(input [7:0] b);
  integer i;begin @(negedge clk);uart_rx=0;#80;
   for(i=0;i<8;i=i+1) begin uart_rx=b[i];#80;end
   uart_rx=1;#80;end
 endtask
 task get(output [7:0] b);
  integer i;begin @(negedge uart_tx);#120;
   for(i=0;i<8;i=i+1) begin b[i]=uart_tx;#80;end
   if(uart_tx!==1) $fatal(1,"TX stop bit");end
 endtask
 reg [7:0] reply [0:5];integer j;
 reg probe_excite=0,probe_clear=1;
 wire probe_q,probe_qb,probe_qu;
 cbdc_puf_core #(.N_STAGES(2),.DIAGNOSTIC(1)) probe(
  .c(2'b01),.excite(probe_excite),.latch(1'b1),.clr(probe_clear),.q(probe_q),
  .qb_capture_seen_o(probe_qb),.qu_capture_seen_o(probe_qu));
 initial begin
  #600;probe_clear=0;#200;
  if({probe_qb,probe_qu}!==0) $fatal(1,"False edge indication without excitation");
  probe_excite=1;#2000;
  if({probe_qb,probe_qu}!==2'b11) $fatal(1,"Monitor failed to record edges");
  probe_clear=1;#20;
  if({probe_qb,probe_qu}!==0) $fatal(1,"Monitor failed to clear");
 end
 task query(input [15:0] c,input accepted);
  begin
   put(8'ha5);put(c[7:0]);put(c[15:8]);put(8'ha5^c[7:0]^c[15:8]);
   for(j=0;j<6;j=j+1) get(reply[j]);
   if(reply[0]!==8'h5a || {reply[2],reply[1]}!==c ||
    reply[5] !== (reply[0]^reply[1]^reply[2]^reply[3]^reply[4])) $fatal(1,"Frame/echo/checksum");
   if(reply[3][0]!==accepted || reply[3][7] || !reply[3][4]) $fatal(1,"Status flags");
   if(accepted && reply[3][2:1]!==2'b11) $fatal(1,"Missing capture-window edge flags");
   if(!accepted && reply[4]!==0) $fatal(1,"Rejected response must be zero");
   #200;
  end
 endtask
 initial begin
  #400;query(16'h0001,1);query(0,1);query(16'h8000,1);query(16'h7fff,1);
  query(16'ha5a5,1); // header-valued bytes inside payload
  put(8'ha5);put(1);put(0);put(0);#4000; // corrupt CRC must not start query
  if(dut.state!==0) $fatal(1,"Bad checksum accepted");
  put(8'ha5);put(1);#4000; // truncated request timeout, then recover
  query(16'h0007,1);
  $display("PASS: serial frames, accepted/rejected queries, capture flags, checksums and recovery");$finish;
 end
 initial begin #150000; $fatal(1,"Serial watchdog");end
endmodule
