`timescale 1ns/1ps
// Controlled terminal signals test FF/CE sequencing, not analog PUF behavior.
module tb_capture;
 reg excite=0,latch=0,clr=1;
 wire q;
 cbdc_puf_core #(.AUTO_PARITY(0),.CAPTURE_MODE(0),.DUAL_ARBITER(0),.DIAGNOSTIC(0)) dut(
 .c(16'h0001),.excite(excite),.latch(latch),.clr(clr),.q(q));
 initial begin
  force dut.qu_w=0; force dut.qb_w=1;
  #5; clr=0; excite=1;
  force dut.qu_w=1; #5; force dut.qb_w=0; #5;
  if(q!==0) $fatal(1,"Captured while Latch disabled");
  force dut.qb_w=1; latch=1; #5; force dut.qb_w=0; #5;
  if(q!==1) $fatal(1,"Did not capture Qu on falling Qb");
  force dut.qb_w=1; force dut.qu_w=0; #5; force dut.qb_w=0; #5;
  if(q!==0) $fatal(1,"Incorrect first-edge locking remains");
  latch=0; force dut.qb_w=1; force dut.qu_w=1; #5; force dut.qb_w=0; #5;
  if(q!==0) $fatal(1,"Response not retained when Latch disabled");
  $display("PASS: disabled capture, negative-edge capture, repeated capture and hold");
  $finish;
 end
 initial begin #1000; $fatal(1,"Watchdog"); end
endmodule
