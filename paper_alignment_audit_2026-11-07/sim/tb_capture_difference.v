`timescale 1ns/1ps
module tb_capture_difference;
 reg [15:0] c=16'h0001;reg excite=0,latch=0,clr=1;
 reg qu=1,qb=1;wire first_q,paper_q;
 cbdc_puf_core #(.AUTO_PARITY(0),.CAPTURE_MODE(1),.DUAL_ARBITER(1),.DIAGNOSTIC(1)) first_core
 (.c(c),.excite(excite),.latch(latch),.clr(clr),.q(first_q));
 cbdc_puf_core #(.AUTO_PARITY(0),.CAPTURE_MODE(0),.DUAL_ARBITER(0),.DIAGNOSTIC(0)) paper_core
 (.c(c),.excite(excite),.latch(latch),.clr(clr),.q(paper_q));
 initial begin
 force first_core.qu_w=qu;force first_core.qb_w=qb;
 force paper_core.qu_w=qu;force paper_core.qb_w=qb;
 #2;clr=0;#2;excite=1;
 #2;qb=0;#2;
 if(first_q!==1 || paper_q!==0) $fatal(1,"First edge should capture only in old mode while Latch is low");
 if(first_core.qb_capture_seen_o!==1) $fatal(1,"Old activity flag should already be high");
 qb=1;qu=0;#2;latch=1;#2;qb=0;#2;
 if(first_q!==1 || paper_q!==0) $fatal(1,"Paper CE captures later edge; old first-edge core remains locked");
 qb=1;qu=1;#2;qb=0;#2;
 if(paper_q!==1) $fatal(1,"Paper CE must allow subsequent edges");
 latch=0;qb=1;qu=0;#2;qb=0;#2;
 if(paper_q!==1) $fatal(1,"Paper CE must retain after Latch falls");
 $display("PASS: old core captures before Latch, locks out later edges, and raises activity before the paper capture window; CE-controlled core follows Latch and holds correctly.");
 $finish;
 end
endmodule
