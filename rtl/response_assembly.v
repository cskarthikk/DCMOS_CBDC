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
// Key Features:
//   1. Parameterized core array: defaults to N_CORES = 128 (paper spec),
//      scalable down to 16, 8, 4, or 1 for fast synthesis/testing.
//   2. Dual Challenge Modes:
//      - Broadcast Mode (config_mode_i = 0): Broadcasts 16-bit challenge_i
//        across all N_CORES. Intra-die spatial variation across the 128 macro
//        sites produces 128 distinct response bits per challenge.
//      - Individual / SHA-3 Mode (config_mode_i = 1): Feeds N_CORES * 16 bits
//        (e.g. 2048-bit SHA-3 hash output) so each core receives its own 16-bit
//        challenge slice.
//   3. Synchronized Single-Sequence Control:
//      All cores run under unified excitation, latching, and clear sequencing
//      driven by cbdc_puf_ctrl.
//   4. First-Edge Single-Shot Capture:
//      Each core locks its race outcome on its own initial wavefront arrival.
//   5. Dual Complementary Readout:
//      Provides primary (resp_data_o), complementary (comp_data_o), and
//      differential (diff_data_o) outputs across all 128 bits.
//   6. Multi-Flop Synchronizer:
//      Safely transfers all N_CORES asynchronous arbiter outputs into the
//      system clock domain without metastability.
//==============================================================================
module response_assembly #(
    parameter integer N_CORES           = 128,  // Number of CBDC-PUF macro cores
    parameter integer N_STAGES          = 16,   // Stages per chain (16)
    parameter [3:0]   GATE_INIT         = 4'h8,  // 4'h8 = AND2, 4'h7 = NAND2
    parameter integer CROSS_COUPLE      = 1,    // 1 = Cross-coupled ring oscillator
    parameter integer ELEMENT_STYLE     = 0,    // 0 = Style P (3 LUTs), 1 = Style 2LUT
    parameter integer AUTO_PARITY       = 1,    // 1 = Dynamic parity selection
    parameter integer SINGLE_SHOT       = 1,    // 1 = First-edge single-shot capture
    parameter integer DUAL_ARBITER      = 1,    // 1 = Complementary arbiter B
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
    input  wire [(N_CORES*N_STAGES)-1:0]      core_config_i,   // Per-core 16-bit challenges (e.g. 2048 bits for 128 cores)
    output wire                               busy_o,          // High while PUF evaluation is active
    output reg                                resp_valid_o,    // Pulses high for 1 cycle when resp_data is ready
    output wire                               request_error_o, // Unsupported challenge indicator
    output reg  [N_CORES-1:0]                 resp_data_o,     // Primary 128-bit PUF response (Arbiter A: D=Qu, C=Qb)
    output reg  [N_CORES-1:0]                 comp_data_o,     // Complementary response (Arbiter B: D=Qb, C=Qu)
    output reg  [N_CORES-1:0]                 diff_data_o      // Skew-cancelled differential response (Q_A ^ ~Q_B)
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

    // Instantiate Central Control Sequencer
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
        .puf_q_i        (raw_q_w[0]) // Feedback core 0 to single-core monitor
    );

    // Raw asynchronous outputs from all PUF cores
    wire [N_CORES-1:0] raw_q_w;
    wire [N_CORES-1:0] comp_q_w;

    // Array of CBDC-PUF Macro Cores
    genvar i;
    generate
        for (i = 0; i < N_CORES; i = i + 1) begin : gen_puf_core
            // Select per-core challenge
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
                .SINGLE_SHOT   (SINGLE_SHOT),
                .DUAL_ARBITER  (DUAL_ARBITER)
            ) u_core_inst (
                .c                 (core_challenge_w),
                .excite            (ctrl_excite_w),
                .latch             (ctrl_latch_w),
                .clr               (ctrl_clr_w),
                .q                 (raw_q_w[i]),
                .q_comp_o          (comp_q_w[i]),
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
    // Latches the synchronized parallel responses when the control sequence completes
    always @(posedge clk) begin
        if (!rst_n) begin
            resp_data_o  <= {N_CORES{1'b0}};
            comp_data_o  <= {N_CORES{1'b0}};
            diff_data_o  <= {N_CORES{1'b0}};
            resp_valid_o <= 1'b0;
        end else if (ctrl_valid_w) begin
            resp_data_o  <= sync_q2_r;
            comp_data_o  <= sync_comp2_r;
            diff_data_o  <= sync_q2_r ^ ~sync_comp2_r;
            resp_valid_o <= 1'b1;
        end else begin
            resp_valid_o <= 1'b0;
        end
    end

endmodule

`default_nettype wire
