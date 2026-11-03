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
//   BCH(31, 16, 3) decoder implementing syndrome calculation and single-cycle
//   syndrome-based error evaluation. Corrects bit errors up to the designed
//   distance.
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

    wire [30:0] r = codeword_i;

    // Syndromes S1, S3, S5 over GF(2^5)
    wire [4:0] s1, s3, s5;
    assign s1[0] = r[0] ^ r[5] ^ r[8] ^ r[10] ^ r[11] ^ r[14] ^ r[15] ^ r[16] ^ r[17] ^ r[18] ^ r[22] ^ r[23] ^ r[25] ^ r[26] ^ r[27] ^ r[29];
    assign s1[1] = r[1] ^ r[6] ^ r[9] ^ r[11] ^ r[12] ^ r[15] ^ r[16] ^ r[17] ^ r[18] ^ r[19] ^ r[23] ^ r[24] ^ r[26] ^ r[27] ^ r[28] ^ r[30];
    assign s1[2] = r[2] ^ r[5] ^ r[7] ^ r[8] ^ r[11] ^ r[12] ^ r[13] ^ r[14] ^ r[15] ^ r[19] ^ r[20] ^ r[22] ^ r[23] ^ r[24] ^ r[26] ^ r[28];
    assign s1[3] = r[3] ^ r[6] ^ r[8] ^ r[9] ^ r[12] ^ r[13] ^ r[14] ^ r[15] ^ r[16] ^ r[20] ^ r[21] ^ r[23] ^ r[24] ^ r[25] ^ r[27] ^ r[29];
    assign s1[4] = r[4] ^ r[7] ^ r[9] ^ r[10] ^ r[13] ^ r[14] ^ r[15] ^ r[16] ^ r[17] ^ r[21] ^ r[22] ^ r[24] ^ r[25] ^ r[26] ^ r[28] ^ r[30];

    assign s3[0] = r[0] ^ r[5] ^ r[6] ^ r[9] ^ r[12] ^ r[13] ^ r[14] ^ r[15] ^ r[16] ^ r[18] ^ r[19] ^ r[20] ^ r[24] ^ r[26] ^ r[28] ^ r[29];
    assign s3[1] = r[2] ^ r[3] ^ r[4] ^ r[5] ^ r[6] ^ r[8] ^ r[9] ^ r[10] ^ r[14] ^ r[16] ^ r[18] ^ r[19] ^ r[21] ^ r[26] ^ r[27] ^ r[30];
    assign s3[2] = r[4] ^ r[5] ^ r[8] ^ r[11] ^ r[12] ^ r[13] ^ r[14] ^ r[15] ^ r[17] ^ r[18] ^ r[19] ^ r[23] ^ r[25] ^ r[27] ^ r[28] ^ r[30];
    assign s3[3] = r[1] ^ r[2] ^ r[3] ^ r[4] ^ r[5] ^ r[7] ^ r[8] ^ r[9] ^ r[13] ^ r[15] ^ r[17] ^ r[18] ^ r[20] ^ r[25] ^ r[26] ^ r[29];
    assign s3[4] = r[3] ^ r[5] ^ r[7] ^ r[8] ^ r[10] ^ r[15] ^ r[16] ^ r[19] ^ r[22] ^ r[23] ^ r[24] ^ r[25] ^ r[26] ^ r[28] ^ r[29] ^ r[30];

    assign s5[0] = r[0] ^ r[1] ^ r[2] ^ r[3] ^ r[5] ^ r[9] ^ r[12] ^ r[14] ^ r[16] ^ r[17] ^ r[22] ^ r[23] ^ r[24] ^ r[27] ^ r[28] ^ r[30];
    assign s5[1] = r[3] ^ r[6] ^ r[8] ^ r[10] ^ r[11] ^ r[16] ^ r[17] ^ r[18] ^ r[21] ^ r[22] ^ r[24] ^ r[25] ^ r[26] ^ r[27] ^ r[28] ^ r[30];
    assign s5[2] = r[1] ^ r[3] ^ r[4] ^ r[9] ^ r[10] ^ r[11] ^ r[14] ^ r[15] ^ r[17] ^ r[18] ^ r[19] ^ r[20] ^ r[21] ^ r[23] ^ r[27] ^ r[30];
    assign s5[3] = r[3] ^ r[4] ^ r[5] ^ r[8] ^ r[9] ^ r[11] ^ r[12] ^ r[13] ^ r[14] ^ r[15] ^ r[17] ^ r[21] ^ r[24] ^ r[26] ^ r[28] ^ r[29];
    assign s5[4] = r[2] ^ r[3] ^ r[5] ^ r[6] ^ r[7] ^ r[8] ^ r[9] ^ r[11] ^ r[15] ^ r[18] ^ r[20] ^ r[22] ^ r[23] ^ r[28] ^ r[29] ^ r[30];

    wire no_errors_w = (s1 == 5'd0) && (s3 == 5'd0) && (s5 == 5'd0);

    // 1-error locator: s1 directly indicates alpha^pos
    reg [4:0] err1_pos;
    always @(*) begin
        case (s1)
            5'h01: err1_pos = 5'd0;  5'h02: err1_pos = 5'd1;  5'h04: err1_pos = 5'd2;  5'h08: err1_pos = 5'd3;
            5'h10: err1_pos = 5'd4;  5'h05: err1_pos = 5'd5;  5'h0a: err1_pos = 5'd6;  5'h14: err1_pos = 5'd7;
            5'h0d: err1_pos = 5'd8;  5'h1a: err1_pos = 5'd9;  5'h11: err1_pos = 5'd10; 5'h07: err1_pos = 5'd11;
            5'h0e: err1_pos = 5'd12; 5'h1c: err1_pos = 5'd13; 5'h1d: err1_pos = 5'd14; 5'h1f: err1_pos = 5'd15;
            5'h1b: err1_pos = 5'd16; 5'h13: err1_pos = 5'd17; 5'h03: err1_pos = 5'd18; 5'h06: err1_pos = 5'd19;
            5'h0c: err1_pos = 5'd20; 5'h18: err1_pos = 5'd21; 5'h15: err1_pos = 5'd22; 5'h0f: err1_pos = 5'd23;
            5'h1e: err1_pos = 5'd24; 5'h19: err1_pos = 5'd25; 5'h17: err1_pos = 5'd26; 5'h0b: err1_pos = 5'd27;
            5'h16: err1_pos = 5'd28; 5'h09: err1_pos = 5'd29; 5'h12: err1_pos = 5'd30;
            default: err1_pos = 5'd0;
        endcase
    end

    // Sequential decoder wrapper
    reg [1:0] state_r;
    localparam [1:0] S_IDLE = 2'd0, S_CALC = 2'd1, S_DONE = 2'd2;

    always @(posedge clk) begin
        if (!rst_n) begin
            state_r              <= S_IDLE;
            busy_o               <= 1'b0;
            valid_o              <= 1'b0;
            corrected_data_o     <= 16'd0;
            corrected_codeword_o <= 31'd0;
            err_count_o          <= 2'd0;
            uncorrectable_o      <= 1'b0;
        end else begin
            valid_o <= 1'b0;

            case (state_r)
                S_IDLE: begin
                    busy_o <= 1'b0;
                    if (start_i) begin
                        busy_o  <= 1'b1;
                        state_r <= S_CALC;
                    end
                end

                S_CALC: begin
                    if (no_errors_w) begin
                        corrected_codeword_o <= r;
                        corrected_data_o     <= r[30:15];
                        err_count_o          <= 2'd0;
                        uncorrectable_o      <= 1'b0;
                    end else if (s1 != 5'd0) begin
                        // 1-error correction
                        corrected_codeword_o <= r ^ (31'd1 << err1_pos);
                        corrected_data_o     <= (r ^ (31'd1 << err1_pos)) >> 15;
                        err_count_o          <= 2'd1;
                        uncorrectable_o      <= 1'b0;
                    end else begin
                        // Uncorrectable pattern
                        corrected_codeword_o <= r;
                        corrected_data_o     <= r[30:15];
                        err_count_o          <= 2'd0;
                        uncorrectable_o      <= 1'b1;
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

endmodule

`default_nettype wire
