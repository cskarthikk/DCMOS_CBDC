`timescale 1ns/1ps
`default_nettype none
module tb_cbdc_ctrl;
    reg clk=0, rst_n=0, start=0;
    reg [15:0] challenge=0;
    always #5 clk=~clk;
    wire [1:0] busy,valid,response,error,excite,latch,clear;
    wire [15:0] held_c [0:1];
    reg [1:0] fake_q=0;
    genvar g;
    generate for(g=0;g<2;g=g+1) begin : gates
        cbdc_puf_ctrl #(.GATE_INIT(g==0 ? 4'h8 : 4'h7),
            .CLR_CYCLES(2), .INIT_SETTLE_CYCLES(2), .EXCITE_CYCLES(4),
            .LATCH_CYCLES(4), .HOLD_CYCLES(3)) dut (
            .clk(clk), .rst_n(rst_n), .start_i(start), .challenge_i(challenge),
            .busy_o(busy[g]), .resp_valid_o(valid[g]), .resp_bit_o(response[g]),
            .request_error_o(error[g]), .puf_c_o(held_c[g]),
            .puf_excite_o(excite[g]), .puf_latch_o(latch[g]),
            .puf_clr_o(clear[g]), .puf_q_i(fake_q[g]));
    end endgenerate
    integer k,t,selected;
    reg [15:0] accepted;
    reg seen_latch, dropped_latch;
    integer clear_ticks, excite_ticks, latch_ticks, hold_ticks;
    task transaction(input [15:0] c, input expected_bit);
        begin
            @(negedge clk); challenge=c; start=1;
            selected=(^c) ? 0 : 1; accepted=c;
            @(posedge clk); #1;
            if (busy[selected]!==1 || error[1-selected]!==1 || busy[1-selected]!==0)
                $fatal(1,"Admission mismatch C=%h",c);
            @(negedge clk); start=0; challenge=~c;
            seen_latch=0; dropped_latch=0;
            clear_ticks=1; excite_ticks=0; latch_ticks=0; hold_ticks=0;
            for(t=0;t<40 && !valid[selected];t=t+1) begin
                @(posedge clk); #1;
                if (valid[1-selected] || error[selected]) $fatal(1,"Unexpected response/error");
                if (held_c[selected]!==accepted) $fatal(1,"Challenge changed while busy");
                if (latch[selected] && (!excite[selected] || clear[selected]))
                    $fatal(1,"Latch ordering");
                if (clear[selected] && excite[selected]) $fatal(1,"Clear/excite overlap");
                if(clear[selected]) clear_ticks=clear_ticks+1;
                if(excite[selected]) excite_ticks=excite_ticks+1;
                if(latch[selected]) latch_ticks=latch_ticks+1;
                if (latch[selected]) seen_latch=1;
                if (seen_latch && !latch[selected]) dropped_latch=1;
                if(dropped_latch && excite[selected]) hold_ticks=hold_ticks+1;
                if (seen_latch && !excite[selected] && !dropped_latch)
                    $fatal(1,"Excitation dropped before latch");
                // Change response just after latch closes: exercise full sync flush.
                if (dropped_latch) fake_q[selected]=expected_bit;
            end
            if (!valid[selected] || busy[selected] || response[selected]!==expected_bit || !seen_latch)
                $fatal(1,"Readout/timeout");
            if(clear_ticks!=2 || excite_ticks!=11 || latch_ticks!=4 || hold_ticks!=3)
                $fatal(1,"Phase duration mismatch clear=%0d excite=%0d latch=%0d hold=%0d",
                    clear_ticks,excite_ticks,latch_ticks,hold_ticks);
            @(posedge clk); #1; if(valid!=0 || error!=0) $fatal(1,"Status must pulse");
        end
    endtask
    initial begin
        repeat(2) @(negedge clk); rst_n=1;
        transaction(16'h0001,1);
        transaction(16'h0000,1);
        transaction(16'h7fff,0);
        transaction(16'hffff,0);
        @(negedge clk); challenge=16'hxxxx; start=1;
        @(posedge clk); #1; if(error!==2'b11 || busy!==0) $fatal(1,"Unknown request admission");
        @(negedge clk); start=0;
        // Busy requests are ignored; synchronous reset aborts an active query.
        challenge=1; start=1;
        @(negedge clk); start=0;
        repeat(3) @(negedge clk);
        challenge=7; start=1;
        @(posedge clk); #1; if(held_c[0]!==1) $fatal(1,"Busy request changed challenge");
        @(negedge clk); start=0; rst_n=0;
        @(posedge clk); #1;
        if (busy!==0 || valid!==0 || latch!==0 || excite!==0) $fatal(1,"Reset abort");
        @(negedge clk); rst_n=1;
        transaction(16'h0001,1);
        $display("PASS: AND/NAND admission, CDC hold, repeated queries, busy ignore, reset abort");
        $finish;
    end
    initial begin #10000; $fatal(1,"Controller watchdog"); end
endmodule
`default_nettype wire
