`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Testbench: bch_tb
// Description:
//   Verification testbench for BCH(31, 16, 3) encoder and decoder modules.
//   Validates systematic encoding and error correction for:
//     - 0 bit errors
//     - 1 bit error
//     - 2 bit errors
//     - 3 bit errors (full capability per paper Section 4.1)
//==============================================================================
module bch_tb;

    reg         clk;
    reg         rst_n;
    reg         start_i;
    reg  [15:0] data_in;
    wire [14:0] parity_out;
    wire [30:0] codeword_out;

    reg  [30:0] rx_codeword;
    wire [15:0] corrected_data;
    /* verilator lint_off UNUSEDSIGNAL */
    wire [30:0] corrected_codeword;
    wire        busy_out;
    /* verilator lint_on UNUSEDSIGNAL */
    wire [1:0]  err_count;
    wire        uncorrectable;
    wire        valid_out;

    // BCH Encoder
    bch_encoder_31_16_3 u_enc (
        .data_i    (data_in),
        .parity_o  (parity_out),
        .codeword_o(codeword_out)
    );

    // BCH Decoder
    bch_decoder_31_16_3 u_dec (
        .clk                 (clk),
        .rst_n               (rst_n),
        .start_i             (start_i),
        .codeword_i          (rx_codeword),
        .corrected_data_o    (corrected_data),
        .corrected_codeword_o(corrected_codeword),
        .err_count_o         (err_count),
        .uncorrectable_o     (uncorrectable),
        .valid_o             (valid_out),
        .busy_o              (busy_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk         = 1'b0;
        rst_n       = 1'b0;
        start_i     = 1'b0;
        data_in     = 16'h0000;
        rx_codeword = 31'd0;

        $display("===============================================================");
        $display("Starting BCH(31, 16, 3) Full Verification Testbench (t <= 3)");
        $display("===============================================================");

        #20;
        rst_n = 1'b1;
        #10;

        // Test 1: Clean codeword (0 bit errors)
        data_in = 16'h1234;
        #5;
        $display("[TB] Test 1: Encode data = 0x%04h -> Parity = 0x%04h, CW = 0x%08h",
                 data_in, parity_out, codeword_out);
        rx_codeword = codeword_out;
        start_i     = 1'b1;
        #10;
        start_i     = 1'b0;
        @(posedge valid_out);
        $display("[TB] Test 1 Result (0 errors): corrected_data = 0x%04h, err_count = %0d, uncorr = %b",
                 corrected_data, err_count, uncorrectable);
        if (corrected_data != 16'h1234 || err_count != 0 || uncorrectable) begin
            $display("[ERROR] Test 1 failed!");
            $fatal(1);
        end

        #20;

        // Test 2: 1-bit error injection at bit 7
        $display("[TB] Test 2: Injecting 1-bit error at bit position 7...");
        rx_codeword = codeword_out ^ (31'd1 << 7);
        start_i     = 1'b1;
        #10;
        start_i     = 1'b0;
        @(posedge valid_out);
        $display("[TB] Test 2 Result (1 error):  corrected_data = 0x%04h, err_count = %0d, uncorr = %b",
                 corrected_data, err_count, uncorrectable);
        if (corrected_data != 16'h1234 || err_count != 1 || uncorrectable) begin
            $display("[ERROR] Test 2 failed to correct 1-bit error!");
            $fatal(1);
        end

        #20;

        // Test 3: 2-bit error injection at bits 3 and 19
        $display("[TB] Test 3: Injecting 2-bit errors at bit positions 3 and 19...");
        rx_codeword = codeword_out ^ (31'd1 << 3) ^ (31'd1 << 19);
        start_i     = 1'b1;
        #10;
        start_i     = 1'b0;
        @(posedge valid_out);
        $display("[TB] Test 3 Result (2 errors): corrected_data = 0x%04h, err_count = %0d, uncorr = %b",
                 corrected_data, err_count, uncorrectable);
        if (corrected_data != 16'h1234 || err_count != 2 || uncorrectable) begin
            $display("[ERROR] Test 3 failed to correct 2-bit error!");
            $fatal(1);
        end

        #20;

        // Test 4: 3-bit error injection at bits 1, 14, and 29
        $display("[TB] Test 4: Injecting 3-bit errors at bit positions 1, 14, and 29...");
        rx_codeword = codeword_out ^ (31'd1 << 1) ^ (31'd1 << 14) ^ (31'd1 << 29);
        start_i     = 1'b1;
        #10;
        start_i     = 1'b0;
        @(posedge valid_out);
        $display("[TB] Test 4 Result (3 errors): corrected_data = 0x%04h, err_count = %0d, uncorr = %b",
                 corrected_data, err_count, uncorrectable);
        if (corrected_data != 16'h1234 || err_count != 3 || uncorrectable) begin
            $display("[ERROR] Test 4 failed to correct 3-bit error!");
            $fatal(1);
        end

        $display("===============================================================");
        $display("ALL BCH(31, 16, 3) TESTS PASSED (0, 1, 2, 3 ERRORS CORRECTED)!");
        $display("===============================================================");
        $finish;
    end

endmodule

`default_nettype wire
