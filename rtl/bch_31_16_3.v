`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: bch_encoder_31_16_3
// Description:
//   Combinational BCH(31, 16, 3) systematic encoder per paper Section 4.1:
//   "an error correction algorithm based on the BCH code is adopted and used to
//    solve the bit-error problem of PUF response. In this article, the BCH code
//    is characterized as (31, 16, 3) and 3-bit errors can be corrected from
//    the 16-bit response."
//
//   Generator polynomial:
//     g(x) = x^15 + x^11 + x^10 + x^9 + x^8 + x^7 + x^5 + x^3 + x^2 + x + 1
//     Hex: 0x8FAF
//==============================================================================
module bch_encoder_31_16_3 (
    input  wire [15:0] data_i,       // 16-bit PUF response segment
    output wire [14:0] parity_o,     // 15-bit helper parity
    output wire [30:0] codeword_o    // 31-bit systematic codeword: {data_i, parity_o}
);

    // Combinational parity generation via generator parity matrix
    assign parity_o[0]  = data_i[0] ^ data_i[4] ^ data_i[5] ^ data_i[6] ^ data_i[7] ^ data_i[11] ^ data_i[12] ^ data_i[15];
    assign parity_o[1]  = data_i[0] ^ data_i[1] ^ data_i[4] ^ data_i[6] ^ data_i[8] ^ data_i[11] ^ data_i[12] ^ data_i[13] ^ data_i[15];
    assign parity_o[2]  = data_i[0] ^ data_i[1] ^ data_i[2] ^ data_i[4] ^ data_i[7] ^ data_i[9] ^ data_i[11] ^ data_i[12] ^ data_i[13] ^ data_i[14] ^ data_i[15];
    assign parity_o[3]  = data_i[0] ^ data_i[1] ^ data_i[2] ^ data_i[3] ^ data_i[5] ^ data_i[8] ^ data_i[10] ^ data_i[12] ^ data_i[13] ^ data_i[14];
    assign parity_o[4]  = data_i[1] ^ data_i[2] ^ data_i[3] ^ data_i[4] ^ data_i[6] ^ data_i[9] ^ data_i[11] ^ data_i[13] ^ data_i[14] ^ data_i[15];
    assign parity_o[5]  = data_i[2] ^ data_i[3] ^ data_i[4] ^ data_i[5] ^ data_i[7] ^ data_i[10] ^ data_i[12] ^ data_i[14] ^ data_i[15];
    assign parity_o[6]  = data_i[3] ^ data_i[4] ^ data_i[5] ^ data_i[6] ^ data_i[8] ^ data_i[11] ^ data_i[13] ^ data_i[15];
    assign parity_o[7]  = data_i[0] ^ data_i[1] ^ data_i[2] ^ data_i[3] ^ data_i[5] ^ data_i[6] ^ data_i[8] ^ data_i[9] ^ data_i[11] ^ data_i[14] ^ data_i[15];
    assign parity_o[8]  = data_i[1] ^ data_i[2] ^ data_i[3] ^ data_i[4] ^ data_i[6] ^ data_i[7] ^ data_i[9] ^ data_i[10] ^ data_i[12] ^ data_i[15];
    assign parity_o[9]  = data_i[0] ^ data_i[2] ^ data_i[3] ^ data_i[4] ^ data_i[5] ^ data_i[7] ^ data_i[8] ^ data_i[10] ^ data_i[11] ^ data_i[13];
    assign parity_o[10] = data_i[1] ^ data_i[3] ^ data_i[4] ^ data_i[5] ^ data_i[6] ^ data_i[8] ^ data_i[9] ^ data_i[11] ^ data_i[12] ^ data_i[14];
    assign parity_o[11] = data_i[0] ^ data_i[2] ^ data_i[4] ^ data_i[5] ^ data_i[6] ^ data_i[7] ^ data_i[9] ^ data_i[10] ^ data_i[12] ^ data_i[13] ^ data_i[15];
    assign parity_o[12] = data_i[1] ^ data_i[3] ^ data_i[5] ^ data_i[6] ^ data_i[7] ^ data_i[8] ^ data_i[10] ^ data_i[11] ^ data_i[13] ^ data_i[14];
    assign parity_o[13] = data_i[2] ^ data_i[4] ^ data_i[6] ^ data_i[7] ^ data_i[8] ^ data_i[9] ^ data_i[11] ^ data_i[12] ^ data_i[14] ^ data_i[15];
    assign parity_o[14] = data_i[3] ^ data_i[5] ^ data_i[7] ^ data_i[8] ^ data_i[9] ^ data_i[10] ^ data_i[12] ^ data_i[13] ^ data_i[15];

    assign codeword_o = {data_i, parity_o};

endmodule

//==============================================================================
// Module: bch_decoder_31_16_3
// Description:
//   Complete BCH(31, 16, 3) decoder implementing:
//     1. Parallel Syndrome Generation (S1..S6 over GF(2^5))
//     2. 6-cycle Berlekamp-Massey Algorithm (error-locator polynomial of degree <= 3)
//     3. Parallel Chien Search correcting up to 3 bit errors anywhere in 31 bits
//==============================================================================
module bch_decoder_31_16_3 (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        start_i,
    input  wire [30:0] codeword_i,
    output reg  [15:0] corrected_data_o,
    output reg  [30:0] corrected_codeword_o,
    output reg  [1:0]  err_count_o,
    output reg         uncorrectable_o,
    output reg         valid_o,
    output reg         busy_o
);

    // GF(2^5) Multiplier function with primitive p(x) = x^5 + x^2 + 1
    function [4:0] gf_mul;
        input [4:0] a, b;
        reg [4:0] p;
        reg [4:0] a_cur;
        integer k;
        begin
            p = 5'd0;
            a_cur = a;
            for (k = 0; k < 5; k = k + 1) begin
                if (b[k])
                    p = p ^ a_cur;
                if (a_cur[4])
                    a_cur = (a_cur << 1) ^ 5'h05;
                else
                    a_cur = a_cur << 1;
            end
            gf_mul = p;
        end
    endfunction

    // GF(2^5) Inversion Lookup
    function [4:0] gf_inv;
        input [4:0] a;
        case (a)
            5'h00: gf_inv = 5'h00; 5'h01: gf_inv = 5'h01; 5'h02: gf_inv = 5'h12; 5'h03: gf_inv = 5'h1c;
            5'h04: gf_inv = 5'h09; 5'h05: gf_inv = 5'h17; 5'h06: gf_inv = 5'h0e; 5'h07: gf_inv = 5'h0c;
            5'h08: gf_inv = 5'h16; 5'h09: gf_inv = 5'h04; 5'h0a: gf_inv = 5'h19; 5'h0b: gf_inv = 5'h10;
            5'h0c: gf_inv = 5'h07; 5'h0d: gf_inv = 5'h0f; 5'h0e: gf_inv = 5'h06; 5'h0f: gf_inv = 5'h0d;
            5'h10: gf_inv = 5'h0b; 5'h11: gf_inv = 5'h18; 5'h12: gf_inv = 5'h02; 5'h13: gf_inv = 5'h1d;
            5'h14: gf_inv = 5'h1e; 5'h15: gf_inv = 5'h1a; 5'h16: gf_inv = 5'h08; 5'h17: gf_inv = 5'h05;
            5'h18: gf_inv = 5'h11; 5'h19: gf_inv = 5'h0a; 5'h1a: gf_inv = 5'h15; 5'h1b: gf_inv = 5'h1f;
            5'h1c: gf_inv = 5'h03; 5'h1d: gf_inv = 5'h13; 5'h1e: gf_inv = 5'h14; 5'h1f: gf_inv = 5'h1b;
            default: gf_inv = 5'h00;
        endcase
    endfunction

    // Alpha^-i powers for Chien search: alpha^(31-i), alpha^(2*(31-i)), alpha^(3*(31-i))
    function [4:0] get_ai1;
        input [4:0] idx;
        case (idx)
            5'd0:  get_ai1 = 5'h01; 5'd1:  get_ai1 = 5'h12; 5'd2:  get_ai1 = 5'h09; 5'd3:  get_ai1 = 5'h16;
            5'd4:  get_ai1 = 5'h0b; 5'd5:  get_ai1 = 5'h17; 5'd6:  get_ai1 = 5'h19; 5'd7:  get_ai1 = 5'h1e;
            5'd8:  get_ai1 = 5'h0f; 5'd9:  get_ai1 = 5'h15; 5'd10: get_ai1 = 5'h18; 5'd11: get_ai1 = 5'h0c;
            5'd12: get_ai1 = 5'h06; 5'd13: get_ai1 = 5'h03; 5'd14: get_ai1 = 5'h13; 5'd15: get_ai1 = 5'h1b;
            5'd16: get_ai1 = 5'h1f; 5'd17: get_ai1 = 5'h1d; 5'd18: get_ai1 = 5'h1c; 5'd19: get_ai1 = 5'h0e;
            5'd20: get_ai1 = 5'h07; 5'd21: get_ai1 = 5'h11; 5'd22: get_ai1 = 5'h1a; 5'd23: get_ai1 = 5'h0d;
            5'd24: get_ai1 = 5'h14; 5'd25: get_ai1 = 5'h0a; 5'd26: get_ai1 = 5'h05; 5'd27: get_ai1 = 5'h10;
            5'd28: get_ai1 = 5'h08; 5'd29: get_ai1 = 5'h04; 5'd30: get_ai1 = 5'h02;
            default: get_ai1 = 5'h00;
        endcase
    endfunction

    // FSM States
    localparam [2:0]
        S_IDLE     = 3'd0,
        S_SYNDROME = 3'd1,
        S_BM_INIT  = 3'd2,
        S_BM_STEP  = 3'd3,
        S_CHIEN    = 3'd4,
        S_DONE     = 3'd5;

    reg [2:0]  state_r;
    reg [30:0] r_reg;
    reg [4:0]  s [1:6];

    // Berlekamp-Massey registers
    reg [4:0]  C [0:3];
    reg [4:0]  B [0:3];
    reg [2:0]  L_r;
    reg [4:0]  b_r;
    reg [2:0]  m_r;
    reg [2:0]  n_r;

    // Chien search registers
    reg [30:0] err_mask_r;
    reg [2:0]  roots_found_r;

    // Syndromes S1, S3, S5 combinational computation
    wire [4:0] s1_w, s3_w, s5_w;
    assign s1_w[0] = r_reg[0] ^ r_reg[5] ^ r_reg[8] ^ r_reg[10] ^ r_reg[11] ^ r_reg[14] ^ r_reg[15] ^ r_reg[16] ^ r_reg[17] ^ r_reg[18] ^ r_reg[22] ^ r_reg[23] ^ r_reg[25] ^ r_reg[26] ^ r_reg[27] ^ r_reg[29];
    assign s1_w[1] = r_reg[1] ^ r_reg[6] ^ r_reg[9] ^ r_reg[11] ^ r_reg[12] ^ r_reg[15] ^ r_reg[16] ^ r_reg[17] ^ r_reg[18] ^ r_reg[19] ^ r_reg[23] ^ r_reg[24] ^ r_reg[26] ^ r_reg[27] ^ r_reg[28] ^ r_reg[30];
    assign s1_w[2] = r_reg[2] ^ r_reg[5] ^ r_reg[7] ^ r_reg[8] ^ r_reg[11] ^ r_reg[12] ^ r_reg[13] ^ r_reg[14] ^ r_reg[15] ^ r_reg[19] ^ r_reg[20] ^ r_reg[22] ^ r_reg[23] ^ r_reg[24] ^ r_reg[26] ^ r_reg[28];
    assign s1_w[3] = r_reg[3] ^ r_reg[6] ^ r_reg[8] ^ r_reg[9] ^ r_reg[12] ^ r_reg[13] ^ r_reg[14] ^ r_reg[15] ^ r_reg[16] ^ r_reg[20] ^ r_reg[21] ^ r_reg[23] ^ r_reg[24] ^ r_reg[25] ^ r_reg[27] ^ r_reg[29];
    assign s1_w[4] = r_reg[4] ^ r_reg[7] ^ r_reg[9] ^ r_reg[10] ^ r_reg[13] ^ r_reg[14] ^ r_reg[15] ^ r_reg[16] ^ r_reg[17] ^ r_reg[21] ^ r_reg[22] ^ r_reg[24] ^ r_reg[25] ^ r_reg[26] ^ r_reg[28] ^ r_reg[30];

    assign s3_w[0] = r_reg[0] ^ r_reg[5] ^ r_reg[6] ^ r_reg[9] ^ r_reg[12] ^ r_reg[13] ^ r_reg[14] ^ r_reg[15] ^ r_reg[16] ^ r_reg[18] ^ r_reg[19] ^ r_reg[20] ^ r_reg[24] ^ r_reg[26] ^ r_reg[28] ^ r_reg[29];
    assign s3_w[1] = r_reg[2] ^ r_reg[3] ^ r_reg[4] ^ r_reg[5] ^ r_reg[6] ^ r_reg[8] ^ r_reg[9] ^ r_reg[10] ^ r_reg[14] ^ r_reg[16] ^ r_reg[18] ^ r_reg[19] ^ r_reg[21] ^ r_reg[26] ^ r_reg[27] ^ r_reg[30];
    assign s3_w[2] = r_reg[4] ^ r_reg[5] ^ r_reg[8] ^ r_reg[11] ^ r_reg[12] ^ r_reg[13] ^ r_reg[14] ^ r_reg[15] ^ r_reg[17] ^ r_reg[18] ^ r_reg[19] ^ r_reg[23] ^ r_reg[25] ^ r_reg[27] ^ r_reg[28] ^ r_reg[30];
    assign s3_w[3] = r_reg[1] ^ r_reg[2] ^ r_reg[3] ^ r_reg[4] ^ r_reg[5] ^ r_reg[7] ^ r_reg[8] ^ r_reg[9] ^ r_reg[13] ^ r_reg[15] ^ r_reg[17] ^ r_reg[18] ^ r_reg[20] ^ r_reg[25] ^ r_reg[26] ^ r_reg[29];
    assign s3_w[4] = r_reg[3] ^ r_reg[5] ^ r_reg[7] ^ r_reg[8] ^ r_reg[10] ^ r_reg[15] ^ r_reg[16] ^ r_reg[19] ^ r_reg[22] ^ r_reg[23] ^ r_reg[24] ^ r_reg[25] ^ r_reg[26] ^ r_reg[28] ^ r_reg[29] ^ r_reg[30];

    assign s5_w[0] = r_reg[0] ^ r_reg[1] ^ r_reg[2] ^ r_reg[3] ^ r_reg[5] ^ r_reg[9] ^ r_reg[12] ^ r_reg[14] ^ r_reg[16] ^ r_reg[17] ^ r_reg[22] ^ r_reg[23] ^ r_reg[24] ^ r_reg[27] ^ r_reg[28] ^ r_reg[30];
    assign s5_w[1] = r_reg[3] ^ r_reg[6] ^ r_reg[8] ^ r_reg[10] ^ r_reg[11] ^ r_reg[16] ^ r_reg[17] ^ r_reg[18] ^ r_reg[21] ^ r_reg[22] ^ r_reg[24] ^ r_reg[25] ^ r_reg[26] ^ r_reg[27] ^ r_reg[28] ^ r_reg[30];
    assign s5_w[2] = r_reg[1] ^ r_reg[3] ^ r_reg[4] ^ r_reg[9] ^ r_reg[10] ^ r_reg[11] ^ r_reg[14] ^ r_reg[15] ^ r_reg[17] ^ r_reg[18] ^ r_reg[19] ^ r_reg[20] ^ r_reg[21] ^ r_reg[23] ^ r_reg[27] ^ r_reg[30];
    assign s5_w[3] = r_reg[3] ^ r_reg[4] ^ r_reg[5] ^ r_reg[8] ^ r_reg[9] ^ r_reg[11] ^ r_reg[12] ^ r_reg[13] ^ r_reg[14] ^ r_reg[15] ^ r_reg[17] ^ r_reg[21] ^ r_reg[24] ^ r_reg[26] ^ r_reg[28] ^ r_reg[29];
    assign s5_w[4] = r_reg[2] ^ r_reg[3] ^ r_reg[5] ^ r_reg[6] ^ r_reg[7] ^ r_reg[8] ^ r_reg[9] ^ r_reg[11] ^ r_reg[15] ^ r_reg[18] ^ r_reg[20] ^ r_reg[22] ^ r_reg[23] ^ r_reg[28] ^ r_reg[29] ^ r_reg[30];

    // BM Discrepancy calculation for current step n_r
    reg [4:0] d_val;
    reg [4:0] term1, term2, term3;
    reg [4:0] scale_val;
    reg [4:0] C_old [0:3];
    integer idx;

    // Chien search temporary variables
    reg [4:0] chien_ai1, chien_ai2, chien_ai3, chien_eval;

    /* verilator lint_off BLKSEQ */
    always @(posedge clk) begin
        if (!rst_n) begin
            state_r              <= S_IDLE;
            busy_o               <= 1'b0;
            valid_o              <= 1'b0;
            uncorrectable_o      <= 1'b0;
            err_count_o          <= 2'd0;
            corrected_data_o     <= 16'd0;
            corrected_codeword_o <= 31'd0;
            r_reg                <= 31'd0;
            L_r                  <= 3'd0;
            b_r                  <= 5'd1;
            m_r                  <= 3'd1;
            n_r                  <= 3'd0;
            err_mask_r           <= 31'd0;
            roots_found_r        <= 3'd0;
            for (idx = 0; idx < 4; idx = idx + 1) begin
                C[idx] <= 5'd0;
                B[idx] <= 5'd0;
            end
        end else begin
            valid_o <= 1'b0;

            case (state_r)
                S_IDLE: begin
                    busy_o <= 1'b0;
                    if (start_i) begin
                        busy_o  <= 1'b1;
                        r_reg   <= codeword_i;
                        state_r <= S_SYNDROME;
                    end
                end

                S_SYNDROME: begin
                    s[1] <= s1_w;
                    s[2] <= gf_mul(s1_w, s1_w);
                    s[3] <= s3_w;
                    s[4] <= gf_mul(gf_mul(s1_w, s1_w), gf_mul(s1_w, s1_w));
                    s[5] <= s5_w;
                    s[6] <= gf_mul(s3_w, s3_w);

                    if (s1_w == 5'd0 && s3_w == 5'd0 && s5_w == 5'd0) begin
                        // 0 errors
                        corrected_codeword_o <= r_reg;
                        corrected_data_o     <= r_reg[30:15];
                        err_count_o          <= 2'd0;
                        uncorrectable_o      <= 1'b0;
                        state_r              <= S_DONE;
                    end else begin
                        state_r <= S_BM_INIT;
                    end
                end

                S_BM_INIT: begin
                    C[0]    <= 5'd1; C[1] <= 5'd0; C[2] <= 5'd0; C[3] <= 5'd0;
                    B[0]    <= 5'd1; B[1] <= 5'd0; B[2] <= 5'd0; B[3] <= 5'd0;
                    L_r     <= 3'd0;
                    b_r     <= 5'd1;
                    m_r     <= 3'd1;
                    n_r     <= 3'd0;
                    state_r <= S_BM_STEP;
                end

                S_BM_STEP: begin
                    // Compute discrepancy d = s[n_r+1] ^ sum(C[i]*s[n_r+1-i])
                    term1 = (1 <= L_r && (n_r + 1 - 1) >= 1) ? gf_mul(C[1], s[n_r + 1 - 1]) : 5'd0;
                    term2 = (2 <= L_r && (n_r + 1 - 2) >= 1) ? gf_mul(C[2], s[n_r + 1 - 2]) : 5'd0;
                    term3 = (3 <= L_r && (n_r + 1 - 3) >= 1) ? gf_mul(C[3], s[n_r + 1 - 3]) : 5'd0;
                    d_val = s[n_r + 1] ^ term1 ^ term2 ^ term3;

                    if (d_val == 5'd0) begin
                        m_r <= m_r + 3'd1;
                    end else begin
                        scale_val = gf_mul(d_val, gf_inv(b_r));
                        C_old[0] = C[0]; C_old[1] = C[1]; C_old[2] = C[2]; C_old[3] = C[3];

                        if (0 >= m_r) C[0] <= C[0] ^ gf_mul(scale_val, B[0 - m_r]);
                        if (1 >= m_r) C[1] <= C[1] ^ gf_mul(scale_val, B[1 - m_r]);
                        if (2 >= m_r) C[2] <= C[2] ^ gf_mul(scale_val, B[2 - m_r]);
                        if (3 >= m_r) C[3] <= C[3] ^ gf_mul(scale_val, B[3 - m_r]);

                        if ({1'b0, L_r} * 2 <= {1'b0, n_r}) begin
                            L_r <= {1'b0, n_r} + 3'd1 - L_r;
                            B[0] <= C_old[0]; B[1] <= C_old[1]; B[2] <= C_old[2]; B[3] <= C_old[3];
                            b_r <= d_val;
                            m_r <= 3'd1;
                        end else begin
                            m_r <= m_r + 3'd1;
                        end
                    end

                    if (n_r == 3'd5) begin
                        state_r <= S_CHIEN;
                    end else begin
                        n_r <= n_r + 3'd1;
                    end
                end

                S_CHIEN: begin
                    // Parallel Chien search over all 31 positions
                    if (L_r > 3'd3 || L_r == 3'd0) begin
                        uncorrectable_o      <= (L_r > 3'd3);
                        corrected_codeword_o <= r_reg;
                        corrected_data_o     <= r_reg[30:15];
                        err_count_o          <= 2'd0;
                    end else begin
                        // Evaluate 31 roots
                        err_mask_r    <= 31'd0;
                        roots_found_r <= 3'd0;
                        for (idx = 0; idx < 31; idx = idx + 1) begin
                            chien_ai1 = get_ai1(idx[4:0]);
                            chien_ai2 = gf_mul(chien_ai1, chien_ai1);
                            chien_ai3 = gf_mul(chien_ai2, chien_ai1);
                            chien_eval = 5'd1 ^ gf_mul(C[1], chien_ai1) ^ gf_mul(C[2], chien_ai2) ^ gf_mul(C[3], chien_ai3);
                            if (chien_eval == 5'd0) begin
                                err_mask_r[idx] <= 1'b1;
                                roots_found_r   <= roots_found_r + 3'd1;
                            end
                        end

                        if (roots_found_r == L_r) begin
                            corrected_codeword_o <= r_reg ^ err_mask_r;
                            corrected_data_o     <= (r_reg ^ err_mask_r) >> 15;
                            err_count_o          <= L_r[1:0];
                            uncorrectable_o      <= 1'b0;
                        end else begin
                            // Roots found did not match locator polynomial degree
                            uncorrectable_o      <= 1'b1;
                            corrected_codeword_o <= r_reg;
                            corrected_data_o     <= r_reg[30:15];
                            err_count_o          <= 2'd0;
                        end
                    end
                    state_r <= S_DONE;
                end

                S_DONE: begin
                    valid_o <= 1'b1;
                    busy_o  <= 1'b0;
                    state_r <= S_IDLE;
                end

                default: state_r <= S_IDLE;
            endcase
        end
    end
    /* verilator lint_on BLKSEQ */

endmodule

`default_nettype wire
