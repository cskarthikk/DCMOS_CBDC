// Timing protocol: A6 lo hi wait capture XOR; reply 5A lo hi wait capture flags bit XOR.
// wait/capture are 1..255 cycles at 100MHz; zero requests are rejected.
`timescale 1ns/1ps
`default_nettype none
module cbdc_serial_engine_timing(input wire [7:0] wait_cycles,capture_cycles,input wire clk,reset,start,input wire [15:0] challenge,
 output wire valid,error,busy,response,output wire [1:0] edges);
 wire [15:0] c; wire excite,latch,clr,q; wire qb_seen,qu_seen;
 (* ASYNC_REG="TRUE", SHREG_EXTRACT="NO" *) reg [1:0] e1=0,e2=0;
 always @(posedge clk) if(reset) begin e1<=0;e2<=0;end else begin e1<={qu_seen,qb_seen};e2<=e1;end
 assign edges=e2;
 cbdc_puf_ctrl_timing u_ctrl(.wait_cycles_i(wait_cycles),.capture_cycles_i(capture_cycles),.clk(clk),.rst_n(~reset),.start_i(start),.challenge_i(challenge),
  .busy_o(busy),.resp_valid_o(valid),.resp_bit_o(response),.request_error_o(error),
  .puf_c_o(c),.puf_excite_o(excite),.puf_latch_o(latch),.puf_clr_o(clr),.puf_q_i(q));
 cbdc_puf_core #(.DIAGNOSTIC(1)) u_core(.c(c),.excite(excite),.latch(latch),.clr(clr),.q(q),
  .qb_capture_seen_o(qb_seen),.qu_capture_seen_o(qu_seen));
endmodule
// Request: A6 low high wait capture xor(previous 5).
// Reply: 5A low high wait capture flags bit xor(previous 7).
// Flags: bit0=accepted; bit1=Qb falling edge seen; bit2=Qu falling edge seen;
// bits5:4=11 timing/instrumented build; bit7=internal timeout.
// Reject unsupported challenge or zero timing => bit0=0, response=0.
// Stop-and-wait only: host must await reply before sending another request.
module cbdc_puf_serial_timing #(parameter integer UART_CLKS=868)(
 input wire clk,btnU,uart_rx,output wire uart_tx,output wire [15:0] led);
 reg [4:0] por=0;wire pr=~por[4];
 always @(posedge clk) if(pr) por<=por+1;
 wire button; cbdc_button u_reset(.clk(clk),.reset(pr),.raw_i(btnU),.level_o(button));
 wire reset=pr|button;
 wire [7:0] rd;wire received,framing,tx_busy;
 reg send=0;reg [7:0] td=0;
 cbdc_uart #(.CLKS(UART_CLKS)) uart(.clk(clk),.reset(reset),.rx(uart_rx),.send(send),
  .tx_data(td),.tx(uart_tx),.busy(tx_busy),.rx_data(rd),.received(received),.framing_error(framing));
 reg [2:0] parser=0,state=0; reg [3:0] index=0;
 reg [7:0] wait_cycles=8,capture_cycles=8;
 reg [15:0] challenge=0;
 reg [31:0] timeout=0,partial_timeout=0;
 reg start=0;wire valid,error,busy,response;wire [1:0] edges;
 reg [7:0] flags=0,bitbyte=0;reg done=0;
 cbdc_serial_engine_timing u_puf(.wait_cycles(wait_cycles),.capture_cycles(capture_cycles),.clk(clk),.reset(reset),.start(start),.challenge(challenge),
  .valid(valid),.error(error),.busy(busy),.response(response),.edges(edges));
 assign led={11'b0,1'b1,busy,~flags[0]&done,done,bitbyte[0]};
 always @(posedge clk) begin
  if(reset) begin parser<=0;state<=0;index<=0;challenge<=0;timeout<=0;partial_timeout<=0;
   start<=0;send<=0;td<=0;flags<=0;bitbyte<=0;done<=0;wait_cycles<=8;capture_cycles<=8;end
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
     case(parser)
      0: if(rd==8'ha6) parser<=1;
      1: begin challenge[7:0]<=rd;parser<=2;end
      2: begin challenge[15:8]<=rd;parser<=3;end
      3: begin wait_cycles<=rd;parser<=4;end
      4: begin capture_cycles<=rd;parser<=5;end
      5: begin parser<=0;if(rd==(8'ha6^challenge[7:0]^challenge[15:8]^wait_cycles^capture_cycles)) begin
       start<=1;state<=1;timeout<=0;done<=0;end end
      default: parser<=0;
     endcase
    end
   end else if(state==1) begin
    timeout<=timeout+1;
    if(valid || error || timeout==10000) begin
     flags<=valid?{2'b0,2'b11,1'b0,edges,1'b1}:(error?8'h30:8'hb0);
     bitbyte<=valid?{7'b0,response}:8'b0;
     state<=2;index<=0;done<=1;
    end
   end else if(state==2) begin
    if(!tx_busy && !send) begin
     if(index==8) begin state<=0;index<=0;end
     else begin
      case(index)
       0:td<=8'h5a;1:td<=challenge[7:0];2:td<=challenge[15:8];3:td<=wait_cycles;4:td<=capture_cycles;5:td<=flags;6:td<=bitbyte;
       7:td<=8'h5a^challenge[7:0]^challenge[15:8]^wait_cycles^capture_cycles^flags^bitbyte;
      endcase
      send<=1;index<=index+1;
     end
    end
   end
  end
 end
endmodule
`default_nettype wire
