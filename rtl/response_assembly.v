`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: response_assembly
// Description:
//   Multi-core CBDC-PUF macro array and parallel response collector following
//   Section 4.1 of the reference paper:
//   "A total of 128 CBDC-PUFs are arranged in a matrix and thus the CRPs space
//    of the PUF framework is 65536^128... The fixed structure of CBDC-PUF is
//    saved as a hard macro and reused to form a 128-bit PUF response."
//
// Key Enhancements:
//   1. Fully parameterized array size: N_CORES (default 128, scalable to 1, 4, 16)
//   2. Dual Challenge Modes:
//      - Broadcast Mode (config_mode_i = 0): 16-bit challenge broadcast to all cores.
//      - Individual Mode (config_mode_i = 1): Per-core 16-bit challenge slices.
//   3. Three Capture Timing Modes:
//      - CAPTURE_MODE = 0: Paper Continuous Sampling
//      - CAPTURE_MODE = 1: True First-Wavefront Race Capture (t = 0 of excite)
//      - CAPTURE_MODE = 2: Post-Settle 1st Edge Capture (t = 80 ns)
//   4. Rigorous Race Validity Mask:
//      - Primary response: resp_data_o (QA)
//      - Diagnostic response: comp_data_o (QB)
//      - Valid race mask: valid_mask_o = QA ^ QB (flagging clean complementary races)
//==============================================================================
module response_assembly #(
    parameter integer N_CORES           = 128,  // Number of CBDC-PUF macro cores
    parameter integer N_STAGES          = 16,   // Stages per chain (16)
    parameter [3:0]   GATE_INIT         = 4'h8,  // 4'h8 = AND2, 4'h7 = NAND2
    parameter integer CROSS_COUPLE      = 1,    // 1 = Cross-coupled ring oscillator
    parameter integer ELEMENT_STYLE     = 0,    // 0 = Style P (3 LUTs), 1 = Style 2LUT
    parameter integer AUTO_PARITY       = 1,    // 1 = Dynamic parity selection
    parameter integer CAPTURE_MODE      = 1,    // 0=Paper Continuous, 1=True First-Wavefront, 2=Post-Settle 1st Edge
    parameter integer DUAL_ARBITER      = 1,    // 1 = Complementary arbiter B for validity check
    parameter integer CLR_CYCLES        = 4,
    parameter integer INIT_SETTLE_CYCLES= 4,
    parameter integer EXCITE_CYCLES     = 8,
    parameter integer LATCH_CYCLES      = 8,
    parameter integer HOLD_CYCLES       = 4
) (
    input  wire                               clk,             // System clock (100 MHz)
    input  wire                               rst_n,           // Active-low synchronous reset
    input  wire                               start_i,         // Start evaluation pulse
    input  wire [N_STAGES-1:0]                challenge_i,     // Broadcast 16-bit challenge
    input  wire                               config_mode_i,   // 0 = Broadcast challenge_i, 1 = Per-core config
    input  wire [(N_CORES*N_STAGES)-1:0]      core_config_i,   // Per-core 16-bit challenges
    output wire                               busy_o,          // High while PUF evaluation is active
    output reg                                resp_valid_o,    // Pulses high for 1 cycle when resp_data is ready
    output wire                               request_error_o, // Unsupported challenge indicator
    output reg  [N_CORES-1:0]                 resp_data_o,     // Primary PUF response bits (Arbiter A: QA)
    output reg  [N_CORES-1:0]                 comp_data_o,     // Diagnostic complementary bits (Arbiter B: QB)
    output reg  [N_CORES-1:0]                 valid_mask_o     // Race validity mask (1 if QA != QB)
);

    // synthesis translate_off
    initial begin
        if (N_CORES < 1) $fatal(1, "N_CORES must be >= 1");
        if (N_STAGES < 1) $fatal(1, "N_STAGES must be >= 1");
    end
    // synthesis translate_on

    // Internal control signals from shared controller
    wire [N_STAGES-1:0] ctrl_c_w;
    wire                ctrl_excite_w;
    wire                ctrl_latch_w;
    wire                ctrl_clr_w;
    wire                ctrl_valid_w;
    wire                ctrl_busy_w;
    wire                ctrl_error_w;

    assign busy_o          = ctrl_busy_w;
    assign request_error_o = ctrl_error_w;

    // Shared Control Sequencer
    cbdc_puf_ctrl #(
        .N_STAGES          (N_STAGES),
        .GATE_INIT         (GATE_INIT),
        .AUTO_PARITY       (AUTO_PARITY),
        .CLR_CYCLES        (CLR_CYCLES),
        .INIT_SETTLE_CYCLES(INIT_SETTLE_CYCLES),
        .EXCITE_CYCLES     (EXCITE_CYCLES),
        .LATCH_CYCLES      (LATCH_CYCLES),
        .HOLD_CYCLES       (HOLD_CYCLES)
    ) u_shared_ctrl (
        .clk            (clk),
        .rst_n          (rst_n),
        .start_i        (start_i),
        .challenge_i    (challenge_i),
        .busy_o         (ctrl_busy_w),
        .resp_valid_o   (ctrl_valid_w),
        .request_error_o(ctrl_error_w),
        .resp_bit_o     (),
        .puf_c_o        (ctrl_c_w),
        .puf_excite_o   (ctrl_excite_w),
        .puf_latch_o    (ctrl_latch_w),
        .puf_clr_o      (ctrl_clr_w),
        .puf_q_i        (raw_q_w[0])
    );

    // Raw asynchronous outputs from all PUF cores
    wire [N_CORES-1:0] raw_q_w;
    wire [N_CORES-1:0] comp_q_w;

    // Array of CBDC-PUF Macro Cores
    genvar i;
    generate
        for (i = 0; i < N_CORES; i = i + 1) begin : gen_puf_core
            wire [N_STAGES-1:0] core_challenge_w;
            assign core_challenge_w = (config_mode_i != 1'b0) ?
                                      core_config_i[i*N_STAGES +: N_STAGES] :
                                      ctrl_c_w;

            (* DONT_TOUCH = "TRUE" *)
            cbdc_puf_core #(
                .N_STAGES      (N_STAGES),
                .GATE_INIT     (GATE_INIT),
                .CROSS_COUPLE  (CROSS_COUPLE),
                .ELEMENT_STYLE (ELEMENT_STYLE),
                .DIAGNOSTIC    (0),
                .AUTO_PARITY   (AUTO_PARITY),
                .CAPTURE_MODE  (CAPTURE_MODE),
                .DUAL_ARBITER  (DUAL_ARBITER)
            ) u_core_inst (
                .c                 (core_challenge_w),
                .excite            (ctrl_excite_w),
                .latch             (ctrl_latch_w),
                .clr               (ctrl_clr_w),
                .q                 (raw_q_w[i]),
                .q_comp_o          (comp_q_w[i]),
                .race_valid_o      (),
                .qb_capture_seen_o (),
                .qu_capture_seen_o ()
            );
        end
    endgenerate

    // 2-Flop Parallel Synchronizer across all N_CORES
    (* ASYNC_REG = "TRUE", SHREG_EXTRACT = "NO" *) reg [N_CORES-1:0] sync_q1_r, sync_q2_r;
    (* ASYNC_REG = "TRUE", SHREG_EXTRACT = "NO" *) reg [N_CORES-1:0] sync_comp1_r, sync_comp2_r;

    always @(posedge clk) begin
        if (!rst_n) begin
            sync_q1_r    <= {N_CORES{1'b0}};
            sync_q2_r    <= {N_CORES{1'b0}};
            sync_comp1_r <= {N_CORES{1'b0}};
            sync_comp2_r <= {N_CORES{1'b0}};
        end else begin
            sync_q1_r    <= raw_q_w;
            sync_q2_r    <= sync_q1_r;
            sync_comp1_r <= comp_q_w;
            sync_comp2_r <= sync_comp1_r;
        end
    end

    // Response Assembly Register
    always @(posedge clk) begin
        if (!rst_n) begin
            resp_data_o  <= {N_CORES{1'b0}};
            comp_data_o  <= {N_CORES{1'b0}};
            valid_mask_o <= {N_CORES{1'b0}};
            resp_valid_o <= 1'b0;
        end else if (ctrl_valid_w) begin
            resp_data_o  <= sync_q2_r;
            comp_data_o  <= sync_comp2_r;
            valid_mask_o <= sync_q2_r ^ sync_comp2_r; // 1 if clean complementary race (QA != QB)
            resp_valid_o <= 1'b1;
        end else begin
            resp_valid_o <= 1'b0;
        end
    end

endmodule

`default_nettype wire
