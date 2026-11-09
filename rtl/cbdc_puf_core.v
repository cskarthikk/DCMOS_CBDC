`timescale 1ns/1ps
`default_nettype none
// Figure 1 interpretation: fixed AND, two configurable cross-coupled chains,
// one negative-edge response FF enabled by Latch. Exact LUT mapping is unpublished.
module cbdc_puf_core(input wire [15:0] c,input wire excite,latch,clr,output wire q);
 (* DONT_TOUCH="TRUE" *) wire qu_w,qb_w;
 (* DONT_TOUCH="TRUE" *) cbdc_puf_chain #(.N_STAGES(16),.GATE_INIT(4'h8),.AUTO_PARITY(0),.ELEMENT_STYLE(0))
 u_chain_upper(.excite_i(excite),.feedback_i(qb_w),.c_i(c),.chain_o(qu_w));
 (* DONT_TOUCH="TRUE" *) cbdc_puf_chain #(.N_STAGES(16),.GATE_INIT(4'h8),.AUTO_PARITY(0),.ELEMENT_STYLE(0))
 u_chain_lower(.excite_i(excite),.feedback_i(qu_w),.c_i(c),.chain_o(qb_w));
 (* DONT_TOUCH="TRUE" *) FDCE_1 #(.INIT(1'b0)) u_arbiter_dff(.Q(q),.C(qb_w),.CE(latch),.CLR(clr),.D(qu_w));
endmodule
`default_nettype wire
