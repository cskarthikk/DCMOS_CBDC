// Blackbox primitives for pure synthesizable RTL linting
module LUT2 #(parameter [3:0] INIT = 4'h0) (output wire O, input wire I0, I1);
    assign O = ((INIT >> {I1, I0}) & 4'd1) != 4'd0;
endmodule

module LUT3 #(parameter [7:0] INIT = 8'h00) (output wire O, input wire I0, I1, I2);
    assign O = ((INIT >> {I2, I1, I0}) & 8'd1) != 8'd0;
endmodule

module FDCE_1 #(parameter [0:0] INIT = 1'b0) (output reg Q, input wire C, CE, CLR, D);
    initial Q = INIT;
    always @(negedge C or posedge CLR) begin
        if (CLR) Q <= 1'b0;
        else if (CE) Q <= D;
    end
endmodule
