`timescale 1ps/1ps
`default_nettype none
module tb_cbdc_units;
    reg [2:0] pins = 0;
    wire [15:0] lut2_q;
    wire [255:0] lut3_q;
    wire element_p, element_2;
    genvar g;
    generate
        for (g=0; g<16; g=g+1) begin : l2
            LUT2 #(.INIT(g)) u (.I0(pins[0]), .I1(pins[1]), .O(lut2_q[g]));
        end
        for (g=0; g<256; g=g+1) begin : l3
            LUT3 #(.INIT(g)) u (.I0(pins[0]), .I1(pins[1]), .I2(pins[2]), .O(lut3_q[g]));
        end
    endgenerate
    cbdc_puf_element ep (.sig_i(pins[0]), .c_i(pins[1]), .sig_o(element_p));
    cbdc_puf_element #(.ELEMENT_STYLE(1)) e2 (.sig_i(pins[0]), .c_i(pins[1]), .sig_o(element_2));

    reg fc=0, ce=0, clear=1, d=0;
    wire fq;
    FDCE_1 ff (.C(fc), .CE(ce), .CLR(clear), .D(d), .Q(fq));
    reg [1:0] challenge = 0;
    wire [31:0] tu, tb;
    wire signed [31:0] delta;
    wire rq, init_q, eligible, initialized;
    cbdc_puf_ref_model #(.N_STAGES(2)) refm (
        .c_i(challenge), .tau_qu_ps_o(tu), .tau_qb_ps_o(tb),
        .delta_sigma_ps_o(delta), .expected_q_o(rq),
        .expected_init_qu_o(init_q), .startup_eligible_o(eligible), .initialized_o(initialized));

    reg pulse=0;
    wire transported, filtered;
    LUT2 #(.INIT(4'hA)) transport_buf (.I0(pulse), .I1(1'b0), .O(transported));
    LUT2 #(.INIT(4'hA), .TRANSPORT(0)) inertial_buf (.I0(pulse), .I1(1'b0), .O(filtered));
    integer transported_rises=0, filtered_rises=0;
    always @(posedge transported) if (transported === 1'b1) transported_rises=transported_rises+1;
    always @(posedge filtered) if (filtered === 1'b1) filtered_rises=filtered_rises+1;

    task check(input condition, input [511:0] message);
        if (condition !== 1'b1) $fatal(1, "%0s", message);
    endtask
    integer i,j;
    initial begin
        wait(initialized); #1;
        for(i=0;i<8;i=i+1) begin
            pins=i; #200;
            for(j=0;j<16;j=j+1) check(lut2_q[j] === ((j >> (i & 3)) & 1), "LUT2 INIT/index");
            for(j=0;j<256;j=j+1) check(lut3_q[j] === ((j >> i) & 1), "LUT3 INIT/index");
            check(element_p === (pins[0]^pins[1]) && element_2 === element_p, "Element truth table");
        end
        pins=3'bx00; #200; check(lut2_q[8] === 0, "AND dominant zero");
        pins=3'b0x0; #200; check(lut2_q[8] === 0, "AND unknown feedback");
        clear=0; ce=1; d=1; #10; fc=1; #10;
        check(fq===0, "Rising edge must not capture");
        fc=0; #10; check(fq===1, "Falling edge must capture");
        ce=0; d=0; fc=1; #10; fc=0; #10; check(fq===1, "CE hold");
        clear=1; #10; check(fq===0, "Asynchronous clear");
        clear=0; ce=1; d=1; fc=1; #10; clear=1; fc=0; #10;
        check(fq===0, "Clear wins at capture edge");
        clear=0; fc=1; ce=1'bx; #10; fc=0; #10;
        check(fq===1'bx, "Unknown CE must not hide uncertainty");
        clear=1; #10; clear=1'bx; #10; check(fq===1'bx, "Unknown clear");
        clear=1; #10; clear=0; ce=1; fc=1'bx; #10; fc=0; #10;
        check(fq===1'bx, "Unknown-to-zero clock is not a clean falling edge");
        clear=1; #10; clear=0; fc=1; #10;
        check(fq===0, "Clear release at rising edge must not capture");

        refm.tau_u_ps=5; refm.tau_b_ps=7;
        refm.phi_u_ps[0]=10; refm.phi_u_ps[1]=20;
        refm.psi_u_ps[0]=14; refm.psi_u_ps[1]=27;
        refm.phi_b_ps[0]=12; refm.phi_b_ps[1]=18;
        refm.psi_b_ps[0]=11; refm.psi_b_ps[1]=30;
        refm.mux_u_ps[0]=0; refm.mux_u_ps[1]=0;
        refm.mux_b_ps[0]=0; refm.mux_b_ps[1]=0;
        challenge=2'b01; #1;
        check(tu==39 && tb==36 && delta==3 && rq===1 && eligible===1, "Independent positive example");
        challenge=2'b10; #1;
        check(tu==42 && tb==49 && delta==-7 && rq===0, "Independent negative/permuted example");
        challenge=2'b01; #1;
        refm.mux_u_ps[0]=2; refm.mux_u_ps[1]=3;
        refm.mux_b_ps[0]=4; refm.mux_b_ps[1]=4; #1;
        check(tu==44 && tb==44 && delta==0 && rq===0, "Automatic profile recalculation/equality");
        challenge=2'b0x; #1; check(rq===1'bx && eligible===1'bx, "Unknown challenge propagation");
        challenge=0; #1; check(eligible===0 && init_q===0, "Even AND configuration is quiescent");

        // 10 ps pulse through 50 ps models: transport preserves, inertial rejects.
        pulse=1; #10; pulse=0; #100;
        check(transported_rises==1 && filtered_rises==0, "Pulse-filter sensitivity");
        transport_buf.rise_extra_ps=20;
        pulse=1; #60; check(transported===0, "Separate rising delay");
        #20; check(transported===1, "Delayed rise arrives");
        pulse=0; #60; check(transported===0, "Separate falling delay");
        $display("PASS: exhaustive LUT/element, arbiter, independent equations, unknowns, pulse sensitivity");
        $finish;
    end
    initial begin #100000; $fatal(1,"Unit watchdog"); end
endmodule
`default_nettype wire
