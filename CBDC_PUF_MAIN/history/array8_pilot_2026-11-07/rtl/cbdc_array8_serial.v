`timescale 1ns/1ps
`default_nettype none
// Independent preserved engines: no XOR/averaging/filtering of raw bits.
// Request A8, 16 payload bytes (core0 low/high ... core7 low/high), XOR.
// Reply 58, echo16, flags, response mask, Qb mask, Qu mask, XOR (22 bytes).
module cbdc_array8_serial #(parameter integer UART_CLKS=868)(
 input wire clk,btnU,uart_rx,output wire uart_tx,output wire [15:0] led);
 reg [4:0] por=0;wire pr=~por[4];
 always @(posedge clk) if(pr) por<=por+1;
 wire button;cbdc_button u_reset(.clk(clk),.reset(pr),.raw_i(btnU),.level_o(button));
 wire reset=pr|button;
 wire [7:0] rd;wire received,framing,tx_busy;
 reg send=0;reg [7:0] td=0;
 cbdc_uart #(.CLKS(UART_CLKS)) uart(.clk(clk),.reset(reset),.rx(uart_rx),.send(send),
 .tx_data(td),.tx(uart_tx),.busy(tx_busy),.rx_data(rd),.received(received),.framing_error(framing));
 reg [1:0] state=0;reg [4:0] parser=0,index=0;
 reg [127:0] challenge=0;reg [7:0] crc=0,txcrc=0;
 reg [31:0] timeout=0,partial_timeout=0;
 reg start=0;wire [7:0] valid,error,busy,response,qb,qu;
 reg [7:0] done_mask=0,result=0,qb_result=0,qu_result=0,flags=0;
 genvar g;
 generate for(g=0;g<8;g=g+1) begin:gen_core
  wire [1:0] edges;
  cbdc_serial_engine u_engine(.clk(clk),.reset(reset),.start(start),.challenge(challenge[g*16+:16]),
   .valid(valid[g]),.error(error[g]),.busy(busy[g]),.response(response[g]),.edges(edges));
  assign qb[g]=edges[0];assign qu[g]=edges[1];
 end endgenerate
 assign led={4'b0,1'b1,(|busy),state==2,(state==0),result};
 integer k;
 always @(posedge clk) begin
  if(reset) begin state<=0;parser<=0;index<=0;challenge<=0;crc<=0;txcrc<=0;
   timeout<=0;partial_timeout<=0;start<=0;send<=0;td<=0;done_mask<=0;
   result<=0;qb_result<=0;qu_result<=0;flags<=0;end
  else begin
   start<=0;send<=0;
   if(state==0) begin
    if(parser!=0) begin
     if(partial_timeout==UART_CLKS*40) begin parser<=0;partial_timeout<=0;end
     else partial_timeout<=partial_timeout+1;
    end
    if(framing) parser<=0;
    else if(received) begin
     partial_timeout<=0;
     if(parser==0) begin if(rd==8'ha8) begin parser<=1;crc<=8'ha8;end end
     else if(parser<=16) begin
      challenge[(parser-1)*8+:8]<=rd;crc<=crc^rd;parser<=parser+1;
     end else begin
      parser<=0;
      if(rd==crc) begin start<=1;state<=1;timeout<=0;done_mask<=0;
       result<=0;qb_result<=0;qu_result<=0;flags<=0;end
     end
    end
   end else if(state==1) begin
    timeout<=timeout+1;
    for(k=0;k<8;k=k+1) if(valid[k]) begin
     done_mask[k]<=1;result[k]<=response[k];qb_result[k]<=qb[k];qu_result[k]<=qu[k];
    end
    if(&done_mask) begin flags<=8'h41;state<=2;index<=0;txcrc<=0;end
    else if((|error) || timeout==10000) begin flags<=8'hc0;state<=2;index<=0;txcrc<=0;end
   end else if(state==2) begin
    if(!tx_busy && !send) begin
     if(index==22) begin state<=0;index<=0;end
     else begin
      case(index)
       0:begin td<=8'h58;txcrc<=8'h58;end
       17:begin td<=flags;txcrc<=txcrc^flags;end
       18:begin td<=result;txcrc<=txcrc^result;end
       19:begin td<=qb_result;txcrc<=txcrc^qb_result;end
       20:begin td<=qu_result;txcrc<=txcrc^qu_result;end
       21:td<=txcrc;
       default:begin td<=challenge[(index-1)*8+:8];txcrc<=txcrc^challenge[(index-1)*8+:8];end
      endcase
      send<=1;index<=index+1;
     end
    end
   end
  end
 end
endmodule
`default_nettype wire
