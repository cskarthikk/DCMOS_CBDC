`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: cbdc_puf_core
// Description:
//   Single CBDC-PUF instance containing upper delay chain (Qu), lower delay
//   chain (Qb), cross-coupled feedback paths, and arbiter logic.
//
// Key Enhancements:
//   1. SINGLE_SHOT = 1 (Default): Captures the true initial wavefront race on the
//      very FIRST falling edge of Qb, then freezes CE to eliminate multi-cycle
//      sampling ambiguity and duty-cycle drift.
//   2. AUTO_PARITY = 1 (Default): Passes down dynamic entrance gate configuration
//      to sustain ring oscillation across 100% of all 65,536 challenges.
//   3. DUAL_ARBITER = 1 (Default): Instantiates complementary Arbiter B (D=Qb, C=Qu)
//      symmetrically in the same slice to cancel out terminal wire routing skew.
//
// Parameters:
//   N_STAGES      : Number of stages per chain (16)
//   GATE_INIT     : 4'h8 = AND2 (Fig. 1), 4'h7 = NAND2 (Table 1)
//   CROSS_COUPLE  : 1 = Cross-coupled (Qb -> Upper, Qu -> Lower, Fig. 1 & Eq. 1)
//                   0 = Same-side feedback (experimental)
//   ELEMENT_STYLE : 0 = Style P (3 LUTs/elem), 1 = Style 2LUT (2 LUTs/elem)
//   DIAGNOSTIC    : Diagnostic monitoring
//   AUTO_PARITY   : 1 = Dynamic AND/NAND based on challenge parity
//   SINGLE_SHOT   : 1 = First-edge single-shot capture mode
//   DUAL_ARBITER  : 1 = Instantiate complementary Arbiter B
//==============================================================================
module cbdc_puf_core #(
    parameter integer N_STAGES      = 16,
    parameter [3:0]   GATE_INIT     = 4'h8,
    parameter integer CROSS_COUPLE  = 1,
    parameter integer ELEMENT_STYLE = 0,
    parameter integer DIAGNOSTIC    = 0,
    parameter integer AUTO_PARITY   = 1,
    parameter integer SINGLE_SHOT   = 1,
    parameter integer DUAL_ARBITER  = 1
) (
    input  wire [N_STAGES-1:0] c,                 // 16-bit challenge input
    input  wire                excite,            // Gate enable for both chains
    input  wire                latch,             // Arbiter capture enable
    input  wire                clr,               // Explicit asynchronous clear
    output wire                q,                 // Primary PUF response bit (Arbiter A: D=Qu, C=negedge Qb)
    output wire                q_comp_o,          // Complementary response bit (Arbiter B: D=Qb, C=negedge Qu)
    output wire                qb_capture_seen_o, // Indicates Qb falling edge occurred
    output wire                qu_capture_seen_o  // Indicates Qu falling edge occurred
);

    // synthesis translate_off
    initial if (CROSS_COUPLE != 0 && CROSS_COUPLE != 1)
        $fatal(1, "CROSS_COUPLE must be 0 or 1");
    // synthesis translate_on

    // Critical terminal nets of the upper and lower configurable delay chains
    (* DONT_TOUCH = "TRUE" *) wire qu_w;
    (* DONT_TOUCH = "TRUE" *) wire qb_w;

    // Cross-coupled feedback selection per Figure 1 and Equation (1)
    wire fb_to_upper_w = (CROSS_COUPLE != 0) ? qb_w : qu_w;
    wire fb_to_lower_w = (CROSS_COUPLE != 0) ? qu_w : qb_w;

    // Upper Configurable Delay Chain (produces Qu)
    (* DONT_TOUCH = "TRUE" *)
    cbdc_puf_chain #(
        .N_STAGES      (N_STAGES),
        .GATE_INIT     (GATE_INIT),
        .ELEMENT_STYLE (ELEMENT_STYLE),
        .AUTO_PARITY   (AUTO_PARITY)
    ) u_chain_upper (
        .excite_i   (excite),
        .feedback_i (fb_to_upper_w),
        .c_i        (c),
        .chain_o    (qu_w)
    );

    // Lower Configurable Delay Chain (produces Qb)
    (* DONT_TOUCH = "TRUE" *)
    cbdc_puf_chain #(
        .N_STAGES      (N_STAGES),
        .GATE_INIT     (GATE_INIT),
        .ELEMENT_STYLE (ELEMENT_STYLE),
        .AUTO_PARITY   (AUTO_PARITY)
    ) u_chain_lower (
        .excite_i   (excite),
        .feedback_i (fb_to_lower_w),
        .c_i        (c),
        .chain_o    (qb_w)
    );

    // First-edge capture gating logic
    // Arms when latch=1; sets on the first falling edge to lock CE against subsequent oscillations
    (* DONT_TOUCH = "TRUE" *) wire qb_first_edge_seen_w;
    (* DONT_TOUCH = "TRUE" *) wire qu_first_edge_seen_w;

    generate
        if (SINGLE_SHOT != 0) begin : gen_single_shot
            (* DONT_TOUCH = "TRUE" *)
            FDCE_1 #(
                .INIT(1'b0)
            ) u_qb_edge_lock (
                .Q   (qb_first_edge_seen_w),
                .C   (qb_w),
                .CE  (latch),
                .CLR (clr),
                .D   (1'b1)
            );

            (* DONT_TOUCH = "TRUE" *)
            FDCE_1 #(
                .INIT(1'b0)
            ) u_qu_edge_lock (
                .Q   (qu_first_edge_seen_w),
                .C   (qu_w),
                .CE  (latch),
                .CLR (clr),
                .D   (1'b1)
            );
        end else begin : gen_continuous_sampling
            assign qb_first_edge_seen_w = 1'b0;
            assign qu_first_edge_seen_w = 1'b0;
        end
    endgenerate

    // Enable for Arbiter A: active only until the first falling edge of Qb
    wire arbiter_a_ce_w = (SINGLE_SHOT != 0) ? (latch & ~qb_first_edge_seen_w) : latch;

    // Enable for Arbiter B: active only until the first falling edge of Qu
    wire arbiter_b_ce_w = (SINGLE_SHOT != 0) ? (latch & ~qu_first_edge_seen_w) : latch;

    // Primary Arbiter A (Figure 1: D=Qu, C=negedge Qb)
    (* DONT_TOUCH = "TRUE" *)
    FDCE_1 #(
        .INIT(1'b0)
    ) u_arbiter_dff (
        .Q   (q),
        .C   (qb_w),
        .CE  (arbiter_a_ce_w),
        .CLR (clr),
        .D   (qu_w)
    );

    // Complementary Arbiter B (Symmetrical dual arbiter: D=Qb, C=negedge Qu)
    // Symmetrically balances out terminal wire routing skew
    generate
        if (DUAL_ARBITER != 0) begin : gen_dual_arbiter
            (* DONT_TOUCH = "TRUE" *)
            FDCE_1 #(
                .INIT(1'b0)
            ) u_arbiter_b_dff (
                .Q   (q_comp_o),
                .C   (qu_w),
                .CE  (arbiter_b_ce_w),
                .CLR (clr),
                .D   (qb_w)
            );
        end else begin : gen_no_dual_arbiter
            assign q_comp_o = 1'b0;
        end
    endgenerate

    // Edge-monitoring flags (DIAGNOSTIC mode)
    generate
        if (DIAGNOSTIC != 0) begin : gen_diagnostic
            if (SINGLE_SHOT != 0) begin : gen_diag_ss
                assign qb_capture_seen_o = qb_first_edge_seen_w;
                assign qu_capture_seen_o = qu_first_edge_seen_w;
            end else begin : gen_diag_cont
                (* DONT_TOUCH = "TRUE" *) FDCE_1 qb_seen (
                    .Q(qb_capture_seen_o), .C(qb_w), .CE(latch), .CLR(clr), .D(1'b1));
                (* DONT_TOUCH = "TRUE" *) FDCE_1 qu_seen (
                    .Q(qu_capture_seen_o), .C(qu_w), .CE(latch), .CLR(clr), .D(1'b1));
            end
        end else begin : gen_no_diagnostic
            assign qb_capture_seen_o = 1'b0;
            assign qu_capture_seen_o = 1'b0;
        end
    endgenerate

endmodule

`default_nettype wire
