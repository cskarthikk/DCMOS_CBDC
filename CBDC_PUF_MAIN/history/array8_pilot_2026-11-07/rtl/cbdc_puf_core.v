`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: cbdc_puf_core
// Description:
//   Single CBDC-PUF macro core containing upper delay chain (Qu), lower delay
//   chain (Qb), cross-coupled feedback paths, and arbiter logic.
//
// Key Modes:
//   1. CAPTURE_MODE:
//      - 0: Paper Continuous Sampling (samples during latch=1, retains final edge)
//      - 1: True First-Wavefront Race (armed at excite=1, latches 1st race edge)
//      - 2: Post-Settle First Edge (armed at latch=1, latches 1st edge after 80 ns)
//   2. AUTO_PARITY:
//      - 0: Fixed entrance gate per paper (odd-parity challenges only)
//      - 1: Dynamic LUT3 (8'h87) entrance gate (100% challenge coverage)
//   3. DUAL_ARBITER:
//      - 0: Single Arbiter A only (D=Qu, C=negedge Qb, Figure 1)
//      - 1: Complementary pair for physical race validity check (QA != QB)
//==============================================================================
module cbdc_puf_core #(
    parameter integer N_STAGES      = 16,
    parameter [3:0]   GATE_INIT     = 4'h8,
    parameter integer CROSS_COUPLE  = 1,
    parameter integer ELEMENT_STYLE = 0,
    parameter integer DIAGNOSTIC    = 0,
    parameter integer AUTO_PARITY   = 1,
    parameter integer CAPTURE_MODE  = 1,   // 0=Paper Continuous, 1=True First-Wavefront, 2=Post-Settle 1st Edge
    parameter integer DUAL_ARBITER  = 1
) (
    input  wire [N_STAGES-1:0] c,                 // 16-bit challenge input
    input  wire                excite,            // Gate enable for both chains
    input  wire                latch,             // Arbiter capture enable
    input  wire                clr,               // Explicit asynchronous clear
    output wire                q,                 // Primary PUF response bit (Arbiter A: D=Qu, C=negedge Qb)
    output wire                q_comp_o,          // Complementary diagnostic bit (Arbiter B: D=Qb, C=negedge Qu)
    output wire                race_valid_o,      // Valid race indicator: 1 if QA != QB (unambiguous winner)
    output wire                qb_capture_seen_o, // Indicates Qb falling edge occurred
    output wire                qu_capture_seen_o  // Indicates Qu falling edge occurred
);

    // synthesis translate_off
    initial if (CROSS_COUPLE != 0 && CROSS_COUPLE != 1)
        $fatal(1, "CROSS_COUPLE must be 0 or 1");
    // synthesis translate_on

    // Critical terminal nets of upper and lower configurable delay chains
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

    // Arm signal for edge-locking registers
    // In Mode 1 (True First-Wavefront), armed as soon as excitation launches (excite=1).
    // In Mode 2, armed when latch=1 (after 80 ns delay).
    wire arm_edge_lock_w = (CAPTURE_MODE == 1) ? excite : latch;

    (* DONT_TOUCH = "TRUE" *) wire qb_first_edge_seen_w;
    (* DONT_TOUCH = "TRUE" *) wire qu_first_edge_seen_w;

    generate
        if (CAPTURE_MODE != 0) begin : gen_first_edge_lock
            (* DONT_TOUCH = "TRUE" *)
            FDCE_1 #(
                .INIT(1'b0)
            ) u_qb_edge_lock (
                .Q   (qb_first_edge_seen_w),
                .C   (qb_w),
                .CE  (arm_edge_lock_w),
                .CLR (clr),
                .D   (1'b1)
            );

            (* DONT_TOUCH = "TRUE" *)
            FDCE_1 #(
                .INIT(1'b0)
            ) u_qu_edge_lock (
                .Q   (qu_first_edge_seen_w),
                .C   (qu_w),
                .CE  (arm_edge_lock_w),
                .CLR (clr),
                .D   (1'b1)
            );
        end else begin : gen_continuous_sampling
            assign qb_first_edge_seen_w = 1'b0;
            assign qu_first_edge_seen_w = 1'b0;
        end
    endgenerate

    // Clock Enable for Arbiter A:
    // Mode 0: active throughout latch=1
    // Mode 1: active from excite=1 until the very first falling edge of Qb arrives
    // Mode 2: active from latch=1 until the first falling edge of Qb after latch
    wire arbiter_a_ce_w = (CAPTURE_MODE == 1) ? (excite & ~qb_first_edge_seen_w) :
                          (CAPTURE_MODE == 2) ? (latch & ~qb_first_edge_seen_w)  :
                                                latch;

    // Clock Enable for Arbiter B:
    wire arbiter_b_ce_w = (CAPTURE_MODE == 1) ? (excite & ~qu_first_edge_seen_w) :
                          (CAPTURE_MODE == 2) ? (latch & ~qu_first_edge_seen_w)  :
                                                latch;

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

    // Complementary Arbiter B (Diagnostic & Race Validity: D=Qb, C=negedge Qu)
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
            // Valid race condition: QA and QB must be complementary (one 0, one 1)
            assign race_valid_o = q ^ q_comp_o;
        end else begin : gen_no_dual_arbiter
            assign q_comp_o     = 1'b0;
            assign race_valid_o = 1'b1; // Single arbiter: always treated as valid
        end
    endgenerate

    // Edge-monitoring flags (DIAGNOSTIC mode)
    generate
        if (DIAGNOSTIC != 0) begin : gen_diagnostic
            if (CAPTURE_MODE != 0) begin : gen_diag_ss
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
