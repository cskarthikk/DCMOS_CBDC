`timescale 1ps / 1ps
`default_nettype none

//==============================================================================
// SIMULATION-ONLY FILE — DO NOT ADD TO VIVADO SYNTHESIS FILESET
// ARTIFICIAL DELAYS; NOT A PUF PROOF
//
// Module: cbdc_puf_ref_model
// Description:
//   Pure mathematical reference model implementing Equations (1), (2), and (3)
//   from Section 3.1 of Liu et al. (2023), plus startup eligibility:
//   Style P extension: add mux_u_ps[i]/mux_b_ps[i] to selected stage delays.
//   Set mux delays to zero when phi/psi already include the entire stage.
//     tau_Qu = sum_{i=0}^{15} ((1 - C[i])*phi_u[i] + C[i]*psi_u[i]) + tau_u
//     tau_Qb = sum_{i=0}^{15} ((1 - C[i])*phi_b[i] + C[i]*psi_b[i]) + tau_b
//     Delta_sigma = tau_Qu - tau_Qb
//     expected_q  = (Delta_sigma > 0) ? 1'b1 : 1'b0   (Equation 3)
//==============================================================================
module cbdc_puf_ref_model #(
    parameter integer N_STAGES  = 16,
    parameter [3:0]   GATE_INIT   = 4'h8,
    parameter integer AUTO_PARITY = 1
) (
    input  wire [N_STAGES-1:0] c_i,
    output reg  [31:0]         tau_qu_ps_o,
    output reg  [31:0]         tau_qb_ps_o,
    output reg  signed [31:0]  delta_sigma_ps_o,
    output reg                 expected_q_o,
    output reg                 expected_init_qu_o,
    output reg                 startup_eligible_o,
    output reg                 initialized_o = 1'b0
);

    // Delay arrays in picoseconds (populated by the testbench to match injected profile)
    integer phi_u_ps [0:N_STAGES-1];
    integer psi_u_ps [0:N_STAGES-1];
    integer phi_b_ps [0:N_STAGES-1];
    integer psi_b_ps [0:N_STAGES-1];
    integer mux_u_ps [0:N_STAGES-1];
    integer mux_b_ps [0:N_STAGES-1];
    integer tau_u_ps;
    integer tau_b_ps;

    integer idx, init_idx;
    reg signed [63:0] sum_u, sum_b;
    reg     chain_inv_parity;
    reg     gate_init_out;
    reg     gate_inverts_when_excited;

    initial begin
        if (N_STAGES < 1 || (GATE_INIT != 4'h8 && GATE_INIT != 4'h7))
            $fatal(1, "Invalid reference model parameters");
        tau_u_ps = 50;
        tau_b_ps = 50;
        for (init_idx = 0; init_idx < N_STAGES; init_idx = init_idx + 1) begin
            phi_u_ps[init_idx] = 50;
            psi_u_ps[init_idx] = 50;
            phi_b_ps[init_idx] = 50;
            psi_b_ps[init_idx] = 50;
            mux_u_ps[init_idx] = 50;
            mux_b_ps[init_idx] = 50;
        end
        initialized_o = 1'b1;
    end

    // Includes every read array element: profile changes automatically recalculate.
    always @* begin
        sum_u = tau_u_ps;
        sum_b = tau_b_ps;
        for (idx = 0; idx < N_STAGES; idx = idx + 1) begin
            if (c_i[idx] === 1'b0) begin
                sum_u = sum_u + phi_u_ps[idx] + mux_u_ps[idx];
                sum_b = sum_b + phi_b_ps[idx] + mux_b_ps[idx];
            end else if (c_i[idx] === 1'b1) begin
                sum_u = sum_u + psi_u_ps[idx] + mux_u_ps[idx];
                sum_b = sum_b + psi_b_ps[idx] + mux_b_ps[idx];
            end else begin
                sum_u = 64'bx;
                sum_b = 64'bx;
            end
        end

        // Keep exported 32-bit totals and signed difference representable.
        if (sum_u < 0 || sum_b < 0 || sum_u > 2147483647 || sum_b > 2147483647) begin
            sum_u = 64'bx;
            sum_b = 64'bx;
        end

        tau_qu_ps_o      = sum_u;
        tau_qb_ps_o      = sum_b;
        delta_sigma_ps_o = $signed(sum_u) - $signed(sum_b);

        // Equation (3): Q = 0 if Delta_sigma <= 0 (tau_Qu <= tau_Qb), 1 if Delta_sigma > 0
        expected_q_o     = (delta_sigma_ps_o > 0) ? 1'b1 : 1'b0;

        // Parity of inversions along the 16-element chain (1 = odd number of 1s in c_i)
        chain_inv_parity = ^c_i;

        // During Initialization (Excite = I0 = 0), gate output is INIT[0]
        // (For AND2 4'h8 -> 0; for NAND2 4'h7 -> 1)
                // When AUTO_PARITY=1, gate automatically matches challenge parity:
        // Odd parity -> AND2 (4'h8, init out = 0)
        // Even parity -> NAND2 (4'h7, init out = 1)
        if (AUTO_PARITY != 0) begin
            gate_init_out = (chain_inv_parity) ? 1'b0 : 1'b1;
            expected_init_qu_o = 1'b1; // Always initializes Qu/Qb to 1
            startup_eligible_o = 1'b1; // 100% of all 65,536 challenges are eligible
        end else begin
            gate_init_out = GATE_INIT[0];
            expected_init_qu_o = gate_init_out ^ chain_inv_parity;
            gate_inverts_when_excited = (GATE_INIT == 4'h7) ? 1'b1 : 1'b0;
            startup_eligible_o = chain_inv_parity ^ gate_inverts_when_excited;
        end
    end

endmodule

`default_nettype wire
