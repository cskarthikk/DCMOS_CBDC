`timescale 1ns/1ps
`default_nettype none
// Board interface only. No additional loads on the asynchronous core nets.
module cbdc_puf_basys3 #(
    parameter integer STABLE_CYCLES=1000000 // 10 ms at 100 MHz
)(input wire clk, input wire [15:0] sw, input wire btnC, btnU,
  output wire [15:0] led);
    reg [4:0] power_count=0;
    wire power_reset=~power_count[4];
    always @(posedge clk) if(power_reset) power_count<=power_count+1'b1;
    wire submit_level, reset_level;
    cbdc_button #(.STABLE_CYCLES(STABLE_CYCLES)) u_submit(
        .clk(clk),.reset(power_reset),.raw_i(btnC),.level_o(submit_level));
    cbdc_button #(.STABLE_CYCLES(STABLE_CYCLES)) u_reset(
        .clk(clk),.reset(power_reset),.raw_i(btnU),.level_o(reset_level));
    wire reset=power_reset|reset_level;
    (* ASYNC_REG="TRUE", SHREG_EXTRACT="NO" *) reg [15:0] sw_meta=0,sw_sync=0;
    localparam integer W=(STABLE_CYCLES<2)?1:$clog2(STABLE_CYCLES);
    reg [W-1:0] stable_count=0;
    reg [15:0] candidate=0, stable_challenge=0, request_challenge=0;
    reg switches_ready=0, previous_submit=0, start=0;
    reg response_led=0, done_led=0, error_led=0;
    wire busy,valid,response,request_error;
    wire submit=submit_level & ~previous_submit;
    cbdc_puf_top u_puf(.clk(clk),.rst_n(~reset),.start_i(start),
        .challenge_i(request_challenge),.busy_o(busy),.resp_valid_o(valid),
        .resp_bit_o(response),.request_error_o(request_error));
    always @(posedge clk) begin
        if(reset) begin
            sw_meta<=0; sw_sync<=0; candidate<=0; stable_challenge<=0;
            stable_count<=0; switches_ready<=0; request_challenge<=0;
            previous_submit<=submit_level; start<=0;
            response_led<=0; done_led<=0; error_led<=0;
        end else begin
            sw_meta<=sw; sw_sync<=sw_meta;
            previous_submit<=submit_level; start<=0;
            // Qualify the entire synchronized bus, not individual bits.
            if(sw_sync!=candidate) begin
                candidate<=sw_sync; stable_count<=0; switches_ready<=0;
            end else if(!switches_ready) begin
                if(stable_count==STABLE_CYCLES-1) begin
                    stable_challenge<=candidate; switches_ready<=1;
                end else stable_count<=stable_count+1'b1;
            end
            if(submit && !busy && !start) begin
                done_led<=0; error_led<=0; response_led<=0;
                if(switches_ready && sw_sync==candidate) begin
                    request_challenge<=stable_challenge;
                    start<=1;
                end else error_led<=1;
            end
            if(valid) begin response_led<=response; done_led<=1; end
            if(request_error) begin error_led<=1; done_led<=0; end
        end
    end
    assign led={11'b0,switches_ready,busy,error_led,done_led,response_led};
    // Switches must be set before pressing submit; a two-flop synchronizer
    // reduces metastability risk but cannot make arbitrary multi-bit updates atomic.
    // synthesis translate_off
    initial if(STABLE_CYCLES<1) $fatal(1,"Invalid switch settling period");
    // synthesis translate_on
endmodule
`default_nettype wire
