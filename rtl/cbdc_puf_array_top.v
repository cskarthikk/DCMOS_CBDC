`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: cbdc_puf_array_top
// Description:
//   Top-level integration module for the multi-core CBDC-PUF macro array.
//   Wraps response_assembly with synchronous top-level control and status ports.
//
// Parameters:
//   N_CORES       : Number of CBDC-PUF cores (default 128)
//   N_STAGES      : Number of stages per chain (16)
//   GATE_INIT     : 4'h8 (AND2) / 4'h7 (NAND2)
//   AUTO_PARITY   : 1 = Dynamic parity selection (100% challenge space)
//   SINGLE_SHOT   : 1 = First-edge single-shot capture mode
//   DUAL_ARBITER  : 1 = Instantiate complementary Arbiter B
//==============================================================================
module cbdc_puf_array_top #(
    parameter integer N_CORES           = 128,
    parameter integer N_STAGES          = 16,
    parameter [3:0]   GATE_INIT         = 4'h8,
    parameter integer CROSS_COUPLE      = 1,
    parameter integer ELEMENT_STYLE     = 0,
    parameter integer AUTO_PARITY       = 1,
    parameter integer SINGLE_SHOT       = 1,
    parameter integer DUAL_ARBITER      = 1,
    parameter integer CLR_CYCLES        = 4,
    parameter integer INIT_SETTLE_CYCLES= 4,
    parameter integer EXCITE_CYCLES     = 8,
    parameter integer LATCH_CYCLES      = 8,
    parameter integer HOLD_CYCLES       = 4
) (
    input  wire                               clk,
    input  wire                               rst_n,
    input  wire                               start_i,
    input  wire [N_STAGES-1:0]                challenge_i,
    input  wire                               config_mode_i,
    input  wire [(N_CORES*N_STAGES)-1:0]      core_config_i,
    output wire                               busy_o,
    output wire                               resp_valid_o,
    output wire                               request_error_o,
    output wire [N_CORES-1:0]                 resp_data_o,
    output wire [N_CORES-1:0]                 comp_data_o,
    output wire [N_CORES-1:0]                 diff_data_o
);

    response_assembly #(
        .N_CORES           (N_CORES),
        .N_STAGES          (N_STAGES),
        .GATE_INIT         (GATE_INIT),
        .CROSS_COUPLE      (CROSS_COUPLE),
        .ELEMENT_STYLE     (ELEMENT_STYLE),
        .AUTO_PARITY       (AUTO_PARITY),
        .SINGLE_SHOT       (SINGLE_SHOT),
        .DUAL_ARBITER      (DUAL_ARBITER),
        .CLR_CYCLES        (CLR_CYCLES),
        .INIT_SETTLE_CYCLES(INIT_SETTLE_CYCLES),
        .EXCITE_CYCLES     (EXCITE_CYCLES),
        .LATCH_CYCLES      (LATCH_CYCLES),
        .HOLD_CYCLES       (HOLD_CYCLES)
    ) u_assembly (
        .clk            (clk),
        .rst_n          (rst_n),
        .start_i        (start_i),
        .challenge_i    (challenge_i),
        .config_mode_i  (config_mode_i),
        .core_config_i  (core_config_i),
        .busy_o         (busy_o),
        .resp_valid_o   (resp_valid_o),
        .request_error_o(request_error_o),
        .resp_data_o    (resp_data_o),
        .comp_data_o    (comp_data_o),
        .diff_data_o    (diff_data_o)
    );

endmodule

`default_nettype wire
