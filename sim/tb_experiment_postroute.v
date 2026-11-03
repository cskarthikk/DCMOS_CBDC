`timescale 1ns/1ps
// Routed core only, ideal external controls. Verify physical self-disable loop
// in the generic SDF model; not manufacturing/noise/metastability certification.
module tb_experiment_postroute;
 reg [15:0] c=1;reg [2:0] mode=0;reg excite=0,latch=0,clr=1;
 wire q,reverse_q,qbs,qus;
 cbdc_puf_core_experiment dut(.c(c),.mode(mode),.excite(excite),.latch(latch),.clr(clr),
  .q(q),.reverse_q(reverse_q),.qb_capture_seen_o(qbs),.qu_capture_seen_o(qus));
 integer attempts_a=0,attempts_b=0,logfile,id=0;reg active=0;
 real first_a=0,first_b=0;
 always @(negedge dut.u_arbiter_dff.C)if(active && dut.u_arbiter_dff.CE && !clr)begin attempts_a=attempts_a+1;if(attempts_a==1)first_a=$realtime;end
 always @(negedge dut.u_reverse_arbiter_dff.C)if(active && dut.u_reverse_arbiter_dff.CE && !clr)begin attempts_b=attempts_b+1;if(attempts_b==1)first_b=$realtime;end
 always @(negedge dut.u_arbiter_dff.CE)if(active && mode[0] && latch && attempts_a>0)$fdisplay(logfile,"A_disable_delay_ns,%0d,%0.3f",id,$realtime-first_a);
 always @(negedge dut.u_reverse_arbiter_dff.CE)if(active && mode[0] && latch && attempts_b>0)$fdisplay(logfile,"B_disable_delay_ns,%0d,%0.3f",id,$realtime-first_b);
 task query(input [15:0] challenge,input [2:0] m,input integer w);
 begin
  active=0;excite=0;latch=0;clr=1;c=challenge;mode=m;id=id+1;attempts_a=0;attempts_b=0;
  #100;clr=0;#70;
  if(w==0)latch=1;
  #10;active=1;excite=1;
  if(w!=0)begin #(w*10);latch=1;end
  #160;
  if(mode[0] && (attempts_a!=1 || dut.u_arbiter_dff.CE!==0))$fatal(1,"A self-disable failed %d %d",id,attempts_a);
  if(mode[0] && mode[2] && (attempts_b!=1 || dut.u_reverse_arbiter_dff.CE!==0))$fatal(1,"B self-disable failed %d %d",id,attempts_b);
  if(!mode[0] && attempts_a<2)$fatal(1,"continuous capture failed");
  if(!mode[2] && attempts_b!=0)$fatal(1,"reverse disable failed");
  if(qbs!==1 || qus!==1)$fatal(1,"edge flag missing");
  $fdisplay(logfile,"CASE,%0d,%04h,%0d,%0d,%0d,%0d,%b,%b",id,c,mode,w,attempts_a,attempts_b,q,reverse_q);
  latch=0;#60;active=0;excite=0;clr=1;#100;
 end endtask
 initial begin
  logfile=$fopen("postroute.csv","w");#300;
  query(1,0,8);query(1,1,8);query(1,1,0);
  query(0,3,0);query(16'hffff,3,0);query(1,7,0);query(0,7,0);query(2,7,0);
  $fclose(logfile);$display("PASS: postroute self-disable loop and continuous comparator, ideal controls");$finish;
 end
 initial begin #20000;$fatal(1,"postroute watchdog");end
endmodule
