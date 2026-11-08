`timescale 1ns/1ps
// Controlled counterexample, not a measured PUF oscillation model.
module tb_capture_window;
 reg clk=0,rst_n=0,start=0;always #5 clk=~clk;
 wire [1:0] busy,valid,error,response,excite,latch,clr,q;
 wire [15:0] cfg0,cfg1;
 reg [1:0] qb=2'b11;reg [1:0] completed=0;reg [1:0] observed=0;
 cbdc_puf_ctrl #(.AUTO_PARITY(0),.LATCH_CYCLES(8)) short_ctrl(
  .clk(clk),.rst_n(rst_n),.start_i(start),.challenge_i(16'h0001),.excite_cycles_i(8'd8),
  .busy_o(busy[0]),.resp_valid_o(valid[0]),.request_error_o(error[0]),.resp_bit_o(response[0]),
  .puf_c_o(cfg0),.puf_excite_o(excite[0]),.puf_latch_o(latch[0]),.puf_clr_o(clr[0]),.puf_q_i(q[0]));
 cbdc_puf_ctrl #(.AUTO_PARITY(0),.LATCH_CYCLES(64)) long_ctrl(
  .clk(clk),.rst_n(rst_n),.start_i(start),.challenge_i(16'h0001),.excite_cycles_i(8'd8),
  .busy_o(busy[1]),.resp_valid_o(valid[1]),.request_error_o(error[1]),.resp_bit_o(response[1]),
  .puf_c_o(cfg1),.puf_excite_o(excite[1]),.puf_latch_o(latch[1]),.puf_clr_o(clr[1]),.puf_q_i(q[1]));
 FDCE_1 ff0(.Q(q[0]),.C(qb[0]),.CE(latch[0]),.CLR(clr[0]),.D(1'b1));
 FDCE_1 ff1(.Q(q[1]),.C(qb[1]),.CE(latch[1]),.CLR(clr[1]),.D(1'b1));
 always @(posedge latch[0]) begin #100;qb[0]=0;end
 always @(posedge latch[1]) begin #100;qb[1]=0;end
 always @(negedge clk) begin
  if(valid[0]) begin completed[0]=1;observed[0]=response[0];end
  if(valid[1]) begin completed[1]=1;observed[1]=response[1];end
 end
 initial begin
  #40;rst_n=1;@(negedge clk);start=1;@(negedge clk);start=0;
  wait(&completed);#10;
  if(error!=0 || observed!==2'b10) $fatal(1,"Unexpected counterexample result");
  $display("CONFIRMED: with D=1 and a falling clock 100ns after Latch opens, the 80ns window reports completion/zero; the 640ns window captures one.");
  $display("LIMIT: this demonstrates a possible missed-capture mechanism, not that the hardware PUF has this waveform or that a longer window fixes its bias.");
  $finish;
 end
 initial begin #10000;$fatal(1,"Watchdog");end
endmodule
