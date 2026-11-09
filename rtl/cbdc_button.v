`timescale 1ns/1ps
`default_nettype none
// Active-high mechanical button: synchronizer plus stable-level qualification.
module cbdc_button #(parameter integer STABLE_CYCLES=1000000)(
    input wire clk, reset, raw_i, output reg level_o=0
);
    localparam integer W=(STABLE_CYCLES<2)?1:$clog2(STABLE_CYCLES);
    (* ASYNC_REG="TRUE", SHREG_EXTRACT="NO" *) reg meta=0, synced=0;
    reg [W-1:0] count=0;
    always @(posedge clk) begin
        if(reset) begin meta<=0; synced<=0; level_o<=0; count<=0; end
        else begin
            meta<=raw_i; synced<=meta;
            if(synced==level_o) count<=0;
            else if(count==STABLE_CYCLES-1) begin level_o<=synced; count<=0; end
            else count<=count+1'b1;
        end
    end
    // synthesis translate_off
    initial if(STABLE_CYCLES<1) $fatal(1,"Invalid debounce period");
    // synthesis translate_on
endmodule
`default_nettype wire
