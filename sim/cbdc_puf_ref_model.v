`timescale 1ps / 1ps
`default_nettype none

//==============================================================================
// SIMULATION-ONLY FILE — DO NOT ADD TO VIVADO SYNTHESIS FILESET
// ARTIFICIAL DELAYS; NOT A PUF PROOF
//
// Module: cbdc_puf_ref_model
// Description:
//   Pure mathematical reference model implementing Equations (1), (2), and (3)
//   from Section 3.1 of Liu et al. (2023), plus liveness/oscillation analysis:
//     tau_Qu = sum_{i=0}^{15} ((1 - C[i])*phi_u[i] + C[i]*psi_u[i]) + tau_u
//     tau_Qb = sum_{i=0}^{15} ((1 - C[i])*phi_b[i] + C[i]*psi_b[i]) + tau_b
//     Delta_sigma = tau_Qu - tau_Qb
//     expected_q  = (Delta_sigma > 0) ? 1'b1 : 1'b0   (Equation 3)
//==============================================================================
module cbdc_puf_ref_model #(
    parameter integer N_STAGES  = 16,
    parameter [3:0]   GATE_INIT = 4'h8
) (
    input  wire [N_STAGES-1:0] c_i,
    output reg  [31:0]         tau_qu_ps_o,
    output reg  [31:0]         tau_qb_ps_o,
    output reg  signed [31:0]  delta_sigma_ps_o,
    output reg                 expected_q_o,
    output reg                 expected_init_qu_o,
    output reg                 expected_oscillates_o
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

    integer idx;
    integer sum_u, sum_b;
    reg     chain_inv_parity;
    reg     gate_init_out;
    reg     gate_inverts_when_excited;

    // Trigger recalculation whenever challenge or trigger event changes
    event recalc_ev;

    initial begin
        tau_u_ps = 50;
        tau_b_ps = 50;
        for (idx = 0; idx < N_STAGES; idx = idx + 1) begin
            phi_u_ps[idx] = 50;
            psi_u_ps[idx] = 50;
            phi_b_ps[idx] = 50;
            psi_b_ps[idx] = 50;
            mux_u_ps[idx] = 50;
            mux_b_ps[idx] = 50;
        end
    end

    always @(c_i or recalc_ev) begin
        sum_u = tau_u_ps;
        sum_b = tau_b_ps;
        for (idx = 0; idx < N_STAGES; idx = idx + 1) begin
            if (c_i[idx] == 1'b0) begin
                sum_u = sum_u + phi_u_ps[idx] + mux_u_ps[idx];
                sum_b = sum_b + phi_b_ps[idx] + mux_b_ps[idx];
            end else begin
                sum_u = sum_u + psi_u_ps[idx] + mux_u_ps[idx];
                sum_b = sum_b + psi_b_ps[idx] + mux_b_ps[idx];
            end
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
        gate_init_out    = GATE_INIT[0];
        expected_init_qu_o = gate_init_out ^ chain_inv_parity;

        // During Excitation (Excite = I0 = 1), gate output is:
        //   AND2  (4'h8): non-inverting (0), so loop oscillates when chain_inv_parity == 1
        //   NAND2 (4'h7): inverting (1),     so loop oscillates when chain_inv_parity == 0
        gate_inverts_when_excited = (GATE_INIT == 4'h7) ? 1'b1 : 1'b0;
        expected_oscillates_o     = chain_inv_parity ^ gate_inverts_when_excited;
    end

endmodule

`default_nettype wire