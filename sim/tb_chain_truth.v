`timescale 1ns/1ps
module tb_chain_truth;
 reg excite=0,feedback=0;reg [15:0] c=0;wire q;integer k;
 cbdc_puf_chain #(.N_STAGES(16),.GATE_INIT(4'h8),.AUTO_PARITY(0),.ELEMENT_STYLE(0)) chain(.excite_i(excite),.feedback_i(feedback),.c_i(c),.chain_o(q));
 initial begin
  for(k=0;k<65536;k=k+1) begin
   c=k;excite=0;feedback=0;#4;if(q!==(^(c))) $fatal(1,"Initialization parity");
   excite=1;feedback=1;#4;if(q!==~(^c)) $fatal(1,"Buffer/inverter truth");
  end
  $display("PASS: all 65536 challenge settings match fixed-AND chain initialization parity and buffer/inverter composition");$finish;
 end
endmodule
