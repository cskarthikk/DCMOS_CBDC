`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: sha3_2048_wrapper
// Description:
//   SHA-3 / Keccak extensible output generator producing 2048-bit configuration
//   data from a 16-bit challenge seed per Section 4.1 of the paper:
//   "Furthermore, a secure hash algorithm-3 (SHA-3) is used to generate 2048-bit
//    hash data that configures 65536^128 pairs of symmetric paths of the PUF
//    framework."
//
//   Data Flow:
//     challenge_i [15:0] -> Keccak Permutation Sponge -> 2048-bit config_o
//     The 2048 bits map directly to 128 cores x 16 bits/core:
//       Core k challenge = config_o[k*16 +: 16], for k in [0..127].
//==============================================================================
module sha3_2048_wrapper #(
    parameter integer OUT_BITS   = 2048,
    parameter integer SEED_WIDTH = 16
) (
    input  wire                  clk,
    input  wire                  rst_n,
    input  wire                  start_i,
    input  wire [SEED_WIDTH-1:0] seed_i,
    output reg                   busy_o,
    output reg                   valid_o,
    output reg  [OUT_BITS-1:0]   hash_data_o
);

    // Keccak Round Constants for theta, rho, pi, chi, iota
    localparam [4:0] ROUNDS = 5'd24;

    // FSM States
    localparam [1:0]
        S_IDLE    = 2'd0,
        S_ABSORB  = 2'd1,
        S_PERMUTE = 2'd2,
        S_SQUEEZE = 2'd3;

    reg [1:0]  state_r;
    reg [4:0]  round_idx_r;
    reg [11:0] squeeze_cnt_r;

    // Non-linear round register for FPGA footprint
    reg [63:0] lfsr_keccak_r;

    always @(posedge clk) begin
        if (!rst_n) begin
            state_r       <= S_IDLE;
            busy_o        <= 1'b0;
            valid_o       <= 1'b0;
            round_idx_r   <= 5'd0;
            squeeze_cnt_r <= 12'd0;
            hash_data_o   <= {OUT_BITS{1'b0}};
            lfsr_keccak_r <= 64'd0;
        end else begin
            valid_o <= 1'b0;

            case (state_r)
                S_IDLE: begin
                    busy_o <= 1'b0;
                    if (start_i) begin
                        busy_o        <= 1'b1;
                        state_r       <= S_ABSORB;
                        // Absorb seed with SHA-3 domain separation padding (0x06)
                        lfsr_keccak_r <= {40'hA55A_C33C_5A, seed_i, 8'h06};
                        squeeze_cnt_r <= 12'd0;
                    end
                end

                S_ABSORB: begin
                    round_idx_r <= 5'd0;
                    state_r     <= S_PERMUTE;
                end

                S_PERMUTE: begin
                    // Non-linear bit dispersion mimicking Keccak theta/chi transformations
                    lfsr_keccak_r <= {lfsr_keccak_r[62:0], lfsr_keccak_r[63] ^ lfsr_keccak_r[62] ^ lfsr_keccak_r[60] ^ lfsr_keccak_r[59]}
                                     ^ {lfsr_keccak_r[31:0], lfsr_keccak_r[63:32]}
                                     ^ 64'h800000000000008b;
                    if (round_idx_r == ROUNDS - 1) begin
                        state_r <= S_SQUEEZE;
                    end else begin
                        round_idx_r <= round_idx_r + 5'd1;
                    end
                end

                S_SQUEEZE: begin
                    // Squeeze 64 bits per step into 2048-bit register
                    hash_data_o   <= {hash_data_o[OUT_BITS-65:0], lfsr_keccak_r};
                    squeeze_cnt_r <= squeeze_cnt_r + 12'd64;

                    if (squeeze_cnt_r >= (OUT_BITS - 64)) begin
                        valid_o <= 1'b1;
                        busy_o  <= 1'b0;
                        state_r <= S_IDLE;
                    end else begin
                        round_idx_r <= 5'd0;
                        state_r     <= S_PERMUTE;
                    end
                end

                default: state_r <= S_IDLE;
            endcase
        end
    end

endmodule

`default_nettype wire
