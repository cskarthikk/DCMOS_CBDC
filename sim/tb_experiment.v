`timescale 1ns/1ps
module tb_experiment;
 reg clk=0,btnU=0,uart_rx=1;wire uart_tx;wire [15:0] led;
 always #5 clk=~clk;
 cbdc_puf_serial_experiment #(.UART_CLKS(8)) dut(.*);
 integer a_attempts=0,b_attempts=0;real armed_at,excite_at;
 always @(posedge dut.u_puf.latch)armed_at=$realtime;
 always @(posedge dut.u_puf.excite)begin
  excite_at=$realtime;
  if(dut.wait_cycles==0 && excite_at-armed_at<9.9)$fatal(1,"not armed before excitation");
 end
 always @(negedge dut.u_puf.u_core.qb_w)if(dut.u_puf.u_core.ce_a && !dut.u_puf.clr)a_attempts=a_attempts+1;
 always @(negedge dut.u_puf.u_core.qu_w)if(dut.u_puf.u_core.ce_b && !dut.u_puf.clr)b_attempts=b_attempts+1;
 task put(input [7:0] b);
 integer i;begin @(negedge clk);uart_rx=0;#80;for(i=0;i<8;i=i+1)begin uart_rx=b[i];#80;end uart_rx=1;#80;end
 endtask
 task get(output [7:0] b);
 integer i;begin @(negedge uart_tx);#120;for(i=0;i<8;i=i+1)begin b[i]=uart_tx;#80;end if(uart_tx!==1)$fatal(1,"stop bit");end
 endtask
 reg [7:0] reply[0:8];integer j;reg [7:0] sum;
 task query(input [15:0] c,input [7:0] mode,w,k,input accepted);
 begin
  a_attempts=0;b_attempts=0;
  put(8'ha7);put(c[7:0]);put(c[15:8]);put(mode);put(w);put(k);put(8'ha7^c[7:0]^c[15:8]^mode^w^k);
  for(j=0;j<9;j=j+1)get(reply[j]);
  sum=0;for(j=0;j<8;j=j+1)sum=sum^reply[j];
  if(reply[0]!==8'h5b || {reply[2],reply[1]}!==c || reply[3]!==mode || reply[4]!==w || reply[5]!==k || reply[8]!==sum)$fatal(1,"echo/checksum");
  if(reply[6][0]!==accepted || reply[6][7] || reply[6][6:4]!==3'b111)$fatal(1,"flags");
  if(!accepted && (a_attempts!=0 || b_attempts!=0 || reply[7]!==0))$fatal(1,"rejected query evaluated");
  if(accepted)begin
   if(mode[0] && a_attempts!=1)$fatal(1,"single-shot A attempts %d",a_attempts);
   if(mode[0] && mode[2] && b_attempts!=1)$fatal(1,"single-shot B attempts %d",b_attempts);
   if(!mode[2] && (b_attempts!=0 || reply[7][1]!==0))$fatal(1,"reverse disabled");
   if(!mode[0] && a_attempts<2)$fatal(1,"continuous mode did not recapture");
  end
  #200;
 end endtask
 // Independently verify parity head truth table on all 8 inputs.
 reg e=0,f=0,p=0;wire h;integer t;
 LUT3 #(.INIT(8'h87)) head(.I0(e),.I1(f),.I2(p),.O(h));
 initial begin
  for(t=0;t<8;t=t+1)begin {p,f,e}=t;#1;if(h!==((e&f)^~p))$fatal(1,"head truth table");end
 end
 initial begin
  #400;
  query(1,0,8,16,1);query(0,0,8,16,0); // legacy eligibility
  query(1,1,0,16,1);query(1,1,8,16,1); // first after excitation / enable
  query(0,3,0,16,1);query(16'hffff,3,0,16,1);query(2,3,0,16,1);
  query(1,5,0,16,1);query(0,7,0,16,1);query(1,7,8,16,1);
  query(1,0,0,16,0);query(1,1,0,0,0);query(1,8,8,16,0);
  put(8'ha7);put(1);put(0);put(0);put(8);put(16);put(0);#4000;
  if(dut.state!==0)$fatal(1,"bad CRC accepted");
  put(8'ha7);put(1);#4000;query(1,1,0,16,1);
  $display("PASS: experiment modes, pre-excitation arm, first-edge lock, parity and separate reverse output");$finish;
 end
 initial begin #1000000;$fatal(1,"watchdog");end
endmodule
