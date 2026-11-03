`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: cbdc_puf_chain
// Description:
//   One configurable delay chain consisting of 1 entrance gate followed by 16
//   cascaded configurable delay elements (Section 3.1, Figure 1).
//
//   Entrance Gate Options:
//     - AUTO_PARITY = 1 (Default): Single LUT3 configured with INIT 8'h87.
//       Dynamically selects AND2 (4'h8) for odd-parity challenges, and NAND2 (4'h7)
//       for even-parity challenges. Guarantees physical ring oscillation liveness
//       across 100% of all 65,536 challenges (2^16).
//     - AUTO_PARITY = 0: Static LUT2 configured with GATE_INIT (4'h8 = AND2, 4'h7 = NAND2).
//
// Parameters:
//   N_STAGES      : Number of configurable delay stages (Paper = 16)
//   GATE_INIT     : 4'h8 = AND2 (Figure 1 / Section 3.1 prose)
//                   4'h7 = NAND2 (Section 4.1 / Table 1)
//   ELEMENT_STYLE : Passed down to cbdc_puf_element (0 = Style P 3-LUT)
//   AUTO_PARITY   : 1 = Dynamic AND/NAND based on challenge parity (100% CRPs)
//==============================================================================
module cbdc_puf_chain #(
    parameter integer N_STAGES      = 16,
    parameter [3:0]   GATE_INIT     = 4'h8, // Default 4'h8 (AND2) per Fig. 1
    parameter integer ELEMENT_STYLE = 0,
    parameter integer AUTO_PARITY   = 1     // 1 = Dynamic AND/NAND parity gate (100% CRP coverage)
) (
    input  wire                excite_i,   // Excite control signal (I0 of entrance gate)
    input  wire                feedback_i, // Cross-coupled feedback from opposite chain (I1)
    input  wire [N_STAGES-1:0] c_i,        // 16-bit challenge bus C[15:0]
    output wire                chain_o     // Final output of the chain (Qu or Qb)
);

    // Challenge parity: 1 for odd number of inverting stages, 0 for even
    wire c_parity = ^c_i;

    // synthesis translate_off
    initial begin
        if (N_STAGES < 1) $fatal(1, "N_STAGES must be positive");
        if (AUTO_PARITY == 0 && GATE_INIT != 4'h8 && GATE_INIT != 4'h7)
            $fatal(1, "Only AND2 and NAND2 entrance gates are supported");
    end
    // synthesis translate_on

    // Internal chain bus: node[0] is Q^0 (gate output), node[N_STAGES] is Qu or Qb
    (* DONT_TOUCH = "TRUE" *) wire [N_STAGES:0] node_w;

    // Entrance Gate Implementation:
    // When AUTO_PARITY=1:
    //   LUT3 #(.INIT(8'h87)):
    //     I2=1 (odd parity)  -> selects 4'h8 (AND2: I0 & I1)
    //     I2=0 (even parity) -> selects 4'h7 (NAND2: ~(I0 & I1))
    // When AUTO_PARITY=0:
    //   LUT2 #(.INIT(GATE_INIT)) legacy fixed gate
    generate
        if (AUTO_PARITY != 0) begin : gen_auto_parity_gate
            (* DONT_TOUCH = "TRUE" *)
            LUT3 #(
                .INIT(8'h87)
            ) u_head_gate (
                .O  (node_w[0]),
                .I0 (excite_i),
                .I1 (feedback_i),
                .I2 (c_parity)
            );
        end else begin : gen_fixed_parity_gate
            (* DONT_TOUCH = "TRUE" *)
            LUT2 #(
                .INIT(GATE_INIT)
            ) u_head_gate (
                .O  (node_w[0]),
                .I0 (excite_i),
                .I1 (feedback_i)
            );
        end
    endgenerate

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
