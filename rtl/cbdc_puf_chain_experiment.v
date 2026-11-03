// Experimental parity-selectable entrance; baseline chain remains unchanged.
// odd_gate_i selects the function. GATE_INIT is an inherited compatibility
// parameter and does not select the dynamic head's function in this variant.
`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: cbdc_puf_chain
// Description:
//   One configurable delay chain consisting of 1 entrance gate (LUT2 configured
//   as AND2 (Figure 1) or experimental NAND2 (Section 4.1)) followed by 16 cascaded
//   configurable delay elements (Section 3.1, Figure 1).
//
// Parameters:
//   N_STAGES      : Number of configurable delay stages (Paper = 16)
//   GATE_INIT     : 4'h8 = AND2 (Figure 1 / Section 3.1 prose)
//                   4'h7 = NAND2 (Section 4.1 / Table 1)
//   ELEMENT_STYLE : Passed down to cbdc_puf_element (0 = Style P 3-LUT)
//==============================================================================
module cbdc_puf_chain_experiment #(
    parameter integer N_STAGES      = 16,
    parameter [3:0]   GATE_INIT     = 4'h8, // Default 4'h8 (AND2) per Fig. 1
    parameter integer ELEMENT_STYLE = 0
) (
    input wire odd_gate_i, // 1=AND, 0=NAND; held before excitation
    input  wire                excite_i,   // Excite control signal (I0 of entrance gate)
    input  wire                feedback_i, // Cross-coupled feedback from opposite chain (I1)
    input  wire [N_STAGES-1:0] c_i,        // 16-bit challenge bus C[15:0]
    output wire                chain_o     // Final output of the chain (Qu or Qb)
);

    // synthesis translate_off
    initial begin
        if (N_STAGES < 1) $fatal(1, "N_STAGES must be positive");
        if (GATE_INIT != 4'h8 && GATE_INIT != 4'h7)
            $fatal(1, "Only AND2 and NAND2 entrance gates are supported");
    end
    // synthesis translate_on

    // Internal chain bus: node[0] is Q^0 (gate output), node[N_STAGES] is Qu or Qb
    (* DONT_TOUCH = "TRUE" *) wire [N_STAGES:0] node_w;

    // Entrance gate (AND2 when GATE_INIT=4'h8, NAND2 when GATE_INIT=4'h7)
    (* DONT_TOUCH = "TRUE" *)
    LUT3 #(
        .INIT(8'h87)
    ) u_head_gate (
        .O  (node_w[0]),
        .I0 (excite_i),
        .I1 (feedback_i),
        .I2 (odd_gate_i)
    );

    // 16 cascaded configurable delay elements (C[0] at stage 0 ... C[15] at stage 15)
    genvar i;
    generate
        for (i = 0; i < N_STAGES; i = i + 1) begin : gen_elem
            (* DONT_TOUCH = "TRUE" *)
            cbdc_puf_element #(
                .ELEMENT_STYLE(ELEMENT_STYLE)
            ) u_elem (
                .sig_i (node_w[i]),
                .c_i   (c_i[i]),
                .sig_o (node_w[i+1])
            );
        end
    endgenerate

    assign chain_o = node_w[N_STAGES];

endmodule

`default_nettype wire
