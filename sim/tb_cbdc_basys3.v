`timescale 1ns/1ps
module tb_cbdc_basys3;
    reg clk=0,btnC=0,btnU=0;
    reg [15:0] sw=1;
    wire [15:0] led;
    always #5 clk=~clk;
    cbdc_puf_basys3 #(.STABLE_CYCLES(8)) dut(.*);
    integer requests=0;
    always @(posedge clk) if(dut.start) requests=requests+1;
    task ticks(input integer n);
        repeat(n) begin @(posedge clk); #1; end
    endtask
    task check(input condition,input [511:0] message);
        if(condition!==1'b1) $fatal(1,"%0s",message);
    endtask
    initial begin
        ticks(50); check(led[4]===1,"Switch readiness");
        // Short bounces must not submit.
        repeat(3) begin @(negedge clk); btnC=1; ticks(1); @(negedge clk); btnC=0; ticks(2); end
        ticks(15); check(requests==0,"Bounce caused request");
        @(negedge clk); btnC=1; ticks(100);
        check(requests==1 && led[1]===1 && led[2]===0,"Supported request completion");
        check(dut.request_challenge===16'h0001,"Challenge capture");
        ticks(50); check(requests==1,"Held button repeated request");
        @(negedge clk); sw=16'hffff; btnC=0; ticks(30);
        check(dut.request_challenge===1,"Switch changes modified captured request");
        @(negedge clk); btnC=1; ticks(100);
        check(requests==2 && led[2]===1 && led[1]===0,"Even-parity rejection/status");
        @(negedge clk); btnC=0; btnU=1; ticks(30);
        check(led[3:0]===0,"Debounced reset did not clear status");
        @(negedge clk); btnU=0; sw=16'h0007; ticks(30);
        @(negedge clk); btnC=1; ticks(100);
        check(requests==3 && led[1]===1 && led[2]===0,"Query after reset");
        check(led[15:5]===0,"Unused LEDs");
        $display("PASS: Basys3 startup, debounce, held button, challenge capture, parity rejection, reset");
        $finish;
    end
    initial begin #20000; $fatal(1,"Board interface watchdog"); end
endmodule
