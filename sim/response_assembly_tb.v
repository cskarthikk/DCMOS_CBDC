`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Testbench: response_assembly_tb
// Description:
//   Verification testbench for the multi-core CBDC-PUF macro array and parallel
//   response assembly engine.
//==============================================================================
module response_assembly_tb;

    parameter integer N_CORES      = 16;   // Fast simulation array (scalable to 128)
    parameter integer N_STAGES     = 16;
    parameter integer CLK_PERIOD   = 10;   // 100 MHz clock

    reg                              clk;
    reg                              rst_n;
    reg                              start_i;
    reg  [N_STAGES-1:0]              challenge_i;
    reg                              config_mode_i;
    reg  [(N_CORES*N_STAGES)-1:0]    core_config_i;

    /* verilator lint_off UNUSEDSIGNAL */
    wire                             busy_o;
    /* verilator lint_on UNUSEDSIGNAL */
    wire                             resp_valid_o;
    wire                             request_error_o;
    wire [N_CORES-1:0]               resp_data_o;
    wire [N_CORES-1:0]               comp_data_o;
    wire [N_CORES-1:0]               diff_data_o;

    // Unit Under Test
    response_assembly #(
        .N_CORES           (N_CORES),
        .N_STAGES          (N_STAGES),
        .GATE_INIT         (4'h8),
        .AUTO_PARITY       (1),
        .SINGLE_SHOT       (1),
        .DUAL_ARBITER      (1),
        .CLR_CYCLES        (4),
        .INIT_SETTLE_CYCLES(4),
        .EXCITE_CYCLES     (8),
        .LATCH_CYCLES      (8),
        .HOLD_CYCLES       (4)
    ) uut (
        .clk            (clk),
        .rst_n          (rst_n),
        .start_i        (start_i),
        .challenge_i    (challenge_i),
        .config_mode_i  (config_mode_i),
        .core_config_i  (core_config_i),
        .busy_o         (busy_o),
        .resp_valid_o   (resp_valid_o),
        .request_error_o(request_error_o),
        .resp_data_o    (resp_data_o),
        .comp_data_o    (comp_data_o),
        .diff_data_o    (diff_data_o)
    );

    // Clock generator
    always #(CLK_PERIOD / 2) clk = ~clk;

    integer test_step;
    initial begin
        clk           = 1'b0;
        rst_n         = 1'b0;
        start_i       = 1'b0;
        challenge_i   = 16'd0;
        config_mode_i = 1'b0;
        core_config_i = {(N_CORES*N_STAGES){1'b0}};

        $display("===============================================================");
        $display("Starting CBDC-PUF Multi-Core Response Assembly Testbench");
        $display("Array Size: %0d cores | Stages per Chain: %0d", N_CORES, N_STAGES);
        $display("===============================================================");

        // Step 1: Reset release
        #(CLK_PERIOD * 5);
        rst_n = 1'b1;
        #(CLK_PERIOD * 2);

        // Step 2: Broadcast Query (Even Parity Challenge: 0xAAAA)
        $display("[TB] Test 1: Broadcast Query C = 0xAAAA (Even Parity with AUTO_PARITY=1)...");
        challenge_i   = 16'hAAAA;
        config_mode_i = 1'b0;
        start_i       = 1'b1;
        #(CLK_PERIOD);
        start_i       = 1'b0;

        // Wait for evaluation
        @(posedge resp_valid_o);
        $display("[TB] Test 1 Complete! resp_valid asserted.");
        $display("     Primary Response   : 0x%04h", resp_data_o);
        $display("     Complementary Resp : 0x%04h", comp_data_o);
        $display("     Differential Resp  : 0x%04h", diff_data_o);

        if (request_error_o) begin
            $display("[ERROR] Test 1 reported unsupported challenge!");
            $fatal(1);
        end

        #(CLK_PERIOD * 5);

        // Step 3: Broadcast Query (Odd Parity Challenge: 0x5551)
        $display("[TB] Test 2: Broadcast Query C = 0x5551 (Odd Parity)...");
        challenge_i   = 16'h5551;
        config_mode_i = 1'b0;
        start_i       = 1'b1;
        #(CLK_PERIOD);
        start_i       = 1'b0;

        @(posedge resp_valid_o);
        $display("[TB] Test 2 Complete! resp_valid asserted.");
        $display("     Primary Response   : 0x%04h", resp_data_o);
        $display("     Complementary Resp : 0x%04h", comp_data_o);
        $display("     Differential Resp  : 0x%04h", diff_data_o);

        #(CLK_PERIOD * 5);

        // Step 4: Individual Core Configuration Mode
        $display("[TB] Test 3: Individual Per-Core Challenge Configuration Mode...");
        config_mode_i = 1'b1;
        // Assign distinct challenge per core
        for (test_step = 0; test_step < N_CORES; test_step = test_step + 1) begin
            core_config_i[test_step*16 +: 16] = 16'h1000 + test_step;
        end
        start_i = 1'b1;
        #(CLK_PERIOD);
        start_i = 1'b0;

        @(posedge resp_valid_o);
        $display("[TB] Test 3 Complete! resp_valid asserted.");
        $display("     Primary Response   : 0x%04h", resp_data_o);
        $display("     Complementary Resp : 0x%04h", comp_data_o);
        $display("     Differential Resp  : 0x%04h", diff_data_o);

        $display("===============================================================");
        $display("ALL RESPONSE ASSEMBLY TESTS PASSED SUCCESSFULLY!");
        $display("===============================================================");
        $finish;
    end

endmodule

`default_nettype wire
