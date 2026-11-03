`timescale 1ns/1ps
module tb_cbdc_timing;
 reg clk=0,btnU=0,uart_rx=1;wire uart_tx;wire [15:0] led;
 always #5 clk=~clk;
 cbdc_puf_serial_timing #(.UART_CLKS(8)) dut(.*);
 task put(input [7:0] b);
 integer i;begin @(negedge clk);uart_rx=0;#80;for(i=0;i<8;i=i+1)begin uart_rx=b[i];#80;end uart_rx=1;#80;end
 endtask
 task get(output [7:0] b);
 integer i;begin @(negedge uart_tx);#120;for(i=0;i<8;i=i+1)begin b[i]=uart_tx;#80;end if(uart_tx!==1)$fatal(1,"stop bit");end
 endtask
 reg [7:0] reply[0:7];integer j;reg [7:0] checksum;
 integer completed=0;time excite_time,latch_time;
 // Check actual emitted waveform intervals, not just configuration echoes.
 always @(posedge dut.u_puf.excite) excite_time=$time;
 always @(posedge dut.u_puf.latch) begin
  latch_time=$time;
  if($time-excite_time != dut.wait_cycles*10)$fatal(1,"wrong excitation wait");
 end
 always @(negedge dut.u_puf.latch) if(!dut.reset && dut.u_puf.excite) begin
  if($time-latch_time != dut.capture_cycles*10)$fatal(1,"wrong capture duration");
  completed=completed+1;
 end
 task query(input [15:0] c,input [7:0] w,k,input accepted);
 begin
  put(8'ha6);put(c[7:0]);put(c[15:8]);put(w);put(k);put(8'ha6^c[7:0]^c[15:8]^w^k);
  for(j=0;j<8;j=j+1)get(reply[j]);
  checksum=0;for(j=0;j<7;j=j+1)checksum=checksum^reply[j];
  if(reply[0]!==8'h5a || {reply[2],reply[1]}!==c || reply[3]!==w || reply[4]!==k || reply[7]!==checksum)$fatal(1,"echo/checksum");
  if(reply[5][0]!==accepted || reply[5][7] || reply[5][5:4]!==2'b11)$fatal(1,"status");
  if(reply[6]>1 || (!accepted && reply[6]!==0))$fatal(1,"response");
  #200;
 end endtask
 initial begin
  #400;
  query(1,8,8,1);query(7,16,4,1);query(1,32,16,1);
  query(1,1,1,1);query(1,255,255,1);
  query(0,8,8,0);query(1,0,8,0);query(1,8,0,0);
  query(16'ha6,8,8,0); // header byte inside an even-parity payload
  put(8'ha6);put(1);put(0);put(8);put(8);put(0);#4000;
  if(dut.state!==0)$fatal(1,"bad checksum accepted");
  put(8'ha6);put(1);#4000;
  query(1,8,8,1);
  if(completed!=6)$fatal(1,"unexpected evaluations %d",completed);
  $display("PASS: timing protocol, runtime durations 1..255, zero rejection and recovery");$finish;
 end
 initial begin #1000000;$fatal(1,"watchdog");end
endmodule
