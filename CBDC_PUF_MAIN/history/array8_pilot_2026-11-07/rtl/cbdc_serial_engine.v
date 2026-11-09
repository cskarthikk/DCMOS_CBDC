`timescale 1ns/1ps
`default_nettype none
module cbdc_serial_engine(input wire clk,reset,start,input wire [15:0] challenge,
 output wire valid,error,busy,response,output wire [1:0] edges);
 wire [15:0] c; wire excite,latch,clr,q; wire qb_seen,qu_seen;
 (* ASYNC_REG="TRUE", SHREG_EXTRACT="NO" *) reg [1:0] e1=0,e2=0;
 always @(posedge clk) if(reset) begin e1<=0;e2<=0;end else begin e1<={qu_seen,qb_seen};e2<=e1;end
 assign edges=e2;
 cbdc_puf_ctrl u_ctrl(.clk(clk),.rst_n(~reset),.start_i(start),.challenge_i(challenge),
  .busy_o(busy),.resp_valid_o(valid),.resp_bit_o(response),.request_error_o(error),
  .puf_c_o(c),.puf_excite_o(excite),.puf_latch_o(latch),.puf_clr_o(clr),.puf_q_i(q));
 cbdc_puf_core #(.DIAGNOSTIC(1)) u_core(.c(c),.excite(excite),.latch(latch),.clr(clr),.q(q),
  .qb_capture_seen_o(qb_seen),.qu_capture_seen_o(qu_seen),.q_comp_o(),.race_valid_o());
endmodule
`default_nettype wire
