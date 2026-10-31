`timescale 1ps / 1ps
`default_nettype none

//==============================================================================
//==============================================================================
//   *** ARTIFICIAL DELAYS; NOT A PUF PROOF ***
//   SIMULATION-ONLY TESTBENCH FOR MILESTONE 1 (LEVEL 0 VERIFICATION)
//   Verifies wiring, C[i] path selection, init -> excite -> latch order,
//   Q retention, clr reinitialization, Equation (3) sign check, and full
//   65,536-challenge liveness/polarity sweep.
//==============================================================================
//==============================================================================
module tb_cbdc_puf_m1;

    localparam integer N_STAGES = 16;

    //--------------------------------------------------------------------------
    // Signals for Direct Core Under Test (DUT 1: AND2 gate per Fig. 1)
    //--------------------------------------------------------------------------
    reg  [N_STAGES-1:0] c_tb;
    reg                 excite_tb;
    reg                 latch_tb;
    reg                 clr_tb;
    wire                q_and_dut;
    wire                q_nand_dut;

    // Instantiate Core with AND2 entrance gate (GATE_INIT = 4'h8, Fig. 1 / Sec. 3.1)
    cbdc_puf_core #(
        .N_STAGES      (N_STAGES),
        .GATE_INIT     (4'h8),
        .CROSS_COUPLE  (1),
        .ELEMENT_STYLE (0)
    ) dut_and (
        .c      (c_tb),
        .excite (excite_tb),
        .latch  (latch_tb),
        .clr    (clr_tb),
        .q      (q_and_dut)
    );

    // Experimental NAND2 comparison motivated by Section 4.1/Table 1.
    cbdc_puf_core #(
        .N_STAGES      (N_STAGES),
        .GATE_INIT     (4'h7),
        .CROSS_COUPLE  (1),
        .ELEMENT_STYLE (0)
    ) dut_nand (
        .c      (c_tb),
        .excite (excite_tb),
        .latch  (latch_tb),
        .clr    (clr_tb),
        .q      (q_nand_dut)
    );

    //--------------------------------------------------------------------------
    // Reference Model Instance (Equations 1-3)
    //--------------------------------------------------------------------------
    wire [31:0]        ref_tau_qu_ps;
    wire [31:0]        ref_tau_qb_ps;
    wire signed [31:0] ref_delta_sigma_ps;
    wire               ref_expected_q;
    wire               ref_expected_init_qu;
    wire               ref_startup_eligible;
    wire               ref_initialized;

    cbdc_puf_ref_model #(
        .N_STAGES  (N_STAGES),
        .GATE_INIT (4'h8)
    ) u_ref (
        .c_i                   (c_tb),
        .tau_qu_ps_o           (ref_tau_qu_ps),
        .tau_qb_ps_o           (ref_tau_qb_ps),
        .delta_sigma_ps_o      (ref_delta_sigma_ps),
        .expected_q_o          (ref_expected_q),
        .expected_init_qu_o    (ref_expected_init_qu),
        .startup_eligible_o   (ref_startup_eligible),
        .initialized_o        (ref_initialized)
    );

    //--------------------------------------------------------------------------
    // Signals for Controller + Core Integration (Test 3 & Test 5)
    //--------------------------------------------------------------------------
    reg                 clk_tb;
    reg                 rst_n_tb;
    reg                 ctrl_start_tb;
    reg  [N_STAGES-1:0] ctrl_c_in_tb;
    wire                ctrl_busy;
    wire                ctrl_valid;
    wire                ctrl_resp_bit;
    wire                ctrl_error;
    wire [N_STAGES-1:0] ctrl_puf_c;
    wire                ctrl_puf_excite;
    wire                ctrl_puf_latch;
    wire                ctrl_puf_clr;
    wire                ctrl_puf_q;

    // 100 MHz clock (10,000 ps = 10 ns period)
    initial clk_tb = 1'b0;
    always #5000 clk_tb = ~clk_tb;

    cbdc_puf_ctrl #(
        .N_STAGES           (N_STAGES),
        .CLR_CYCLES         (2),
        .INIT_SETTLE_CYCLES (2),
        .EXCITE_CYCLES      (4),
        .LATCH_CYCLES       (4),
        .HOLD_CYCLES        (3)
    ) u_ctrl (
        .clk          (clk_tb),
        .rst_n        (rst_n_tb),
        .start_i      (ctrl_start_tb),
        .challenge_i  (ctrl_c_in_tb),
        .busy_o       (ctrl_busy),
        .resp_valid_o (ctrl_valid),
        .resp_bit_o   (ctrl_resp_bit),
        .request_error_o (ctrl_error),
        .puf_c_o      (ctrl_puf_c),
        .puf_excite_o (ctrl_puf_excite),
        .puf_latch_o  (ctrl_puf_latch),
        .puf_clr_o    (ctrl_puf_clr),
        .puf_q_i      (ctrl_puf_q)
    );

    cbdc_puf_core #(
        .N_STAGES      (N_STAGES),
        .GATE_INIT     (4'h8),
        .CROSS_COUPLE  (1),
        .ELEMENT_STYLE (0)
    ) dut_ctrl_core (
        .c      (ctrl_puf_c),
        .excite (ctrl_puf_excite),
        .latch  (ctrl_puf_latch),
        .clr    (ctrl_puf_clr),
        .q      (ctrl_puf_q)
    );

    //--------------------------------------------------------------------------
    // Helper Task: Push Delay Arrays from u_ref into dut_and, dut_nand, dut_ctrl_core
    //--------------------------------------------------------------------------
    `define APPLY_STAGE_DLY(IDX) \
        dut_and.u_chain_upper.gen_elem[IDX].u_elem.gen_style_p.u_buf.dly_ps       = u_ref.phi_u_ps[IDX]; \
        dut_and.u_chain_upper.gen_elem[IDX].u_elem.gen_style_p.u_inv.dly_ps       = u_ref.psi_u_ps[IDX]; \
        dut_and.u_chain_upper.gen_elem[IDX].u_elem.gen_style_p.u_mux.dly_ps       = u_ref.mux_u_ps[IDX]; \
        dut_and.u_chain_lower.gen_elem[IDX].u_elem.gen_style_p.u_buf.dly_ps       = u_ref.phi_b_ps[IDX]; \
        dut_and.u_chain_lower.gen_elem[IDX].u_elem.gen_style_p.u_inv.dly_ps       = u_ref.psi_b_ps[IDX]; \
        dut_and.u_chain_lower.gen_elem[IDX].u_elem.gen_style_p.u_mux.dly_ps       = u_ref.mux_b_ps[IDX]; \
        dut_nand.u_chain_upper.gen_elem[IDX].u_elem.gen_style_p.u_buf.dly_ps      = u_ref.phi_u_ps[IDX]; \
        dut_nand.u_chain_upper.gen_elem[IDX].u_elem.gen_style_p.u_inv.dly_ps      = u_ref.psi_u_ps[IDX]; \
        dut_nand.u_chain_upper.gen_elem[IDX].u_elem.gen_style_p.u_mux.dly_ps      = u_ref.mux_u_ps[IDX]; \
        dut_nand.u_chain_lower.gen_elem[IDX].u_elem.gen_style_p.u_buf.dly_ps      = u_ref.phi_b_ps[IDX]; \
        dut_nand.u_chain_lower.gen_elem[IDX].u_elem.gen_style_p.u_inv.dly_ps      = u_ref.psi_b_ps[IDX]; \
        dut_nand.u_chain_lower.gen_elem[IDX].u_elem.gen_style_p.u_mux.dly_ps      = u_ref.mux_b_ps[IDX]; \
        dut_ctrl_core.u_chain_upper.gen_elem[IDX].u_elem.gen_style_p.u_buf.dly_ps = u_ref.phi_u_ps[IDX]; \
        dut_ctrl_core.u_chain_upper.gen_elem[IDX].u_elem.gen_style_p.u_inv.dly_ps = u_ref.psi_u_ps[IDX]; \
        dut_ctrl_core.u_chain_upper.gen_elem[IDX].u_elem.gen_style_p.u_mux.dly_ps = u_ref.mux_u_ps[IDX]; \
        dut_ctrl_core.u_chain_lower.gen_elem[IDX].u_elem.gen_style_p.u_buf.dly_ps = u_ref.phi_b_ps[IDX]; \
        dut_ctrl_core.u_chain_lower.gen_elem[IDX].u_elem.gen_style_p.u_inv.dly_ps = u_ref.psi_b_ps[IDX]; \
        dut_ctrl_core.u_chain_lower.gen_elem[IDX].u_elem.gen_style_p.u_mux.dly_ps = u_ref.mux_b_ps[IDX];

    task sync_delays_to_duts;
        begin
            dut_and.u_chain_upper.u_head_gate.dly_ps       = u_ref.tau_u_ps;
            dut_and.u_chain_lower.u_head_gate.dly_ps       = u_ref.tau_b_ps;
            dut_nand.u_chain_upper.u_head_gate.dly_ps      = u_ref.tau_u_ps;
            dut_nand.u_chain_lower.u_head_gate.dly_ps      = u_ref.tau_b_ps;
            dut_ctrl_core.u_chain_upper.u_head_gate.dly_ps = u_ref.tau_u_ps;
            dut_ctrl_core.u_chain_lower.u_head_gate.dly_ps = u_ref.tau_b_ps;

            `APPLY_STAGE_DLY(0)
            `APPLY_STAGE_DLY(1)
            `APPLY_STAGE_DLY(2)
            `APPLY_STAGE_DLY(3)
            `APPLY_STAGE_DLY(4)
            `APPLY_STAGE_DLY(5)
            `APPLY_STAGE_DLY(6)
            `APPLY_STAGE_DLY(7)
            `APPLY_STAGE_DLY(8)
            `APPLY_STAGE_DLY(9)
            `APPLY_STAGE_DLY(10)
            `APPLY_STAGE_DLY(11)
            `APPLY_STAGE_DLY(12)
            `APPLY_STAGE_DLY(13)
            `APPLY_STAGE_DLY(14)
            `APPLY_STAGE_DLY(15)
        end
    endtask

    //--------------------------------------------------------------------------
    // Helper Task: Configure a Delay Profile
    //   profile_id 0: Upper chain faster on buffer & inverter (Delta_sigma < 0 => Q=0)
    //   profile_id 1: Lower chain faster on buffer & inverter (Delta_sigma > 0 => Q=1)
    //   profile_id 2: Challenge-dependent profile (Buffer faster on Upper,
    //                 Inverter faster on Lower => Q depends on Hamming weight of C)
    //--------------------------------------------------------------------------
    task load_delay_profile(input integer profile_id);
        integer k;
        begin
            u_ref.tau_u_ps = 50;
            u_ref.tau_b_ps = 50;
            for (k = 0; k < N_STAGES; k = k + 1) begin
                u_ref.mux_u_ps[k] = 40;
                u_ref.mux_b_ps[k] = 40;
                if (profile_id == 0) begin
                    // Fig. 2(a): Upper faster than Lower (tau_Qu < tau_Qb => Delta_sigma < 0)
                    u_ref.phi_u_ps[k] = 45;
                    u_ref.psi_u_ps[k] = 48;
                    u_ref.phi_b_ps[k] = 60;
                    u_ref.psi_b_ps[k] = 63;
                end else if (profile_id == 1) begin
                    // Fig. 2(b): Upper slower than Lower (tau_Qu > tau_Qb => Delta_sigma > 0)
                    u_ref.phi_u_ps[k] = 65;
                    u_ref.psi_u_ps[k] = 68;
                    u_ref.phi_b_ps[k] = 45;
                    u_ref.psi_b_ps[k] = 48;
                end else begin
                    // Mixed profile: C[k]=0 favors Upper (-15 ps/stage), C[k]=1 favors Lower (+17 ps/stage)
                    u_ref.phi_u_ps[k] = 45 + (k % 3);
                    u_ref.phi_b_ps[k] = 60 + (k % 3);
                    u_ref.psi_u_ps[k] = 65 + (k % 5);
                    u_ref.psi_b_ps[k] = 48 + (k % 5);
                end
            end
            sync_delays_to_duts();
        end
    endtask

    //--------------------------------------------------------------------------
    // Edge Counters on dut_and.qb_w and dut_nand.qb_w for Liveness Checks
    //--------------------------------------------------------------------------
    integer qb_and_fall_cnt  = 0;
    integer qb_nand_fall_cnt = 0;
    integer and_capture_edges = 0;
    integer nand_capture_edges = 0;

    always @(negedge dut_and.qb_w) begin
        if (excite_tb === 1'b1) qb_and_fall_cnt = qb_and_fall_cnt + 1;
        if (excite_tb === 1'b1 && latch_tb === 1'b1 && clr_tb === 1'b0)
            and_capture_edges = and_capture_edges + 1;
    end

    always @(negedge dut_nand.qb_w) begin
        if (excite_tb === 1'b1) qb_nand_fall_cnt = qb_nand_fall_cnt + 1;
        if (excite_tb === 1'b1 && latch_tb === 1'b1 && clr_tb === 1'b0)
            nand_capture_edges = nand_capture_edges + 1;
    end

    //--------------------------------------------------------------------------
    // Main Verification Sequence (Tests 1 through 7)
    //--------------------------------------------------------------------------
    integer err_cnt;
    integer i_stg;
    integer ch_idx;
    integer and_live_cnt;
    integer nand_live_cnt;
    integer sweep_start_errors;
    reg [15:0] test_vec [0:5];

    initial begin
        $display("==============================================================================");
        $display("  *** ARTIFICIAL DELAYS; NOT A PUF PROOF ***");
        $display("  CBDC-PUF Milestone 1 Verification Testbench (Tests 1-7)");
        $display("==============================================================================");

        err_cnt       = 0;
        c_tb          = 16'h7FFF; // Paper Section 3.1 example: C[15]=0, C[14:0]=1
        excite_tb     = 1'b0;
        latch_tb      = 1'b0;
        clr_tb        = 1'b1;
        rst_n_tb      = 1'b0;
        ctrl_start_tb = 1'b0;
        ctrl_c_in_tb  = 16'h7FFF;

        wait (ref_initialized === 1'b1);
        #1; // All module initial blocks complete before loading profiles.
        load_delay_profile(0);
        #5000;
        clr_tb   = 1'b0;
        rst_n_tb = 1'b1;
        #5000;

        //======================================================================
        // TEST 1: Challenge Width (16-bit) and Bit-to-Element Mapping
        //======================================================================
        $display("\n[TEST 1] Verifying 16-bit challenge width and bit-to-element polarity mapping...");
        excite_tb = 1'b0;
        latch_tb  = 1'b0;
        for (i_stg = 0; i_stg < N_STAGES; i_stg = i_stg + 1) begin
            c_tb = (16'h0001 << i_stg); // Single bit C[i_stg] = 1 (1 inversion at stage i_stg)
            #5000;
            // With AND2 gate and Excite=0, node_w[0] == 0.
            // Nodes 0 .. i_stg must be 0, and nodes i_stg+1 .. 16 must be 1!
            if (dut_and.u_chain_upper.node_w[i_stg] !== 1'b0 ||
                dut_and.u_chain_upper.node_w[i_stg+1] !== 1'b1 ||
                dut_and.u_chain_lower.node_w[i_stg] !== 1'b0 ||
                dut_and.u_chain_lower.node_w[i_stg+1] !== 1'b1 ||
                dut_and.qb_w !== 1'b1 ||
                dut_and.qu_w !== 1'b1) begin
                $display("  [FAIL] Stage %0d mapping mismatch! node[%0d]=%b, node[%0d]=%b, qu=%b",
                         i_stg, i_stg, dut_and.u_chain_upper.node_w[i_stg],
                         i_stg+1, dut_and.u_chain_upper.node_w[i_stg+1], dut_and.qu_w);
                err_cnt = err_cnt + 1;
            end
        end
        if (err_cnt == 0)
            $display("  [PASS] All 16 challenge bits C[0..15] map 1-to-1 to elements 0..15.");

        //======================================================================
        // TEST 2: Initialization State Verification (Paper Section 3.1 Example)
        //======================================================================
        $display("\n[TEST 2] Verifying Section 3.1 Initialization state (C = 16'h7FFF, Excite=0, Latch=0)...");
        c_tb      = 16'h7FFF; // C[15]=0, C[0..14]=1 (15 inversions)
        excite_tb = 1'b0;
        latch_tb  = 1'b0;
        clr_tb    = 1'b1;
        #3000;
        clr_tb    = 1'b0;
        #5000;
        if (dut_and.u_chain_upper.node_w[0] !== 1'b0 ||
            dut_and.u_chain_lower.node_w[0] !== 1'b0 ||
            dut_and.qu_w !== 1'b1 ||
            dut_and.qb_w !== 1'b1 ||
            q_and_dut    !== 1'b0) begin
            $display("  [FAIL] Init state mismatch: Q0u=%b Q0b=%b Qu=%b Qb=%b Q=%b",
                     dut_and.u_chain_upper.node_w[0], dut_and.u_chain_lower.node_w[0],
                     dut_and.qu_w, dut_and.qb_w, q_and_dut);
            err_cnt = err_cnt + 1;
        end else begin
            $display("  [PASS] Init state matches Section 3.1: Q0u=0, Q0b=0, Qu=1, Qb=1, Q=0.");
        end

        //======================================================================
        // TEST 3: Excitation and Latch Order (Fig. 2a & Fig. 2b Sequence)
        //======================================================================
        $display("\n[TEST 3] Verifying Excitation -> Latch order and FSM controller sequence...");
        load_delay_profile(1); // Profile 1: Delta_sigma > 0 => Expected Q = 1
        c_tb          = 16'h7FFF;
        qb_and_fall_cnt = 0;

        // Phase 2: this artificial transport profile must show activity; Q stays 0.
        excite_tb = 1'b1;
        latch_tb  = 1'b0;
        #20000;
        if (qb_and_fall_cnt < 2 || q_and_dut !== 1'b0) begin
            $display("  [FAIL] During Excitation (Latch=0): qb_falls=%0d, Q=%b (expected >=2 falls, Q=0)",
                     qb_and_fall_cnt, q_and_dut);
            err_cnt = err_cnt + 1;
        end

        // Phase 3: Data Latching (Excite=1, Latch=1) -> Q must capture 1 on falling edge of Qb
        latch_tb = 1'b1;
        #10000;
        if (q_and_dut !== 1'b1) begin
            $display("  [FAIL] During Latching (Latch=1, Delta_sigma>0): Q=%b (expected 1)", q_and_dut);
            err_cnt = err_cnt + 1;
        end else begin
            $display("  [PASS] Direct core stayed Q=0 during Excitation (Latch=0) and captured Q=1 when Latch=1.");
        end

        // Also verify cbdc_puf_ctrl FSM sequence
        @(posedge clk_tb);
        ctrl_c_in_tb  <= 16'h7FFF;
        ctrl_start_tb <= 1'b1;
        @(posedge clk_tb);
        ctrl_start_tb <= 1'b0;
        wait (ctrl_valid === 1'b1);
        @(posedge clk_tb);
        if (ctrl_resp_bit !== 1'b1) begin
            $display("  [FAIL] Controller FSM captured resp_bit=%b (expected 1)", ctrl_resp_bit);
            err_cnt = err_cnt + 1;
        end else begin
            $display("  [PASS] Controller FSM sequenced clr -> excite -> latch -> sync read -> hold cleanly.");
        end

        //======================================================================
        // TEST 4: Response Retention After Latch Falls and Excite Falls
        //======================================================================
        $display("\n[TEST 4] Verifying Q retention after Latch falls and after Excite falls...");
        // Currently q_and_dut == 1 from Test 3. Drop latch_tb = 0 while still oscillating.
        latch_tb = 1'b0;
        // Now invert the delay profile while oscillating so Qu falls before Qb!
        // Because latch_tb == 0, FDCE_1 must ignore the new falling edges and retain Q=1.
        load_delay_profile(0); // Delta_sigma < 0
        #20000;
        if (q_and_dut !== 1'b1) begin
            $display("  [FAIL] Q changed while Latch=0! Q=%b (expected retained 1)", q_and_dut);
            err_cnt = err_cnt + 1;
        end
        // Drop excite_tb; Q stays 1 because clr is separate from ~Excite.
        excite_tb = 1'b0;
        #10000;
        if (q_and_dut !== 1'b1) begin
            $display("  [FAIL] Q wiped when Excite dropped to 0! Q=%b (expected retained 1)", q_and_dut);
            err_cnt = err_cnt + 1;
        end else begin
            $display("  [PASS] Q=1 retained across Latch=0 oscillation and Excite=0 shutdown.");
        end

        //======================================================================
        // TEST 5: Reinitialization with clr
        //======================================================================
        $display("\n[TEST 5] Verifying async clr reinitializes Q to 0 cleanly...");
        clr_tb = 1'b1;
        #2000;
        if (q_and_dut !== 1'b0) begin
            $display("  [FAIL] clr=1 did not reset Q to 0! Q=%b", q_and_dut);
            err_cnt = err_cnt + 1;
        end
        clr_tb = 1'b0;
        #2000;
        if (q_and_dut !== 1'b0) begin
            $display("  [FAIL] Q did not stay 0 after clr release! Q=%b", q_and_dut);
            err_cnt = err_cnt + 1;
        end else begin
            $display("  [PASS] clr pulse reset Q=1 -> Q=0 cleanly.");
        end

        //======================================================================
        // TEST 6: Equation (3) Sign Check Across Multiple Delay Profiles & Challenges
        //======================================================================
        $display("\n[TEST 6] Verifying Eq. (3) Q == sign(Delta_sigma) across profiles & challenges...");
        test_vec[0] = 16'h7FFF; // Weight 15 (odd)
        test_vec[1] = 16'h0001; // Weight 1  (odd)
        test_vec[2] = 16'h0007; // Weight 3  (odd)
        test_vec[3] = 16'h01FF; // Weight 9  (odd)
        test_vec[4] = 16'h1FFF; // Weight 13 (odd)
        test_vec[5] = 16'hFFFE; // Weight 15 (odd)

        for (i_stg = 0; i_stg < 3; i_stg = i_stg + 1) begin
            load_delay_profile(i_stg);
            for (ch_idx = 0; ch_idx < 6; ch_idx = ch_idx + 1) begin
                c_tb      = test_vec[ch_idx];
                excite_tb = 1'b0;
                latch_tb  = 1'b0;
                clr_tb    = 1'b1;
                and_capture_edges = 0;
                #2000;
                clr_tb    = 1'b0;
                #4000;
                excite_tb = 1'b1;
                #12000;
                latch_tb  = 1'b1;
                #12000;
                latch_tb  = 1'b0;
                #2000;
                excite_tb = 1'b0;

                if (and_capture_edges == 0 || q_and_dut !== ref_expected_q) begin
                    $display("  [FAIL] Profile %0d, C=0x%04h: tau_Qu=%0d ps, tau_Qb=%0d ps, Delta_sigma=%0d ps -> Q=%b (expected %b)",
                             i_stg, c_tb, ref_tau_qu_ps, ref_tau_qb_ps, ref_delta_sigma_ps, q_and_dut, ref_expected_q);
                    err_cnt = err_cnt + 1;
                end else begin
                    $display("  [OK]   Profile %0d, C=0x%04h: tau_Qu=%0d ps, tau_Qb=%0d ps, Delta_sigma=%0d ps -> Q=%b",
                             i_stg, c_tb, ref_tau_qu_ps, ref_tau_qb_ps, ref_delta_sigma_ps, q_and_dut);
                end
            end
        end

        //======================================================================
        // TEST 7: Full challenge initialization, model activity and capture sweep.
        //======================================================================
        $display("\n[TEST 7] Running full 65,536-challenge sweep (0x0000 .. 0xFFFF)...");
        // Drain all previously scheduled OLD-profile transport events before
        // changing delays. Short new-profile waits cannot flush old events.
        excite_tb = 1'b0;
        latch_tb = 1'b0;
        clr_tb = 1'b1;
        #5000;
        sweep_start_errors = err_cnt;
        // Compact artificial delays for the exhaustive activity/capture sweep.
        u_ref.tau_u_ps = 5;
        u_ref.tau_b_ps = 5;
        for (i_stg = 0; i_stg < N_STAGES; i_stg = i_stg + 1) begin
            u_ref.phi_u_ps[i_stg] = 4;
            u_ref.psi_u_ps[i_stg] = 4;
            u_ref.mux_u_ps[i_stg] = 4;
            u_ref.phi_b_ps[i_stg] = 6;
            u_ref.psi_b_ps[i_stg] = 6;
            u_ref.mux_b_ps[i_stg] = 4;
        end
        sync_delays_to_duts();

        and_live_cnt  = 0;
        nand_live_cnt = 0;

        for (ch_idx = 0; ch_idx < 65536; ch_idx = ch_idx + 1) begin
            c_tb            = ch_idx[15:0];
            excite_tb       = 1'b0;
            latch_tb        = 1'b0;
            clr_tb          = 1'b1;
            qb_and_fall_cnt  = 0;
            qb_nand_fall_cnt = 0;
            and_capture_edges = 0;
            nand_capture_edges = 0;
            #300; // Settle initialization state

            // Check init state matches reference model for every single challenge
            if (dut_and.qu_w !== (^c_tb) || dut_and.qb_w !== (^c_tb) ||
                dut_nand.qu_w !== (~^c_tb) || dut_nand.qb_w !== (~^c_tb)) begin
                $display("  [FAIL] Init polarity mismatch at C=0x%04h", c_tb);
                err_cnt = err_cnt + 1;
            end

            // Excite both cores for 600 ps (about two round trips in this profile).
            excite_tb = 1'b1;
            clr_tb = 1'b0;
            #600;

            // Count actual capture edges after the excitation-only window.
            latch_tb = 1'b1;
            #600;
            latch_tb = 1'b0;
            #1;
            if ((^c_tb) === 1'b1) begin
                if (and_capture_edges < 2 || q_and_dut !== 1'b0 || nand_capture_edges != 0)
                    $fatal(1, "AND eligible capture/NAND quiescence failed C=%h", c_tb);
            end else begin
                if (nand_capture_edges < 2 || q_nand_dut !== 1'b0 || and_capture_edges != 0)
                    $fatal(1, "NAND eligible capture/AND quiescence failed C=%h", c_tb);
            end

            if (qb_and_fall_cnt > 0)  and_live_cnt  = and_live_cnt  + 1;
            if (qb_nand_fall_cnt > 0) nand_live_cnt = nand_live_cnt + 1;

            // Model-specific activity only: not a physical oscillation guarantee.
            if ((qb_and_fall_cnt >= 2) !== (^c_tb) ||
                (qb_nand_fall_cnt >= 2) !== (~^c_tb) ||
                ref_startup_eligible !== (^c_tb)) begin
                $display("  [FAIL] Unexpected liveness at C=0x%04h", c_tb);
                err_cnt = err_cnt + 1;
            end
        end

        excite_tb = 1'b0;
        $display("  [INFO] 65,536-Challenge Sweep Complete:");
        $display("         - AND2 observed active challenges : %0d / 65536 (odd parity)", and_live_cnt);
        $display("         - NAND2 observed active challenges: %0d / 65536 (even parity)", nand_live_cnt);
        $display("         - These are TWO configurations, not 65536 usable races in one core.");

        if (and_live_cnt != 32768 || nand_live_cnt != 32768) begin
            $display("  [FAIL] Expected 32768 active challenges in each artificial-model configuration!");
            err_cnt = err_cnt + 1;
        end else if (err_cnt == sweep_start_errors) begin
            $display("  [PASS] Full 65,536-challenge sweep verified with 0 mismatches.");
        end

        //======================================================================
        // Final Summary
        //======================================================================
        $display("\n==============================================================================");
        if (err_cnt == 0) begin
            $display("  MILESTONE 1 SIMULATION RESULT: ALL TESTS PASSED (0 ERRORS)");
        end else begin
            $display("  MILESTONE 1 SIMULATION RESULT: FAILED WITH %0d ERRORS", err_cnt);
            $fatal(1, "Milestone 1 failed");
        end
        $display("  REMINDER: ARTIFICIAL DELAYS; NOT A PUF PROOF.");
        $display("==============================================================================\n");
        $finish;
    end

    initial begin
        #200000000;
        $fatal(1, "Watchdog: testbench did not complete");
    end

endmodule

`default_nettype wire
