`timescale 1ns/1ps
module tb_latency64;
 reg clk=0,btnU=0,uart_rx=1;wire uart_tx;wire [15:0] led;
 reg [63:0] expected_word=64'h963CA5F081E74269;integer busy_count,h;reg saw_parallel=0;
 always #5 clk=~clk;
 cbdc_array64_serial #(.UART_CLKS(8)) dut(.*);
 // Controlled Qu/Qb waveforms test real capture/controller/readout logic;
 // they are not physical delay or PUF randomness models.
 genvar g;
 generate for(g=0;g<64;g=g+1) begin:stim
  time accepted_at, excited_at, latch_at, frozen_at;
  always @(posedge clk) if(dut.start[g] && dut.control==44) accepted_at=$time;
  always @(posedge dut.gen_core[g].u_engine.excite) if(dut.control==44) excited_at=$time;
  always @(posedge dut.gen_core[g].u_engine.latch) if(dut.control==44) latch_at=$time;
  always @(negedge dut.gen_core[g].u_engine.latch) if(dut.control==44) frozen_at=$time;
  always @(posedge dut.valid[g]) if(dut.control==44)
    $display("LATENCY_CORE,%0d,%0d,%0d,%0d,%0d",g,$time-accepted_at,latch_at-excited_at,frozen_at-latch_at,$time-excited_at);
  reg qu=0,qb=1;
  initial begin force dut.gen_core[g].u_engine.u_core.qu_w=qu;force dut.gen_core[g].u_engine.u_core.qb_w=qb;end
  always @(posedge dut.gen_core[g].u_engine.excite) begin
   qu=~expected_word[g];qb=1;#2;qb=0;#2;qb=1;
  end
  always @(posedge dut.gen_core[g].u_engine.latch) begin
   qu=expected_word[g];qb=1;#2;qb=0;#2;qb=1;
  end
 end endgenerate
 always @(negedge clk) if(dut.state==1) begin
  busy_count=0;for(h=0;h<64;h=h+1) if(dut.busy[h]) busy_count=busy_count+1;
  if(dut.control[0] && busy_count>1) $fatal(1,"Sequential mode overlapped cores");
  if(!dut.control[0] && busy_count==64) saw_parallel=1;
 end
 task put(input [7:0] b);
 integer i;begin @(negedge clk);uart_rx=0;#80;for(i=0;i<8;i=i+1) begin uart_rx=b[i];#80;end uart_rx=1;#80;end
 endtask
 task get(output [7:0] b);
 integer i;begin @(negedge uart_tx);#120;for(i=0;i<8;i=i+1) begin b[i]=uart_tx;#80;end if(uart_tx!==1) $fatal(1,"Stop bit");end
 endtask
 reg [7:0] reply[0:139];reg [7:0] check;integer j;
 task query(input [1023:0] c,input [7:0] control,input accepted);
 begin
  check=8'ha6^control;put(8'ha6);put(control);
  for(j=0;j<128;j=j+1) begin put(c[j*8+:8]);check=check^c[j*8+:8];end put(check);
  for(j=0;j<140;j=j+1) get(reply[j]);
  check=0;for(j=0;j<139;j=j+1) check=check^reply[j];
  if(reply[0]!==8'hd6 || reply[1]!==control || reply[139]!==check) $fatal(1,"Frame/checksum");
  if(reply[130] !== (accepted?8'h61:8'h60)) $fatal(1,"Status");
  if(accepted) begin
   for(j=0;j<128;j=j+1) if(reply[j+2]!==c[j*8+:8]) $fatal(1,"Actual configuration readback");
   for(j=0;j<8;j=j+1) if(reply[131+j]!==expected_word[8*j+:8]) $fatal(1,"Capture should follow Latch, not the earlier edge");
  end
  #300;
 end endtask
 reg [1023:0] configs;integer c;
 initial begin
  for(c=0;c<64;c=c+1) begin
   configs[c*16+:16]=(c*16'h9e37)^16'h1234;
   if (!(^configs[c*16+:16])) configs[c*16]=~configs[c*16];
  end
  #400;
  query(configs,44,1);
  query(configs,16,1);
  if(!saw_parallel) $fatal(1,"Parallel mode not exercised");
  expected_word=64'h69C35A0F7E18BD96;
  query(~configs,17,1);
  query(configs,2,1);
  query(configs,254,1);
  query(configs,255,1);
  query(configs,0,0); // no zero wait
  query(0,16,0); // unsupported even parity must be explicit
  put(8'ha6);put(16);for(j=0;j<128;j=j+1) put(0);put(0);#4000;
  if(dut.state!==0) $fatal(1,"Bad checksum launched");
  put(8'ha6);put(16);#4000;if(dut.parser!==0) $fatal(1,"Truncated recovery");
  query(configs,3,1);
  $display("PASS: real Latch-controlled capture, 1024-bit configuration readback, 64 raw bits, sequential exclusion, parallel activation, timing modes, parity rejection, checksums and recovery");$finish;
 end
 initial begin #10000000; $fatal(1,"Watchdog");end
endmodule
