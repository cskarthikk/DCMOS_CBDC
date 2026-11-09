`timescale 1ns/1ps
`default_nettype none
// Request AC, control, 16 configuration bytes, XOR (19 bytes).
// control[0]: sequential diagnostic; [7:1]: excite wait in 100-MHz cycles, 1..127.
// Reply 5C, control, 16 actual latched configuration bytes, flags, raw word, XOR.
// 61=all completed; 60=rejected; E0=timeout/error. No activity monitor flags exist.
module cbdc_array8_serial #(parameter integer UART_CLKS=868)(
 input wire clk,btnU,uart_rx,output wire uart_tx,output wire [15:0] led);
 reg [4:0] por=0;wire pr=~por[4];always @(posedge clk) if(pr) por<=por+1;
 wire button;cbdc_button u_reset(.clk(clk),.reset(pr),.raw_i(btnU),.level_o(button));wire reset=pr|button;
 wire [7:0] rd;wire received,framing,tx_busy;reg send=0;reg [7:0] td=0;
 cbdc_uart #(.CLKS(UART_CLKS)) uart(.clk(clk),.reset(reset),.rx(uart_rx),.send(send),.tx_data(td),.tx(uart_tx),.busy(tx_busy),.rx_data(rd),.received(received),.framing_error(framing));
 reg [1:0] state=0;reg [4:0] parser=0,index=0;reg [127:0] challenge=0;
 reg [7:0] control=0,crc=0,txcrc=0,start=0,done_mask=0,result=0,flags=0;
 reg [2:0] active_core=0;reg [31:0] timeout=0,partial_timeout=0;
 wire [7:0] valid,error,busy,response,parity;wire [127:0] configuration;
 genvar g;
 generate for(g=0;g<8;g=g+1) begin:gen_core
  assign parity[g]=^challenge[g*16+:16];
  cbdc_serial_engine u_engine(.clk(clk),.reset(reset),.start(start[g]),.challenge(challenge[g*16+:16]),.excite_cycles({1'b0,control[7:1]}),
   .valid(valid[g]),.error(error[g]),.busy(busy[g]),.response(response[g]),.configuration(configuration[g*16+:16]));
 end endgenerate
 assign led={4'b0,1'b1,(|busy),state==2,state==0,result};
 integer k;
 always @(posedge clk) begin
  if(reset) begin state<=0;parser<=0;index<=0;challenge<=0;control<=0;crc<=0;txcrc<=0;start<=0;done_mask<=0;result<=0;flags<=0;
   active_core<=0;timeout<=0;partial_timeout<=0;send<=0;td<=0;end
  else begin
   start<=0;send<=0;
   if(state==0) begin
    if(parser!=0) begin if(partial_timeout==UART_CLKS*40) begin parser<=0;partial_timeout<=0;end else partial_timeout<=partial_timeout+1;end
    if(framing) parser<=0;
    else if(received) begin
     partial_timeout<=0;
     if(parser==0) begin if(rd==8'hac) begin parser<=1;crc<=8'hac;end end
     else if(parser==1) begin control<=rd;crc<=crc^rd;parser<=2;end
     else if(parser<=17) begin challenge[(parser-2)*8+:8]<=rd;crc<=crc^rd;parser<=parser+1;end
     else begin
      parser<=0;
      if(rd==crc) begin
       done_mask<=0;result<=0;timeout<=0;active_core<=0;
       if((control[7:1]!=0) && (&parity)) begin start<=control[0]?8'h01:8'hff;state<=1;end
       else begin flags<=8'h60;state<=2;index<=0;txcrc<=0;end
      end
     end
    end
   end else if(state==1) begin
    timeout<=timeout+1;
    for(k=0;k<8;k=k+1) if(valid[k]) begin done_mask[k]<=1;result[k]<=response[k];end
    if(control[0] && valid[active_core] && active_core<7) begin active_core<=active_core+1;start<=8'b1<<(active_core+1);end
    if(&done_mask) begin flags<=8'h61;state<=2;index<=0;txcrc<=0;end
    else if((|error) || timeout==20000) begin flags<=8'he0;state<=2;index<=0;txcrc<=0;end
   end else if(state==2) begin
    if(!tx_busy && !send) begin
     if(index==21) begin state<=0;index<=0;end
     else begin
      case(index)
       0:begin td<=8'h5c;txcrc<=8'h5c;end
       1:begin td<=control;txcrc<=txcrc^control;end
       18:begin td<=flags;txcrc<=txcrc^flags;end
       19:begin td<=result;txcrc<=txcrc^result;end
       20:td<=txcrc;
       default:begin td<=configuration[(index-2)*8+:8];txcrc<=txcrc^configuration[(index-2)*8+:8];end
      endcase
      send<=1;index<=index+1;
     end
    end
   end
  end
 end
endmodule
`default_nettype wire
