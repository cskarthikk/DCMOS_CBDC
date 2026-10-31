`timescale 1ns / 1ps
`default_nettype none

//==============================================================================
// Module: cbdc_puf_element
// Description:
//   Single configurable delay element for the CBDC-PUF (Figure 1, Section 3.1).
//   Purely structural Xilinx 7-Series primitive implementation with DONT_TOUCH
//   preservation attributes. Contains ZERO simulation delays (#).
//
// Parameters:
//   ELEMENT_STYLE:
//     0 = Style P (Default, Decision A9):
//         - u_buf : LUT2 #(.INIT(4'hA)) non-inverting path (phi_i)
//         - u_inv : LUT2 #(.INIT(4'h5)) inverting path (psi_i)
//         - u_mux : LUT3 #(.INIT(8'hCA)) 2:1 path selector controlled by c_i
//         Output logic: sig_o = (c_i == 1'b0) ? sig_i : ~sig_i
//     1 = Style 2LUT (Table 1 count variant, 2 LUT2s per element):
//         - u_buf : LUT2 #(.INIT(4'hA)) buffer
//         - u_mux : LUT2 #(.INIT(4'h6)) XOR stage (experimental variant)
//==============================================================================
module cbdc_puf_element #(
    parameter integer ELEMENT_STYLE = 0
) (
    input  wire sig_i, // Input from previous stage (Q^i)
    input  wire c_i,   // Challenge bit C[i] (0 = buffer path, 1 = inverter path)
    output wire sig_o  // Output to next stage (Q^{i+1})
);

    generate
        if (ELEMENT_STYLE == 0) begin : gen_style_p
            // Internal nets between the parallel buffer/inverter LUTs and the select LUT3
            (* DONT_TOUCH = "TRUE" *) wire buf_path_w;
            (* DONT_TOUCH = "TRUE" *) wire inv_path_w;

            // Non-inverting path (Buffer): O = I0 (INIT = 4'b1010 = 4'hA)
            // I1 is tied to 1'b0 so both chains use identical LUT input pins.
            (* DONT_TOUCH = "TRUE" *)
            LUT2 #(
                .INIT(4'hA)
            ) u_buf (
                .O  (buf_path_w),
                .I0 (sig_i),
                .I1 (1'b0)
            );

            // Inverting path (Inverter): O = ~I0 (INIT = 4'b0101 = 4'h5)
            (* DONT_TOUCH = "TRUE" *)
            LUT2 #(
                .INIT(4'h5)
            ) u_inv (
                .O  (inv_path_w),
                .I0 (sig_i),
                .I1 (1'b0)
            );

            // 2:1 Select Mux: O = (~I2 & I0) | (I2 & I1) (INIT = 8'hCA)
            // When I2 (c_i) = 0 -> selects I0 (buf_path_w)
            // When I2 (c_i) = 1 -> selects I1 (inv_path_w)
            (* DONT_TOUCH = "TRUE" *)
            LUT3 #(
                .INIT(8'hCA)
            ) u_mux (
                .O  (sig_o),
                .I0 (buf_path_w),
                .I1 (inv_path_w),
                .I2 (c_i)
            );

        end else begin : gen_style_2lut
            // Table 1 2-LUT2 experimental variant (2 LUT2s per element = 64 LUT2s/instance)
            (* DONT_TOUCH = "TRUE" *) wire stage1_w;

            (* DONT_TOUCH = "TRUE" *)
            LUT2 #(
                .INIT(4'hA)
            ) u_lut_a (
                .O  (stage1_w),
                .I0 (sig_i),
                .I1 (c_i)
            );

            (* DONT_TOUCH = "TRUE" *)
            LUT2 #(
                .INIT(4'h6)
            ) u_lut_b (
                .O  (sig_o),
                .I0 (stage1_w),
                .I1 (c_i)
            );
        end
    endgenerate

endmodule

`default_nettype wire