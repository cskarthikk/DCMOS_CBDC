`timescale 1ns/1ps
`default_nettype none
module cbdc_serial_engine(input wire clk,reset,start,input wire [15:0] challenge,input wire [7:0] excite_cycles,
 output wire valid,error,busy,response,output wire [15:0] configuration);
 wire excite,latch,clr,q;
 cbdc_puf_ctrl #(.AUTO_PARITY(0),.GATE_INIT(4'h8),.LATCH_CYCLES(64)) u_ctrl(
 .clk(clk),.rst_n(~reset),.start_i(start),.challenge_i(challenge),.excite_cycles_i(excite_cycles),
 .busy_o(busy),.resp_valid_o(valid),.resp_bit_o(response),.request_error_o(error),
 .puf_c_o(configuration),.puf_excite_o(excite),.puf_latch_o(latch),.puf_clr_o(clr),.puf_q_i(q));
 cbdc_puf_core u_core(.c(configuration),.excite(excite),.latch(latch),.clr(clr),.q(q));
endmodule
`default_nettype wire
