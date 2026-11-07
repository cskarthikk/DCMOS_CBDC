`timescale 1ns/1ps
`default_nettype none
// 8N1, 100 MHz / 868 = approximately 115200 baud. No hardware flow control.
module cbdc_uart #(parameter integer CLKS=868)(
 input wire clk,reset,rx,send,input wire [7:0] tx_data,
 output wire tx,output reg busy=0,output reg [7:0] rx_data=0,
 output reg received=0,output reg framing_error=0);
 (* ASYNC_REG="TRUE", SHREG_EXTRACT="NO" *) reg meta=1,sync=1;
 reg [9:0] shift=10'h3ff;
 reg [3:0] tbit=0,rbit=0;
 reg [31:0] tc=0,rc=0;
 reg [1:0] rs=0;
 reg [7:0] rshift=0;
 assign tx=shift[0];
 always @(posedge clk) begin
  if(reset) begin meta<=1;sync<=1;shift<=10'h3ff;busy<=0;tc<=0;tbit<=0;
   rs<=0;rc<=0;rbit<=0;rshift<=0;rx_data<=0;received<=0;framing_error<=0;end
  else begin
   meta<=rx;sync<=meta;received<=0;framing_error<=0;
   if(!busy) begin
    if(send) begin shift<={1'b1,tx_data,1'b0};busy<=1;tc<=0;tbit<=0;end
   end else if(tc==CLKS-1) begin
    tc<=0;shift<={1'b1,shift[9:1]};
    if(tbit==9) busy<=0;else tbit<=tbit+1'b1;
   end else tc<=tc+1'b1;
   case(rs)
    0: if(!sync) begin rs<=1;rc<=0;end
    1: if(rc==CLKS/2-1) begin rc<=0;if(!sync) begin rs<=2;rbit<=0;end else rs<=0;end else rc<=rc+1;
    2: if(rc==CLKS-1) begin rc<=0;rshift[rbit]<=sync;if(rbit==7) rs<=3;else rbit<=rbit+1;end else rc<=rc+1;
    3: if(rc==CLKS-1) begin rc<=0;rs<=0;if(sync) begin rx_data<=rshift;received<=1;end else framing_error<=1;end else rc<=rc+1;
   endcase
  end
 end
 // synthesis translate_off
 initial if(CLKS<4) $fatal(1,"UART CLKS must be >=4");
 // synthesis translate_on
endmodule
`default_nettype wire
