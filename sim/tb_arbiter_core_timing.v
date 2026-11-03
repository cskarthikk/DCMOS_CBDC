`timescale 1ns/1ps
// Focused routed-core SDF test. Ideal external controls intentionally exclude
// the UART/controller and their external input routes; not a chip prediction.
module tb_arbiter_core_timing;
 reg [15:0] c=1;reg excite=0,latch=0,clr=1;
 wire q,qb_seen,qu_seen;
 cbdc_puf_core dut(.c(c),.excite(excite),.latch(latch),.clr(clr),.q(q),
  .qb_capture_seen_o(qb_seen),.qu_capture_seen_o(qu_seen));
 wire ad=dut.u_arbiter_dff.D,ac=dut.u_arbiter_dff.C;
 wire ae=dut.u_arbiter_dff.CE,ar=dut.u_arbiter_dff.CLR,aq=dut.u_arbiter_dff.Q;
 integer events,summary,id=0;reg active=0;integer w=8,k=8;
 real excite_at=0,last_d_change=0;
 initial begin
  events=$fopen("events.csv","w");summary=$fopen("summary.csv","w");
  $fdisplay(events,"id,challenge,wait,capture,event,time_ns,since_excite_ns,D,C,CE,CLR,Q,since_D_change_ns");
  $fdisplay(summary,"id,challenge,wait,capture,response,qb_seen,qu_seen");
 end
 task record_event(input [8*16-1:0] kind);
  if(active)$fdisplay(events,"%0d,%04h,%0d,%0d,%0s,%0.3f,%0.3f,%b,%b,%b,%b,%b,%0.3f",id,c,w,k,kind,$realtime,$realtime-excite_at,ad,ac,ae,ar,aq,$realtime-last_d_change);
 endtask
 always @(ad) begin last_d_change=$realtime;record_event("D_CHANGE");end
 always @(negedge ac)record_event("C_FALL");
 always @(ae)record_event("CE_CHANGE");
 always @(ar)record_event("CLR_CHANGE");
 always @(aq)record_event("Q_CHANGE");
 task query(input [15:0] challenge,input integer wait_cycles,capture_cycles);
 begin
  active=0;excite=0;latch=0;clr=1;c=challenge;w=wait_cycles;k=capture_cycles;id=id+1;
  #100;clr=0;#80;
  excite_at=$realtime;active=1;excite=1;
  #(w*10);latch=1;#(k*10);latch=0;#60;
  $fdisplay(summary,"%0d,%04h,%0d,%0d,%b,%b,%b",id,c,w,k,q,qb_seen,qu_seen);
  active=0;excite=0;clr=1;#100;
 end endtask
 initial begin
  #300;
  query(1,1,1);query(2,1,1);query(1,8,8);query(2,8,8);query(1,32,16);query(2,32,16);
  $fclose(events);$fclose(summary);
  $display("TRACE_COMPLETE: 6 routed-core model evaluations with ideal controls");$finish;
 end
 initial begin #20000;$fatal(1,"core trace watchdog");end
endmodule
