`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Testbench: bch_tb
// Description:
//   Verification testbench for BCH(31, 16, 3) encoder and decoder modules.
//   Validates systematic encoding, zero-error decoding, and 1-bit error correction.
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
        $display("Starting BCH(31, 16, 3) Verification Testbench");
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
        $display("[TB] Test 1 Result: corrected_data = 0x%04h, err_count = %0d, uncorr = %b",
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
        $display("[TB] Test 2 Result: corrected_data = 0x%04h, err_count = %0d, uncorr = %b",
                 corrected_data, err_count, uncorrectable);
        if (corrected_data != 16'h1234 || err_count != 1 || uncorrectable) begin
            $display("[ERROR] Test 2 failed to correct 1-bit error!");
            $fatal(1);
        end

        #20;

        // Test 3: 1-bit error injection in message bit 20 (data_in bit 5)
        $display("[TB] Test 3: Injecting 1-bit error in message bit position 20...");
        rx_codeword = codeword_out ^ (31'd1 << 20);
        start_i     = 1'b1;
        #10;
        start_i     = 1'b0;
        @(posedge valid_out);
        $display("[TB] Test 3 Result: corrected_data = 0x%04h, err_count = %0d, uncorr = %b",
                 corrected_data, err_count, uncorrectable);
        if (corrected_data != 16'h1234 || err_count != 1 || uncorrectable) begin
            $display("[ERROR] Test 3 failed to correct message error!");
            $fatal(1);
        end

        $display("===============================================================");
        $display("ALL BCH(31, 16, 3) TESTS PASSED SUCCESSFULLY!");
        $display("===============================================================");
        $finish;
    end

endmodule

`default_nettype wire
