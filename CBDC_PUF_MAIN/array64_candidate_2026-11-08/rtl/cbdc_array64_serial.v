`timescale 1ns/1ps
`default_nettype none
// 64-core candidate: request A6/control/128 config bytes/XOR; reply D6/control/128 actual config bytes/status/8 response bytes/XOR.
// control[0]: sequential diagnostic; [7:1]: excite wait in 100-MHz cycles, 1..127.
// Reply 5C, control, 16 actual latched configuration bytes, flags, raw word, XOR.
// 61=all completed; 60=rejected; E0=timeout/error. No activity monitor flags exist.
module cbdc_array64_serial #(parameter integer UART_CLKS=868, CORE_COUNT=64)(
 input wire clk,btnU,uart_rx,output wire uart_tx,output wire [15:0] led);
 reg [4:0] por=0;wire pr=~por[4];always @(posedge clk) if(pr) por<=por+1;
 wire button;cbdc_button u_reset(.clk(clk),.reset(pr),.raw_i(btnU),.level_o(button));wire reset=pr|button;
 wire [7:0] rd;wire received,framing,tx_busy;reg send=0;reg [7:0] td=0;
 cbdc_uart #(.CLKS(UART_CLKS)) uart(.clk(clk),.reset(reset),.rx(uart_rx),.send(send),.tx_data(td),.tx(uart_tx),.busy(tx_busy),.rx_data(rd),.received(received),.framing_error(framing));
 localparam integer CONFIG_BYTES=2*CORE_COUNT;
 localparam integer WORD_BYTES=CORE_COUNT/8;
 localparam integer FLAGS_INDEX=CONFIG_BYTES+2;
 localparam integer RESPONSE_BEGIN=CONFIG_BYTES+3;
 localparam integer REPLY_BYTES=4+CONFIG_BYTES+WORD_BYTES;
 localparam integer INDEX_WIDTH=$clog2(REPLY_BYTES+1);
 localparam integer CORE_WIDTH=$clog2(CORE_COUNT);
 reg [1:0] state=0;reg [INDEX_WIDTH-1:0] parser=0,index=0;reg [16*CORE_COUNT-1:0] challenge=0;
 reg [7:0] control=0,crc=0,txcrc=0,flags=0;reg [CORE_COUNT-1:0] start=0,done_mask=0,result=0;
 reg [CORE_WIDTH-1:0] active_core=0;reg [31:0] timeout=0,partial_timeout=0;
 wire [CORE_COUNT-1:0] valid,error,busy,response,parity;wire [16*CORE_COUNT-1:0] configuration;
 genvar g;
 generate for(g=0;g<CORE_COUNT;g=g+1) begin:gen_core
  assign parity[g]=^challenge[g*16+:16];
  cbdc_serial_engine u_engine(.clk(clk),.reset(reset),.start(start[g]),.challenge(challenge[g*16+:16]),.excite_cycles({1'b0,control[7:1]}),
   .valid(valid[g]),.error(error[g]),.busy(busy[g]),.response(response[g]),.configuration(configuration[g*16+:16]));
 end endgenerate
 assign led={4'b0,1'b1,(|busy),state==2,state==0,result[7:0]};
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
     if(parser==0) begin if(rd==8'ha6) begin parser<=1;crc<=8'ha6;end end
     else if(parser==1) begin control<=rd;crc<=crc^rd;parser<=2;end
     else if(parser<=CONFIG_BYTES+1) begin challenge[(parser-2)*8+:8]<=rd;crc<=crc^rd;parser<=parser+1;end
     else begin
      parser<=0;
      if(rd==crc) begin
       done_mask<=0;result<=0;timeout<=0;active_core<=0;
       if((control[7:1]!=0) && (&parity)) begin start<=control[0]?{{(CORE_COUNT-1){1'b0}},1'b1}:{CORE_COUNT{1'b1}};state<=1;end
       else begin flags<=8'h60;state<=2;index<=0;txcrc<=0;end
      end
     end
    end
   end else if(state==1) begin
    timeout<=timeout+1;
    for(k=0;k<CORE_COUNT;k=k+1) if(valid[k]) begin done_mask[k]<=1;result[k]<=response[k];end
    if(control[0] && valid[active_core] && active_core<CORE_COUNT-1) begin active_core<=active_core+1;start<={{(CORE_COUNT-1){1'b0}},1'b1}<<(active_core+1);end
    if(&done_mask) begin flags<=8'h61;state<=2;index<=0;txcrc<=0;end
    else if((|error) || timeout==20000) begin flags<=8'he0;state<=2;index<=0;txcrc<=0;end
   end else if(state==2) begin
    if(!tx_busy && !send) begin
     if(index==REPLY_BYTES) begin state<=0;index<=0;end
     else begin
      case(index)
       0:begin td<=8'hd6;txcrc<=8'hd6;end
       1:begin td<=control;txcrc<=txcrc^control;end
       FLAGS_INDEX:begin td<=flags;txcrc<=txcrc^flags;end
       
       REPLY_BYTES-1:td<=txcrc;
       default:begin
        if(index>=RESPONSE_BEGIN) begin td<=result[(index-RESPONSE_BEGIN)*8+:8];txcrc<=txcrc^result[(index-RESPONSE_BEGIN)*8+:8];end
        else begin td<=configuration[(index-2)*8+:8];txcrc<=txcrc^configuration[(index-2)*8+:8];end
       end
      endcase
      send<=1;index<=index+1;
     end
    end
   end
  end
 end
endmodule
`default_nettype wire
