`timescale 1ns/1ps
module tb_invalid_params;
    // Run separately: success means simulator returns NONZERO before reaching #1.
    cbdc_puf_ctrl #(.HOLD_CYCLES(2)) invalid ();
    initial begin #1; $display("ERROR: invalid parameter accepted"); $finish; end
endmodule
