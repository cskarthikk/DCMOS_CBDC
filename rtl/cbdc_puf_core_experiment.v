`timescale 1ns/1ps
`default_nettype none
// Experimental CBDC-derived variant. NOT a replacement for the paper baseline.
// Modes are held by the controller throughout initialization/evaluation.
module cbdc_puf_core_experiment #(parameter integer N_STAGES=16)(
 input wire [N_STAGES-1:0] c,input wire [2:0] mode,
 input wire excite,latch,clr,output wire q,reverse_q,
 output wire qb_capture_seen_o,qu_capture_seen_o);
 (* DONT_TOUCH="TRUE" *) wire qu_w,qb_w;
 wire odd_gate_w=mode[1] ? (^c) : 1'b1;
 (* DONT_TOUCH="TRUE" *) cbdc_puf_chain_experiment #(.N_STAGES(N_STAGES)) u_chain_upper(
  .odd_gate_i(odd_gate_w),.excite_i(excite),.feedback_i(qb_w),.c_i(c),.chain_o(qu_w));
 (* DONT_TOUCH="TRUE" *) cbdc_puf_chain_experiment #(.N_STAGES(N_STAGES)) u_chain_lower(
  .odd_gate_i(odd_gate_w),.excite_i(excite),.feedback_i(qu_w),.c_i(c),.chain_o(qb_w));
 wire ce_a,ce_b;
 // Existing activity flags double as done flags: no extra done-clock load.
 // Both arbiters/monitors always exist, keeping clock loads constant across modes.
 (* DONT_TOUCH="TRUE" *) LUT4 #(.INIT(16'h2a00)) u_ce_a(
  .I0(latch),.I1(mode[0]),.I2(qb_capture_seen_o),.I3(1'b1),.O(ce_a));
 (* DONT_TOUCH="TRUE" *) LUT4 #(.INIT(16'h2a00)) u_ce_b(
  .I0(latch),.I1(mode[0]),.I2(qu_capture_seen_o),.I3(mode[2]),.O(ce_b));
 (* DONT_TOUCH="TRUE" *) FDCE_1 #(.INIT(1'b0)) u_arbiter_dff(
  .D(qu_w),.C(qb_w),.CE(ce_a),.CLR(clr),.Q(q));
 // Different clock: MUST be placed in a separate compatible slice.
 (* DONT_TOUCH="TRUE" *) FDCE_1 #(.INIT(1'b0)) u_reverse_arbiter_dff(
  .D(qb_w),.C(qu_w),.CE(ce_b),.CLR(clr),.Q(reverse_q));
 generate if(1) begin:gen_diagnostic
  (* DONT_TOUCH="TRUE" *) FDCE_1 #(.INIT(1'b0)) qb_seen(
   .D(1'b1),.C(qb_w),.CE(latch),.CLR(clr),.Q(qb_capture_seen_o));
  (* DONT_TOUCH="TRUE" *) FDCE_1 #(.INIT(1'b0)) qu_seen(
   .D(1'b1),.C(qu_w),.CE(latch),.CLR(clr),.Q(qu_capture_seen_o));
 end endgenerate
endmodule
`default_nettype wire
