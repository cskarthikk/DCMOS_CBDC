`timescale 1ns / 1ps
`default_nettype none
// Integration top, not a board pin wrapper. Figure 1 core + synchronous readout.
// GATE_INIT is shared so admission policy cannot disagree with the core.
// No monitors or extra registers are attached to the critical Qu/Qb nets.
module cbdc_puf_top #(
    parameter integer N_STAGES = 16,
    parameter [3:0] GATE_INIT = 4'h8,
    parameter integer CLR_CYCLES = 4,
    parameter integer INIT_SETTLE_CYCLES = 4,
    parameter integer EXCITE_CYCLES = 8,
    parameter integer LATCH_CYCLES = 8,
    parameter integer HOLD_CYCLES = 4
) (
    input wire clk, rst_n, start_i,
    input wire [N_STAGES-1:0] challenge_i,
    output wire busy_o, resp_valid_o, resp_bit_o, request_error_o
);
    wire [N_STAGES-1:0] challenge;
    wire excite, latch, clr, response;
    cbdc_puf_ctrl #(
        .N_STAGES(N_STAGES), .GATE_INIT(GATE_INIT),
        .CLR_CYCLES(CLR_CYCLES), .INIT_SETTLE_CYCLES(INIT_SETTLE_CYCLES),
        .EXCITE_CYCLES(EXCITE_CYCLES), .LATCH_CYCLES(LATCH_CYCLES),
        .HOLD_CYCLES(HOLD_CYCLES)
    ) u_ctrl (
        .clk(clk), .rst_n(rst_n), .start_i(start_i), .challenge_i(challenge_i),
        .busy_o(busy_o), .resp_valid_o(resp_valid_o), .resp_bit_o(resp_bit_o),
        .request_error_o(request_error_o), .puf_c_o(challenge),
        .puf_excite_o(excite), .puf_latch_o(latch), .puf_clr_o(clr), .puf_q_i(response)
    );
    cbdc_puf_core #(.N_STAGES(N_STAGES), .GATE_INIT(GATE_INIT),
        .CROSS_COUPLE(1), .ELEMENT_STYLE(0)) u_core (
        .c(challenge), .excite(excite), .latch(latch), .clr(clr), .q(response),
        .q_comp_o(), .qb_capture_seen_o(), .qu_capture_seen_o()
    );
endmodule
`default_nettype wire
