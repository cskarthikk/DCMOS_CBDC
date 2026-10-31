`timescale 1ps / 1ps
`default_nettype none

//==============================================================================
// SIMULATION-ONLY FILE — DO NOT ADD TO VIVADO SYNTHESIS FILESET
// ARTIFICIAL TRANSPORT DELAYS; NOT A PUF PROOF
// No routing, metastability, setup/hold, or analog pulse rejection is modeled.
// Never compile this file with vendor definitions of the same primitives.
//
// Provides behavioral wrappers for Xilinx 7-Series LUT2, LUT3, and FDCE_1
// primitives with runtime-configurable picosecond delays (dly_ps) so that:
//   1. Combinational feedback loops in cbdc_puf_core do not hang in zero-delay.
//   2. Testbenches can hierarchically inject known delay profiles (phi_u, psi_u,
//      phi_b, psi_b, tau_u, tau_b) without modifying a single line of RTL.
//   3. Known driving inputs (e.g. I0=0 on an AND2 gate) resolve cleanly even
//      when the feedback pin I1 is initially 1'bx at t=0.
//==============================================================================

module LUT2 #(
    parameter [3:0] INIT = 4'h0,
    parameter integer TRANSPORT = 1
) (
    output wire O,
    input  wire I0,
    input  wire I1
);
    // Default 50 ps propagation delay; overridden hierarchically by testbench
    integer dly_ps = 50;
    integer rise_extra_ps = 0, fall_extra_ps = 0;

    // X-tolerant truth-table evaluation (resolves when one input dominates)
    wire b0 = (I0 === 1'b1) ? INIT[1] : (I0 === 1'b0) ? INIT[0] : (INIT[1] === INIT[0]) ? INIT[0] : 1'bx;
    wire b1 = (I0 === 1'b1) ? INIT[3] : (I0 === 1'b0) ? INIT[2] : (INIT[3] === INIT[2]) ? INIT[2] : 1'bx;
    wire raw_o = (I1 === 1'b0) ? b0 :
                 (I1 === 1'b1) ? b1 :
                 (b0 === b1)   ? b0 : 1'bx;

    reg o_reg = 1'bx;

    initial begin
        #0;
        o_reg <= #(dly_ps + ((raw_o === 1'b1) ? rise_extra_ps : fall_extra_ps)) raw_o;
    end

    always @(raw_o) begin
        o_reg <= #(dly_ps + ((raw_o === 1'b1) ? rise_extra_ps : fall_extra_ps)) raw_o;
    end

    generate if (TRANSPORT) begin : transport_output
        assign O = o_reg;
    end else begin : inertial_output
        assign #(dly_ps + rise_extra_ps, dly_ps + fall_extra_ps) O = raw_o;
    end endgenerate
endmodule


module LUT3 #(
    parameter [7:0] INIT = 8'h00,
    parameter integer TRANSPORT = 1
) (
    output wire O,
    input  wire I0,
    input  wire I1,
    input  wire I2
);
    // Default 50 ps propagation delay; overridden hierarchically by testbench
    integer dly_ps = 50;
    integer rise_extra_ps = 0, fall_extra_ps = 0;

    // X-tolerant truth-table evaluation for I2=0 (m0) and I2=1 (m1)
    wire m0_0 = (I0 === 1'b1) ? INIT[1] : (I0 === 1'b0) ? INIT[0] : (INIT[1] === INIT[0]) ? INIT[0] : 1'bx;
    wire m0_1 = (I0 === 1'b1) ? INIT[3] : (I0 === 1'b0) ? INIT[2] : (INIT[3] === INIT[2]) ? INIT[2] : 1'bx;
    wire m0   = (I1 === 1'b0) ? m0_0    : (I1 === 1'b1) ? m0_1    : (m0_0 === m0_1)       ? m0_0    : 1'bx;

    wire m1_0 = (I0 === 1'b1) ? INIT[5] : (I0 === 1'b0) ? INIT[4] : (INIT[5] === INIT[4]) ? INIT[4] : 1'bx;
    wire m1_1 = (I0 === 1'b1) ? INIT[7] : (I0 === 1'b0) ? INIT[6] : (INIT[7] === INIT[6]) ? INIT[6] : 1'bx;
    wire m1   = (I1 === 1'b0) ? m1_0    : (I1 === 1'b1) ? m1_1    : (m1_0 === m1_1)       ? m1_0    : 1'bx;

    wire raw_o = (I2 === 1'b0) ? m0 :
                 (I2 === 1'b1) ? m1 :
                 (m0 === m1)   ? m0 : 1'bx;

    reg o_reg = 1'bx;

    initial begin
        #0;
        o_reg <= #(dly_ps + ((raw_o === 1'b1) ? rise_extra_ps : fall_extra_ps)) raw_o;
    end

    always @(raw_o) begin
        o_reg <= #(dly_ps + ((raw_o === 1'b1) ? rise_extra_ps : fall_extra_ps)) raw_o;
    end

    generate if (TRANSPORT) begin : transport_output
        assign O = o_reg;
    end else begin : inertial_output
        assign #(dly_ps + rise_extra_ps, dly_ps + fall_extra_ps) O = raw_o;
    end endgenerate
endmodule


module FDCE_1 #(
    parameter [0:0] INIT = 1'b0
) (
    output reg  Q,
    input  wire C,
    input  wire CE,
    input  wire CLR,
    input  wire D
);
    initial begin
        Q = INIT;
    end

    // Negative-edge-triggered DFF with active-high async clear (CLR) and clock enable (CE)
    // Conservative unknown handling; this is not a replacement for UNISIM.
    reg previous_c = 1'bx;
    initial begin #0; previous_c = C; end
    always @(C) previous_c <= C;
    always @(negedge C or CLR) begin
        if (CLR === 1'b1) begin
            Q <= 1'b0;
        end else if (CLR !== 1'b0) begin
            Q <= 1'bx;
        end else if (C !== previous_c && C !== 1'b1 &&
                     previous_c !== 1'b0 && CE !== 1'b0) begin
            if (C !== 1'b0 || previous_c !== 1'b1) Q <= 1'bx;
            else if (CE === 1'b1) Q <= D;
            else Q <= (D === Q) ? Q : 1'bx;
        end
    end
endmodule

`default_nettype wire
