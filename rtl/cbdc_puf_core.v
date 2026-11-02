`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: cbdc_puf_core
// Description:
//   Single CBDC-PUF instance containing the upper delay chain (Qu), lower delay
//   chain (Qb), cross-coupled feedback paths, and negative-edge DFF arbiter
//   (FDCE_1) per Figure 1, Figure 2, and Equations (1)-(3).
//
//   No debug ports are attached to qu or qb to avoid additional loads.
//   Symmetric physical loading is not implied. Testbenches inspect dut.qu_w and
//   dut.qb_w via hierarchical reference.
//
// Parameters:
//   N_STAGES      : Number of stages per chain (16)
//   GATE_INIT     : 4'h8 = AND2 (Fig. 1), 4'h7 = NAND2 (Table 1)
//   CROSS_COUPLE  : 1 = Cross-coupled (Qb -> Upper, Qu -> Lower, Fig. 1 & Eq. 1)
//                   0 = Same-side feedback (experimental, not the paper architecture)
//   ELEMENT_STYLE : 0 = Style P (3 LUTs/elem), 1 = Style 2LUT (2 LUTs/elem)
//==============================================================================
module cbdc_puf_core #(
    parameter integer N_STAGES      = 16,
    parameter [3:0]   GATE_INIT     = 4'h8,
    parameter integer CROSS_COUPLE  = 1,
    parameter integer ELEMENT_STYLE = 0,
    parameter integer DIAGNOSTIC = 0
) (
    input  wire [N_STAGES-1:0] c,      // 16-bit challenge input (static during run)
    input  wire                excite, // Gate enable for both chains
    input  wire                latch,  // FDCE_1 clock enable (CE)
    input  wire                clr,    // Explicit asynchronous clear (engineering addition)
    output wire                q,      // Captured 1-bit raw PUF response
    output wire                qb_capture_seen_o,
    output wire                qu_capture_seen_o
);

    // Direct-core users must keep c stable and enforce supported parity:
    // AND2: odd; NAND2: even. Eligibility does not guarantee physical oscillation.
    // synthesis translate_off
    initial if (CROSS_COUPLE != 0 && CROSS_COUPLE != 1)
        $fatal(1, "CROSS_COUPLE must be 0 or 1 (0 is experimental)");
    // synthesis translate_on

    // Critical terminal nets of the upper and lower configurable delay chains
    (* DONT_TOUCH = "TRUE" *) wire qu_w;
    (* DONT_TOUCH = "TRUE" *) wire qb_w;

    // CROSS_COUPLE = 1 follows Figure 1 and Equation (1).
    wire fb_to_upper_w = (CROSS_COUPLE != 0) ? qb_w : qu_w;
    wire fb_to_lower_w = (CROSS_COUPLE != 0) ? qu_w : qb_w;

    // Upper Configurable Delay Chain (produces Qu)
    (* DONT_TOUCH = "TRUE" *)
    cbdc_puf_chain #(
        .N_STAGES      (N_STAGES),
        .GATE_INIT     (GATE_INIT),
        .ELEMENT_STYLE (ELEMENT_STYLE)
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
        .ELEMENT_STYLE (ELEMENT_STYLE)
    ) u_chain_lower (
        .excite_i   (excite),
        .feedback_i (fb_to_lower_w),
        .c_i        (c),
        .chain_o    (qb_w)
    );

    // Negative-edge-triggered DFF arbiter (Xilinx FDCE_1 primitive, Section 4.1)
    // Figure 1: D = Qu, negative-edge C = Qb, CE = latch; CLR is explicit here.
    // Captures Qu on the falling edge of Qb while latch == 1:
    //   tau_Qu < tau_Qb (Delta_sigma < 0) => Qu falls before Qb => captures Q = 0 (Fig. 2a)
    //   tau_Qu > tau_Qb (Delta_sigma > 0) => Qb falls before Qu => captures Q = 1 (Fig. 2b)
    (* DONT_TOUCH = "TRUE" *)
    FDCE_1 #(
        .INIT(1'b0)
    ) u_arbiter_dff (
        .Q   (q),
        .C   (qb_w),
        .CE  (latch),
        .CLR (clr),
        .D   (qu_w)
    );

    // Diagnostic-only loads. A set flag means >=1 falling edge while CE was high;
    // it does not count edges or establish oscillation/metastability resolution.
    generate if (DIAGNOSTIC != 0) begin : gen_diagnostic
        (* DONT_TOUCH = "TRUE" *) FDCE_1 qb_seen (
            .Q(qb_capture_seen_o), .C(qb_w), .CE(latch), .CLR(clr), .D(1'b1));
        (* DONT_TOUCH = "TRUE" *) FDCE_1 qu_seen (
            .Q(qu_capture_seen_o), .C(qu_w), .CE(latch), .CLR(clr), .D(1'b1));
    end else begin : gen_no_diagnostic
        assign qb_capture_seen_o = 1'b0;
        assign qu_capture_seen_o = 1'b0;
    end endgenerate
endmodule

`default_nettype wire
