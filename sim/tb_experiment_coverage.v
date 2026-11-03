`timescale 1ns/1ps
// Exhaustive launch/initialization and first-capture checks, artificial delays.
module tb_experiment_coverage;
 reg [15:0] c=0;reg excite=0,latch=0,clr=1;wire q,b,qbs,qus;
 cbdc_puf_core_experiment dut(.c(c),.mode(3'b011),.excite(excite),.latch(latch),.clr(clr),
  .q(q),.reverse_q(b),.qb_capture_seen_o(qbs),.qu_capture_seen_o(qus));
 integer n,attempts=0;
 always @(negedge dut.qb_w)if(dut.ce_a && !clr)attempts=attempts+1;
 initial begin
  for(n=0;n<65536;n=n+1)begin
   excite=0;latch=0;clr=1;c=n;attempts=0;
   #5;if(dut.qu_w!==1 || dut.qb_w!==1)$fatal(1,"initialization %h",c);
   clr=0;latch=1;#1;excite=1;#6;
   if(qbs!==1 || qus!==1 || attempts!=1 || dut.ce_a!==0)$fatal(1,"launch/shot %h attempts=%d",c,attempts);
  end
  $display("PASS: experiment coverage all 65536 configurations initialize, launch and capture once in artificial model");$finish;
 end
 initial begin #1000000;$fatal(1,"coverage watchdog");end
endmodule
