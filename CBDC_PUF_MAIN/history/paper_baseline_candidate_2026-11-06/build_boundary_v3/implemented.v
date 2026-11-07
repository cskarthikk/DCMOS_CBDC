// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sat Nov  7 04:04:10 2026
// Host        : CsKarthik running 64-bit major release  (build 9200)
// Command     : write_verilog
//               C:/BTech/Semester_5/DCMOS/Project/paper_baseline_candidate_2026-11-06/build_boundary_v3/implemented.v
// Design      : cbdc_puf_serial
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* STABLE_CYCLES = "1000000" *) (* W = "20" *) 
module cbdc_button
   (clk,
    reset,
    raw_i,
    level_o);
  input clk;
  input reset;
  input raw_i;
  output level_o;

  wire \<const0> ;
  wire \<const1> ;
  wire clk;
  wire \count[0]_i_1_n_0 ;
  wire \count[0]_i_3_n_0 ;
  wire [19:0]count_reg;
  wire \count_reg[0]_i_2_n_0 ;
  wire \count_reg[0]_i_2_n_4 ;
  wire \count_reg[0]_i_2_n_5 ;
  wire \count_reg[0]_i_2_n_6 ;
  wire \count_reg[0]_i_2_n_7 ;
  wire \count_reg[12]_i_1_n_0 ;
  wire \count_reg[12]_i_1_n_4 ;
  wire \count_reg[12]_i_1_n_5 ;
  wire \count_reg[12]_i_1_n_6 ;
  wire \count_reg[12]_i_1_n_7 ;
  wire \count_reg[16]_i_1_n_4 ;
  wire \count_reg[16]_i_1_n_5 ;
  wire \count_reg[16]_i_1_n_6 ;
  wire \count_reg[16]_i_1_n_7 ;
  wire \count_reg[4]_i_1_n_0 ;
  wire \count_reg[4]_i_1_n_4 ;
  wire \count_reg[4]_i_1_n_5 ;
  wire \count_reg[4]_i_1_n_6 ;
  wire \count_reg[4]_i_1_n_7 ;
  wire \count_reg[8]_i_1_n_0 ;
  wire \count_reg[8]_i_1_n_4 ;
  wire \count_reg[8]_i_1_n_5 ;
  wire \count_reg[8]_i_1_n_6 ;
  wire \count_reg[8]_i_1_n_7 ;
  wire level_o;
  wire level_o_i_1_n_0;
  wire level_o_i_2_n_0;
  wire level_o_i_3_n_0;
  wire level_o_i_4_n_0;
  wire level_o_i_5_n_0;
  wire level_o_i_6_n_0;
  wire level_o_i_7_n_0;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire meta;
  wire raw_i;
  wire reset;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire synced;
  wire [3:0]\NLW_count_reg[0]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_count_reg[8]_i_1_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT4 #(
    .INIT(16'hFFEB)) 
    \count[0]_i_1 
       (.I0(level_o_i_2_n_0),
        .I1(synced),
        .I2(level_o),
        .I3(reset),
        .O(\count[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_3 
       (.I0(count_reg[0]),
        .O(\count[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[0]_i_2_n_7 ),
        .Q(count_reg[0]),
        .R(\count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \count_reg[0]_i_2 
       (.CI(\<const0> ),
        .CO({\count_reg[0]_i_2_n_0 ,\NLW_count_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\count_reg[0]_i_2_n_4 ,\count_reg[0]_i_2_n_5 ,\count_reg[0]_i_2_n_6 ,\count_reg[0]_i_2_n_7 }),
        .S({count_reg[3:1],\count[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[8]_i_1_n_5 ),
        .Q(count_reg[10]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[8]_i_1_n_4 ),
        .Q(count_reg[11]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[12]_i_1_n_7 ),
        .Q(count_reg[12]),
        .R(\count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \count_reg[12]_i_1 
       (.CI(\count_reg[8]_i_1_n_0 ),
        .CO({\count_reg[12]_i_1_n_0 ,\NLW_count_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[12]_i_1_n_4 ,\count_reg[12]_i_1_n_5 ,\count_reg[12]_i_1_n_6 ,\count_reg[12]_i_1_n_7 }),
        .S(count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[13] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[12]_i_1_n_6 ),
        .Q(count_reg[13]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[14] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[12]_i_1_n_5 ),
        .Q(count_reg[14]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[15] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[12]_i_1_n_4 ),
        .Q(count_reg[15]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[16] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[16]_i_1_n_7 ),
        .Q(count_reg[16]),
        .R(\count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \count_reg[16]_i_1 
       (.CI(\count_reg[12]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[16]_i_1_n_4 ,\count_reg[16]_i_1_n_5 ,\count_reg[16]_i_1_n_6 ,\count_reg[16]_i_1_n_7 }),
        .S(count_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[17] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[16]_i_1_n_6 ),
        .Q(count_reg[17]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[18] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[16]_i_1_n_5 ),
        .Q(count_reg[18]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[19] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[16]_i_1_n_4 ),
        .Q(count_reg[19]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[0]_i_2_n_6 ),
        .Q(count_reg[1]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[0]_i_2_n_5 ),
        .Q(count_reg[2]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[0]_i_2_n_4 ),
        .Q(count_reg[3]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[4]_i_1_n_7 ),
        .Q(count_reg[4]),
        .R(\count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \count_reg[4]_i_1 
       (.CI(\count_reg[0]_i_2_n_0 ),
        .CO({\count_reg[4]_i_1_n_0 ,\NLW_count_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[4]_i_1_n_4 ,\count_reg[4]_i_1_n_5 ,\count_reg[4]_i_1_n_6 ,\count_reg[4]_i_1_n_7 }),
        .S(count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[4]_i_1_n_6 ),
        .Q(count_reg[5]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[4]_i_1_n_5 ),
        .Q(count_reg[6]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[4]_i_1_n_4 ),
        .Q(count_reg[7]),
        .R(\count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[8]_i_1_n_7 ),
        .Q(count_reg[8]),
        .R(\count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \count_reg[8]_i_1 
       (.CI(\count_reg[4]_i_1_n_0 ),
        .CO({\count_reg[8]_i_1_n_0 ,\NLW_count_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[8]_i_1_n_4 ,\count_reg[8]_i_1_n_5 ,\count_reg[8]_i_1_n_6 ,\count_reg[8]_i_1_n_7 }),
        .S(count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\count_reg[8]_i_1_n_6 ),
        .Q(count_reg[9]),
        .R(\count[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00AC)) 
    level_o_i_1
       (.I0(synced),
        .I1(level_o),
        .I2(level_o_i_2_n_0),
        .I3(reset),
        .O(level_o_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000004)) 
    level_o_i_2
       (.I0(level_o_i_3_n_0),
        .I1(level_o_i_4_n_0),
        .I2(level_o_i_5_n_0),
        .I3(level_o_i_6_n_0),
        .I4(level_o_i_7_n_0),
        .O(level_o_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFF7)) 
    level_o_i_3
       (.I0(count_reg[16]),
        .I1(count_reg[1]),
        .I2(count_reg[11]),
        .I3(count_reg[7]),
        .O(level_o_i_3_n_0));
  LUT4 #(
    .INIT(16'h0040)) 
    level_o_i_4
       (.I0(count_reg[12]),
        .I1(count_reg[19]),
        .I2(count_reg[4]),
        .I3(count_reg[8]),
        .O(level_o_i_4_n_0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    level_o_i_5
       (.I0(count_reg[17]),
        .I1(count_reg[6]),
        .I2(count_reg[18]),
        .I3(count_reg[14]),
        .O(level_o_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    level_o_i_6
       (.I0(count_reg[2]),
        .I1(count_reg[13]),
        .I2(count_reg[0]),
        .I3(count_reg[10]),
        .O(level_o_i_6_n_0));
  LUT4 #(
    .INIT(16'hFF7F)) 
    level_o_i_7
       (.I0(count_reg[9]),
        .I1(count_reg[5]),
        .I2(count_reg[3]),
        .I3(count_reg[15]),
        .O(level_o_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    level_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(level_o_i_1_n_0),
        .Q(level_o),
        .R(\<const0> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    meta_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(raw_i),
        .Q(meta),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    synced_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(meta),
        .Q(synced),
        .R(reset));
endmodule

(* AUTO_PARITY = "0" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) 
module cbdc_puf_chain
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire excite_i;
  wire feedback_i;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__1 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__11 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__12 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__13 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__14 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__15 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__2 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__3 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__4 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__5 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__6 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__7 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__8 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__9 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__10 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h8)) 
    \gen_fixed_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .O(node_w[0]));
endmodule

(* AUTO_PARITY = "0" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__1
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire excite_i;
  wire feedback_i;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__31 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__21 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__20 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__19 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__18 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__17 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__16 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__30 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__29 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__28 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__27 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__26 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__25 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__24 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__23 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__22 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h8)) 
    \gen_fixed_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .O(node_w[0]));
endmodule

(* AUTO_PARITY = "0" *) (* CAPTURE_MODE = "0" *) (* CROSS_COUPLE = "1" *) 
(* DIAGNOSTIC = "0" *) (* DUAL_ARBITER = "0" *) (* ELEMENT_STYLE = "0" *) 
(* GATE_INIT = "4'b1000" *) (* N_STAGES = "16" *) 
module cbdc_puf_core
   (c,
    excite,
    latch,
    clr,
    q,
    q_comp_o,
    race_valid_o,
    qb_capture_seen_o,
    qu_capture_seen_o);
  input [15:0]c;
  input excite;
  input latch;
  input clr;
  output q;
  output q_comp_o;
  output race_valid_o;
  output qb_capture_seen_o;
  output qu_capture_seen_o;

  wire \<const0> ;
  wire [15:0]c;
  wire clr;
  wire excite;
  wire latch;
  wire q;
  (* DONT_TOUCH *) wire qb_first_edge_seen_w;
  (* DONT_TOUCH *) wire qb_w;
  (* DONT_TOUCH *) wire qu_first_edge_seen_w;
  (* DONT_TOUCH *) wire qu_w;

  GND GND
       (.G(\<const0> ));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(\<const0> ),
        .O(qb_first_edge_seen_w));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(\<const0> ),
        .O(qu_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    u_arbiter_dff
       (.C(qb_w),
        .CE(latch),
        .CLR(clr),
        .D(qu_w),
        .Q(q));
  (* AUTO_PARITY = "0" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain u_chain_lower
       (.c_i(c),
        .chain_o(qb_w),
        .excite_i(excite),
        .feedback_i(qu_w));
  (* AUTO_PARITY = "0" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__1 u_chain_upper
       (.c_i(c),
        .chain_o(qu_w),
        .excite_i(excite),
        .feedback_i(qb_w));
endmodule

(* AUTO_PARITY = "0" *) (* CLR_CYCLES = "4" *) (* EXCITE_CYCLES = "8" *) 
(* GATE_INIT = "4'b1000" *) (* HOLD_CYCLES = "4" *) (* INIT_SETTLE_CYCLES = "4" *) 
(* LATCH_CYCLES = "8" *) (* N_STAGES = "16" *) (* ST_DONE = "3'b111" *) 
(* ST_DROP_EXCITE = "3'b110" *) (* ST_DROP_LATCH = "3'b101" *) (* ST_EXCITE = "3'b011" *) 
(* ST_IDLE = "3'b000" *) (* ST_INIT_CLR = "3'b001" *) (* ST_INIT_SETTLE = "3'b010" *) 
(* ST_LATCH = "3'b100" *) 
module cbdc_puf_ctrl
   (clk,
    .rst_n(busy_o_i_1_n_0),
    start_i,
    challenge_i,
    busy_o,
    resp_valid_o,
    request_error_o,
    resp_bit_o,
    puf_c_o,
    puf_excite_o,
    puf_latch_o,
    puf_clr_o,
    puf_q_i);
  input clk;
  input start_i;
  input [15:0]challenge_i;
  output busy_o;
  output resp_valid_o;
  output request_error_o;
  output resp_bit_o;
  output [15:0]puf_c_o;
  output puf_excite_o;
  output puf_latch_o;
  output puf_clr_o;
  input puf_q_i;
  input busy_o_i_1_n_0;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_sequential_state_r[0]_i_1_n_0 ;
  wire \FSM_sequential_state_r[1]_i_1_n_0 ;
  wire \FSM_sequential_state_r[2]_i_1_n_0 ;
  wire busy_o;
  wire busy_o_i_1_n_0;
  wire busy_o_i_2_n_0;
  wire busy_o_i_3_n_0;
  wire busy_o_i_4_n_0;
  wire busy_o_i_5_n_0;
  wire busy_o_i_6_n_0;
  wire busy_o_i_7_n_0;
  wire busy_o_i_8_n_0;
  wire [15:0]challenge_i;
  wire clk;
  wire [15:0]puf_c_o;
  wire \puf_c_o[15]_i_1_n_0 ;
  wire puf_clr_o;
  wire puf_clr_o_i_1_n_0;
  wire puf_excite_o;
  wire puf_excite_o_i_1_n_0;
  wire puf_latch_o;
  wire puf_latch_o_i_1_n_0;
  wire puf_latch_o_i_2_n_0;
  wire puf_latch_o_i_3_n_0;
  wire puf_q_i;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync1_r;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync2_r;
  wire request_error_o;
  wire request_error_o_i_1_n_0;
  wire request_error_o_i_2_n_0;
  wire resp_bit_o;
  wire resp_bit_o_i_1_n_0;
  wire resp_bit_o_i_2_n_0;
  wire resp_bit_o_i_3_n_0;
  wire resp_bit_o_i_4_n_0;
  wire resp_bit_o_i_5_n_0;
  wire resp_valid_o;
  wire resp_valid_o_i_1_n_0;
  wire start_i;
  wire [2:0]state_r;
  wire [15:0]timer_r;
  wire \timer_r[15]_i_1_n_0 ;
  wire \timer_r_reg[12]_i_2_n_0 ;
  wire \timer_r_reg[12]_i_2_n_4 ;
  wire \timer_r_reg[12]_i_2_n_5 ;
  wire \timer_r_reg[12]_i_2_n_6 ;
  wire \timer_r_reg[12]_i_2_n_7 ;
  wire \timer_r_reg[15]_i_3_n_5 ;
  wire \timer_r_reg[15]_i_3_n_6 ;
  wire \timer_r_reg[15]_i_3_n_7 ;
  wire \timer_r_reg[4]_i_2_n_0 ;
  wire \timer_r_reg[4]_i_2_n_4 ;
  wire \timer_r_reg[4]_i_2_n_5 ;
  wire \timer_r_reg[4]_i_2_n_6 ;
  wire \timer_r_reg[4]_i_2_n_7 ;
  wire \timer_r_reg[8]_i_2_n_0 ;
  wire \timer_r_reg[8]_i_2_n_4 ;
  wire \timer_r_reg[8]_i_2_n_5 ;
  wire \timer_r_reg[8]_i_2_n_6 ;
  wire \timer_r_reg[8]_i_2_n_7 ;
  wire \timer_r_reg_n_0_[0] ;
  wire \timer_r_reg_n_0_[10] ;
  wire \timer_r_reg_n_0_[11] ;
  wire \timer_r_reg_n_0_[12] ;
  wire \timer_r_reg_n_0_[13] ;
  wire \timer_r_reg_n_0_[14] ;
  wire \timer_r_reg_n_0_[15] ;
  wire \timer_r_reg_n_0_[1] ;
  wire \timer_r_reg_n_0_[2] ;
  wire \timer_r_reg_n_0_[3] ;
  wire \timer_r_reg_n_0_[4] ;
  wire \timer_r_reg_n_0_[5] ;
  wire \timer_r_reg_n_0_[6] ;
  wire \timer_r_reg_n_0_[7] ;
  wire \timer_r_reg_n_0_[8] ;
  wire \timer_r_reg_n_0_[9] ;
  wire [3:0]\NLW_timer_r_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_timer_r_reg[4]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_timer_r_reg[8]_i_2_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h22F022F0CF44CF77)) 
    \FSM_sequential_state_r[0]_i_1 
       (.I0(puf_latch_o_i_2_n_0),
        .I1(state_r[2]),
        .I2(resp_bit_o_i_2_n_0),
        .I3(state_r[1]),
        .I4(busy_o_i_4_n_0),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h26AE2626)) 
    \FSM_sequential_state_r[1]_i_1 
       (.I0(state_r[1]),
        .I1(state_r[0]),
        .I2(resp_bit_o_i_2_n_0),
        .I3(state_r[2]),
        .I4(puf_latch_o_i_2_n_0),
        .O(\FSM_sequential_state_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h7078)) 
    \FSM_sequential_state_r[2]_i_1 
       (.I0(state_r[1]),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(puf_latch_o_i_2_n_0),
        .O(\FSM_sequential_state_r[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_r_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[0]_i_1_n_0 ),
        .Q(state_r[0]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_r_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[1]_i_1_n_0 ),
        .Q(state_r[1]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_r_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[2]_i_1_n_0 ),
        .Q(state_r[2]),
        .R(busy_o_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT3 #(
    .INIT(8'h81)) 
    busy_o_i_2
       (.I0(state_r[2]),
        .I1(state_r[0]),
        .I2(state_r[1]),
        .O(busy_o_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    busy_o_i_3
       (.I0(state_r[2]),
        .I1(busy_o_i_4_n_0),
        .O(busy_o_i_3_n_0));
  LUT5 #(
    .INIT(32'hD77D7DD7)) 
    busy_o_i_4
       (.I0(start_i),
        .I1(busy_o_i_5_n_0),
        .I2(busy_o_i_6_n_0),
        .I3(busy_o_i_7_n_0),
        .I4(busy_o_i_8_n_0),
        .O(busy_o_i_4_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    busy_o_i_5
       (.I0(challenge_i[5]),
        .I1(challenge_i[4]),
        .I2(challenge_i[3]),
        .I3(challenge_i[2]),
        .O(busy_o_i_5_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    busy_o_i_6
       (.I0(challenge_i[1]),
        .I1(challenge_i[0]),
        .I2(challenge_i[7]),
        .I3(challenge_i[6]),
        .O(busy_o_i_6_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    busy_o_i_7
       (.I0(challenge_i[13]),
        .I1(challenge_i[12]),
        .I2(challenge_i[11]),
        .I3(challenge_i[10]),
        .O(busy_o_i_7_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    busy_o_i_8
       (.I0(challenge_i[9]),
        .I1(challenge_i[8]),
        .I2(challenge_i[15]),
        .I3(challenge_i[14]),
        .O(busy_o_i_8_n_0));
  FDRE #(
    .INIT(1'b0)) 
    busy_o_reg
       (.C(clk),
        .CE(busy_o_i_2_n_0),
        .D(busy_o_i_3_n_0),
        .Q(busy_o),
        .R(busy_o_i_1_n_0));
  LUT5 #(
    .INIT(32'h00020000)) 
    \puf_c_o[15]_i_1 
       (.I0(request_error_o_i_2_n_0),
        .I1(state_r[1]),
        .I2(state_r[0]),
        .I3(state_r[2]),
        .I4(start_i),
        .O(\puf_c_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[0] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[0]),
        .Q(puf_c_o[0]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[10] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[10]),
        .Q(puf_c_o[10]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[11] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[11]),
        .Q(puf_c_o[11]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[12] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[12]),
        .Q(puf_c_o[12]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[13] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[13]),
        .Q(puf_c_o[13]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[14] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[14]),
        .Q(puf_c_o[14]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[15] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[15]),
        .Q(puf_c_o[15]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[1] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[1]),
        .Q(puf_c_o[1]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[2] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[2]),
        .Q(puf_c_o[2]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[3] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[3]),
        .Q(puf_c_o[3]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[4] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[4]),
        .Q(puf_c_o[4]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[5] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[5]),
        .Q(puf_c_o[5]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[6] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[6]),
        .Q(puf_c_o[6]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[7] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[7]),
        .Q(puf_c_o[7]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[8] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[8]),
        .Q(puf_c_o[8]),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \puf_c_o_reg[9] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[9]),
        .Q(puf_c_o[9]),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hF00A0003000A0003)) 
    puf_clr_o_i_1
       (.I0(resp_bit_o_i_2_n_0),
        .I1(busy_o_i_4_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_clr_o),
        .O(puf_clr_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    puf_clr_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_clr_o_i_1_n_0),
        .Q(puf_clr_o),
        .R(busy_o_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hF81C381C)) 
    puf_excite_o_i_1
       (.I0(resp_bit_o_i_2_n_0),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(state_r[0]),
        .I4(puf_excite_o),
        .O(puf_excite_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    puf_excite_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_excite_o_i_1_n_0),
        .Q(puf_excite_o),
        .R(busy_o_i_1_n_0));
  LUT5 #(
    .INIT(32'hD0081008)) 
    puf_latch_o_i_1
       (.I0(puf_latch_o_i_2_n_0),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(state_r[0]),
        .I4(puf_latch_o),
        .O(puf_latch_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    puf_latch_o_i_2
       (.I0(\timer_r_reg_n_0_[10] ),
        .I1(\timer_r_reg_n_0_[5] ),
        .I2(\timer_r_reg_n_0_[7] ),
        .I3(resp_bit_o_i_3_n_0),
        .I4(resp_bit_o_i_4_n_0),
        .I5(puf_latch_o_i_3_n_0),
        .O(puf_latch_o_i_2_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    puf_latch_o_i_3
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(puf_latch_o_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    puf_latch_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_latch_o_i_1_n_0),
        .Q(puf_latch_o),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    q_sync1_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_q_i),
        .Q(q_sync1_r),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    q_sync2_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(q_sync1_r),
        .Q(q_sync2_r),
        .R(busy_o_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000100)) 
    request_error_o_i_1
       (.I0(state_r[1]),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(start_i),
        .I4(request_error_o_i_2_n_0),
        .O(request_error_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    request_error_o_i_2
       (.I0(busy_o_i_8_n_0),
        .I1(busy_o_i_7_n_0),
        .I2(busy_o_i_6_n_0),
        .I3(busy_o_i_5_n_0),
        .O(request_error_o_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    request_error_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(request_error_o_i_1_n_0),
        .Q(request_error_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    resp_bit_o_i_1
       (.I0(q_sync2_r),
        .I1(resp_bit_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o),
        .O(resp_bit_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    resp_bit_o_i_2
       (.I0(\timer_r_reg_n_0_[10] ),
        .I1(\timer_r_reg_n_0_[5] ),
        .I2(\timer_r_reg_n_0_[7] ),
        .I3(resp_bit_o_i_3_n_0),
        .I4(resp_bit_o_i_4_n_0),
        .I5(resp_bit_o_i_5_n_0),
        .O(resp_bit_o_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    resp_bit_o_i_3
       (.I0(\timer_r_reg_n_0_[15] ),
        .I1(\timer_r_reg_n_0_[6] ),
        .I2(\timer_r_reg_n_0_[3] ),
        .I3(\timer_r_reg_n_0_[11] ),
        .O(resp_bit_o_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    resp_bit_o_i_4
       (.I0(\timer_r_reg_n_0_[4] ),
        .I1(\timer_r_reg_n_0_[8] ),
        .I2(\timer_r_reg_n_0_[14] ),
        .I3(\timer_r_reg_n_0_[13] ),
        .I4(\timer_r_reg_n_0_[12] ),
        .I5(\timer_r_reg_n_0_[9] ),
        .O(resp_bit_o_i_4_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    resp_bit_o_i_5
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(resp_bit_o_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    resp_bit_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_bit_o_i_1_n_0),
        .Q(resp_bit_o),
        .R(busy_o_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h80)) 
    resp_valid_o_i_1
       (.I0(state_r[0]),
        .I1(state_r[1]),
        .I2(state_r[2]),
        .O(resp_valid_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    resp_valid_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_valid_o_i_1_n_0),
        .Q(resp_valid_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h4554455044044000)) 
    \timer_r[0]_i_1 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[0]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[10]_i_1 
       (.I0(\timer_r_reg[12]_i_2_n_6 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[10]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[11]_i_1 
       (.I0(\timer_r_reg[12]_i_2_n_5 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[11]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[12]_i_1 
       (.I0(\timer_r_reg[12]_i_2_n_4 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[12]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[13]_i_1 
       (.I0(\timer_r_reg[15]_i_3_n_7 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[13]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[14]_i_1 
       (.I0(\timer_r_reg[15]_i_3_n_6 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[14]));
  LUT4 #(
    .INIT(16'h55FB)) 
    \timer_r[15]_i_1 
       (.I0(state_r[1]),
        .I1(busy_o_i_4_n_0),
        .I2(state_r[0]),
        .I3(state_r[2]),
        .O(\timer_r[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[15]_i_2 
       (.I0(\timer_r_reg[15]_i_3_n_5 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[15]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[1]_i_1 
       (.I0(\timer_r_reg[4]_i_2_n_7 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[1]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[2]_i_1 
       (.I0(\timer_r_reg[4]_i_2_n_6 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[2]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[3]_i_1 
       (.I0(\timer_r_reg[4]_i_2_n_5 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[3]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[4]_i_1 
       (.I0(\timer_r_reg[4]_i_2_n_4 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[4]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[5]_i_1 
       (.I0(\timer_r_reg[8]_i_2_n_7 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[5]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[6]_i_1 
       (.I0(\timer_r_reg[8]_i_2_n_6 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[6]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[7]_i_1 
       (.I0(\timer_r_reg[8]_i_2_n_5 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[7]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[8]_i_1 
       (.I0(\timer_r_reg[8]_i_2_n_4 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[8]));
  LUT6 #(
    .INIT(64'h8AA88AA088088000)) 
    \timer_r[9]_i_1 
       (.I0(\timer_r_reg[12]_i_2_n_7 ),
        .I1(puf_latch_o_i_2_n_0),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(state_r[2]),
        .I5(resp_bit_o_i_2_n_0),
        .O(timer_r[9]));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[0] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[0]),
        .Q(\timer_r_reg_n_0_[0] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[10] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[10]),
        .Q(\timer_r_reg_n_0_[10] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[11] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[11]),
        .Q(\timer_r_reg_n_0_[11] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[12] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[12]),
        .Q(\timer_r_reg_n_0_[12] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[12]_i_2 
       (.CI(\timer_r_reg[8]_i_2_n_0 ),
        .CO({\timer_r_reg[12]_i_2_n_0 ,\NLW_timer_r_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[12]_i_2_n_4 ,\timer_r_reg[12]_i_2_n_5 ,\timer_r_reg[12]_i_2_n_6 ,\timer_r_reg[12]_i_2_n_7 }),
        .S({\timer_r_reg_n_0_[12] ,\timer_r_reg_n_0_[11] ,\timer_r_reg_n_0_[10] ,\timer_r_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[13] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[13]),
        .Q(\timer_r_reg_n_0_[13] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[14] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[14]),
        .Q(\timer_r_reg_n_0_[14] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[15] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[15]),
        .Q(\timer_r_reg_n_0_[15] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[15]_i_3 
       (.CI(\timer_r_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[15]_i_3_n_5 ,\timer_r_reg[15]_i_3_n_6 ,\timer_r_reg[15]_i_3_n_7 }),
        .S({\<const0> ,\timer_r_reg_n_0_[15] ,\timer_r_reg_n_0_[14] ,\timer_r_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[1] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[1]),
        .Q(\timer_r_reg_n_0_[1] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[2] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[2]),
        .Q(\timer_r_reg_n_0_[2] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[3] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[3]),
        .Q(\timer_r_reg_n_0_[3] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[4] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[4]),
        .Q(\timer_r_reg_n_0_[4] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[4]_i_2 
       (.CI(\<const0> ),
        .CO({\timer_r_reg[4]_i_2_n_0 ,\NLW_timer_r_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\timer_r_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[4]_i_2_n_4 ,\timer_r_reg[4]_i_2_n_5 ,\timer_r_reg[4]_i_2_n_6 ,\timer_r_reg[4]_i_2_n_7 }),
        .S({\timer_r_reg_n_0_[4] ,\timer_r_reg_n_0_[3] ,\timer_r_reg_n_0_[2] ,\timer_r_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[5] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[5]),
        .Q(\timer_r_reg_n_0_[5] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[6] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[6]),
        .Q(\timer_r_reg_n_0_[6] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[7] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[7]),
        .Q(\timer_r_reg_n_0_[7] ),
        .R(busy_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[8] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[8]),
        .Q(\timer_r_reg_n_0_[8] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[8]_i_2 
       (.CI(\timer_r_reg[4]_i_2_n_0 ),
        .CO({\timer_r_reg[8]_i_2_n_0 ,\NLW_timer_r_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[8]_i_2_n_4 ,\timer_r_reg[8]_i_2_n_5 ,\timer_r_reg[8]_i_2_n_6 ,\timer_r_reg[8]_i_2_n_7 }),
        .S({\timer_r_reg_n_0_[8] ,\timer_r_reg_n_0_[7] ,\timer_r_reg_n_0_[6] ,\timer_r_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \timer_r_reg[9] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[9]),
        .Q(\timer_r_reg_n_0_[9] ),
        .R(busy_o_i_1_n_0));
endmodule

(* ELEMENT_STYLE = "0" *) 
module cbdc_puf_element
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__1
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__10
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__11
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__12
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__13
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__14
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__15
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__16
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__17
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__18
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__19
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__2
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__20
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__21
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__22
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__23
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__24
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__25
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__26
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__27
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__28
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__29
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__3
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__30
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__31
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__4
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__5
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__6
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__7
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__8
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__9
   (sig_i,
    c_i,
    sig_o);
  input sig_i;
  input c_i;
  output sig_o;

  wire \<const0> ;
  wire c_i;
  (* DONT_TOUCH *) wire \gen_style_p.buf_path_w ;
  (* DONT_TOUCH *) wire \gen_style_p.inv_path_w ;
  wire sig_i;
  wire sig_o;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'hA)) 
    \gen_style_p.u_buf 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.buf_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT2 #(
    .INIT(4'h5)) 
    \gen_style_p.u_inv 
       (.I0(sig_i),
        .I1(\<const0> ),
        .O(\gen_style_p.inv_path_w ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gen_style_p.u_mux 
       (.I0(\gen_style_p.buf_path_w ),
        .I1(\gen_style_p.inv_path_w ),
        .I2(c_i),
        .O(sig_o));
endmodule

(* ECO_CHECKSUM = "d8fab2a" *) (* UART_CLKS = "868" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module cbdc_puf_serial
   (clk,
    btnU,
    uart_rx,
    uart_tx,
    led);
  input clk;
  input btnU;
  input uart_rx;
  output uart_tx;
  output [15:0]led;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_onehot_parser[0]_i_1_n_0 ;
  wire \FSM_onehot_parser[1]_i_1_n_0 ;
  wire \FSM_onehot_parser[1]_i_2_n_0 ;
  wire \FSM_onehot_parser[2]_i_1_n_0 ;
  wire \FSM_onehot_parser[3]_i_10_n_0 ;
  wire \FSM_onehot_parser[3]_i_11_n_0 ;
  wire \FSM_onehot_parser[3]_i_12_n_0 ;
  wire \FSM_onehot_parser[3]_i_13_n_0 ;
  wire \FSM_onehot_parser[3]_i_14_n_0 ;
  wire \FSM_onehot_parser[3]_i_15_n_0 ;
  wire \FSM_onehot_parser[3]_i_16_n_0 ;
  wire \FSM_onehot_parser[3]_i_1_n_0 ;
  wire \FSM_onehot_parser[3]_i_2_n_0 ;
  wire \FSM_onehot_parser[3]_i_3_n_0 ;
  wire \FSM_onehot_parser[3]_i_4_n_0 ;
  wire \FSM_onehot_parser[3]_i_5_n_0 ;
  wire \FSM_onehot_parser[3]_i_6_n_0 ;
  wire \FSM_onehot_parser[3]_i_7_n_0 ;
  wire \FSM_onehot_parser[3]_i_8_n_0 ;
  wire \FSM_onehot_parser[3]_i_9_n_0 ;
  wire \FSM_onehot_parser_reg_n_0_[0] ;
  wire \FSM_onehot_parser_reg_n_0_[1] ;
  wire \FSM_onehot_parser_reg_n_0_[2] ;
  wire \FSM_onehot_parser_reg_n_0_[3] ;
  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_10_n_0 ;
  wire \FSM_onehot_state[2]_i_11_n_0 ;
  wire \FSM_onehot_state[2]_i_12_n_0 ;
  wire \FSM_onehot_state[2]_i_13_n_0 ;
  wire \FSM_onehot_state[2]_i_14_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_3_n_0 ;
  wire \FSM_onehot_state[2]_i_4_n_0 ;
  wire \FSM_onehot_state[2]_i_5_n_0 ;
  wire \FSM_onehot_state[2]_i_6_n_0 ;
  wire \FSM_onehot_state[2]_i_7_n_0 ;
  wire \FSM_onehot_state[2]_i_8_n_0 ;
  wire \FSM_onehot_state[2]_i_9_n_0 ;
  wire [0:0]bitbyte;
  wire \bitbyte[0]_i_1_n_0 ;
  wire \bitbyte_reg[0]_lopt_replica_1 ;
  wire btnU;
  wire btnU_IBUF;
  wire button;
  wire [8:0]challenge;
  wire \challenge[10]_i_1_n_0 ;
  wire \challenge[11]_i_1_n_0 ;
  wire \challenge[12]_i_1_n_0 ;
  wire \challenge[13]_i_1_n_0 ;
  wire \challenge[14]_i_1_n_0 ;
  wire \challenge[15]_i_2_n_0 ;
  wire \challenge[8]_i_1_n_0 ;
  wire \challenge[9]_i_1_n_0 ;
  wire \challenge_reg_n_0_[0] ;
  wire \challenge_reg_n_0_[10] ;
  wire \challenge_reg_n_0_[11] ;
  wire \challenge_reg_n_0_[12] ;
  wire \challenge_reg_n_0_[13] ;
  wire \challenge_reg_n_0_[14] ;
  wire \challenge_reg_n_0_[15] ;
  wire \challenge_reg_n_0_[1] ;
  wire \challenge_reg_n_0_[2] ;
  wire \challenge_reg_n_0_[3] ;
  wire \challenge_reg_n_0_[4] ;
  wire \challenge_reg_n_0_[5] ;
  wire \challenge_reg_n_0_[6] ;
  wire \challenge_reg_n_0_[7] ;
  wire \challenge_reg_n_0_[8] ;
  wire \challenge_reg_n_0_[9] ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [31:1]data0;
  wire done;
  wire done_i_1_n_0;
  wire error;
  wire [5:0]flags;
  wire \flags[7]_i_2_n_0 ;
  wire \flags_reg_n_0_[0] ;
  wire \flags_reg_n_0_[5] ;
  wire \flags_reg_n_0_[7] ;
  wire framing;
  wire [31:1]in11;
  wire [2:0]index;
  wire \index[0]_i_1_n_0 ;
  wire \index[1]_i_1_n_0 ;
  wire \index[2]_i_1_n_0 ;
  wire [15:0]led;
  wire [3:0]led_OBUF;
  wire [4:0]p_0_in;
  wire \partial_timeout[0]_i_1_n_0 ;
  wire \partial_timeout[31]_i_10_n_0 ;
  wire \partial_timeout[31]_i_11_n_0 ;
  wire \partial_timeout[31]_i_1_n_0 ;
  wire \partial_timeout[31]_i_2_n_0 ;
  wire \partial_timeout[31]_i_4_n_0 ;
  wire \partial_timeout[31]_i_5_n_0 ;
  wire \partial_timeout[31]_i_6_n_0 ;
  wire \partial_timeout[31]_i_7_n_0 ;
  wire \partial_timeout[31]_i_8_n_0 ;
  wire \partial_timeout[31]_i_9_n_0 ;
  wire \partial_timeout_reg[12]_i_1_n_0 ;
  wire \partial_timeout_reg[16]_i_1_n_0 ;
  wire \partial_timeout_reg[20]_i_1_n_0 ;
  wire \partial_timeout_reg[24]_i_1_n_0 ;
  wire \partial_timeout_reg[28]_i_1_n_0 ;
  wire \partial_timeout_reg[4]_i_1_n_0 ;
  wire \partial_timeout_reg[8]_i_1_n_0 ;
  wire \partial_timeout_reg_n_0_[0] ;
  wire \partial_timeout_reg_n_0_[10] ;
  wire \partial_timeout_reg_n_0_[11] ;
  wire \partial_timeout_reg_n_0_[12] ;
  wire \partial_timeout_reg_n_0_[13] ;
  wire \partial_timeout_reg_n_0_[14] ;
  wire \partial_timeout_reg_n_0_[15] ;
  wire \partial_timeout_reg_n_0_[16] ;
  wire \partial_timeout_reg_n_0_[17] ;
  wire \partial_timeout_reg_n_0_[18] ;
  wire \partial_timeout_reg_n_0_[19] ;
  wire \partial_timeout_reg_n_0_[1] ;
  wire \partial_timeout_reg_n_0_[20] ;
  wire \partial_timeout_reg_n_0_[21] ;
  wire \partial_timeout_reg_n_0_[22] ;
  wire \partial_timeout_reg_n_0_[23] ;
  wire \partial_timeout_reg_n_0_[24] ;
  wire \partial_timeout_reg_n_0_[25] ;
  wire \partial_timeout_reg_n_0_[26] ;
  wire \partial_timeout_reg_n_0_[27] ;
  wire \partial_timeout_reg_n_0_[28] ;
  wire \partial_timeout_reg_n_0_[29] ;
  wire \partial_timeout_reg_n_0_[2] ;
  wire \partial_timeout_reg_n_0_[30] ;
  wire \partial_timeout_reg_n_0_[31] ;
  wire \partial_timeout_reg_n_0_[3] ;
  wire \partial_timeout_reg_n_0_[4] ;
  wire \partial_timeout_reg_n_0_[5] ;
  wire \partial_timeout_reg_n_0_[6] ;
  wire \partial_timeout_reg_n_0_[7] ;
  wire \partial_timeout_reg_n_0_[8] ;
  wire \partial_timeout_reg_n_0_[9] ;
  wire \por_reg_n_0_[0] ;
  wire \por_reg_n_0_[1] ;
  wire \por_reg_n_0_[2] ;
  wire \por_reg_n_0_[3] ;
  wire pr;
  wire [7:0]rd;
  wire received;
  wire reset;
  wire response;
  wire send_i_1_n_0;
  wire send_reg_n_0;
  wire start;
  wire start_i_1_n_0;
  wire start_i_3_n_0;
  wire start_i_4_n_0;
  wire start_i_5_n_0;
  wire start_i_6_n_0;
  wire start_reg_n_0;
  wire [2:0]state__0;
  wire [7:0]td;
  wire \td[0]_i_2_n_0 ;
  wire \td[0]_i_3_n_0 ;
  wire \td[7]_i_1_n_0 ;
  wire \td_reg_n_0_[0] ;
  wire \td_reg_n_0_[1] ;
  wire \td_reg_n_0_[2] ;
  wire \td_reg_n_0_[3] ;
  wire \td_reg_n_0_[4] ;
  wire \td_reg_n_0_[5] ;
  wire \td_reg_n_0_[6] ;
  wire \td_reg_n_0_[7] ;
  wire [31:0]timeout;
  wire \timeout[31]_i_1_n_0 ;
  wire \timeout_reg[12]_i_2_n_0 ;
  wire \timeout_reg[16]_i_2_n_0 ;
  wire \timeout_reg[20]_i_2_n_0 ;
  wire \timeout_reg[24]_i_2_n_0 ;
  wire \timeout_reg[28]_i_2_n_0 ;
  wire \timeout_reg[4]_i_2_n_0 ;
  wire \timeout_reg[8]_i_2_n_0 ;
  wire \timeout_reg_n_0_[0] ;
  wire \timeout_reg_n_0_[10] ;
  wire \timeout_reg_n_0_[11] ;
  wire \timeout_reg_n_0_[12] ;
  wire \timeout_reg_n_0_[13] ;
  wire \timeout_reg_n_0_[14] ;
  wire \timeout_reg_n_0_[15] ;
  wire \timeout_reg_n_0_[16] ;
  wire \timeout_reg_n_0_[17] ;
  wire \timeout_reg_n_0_[18] ;
  wire \timeout_reg_n_0_[19] ;
  wire \timeout_reg_n_0_[1] ;
  wire \timeout_reg_n_0_[20] ;
  wire \timeout_reg_n_0_[21] ;
  wire \timeout_reg_n_0_[22] ;
  wire \timeout_reg_n_0_[23] ;
  wire \timeout_reg_n_0_[24] ;
  wire \timeout_reg_n_0_[25] ;
  wire \timeout_reg_n_0_[26] ;
  wire \timeout_reg_n_0_[27] ;
  wire \timeout_reg_n_0_[28] ;
  wire \timeout_reg_n_0_[29] ;
  wire \timeout_reg_n_0_[2] ;
  wire \timeout_reg_n_0_[30] ;
  wire \timeout_reg_n_0_[31] ;
  wire \timeout_reg_n_0_[3] ;
  wire \timeout_reg_n_0_[4] ;
  wire \timeout_reg_n_0_[5] ;
  wire \timeout_reg_n_0_[6] ;
  wire \timeout_reg_n_0_[7] ;
  wire \timeout_reg_n_0_[8] ;
  wire \timeout_reg_n_0_[9] ;
  wire tx_busy;
  wire uart_rx;
  wire uart_rx_IBUF;
  wire uart_tx;
  wire uart_tx_OBUF;
  wire valid;
  wire [3:0]\NLW_partial_timeout_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[16]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[20]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[24]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[28]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[4]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[8]_i_2_CO_UNCONNECTED ;

  LUT5 #(
    .INIT(32'h0000BBBF)) 
    \FSM_onehot_parser[0]_i_1 
       (.I0(\FSM_onehot_parser_reg_n_0_[0] ),
        .I1(received),
        .I2(\FSM_onehot_parser_reg_n_0_[1] ),
        .I3(\FSM_onehot_parser_reg_n_0_[2] ),
        .I4(\FSM_onehot_parser[1]_i_1_n_0 ),
        .O(\FSM_onehot_parser[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \FSM_onehot_parser[1]_i_1 
       (.I0(received),
        .I1(rd[4]),
        .I2(rd[0]),
        .I3(\FSM_onehot_parser_reg_n_0_[0] ),
        .I4(rd[3]),
        .I5(\FSM_onehot_parser[1]_i_2_n_0 ),
        .O(\FSM_onehot_parser[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFFFFFFF)) 
    \FSM_onehot_parser[1]_i_2 
       (.I0(rd[6]),
        .I1(rd[7]),
        .I2(rd[2]),
        .I3(rd[1]),
        .I4(rd[5]),
        .O(\FSM_onehot_parser[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \FSM_onehot_parser[2]_i_1 
       (.I0(\FSM_onehot_parser_reg_n_0_[1] ),
        .I1(received),
        .I2(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\FSM_onehot_parser[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFF8)) 
    \FSM_onehot_parser[3]_i_1 
       (.I0(framing),
        .I1(state__0[0]),
        .I2(pr),
        .I3(button),
        .O(\FSM_onehot_parser[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \FSM_onehot_parser[3]_i_10 
       (.I0(\partial_timeout_reg_n_0_[10] ),
        .I1(\partial_timeout_reg_n_0_[11] ),
        .I2(\partial_timeout_reg_n_0_[13] ),
        .I3(\partial_timeout_reg_n_0_[14] ),
        .I4(\partial_timeout_reg_n_0_[17] ),
        .I5(\partial_timeout_reg_n_0_[16] ),
        .O(\FSM_onehot_parser[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \FSM_onehot_parser[3]_i_11 
       (.I0(\partial_timeout_reg_n_0_[0] ),
        .I1(\partial_timeout_reg_n_0_[1] ),
        .I2(\partial_timeout_reg_n_0_[2] ),
        .I3(\partial_timeout_reg_n_0_[5] ),
        .I4(\partial_timeout_reg_n_0_[4] ),
        .I5(\FSM_onehot_parser[3]_i_16_n_0 ),
        .O(\FSM_onehot_parser[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h2A0000002A002A00)) 
    \FSM_onehot_parser[3]_i_12 
       (.I0(\partial_timeout_reg_n_0_[8] ),
        .I1(\partial_timeout_reg_n_0_[7] ),
        .I2(\partial_timeout_reg_n_0_[6] ),
        .I3(\partial_timeout_reg_n_0_[5] ),
        .I4(\partial_timeout_reg_n_0_[4] ),
        .I5(\partial_timeout_reg_n_0_[3] ),
        .O(\FSM_onehot_parser[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h2323230023002300)) 
    \FSM_onehot_parser[3]_i_13 
       (.I0(\partial_timeout_reg_n_0_[13] ),
        .I1(\partial_timeout_reg_n_0_[14] ),
        .I2(\partial_timeout_reg_n_0_[12] ),
        .I3(\partial_timeout_reg_n_0_[11] ),
        .I4(\partial_timeout_reg_n_0_[9] ),
        .I5(\partial_timeout_reg_n_0_[10] ),
        .O(\FSM_onehot_parser[3]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h2300230023232300)) 
    \FSM_onehot_parser[3]_i_14 
       (.I0(\partial_timeout_reg_n_0_[19] ),
        .I1(\partial_timeout_reg_n_0_[20] ),
        .I2(\partial_timeout_reg_n_0_[18] ),
        .I3(\partial_timeout_reg_n_0_[17] ),
        .I4(\partial_timeout_reg_n_0_[15] ),
        .I5(\partial_timeout_reg_n_0_[16] ),
        .O(\FSM_onehot_parser[3]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000230000002323)) 
    \FSM_onehot_parser[3]_i_15 
       (.I0(\partial_timeout_reg_n_0_[28] ),
        .I1(\partial_timeout_reg_n_0_[29] ),
        .I2(\partial_timeout_reg_n_0_[27] ),
        .I3(\partial_timeout_reg_n_0_[25] ),
        .I4(\partial_timeout_reg_n_0_[26] ),
        .I5(\partial_timeout_reg_n_0_[24] ),
        .O(\FSM_onehot_parser[3]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_parser[3]_i_16 
       (.I0(\partial_timeout_reg_n_0_[7] ),
        .I1(\partial_timeout_reg_n_0_[8] ),
        .O(\FSM_onehot_parser[3]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hEAAA0000F0000000)) 
    \FSM_onehot_parser[3]_i_2 
       (.I0(\FSM_onehot_parser[3]_i_4_n_0 ),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .I2(\FSM_onehot_parser[3]_i_5_n_0 ),
        .I3(\FSM_onehot_parser[3]_i_6_n_0 ),
        .I4(state__0[0]),
        .I5(received),
        .O(\FSM_onehot_parser[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \FSM_onehot_parser[3]_i_3 
       (.I0(\FSM_onehot_parser_reg_n_0_[1] ),
        .I1(\FSM_onehot_parser_reg_n_0_[2] ),
        .I2(received),
        .I3(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\FSM_onehot_parser[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \FSM_onehot_parser[3]_i_4 
       (.I0(\FSM_onehot_parser_reg_n_0_[1] ),
        .I1(\FSM_onehot_parser_reg_n_0_[3] ),
        .I2(\FSM_onehot_parser_reg_n_0_[2] ),
        .I3(\FSM_onehot_parser[3]_i_7_n_0 ),
        .O(\FSM_onehot_parser[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \FSM_onehot_parser[3]_i_5 
       (.I0(\FSM_onehot_parser[3]_i_8_n_0 ),
        .I1(\FSM_onehot_parser[3]_i_9_n_0 ),
        .I2(\FSM_onehot_parser_reg_n_0_[0] ),
        .I3(\partial_timeout_reg_n_0_[31] ),
        .I4(\partial_timeout_reg_n_0_[30] ),
        .I5(\partial_timeout_reg_n_0_[29] ),
        .O(\FSM_onehot_parser[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \FSM_onehot_parser[3]_i_6 
       (.I0(\FSM_onehot_parser[3]_i_10_n_0 ),
        .I1(\FSM_onehot_parser[3]_i_11_n_0 ),
        .I2(\FSM_onehot_parser[3]_i_12_n_0 ),
        .I3(\FSM_onehot_parser[3]_i_13_n_0 ),
        .I4(\FSM_onehot_parser[3]_i_14_n_0 ),
        .O(\FSM_onehot_parser[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    \FSM_onehot_parser[3]_i_7 
       (.I0(\FSM_onehot_parser[1]_i_2_n_0 ),
        .I1(rd[3]),
        .I2(\FSM_onehot_parser_reg_n_0_[0] ),
        .I3(rd[0]),
        .I4(rd[4]),
        .O(\FSM_onehot_parser[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \FSM_onehot_parser[3]_i_8 
       (.I0(\FSM_onehot_parser[3]_i_15_n_0 ),
        .I1(\partial_timeout_reg_n_0_[22] ),
        .I2(\partial_timeout_reg_n_0_[20] ),
        .I3(\partial_timeout_reg_n_0_[19] ),
        .I4(\partial_timeout_reg_n_0_[21] ),
        .I5(\partial_timeout_reg_n_0_[23] ),
        .O(\FSM_onehot_parser[3]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_onehot_parser[3]_i_9 
       (.I0(\partial_timeout_reg_n_0_[28] ),
        .I1(\partial_timeout_reg_n_0_[26] ),
        .I2(\partial_timeout_reg_n_0_[25] ),
        .I3(\partial_timeout_reg_n_0_[23] ),
        .O(\FSM_onehot_parser[3]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:0100,iSTATE0:1000,iSTATE1:0001,iSTATE2:0010" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_parser_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_parser[3]_i_2_n_0 ),
        .D(\FSM_onehot_parser[0]_i_1_n_0 ),
        .Q(\FSM_onehot_parser_reg_n_0_[0] ),
        .S(\FSM_onehot_parser[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:0100,iSTATE0:1000,iSTATE1:0001,iSTATE2:0010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_parser_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_parser[3]_i_2_n_0 ),
        .D(\FSM_onehot_parser[1]_i_1_n_0 ),
        .Q(\FSM_onehot_parser_reg_n_0_[1] ),
        .R(\FSM_onehot_parser[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:0100,iSTATE0:1000,iSTATE1:0001,iSTATE2:0010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_parser_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_parser[3]_i_2_n_0 ),
        .D(\FSM_onehot_parser[2]_i_1_n_0 ),
        .Q(\FSM_onehot_parser_reg_n_0_[2] ),
        .R(\FSM_onehot_parser[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:0100,iSTATE0:1000,iSTATE1:0001,iSTATE2:0010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_parser_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_parser[3]_i_2_n_0 ),
        .D(\FSM_onehot_parser[3]_i_3_n_0 ),
        .Q(\FSM_onehot_parser_reg_n_0_[3] ),
        .R(\FSM_onehot_parser[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000033355555444)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(state__0[1]),
        .I1(done),
        .I2(\FSM_onehot_state[2]_i_3_n_0 ),
        .I3(\FSM_onehot_state[2]_i_4_n_0 ),
        .I4(\FSM_onehot_state[2]_i_5_n_0 ),
        .I5(state__0[0]),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAABBBAAAAA888)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(state__0[0]),
        .I1(done),
        .I2(\FSM_onehot_state[2]_i_3_n_0 ),
        .I3(\FSM_onehot_state[2]_i_4_n_0 ),
        .I4(\FSM_onehot_state[2]_i_5_n_0 ),
        .I5(state__0[1]),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAABBBAAAAA888)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(state__0[1]),
        .I1(done),
        .I2(\FSM_onehot_state[2]_i_3_n_0 ),
        .I3(\FSM_onehot_state[2]_i_4_n_0 ),
        .I4(\FSM_onehot_state[2]_i_5_n_0 ),
        .I5(state__0[2]),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_state[2]_i_10 
       (.I0(valid),
        .I1(error),
        .O(\FSM_onehot_state[2]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \FSM_onehot_state[2]_i_11 
       (.I0(\timeout_reg_n_0_[11] ),
        .I1(\timeout_reg_n_0_[10] ),
        .I2(\timeout_reg_n_0_[9] ),
        .I3(\timeout_reg_n_0_[8] ),
        .O(\FSM_onehot_state[2]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \FSM_onehot_state[2]_i_12 
       (.I0(\timeout_reg_n_0_[7] ),
        .I1(\timeout_reg_n_0_[6] ),
        .I2(\timeout_reg_n_0_[5] ),
        .I3(\timeout_reg_n_0_[4] ),
        .O(\FSM_onehot_state[2]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_onehot_state[2]_i_13 
       (.I0(\timeout_reg_n_0_[28] ),
        .I1(\timeout_reg_n_0_[29] ),
        .I2(\timeout_reg_n_0_[31] ),
        .I3(\timeout_reg_n_0_[30] ),
        .O(\FSM_onehot_state[2]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_onehot_state[2]_i_14 
       (.I0(\timeout_reg_n_0_[20] ),
        .I1(\timeout_reg_n_0_[21] ),
        .I2(\timeout_reg_n_0_[22] ),
        .I3(\timeout_reg_n_0_[23] ),
        .O(\FSM_onehot_state[2]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(framing),
        .I1(received),
        .I2(state__0[0]),
        .I3(start),
        .O(done));
  LUT3 #(
    .INIT(8'h02)) 
    \FSM_onehot_state[2]_i_3 
       (.I0(state__0[2]),
        .I1(send_reg_n_0),
        .I2(tx_busy),
        .O(\FSM_onehot_state[2]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \FSM_onehot_state[2]_i_4 
       (.I0(index[1]),
        .I1(index[2]),
        .I2(index[0]),
        .O(\FSM_onehot_state[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA00000080)) 
    \FSM_onehot_state[2]_i_5 
       (.I0(state__0[1]),
        .I1(\FSM_onehot_state[2]_i_6_n_0 ),
        .I2(\FSM_onehot_state[2]_i_7_n_0 ),
        .I3(\FSM_onehot_state[2]_i_8_n_0 ),
        .I4(\FSM_onehot_state[2]_i_9_n_0 ),
        .I5(\FSM_onehot_state[2]_i_10_n_0 ),
        .O(\FSM_onehot_state[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \FSM_onehot_state[2]_i_6 
       (.I0(\timeout_reg_n_0_[13] ),
        .I1(\timeout_reg_n_0_[12] ),
        .I2(\timeout_reg_n_0_[14] ),
        .I3(\timeout_reg_n_0_[15] ),
        .I4(\FSM_onehot_state[2]_i_11_n_0 ),
        .O(\FSM_onehot_state[2]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \FSM_onehot_state[2]_i_7 
       (.I0(\timeout_reg_n_0_[2] ),
        .I1(\timeout_reg_n_0_[3] ),
        .I2(\timeout_reg_n_0_[0] ),
        .I3(\timeout_reg_n_0_[1] ),
        .I4(\FSM_onehot_state[2]_i_12_n_0 ),
        .O(\FSM_onehot_state[2]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_state[2]_i_8 
       (.I0(\timeout_reg_n_0_[27] ),
        .I1(\timeout_reg_n_0_[26] ),
        .I2(\timeout_reg_n_0_[25] ),
        .I3(\timeout_reg_n_0_[24] ),
        .I4(\FSM_onehot_state[2]_i_13_n_0 ),
        .O(\FSM_onehot_state[2]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_state[2]_i_9 
       (.I0(\timeout_reg_n_0_[19] ),
        .I1(\timeout_reg_n_0_[18] ),
        .I2(\timeout_reg_n_0_[17] ),
        .I3(\timeout_reg_n_0_[16] ),
        .I4(\FSM_onehot_state[2]_i_14_n_0 ),
        .O(\FSM_onehot_state[2]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:100,iSTATE0:001,iSTATE1:010," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .Q(state__0[0]),
        .S(reset));
  (* FSM_ENCODED_STATES = "iSTATE:100,iSTATE0:001,iSTATE1:010," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(state__0[1]),
        .R(reset));
  (* FSM_ENCODED_STATES = "iSTATE:100,iSTATE0:001,iSTATE1:010," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(state__0[2]),
        .R(reset));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT4 #(
    .INIT(16'h0008)) 
    \bitbyte[0]_i_1 
       (.I0(valid),
        .I1(response),
        .I2(pr),
        .I3(button),
        .O(\bitbyte[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bitbyte_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(bitbyte),
        .D(\bitbyte[0]_i_1_n_0 ),
        .Q(led_OBUF[0]),
        .R(\<const0> ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \bitbyte_reg[0]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(bitbyte),
        .D(\bitbyte[0]_i_1_n_0 ),
        .Q(\bitbyte_reg[0]_lopt_replica_1 ),
        .R(\<const0> ));
  IBUF btnU_IBUF_inst
       (.I(btnU),
        .O(btnU_IBUF));
  LUT2 #(
    .INIT(4'hE)) 
    \challenge[10]_i_1 
       (.I0(rd[2]),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\challenge[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \challenge[11]_i_1 
       (.I0(rd[3]),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\challenge[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \challenge[12]_i_1 
       (.I0(rd[4]),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\challenge[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \challenge[13]_i_1 
       (.I0(rd[5]),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\challenge[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \challenge[14]_i_1 
       (.I0(rd[6]),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\challenge[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \challenge[15]_i_1 
       (.I0(framing),
        .I1(received),
        .I2(state__0[0]),
        .I3(\FSM_onehot_parser_reg_n_0_[2] ),
        .O(challenge[8]));
  LUT2 #(
    .INIT(4'hE)) 
    \challenge[15]_i_2 
       (.I0(rd[7]),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\challenge[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \challenge[7]_i_1 
       (.I0(framing),
        .I1(received),
        .I2(state__0[0]),
        .I3(\FSM_onehot_parser_reg_n_0_[1] ),
        .O(challenge[0]));
  LUT2 #(
    .INIT(4'hE)) 
    \challenge[8]_i_1 
       (.I0(rd[0]),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\challenge[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \challenge[9]_i_1 
       (.I0(rd[1]),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .O(\challenge[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[0]),
        .D(\challenge[8]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[8]),
        .D(\challenge[10]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[10] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[8]),
        .D(\challenge[11]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[11] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[8]),
        .D(\challenge[12]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[12] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[8]),
        .D(\challenge[13]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[13] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[8]),
        .D(\challenge[14]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[14] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[8]),
        .D(\challenge[15]_i_2_n_0 ),
        .Q(\challenge_reg_n_0_[15] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[0]),
        .D(\challenge[9]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[0]),
        .D(\challenge[10]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[0]),
        .D(\challenge[11]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[0]),
        .D(\challenge[12]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[4] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[0]),
        .D(\challenge[13]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[0]),
        .D(\challenge[14]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[6] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[0]),
        .D(\challenge[15]_i_2_n_0 ),
        .Q(\challenge_reg_n_0_[7] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[8]),
        .D(\challenge[8]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[8] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[8]),
        .D(\challenge[9]_i_1_n_0 ),
        .Q(\challenge_reg_n_0_[9] ),
        .R(reset));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT3 #(
    .INIT(8'hDC)) 
    done_i_1
       (.I0(done),
        .I1(\FSM_onehot_state[2]_i_5_n_0 ),
        .I2(led_OBUF[1]),
        .O(done_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(done_i_1_n_0),
        .Q(led_OBUF[1]),
        .R(reset));
  LUT3 #(
    .INIT(8'h02)) 
    \flags[0]_i_1 
       (.I0(valid),
        .I1(pr),
        .I2(button),
        .O(flags[0]));
  LUT2 #(
    .INIT(4'h1)) 
    \flags[5]_i_1 
       (.I0(pr),
        .I1(button),
        .O(flags[5]));
  LUT3 #(
    .INIT(8'hFE)) 
    \flags[7]_i_1 
       (.I0(\FSM_onehot_state[2]_i_5_n_0 ),
        .I1(pr),
        .I2(button),
        .O(bitbyte));
  LUT4 #(
    .INIT(16'h0001)) 
    \flags[7]_i_2 
       (.I0(error),
        .I1(valid),
        .I2(pr),
        .I3(button),
        .O(\flags[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \flags_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(bitbyte),
        .D(flags[0]),
        .Q(\flags_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \flags_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(bitbyte),
        .D(flags[5]),
        .Q(\flags_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \flags_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(bitbyte),
        .D(\flags[7]_i_2_n_0 ),
        .Q(\flags_reg_n_0_[7] ),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000000002666)) 
    \index[0]_i_1 
       (.I0(index[0]),
        .I1(\FSM_onehot_state[2]_i_3_n_0 ),
        .I2(index[1]),
        .I3(index[2]),
        .I4(reset),
        .I5(\FSM_onehot_state[2]_i_5_n_0 ),
        .O(\index[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000626A)) 
    \index[1]_i_1 
       (.I0(index[1]),
        .I1(\FSM_onehot_state[2]_i_3_n_0 ),
        .I2(index[0]),
        .I3(index[2]),
        .I4(reset),
        .I5(\FSM_onehot_state[2]_i_5_n_0 ),
        .O(\index[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000006A2A)) 
    \index[2]_i_1 
       (.I0(index[2]),
        .I1(\FSM_onehot_state[2]_i_3_n_0 ),
        .I2(index[1]),
        .I3(index[0]),
        .I4(reset),
        .I5(\FSM_onehot_state[2]_i_5_n_0 ),
        .O(\index[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\index[0]_i_1_n_0 ),
        .Q(index[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\index[1]_i_1_n_0 ),
        .Q(index[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\index[2]_i_1_n_0 ),
        .Q(index[2]),
        .R(\<const0> ));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \led_OBUF[0]_inst 
       (.I(\bitbyte_reg[0]_lopt_replica_1 ),
        .O(led[0]));
  OBUF \led_OBUF[10]_inst 
       (.I(\<const0> ),
        .O(led[10]));
  OBUF \led_OBUF[11]_inst 
       (.I(\<const0> ),
        .O(led[11]));
  OBUF \led_OBUF[12]_inst 
       (.I(\<const0> ),
        .O(led[12]));
  OBUF \led_OBUF[13]_inst 
       (.I(\<const0> ),
        .O(led[13]));
  OBUF \led_OBUF[14]_inst 
       (.I(\<const0> ),
        .O(led[14]));
  OBUF \led_OBUF[15]_inst 
       (.I(\<const0> ),
        .O(led[15]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  OBUF \led_OBUF[2]_inst 
       (.I(led_OBUF[2]),
        .O(led[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \led_OBUF[2]_inst_i_1 
       (.I0(led_OBUF[1]),
        .I1(\flags_reg_n_0_[0] ),
        .O(led_OBUF[2]));
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  OBUF \led_OBUF[4]_inst 
       (.I(\<const1> ),
        .O(led[4]));
  OBUF \led_OBUF[5]_inst 
       (.I(\<const0> ),
        .O(led[5]));
  OBUF \led_OBUF[6]_inst 
       (.I(\<const0> ),
        .O(led[6]));
  OBUF \led_OBUF[7]_inst 
       (.I(\<const0> ),
        .O(led[7]));
  OBUF \led_OBUF[8]_inst 
       (.I(\<const0> ),
        .O(led[8]));
  OBUF \led_OBUF[9]_inst 
       (.I(\<const0> ),
        .O(led[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \partial_timeout[0]_i_1 
       (.I0(\partial_timeout_reg_n_0_[0] ),
        .O(\partial_timeout[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0A002A22)) 
    \partial_timeout[31]_i_1 
       (.I0(state__0[0]),
        .I1(\FSM_onehot_parser_reg_n_0_[0] ),
        .I2(framing),
        .I3(received),
        .I4(\partial_timeout[31]_i_4_n_0 ),
        .I5(reset),
        .O(\partial_timeout[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \partial_timeout[31]_i_10 
       (.I0(\partial_timeout_reg_n_0_[18] ),
        .I1(\partial_timeout_reg_n_0_[19] ),
        .I2(\partial_timeout_reg_n_0_[17] ),
        .I3(\partial_timeout_reg_n_0_[16] ),
        .O(\partial_timeout[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \partial_timeout[31]_i_11 
       (.I0(\partial_timeout_reg_n_0_[20] ),
        .I1(\partial_timeout_reg_n_0_[21] ),
        .I2(\partial_timeout_reg_n_0_[22] ),
        .I3(\partial_timeout_reg_n_0_[23] ),
        .O(\partial_timeout[31]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFEFEFEEEEEEEE)) 
    \partial_timeout[31]_i_2 
       (.I0(button),
        .I1(pr),
        .I2(\FSM_onehot_parser_reg_n_0_[0] ),
        .I3(framing),
        .I4(received),
        .I5(state__0[0]),
        .O(\partial_timeout[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \partial_timeout[31]_i_4 
       (.I0(\partial_timeout[31]_i_5_n_0 ),
        .I1(\partial_timeout[31]_i_6_n_0 ),
        .I2(\partial_timeout_reg_n_0_[6] ),
        .I3(\partial_timeout_reg_n_0_[29] ),
        .I4(\partial_timeout_reg_n_0_[28] ),
        .I5(\partial_timeout_reg_n_0_[27] ),
        .O(\partial_timeout[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \partial_timeout[31]_i_5 
       (.I0(\partial_timeout[31]_i_7_n_0 ),
        .I1(\partial_timeout_reg_n_0_[31] ),
        .I2(\partial_timeout_reg_n_0_[4] ),
        .I3(\partial_timeout_reg_n_0_[3] ),
        .I4(\partial_timeout_reg_n_0_[2] ),
        .O(\partial_timeout[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \partial_timeout[31]_i_6 
       (.I0(\partial_timeout_reg_n_0_[14] ),
        .I1(\partial_timeout_reg_n_0_[25] ),
        .I2(\partial_timeout[31]_i_8_n_0 ),
        .I3(\partial_timeout[31]_i_9_n_0 ),
        .I4(\partial_timeout[31]_i_10_n_0 ),
        .I5(\partial_timeout[31]_i_11_n_0 ),
        .O(\partial_timeout[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \partial_timeout[31]_i_7 
       (.I0(\partial_timeout_reg_n_0_[13] ),
        .I1(\partial_timeout_reg_n_0_[12] ),
        .I2(\partial_timeout_reg_n_0_[11] ),
        .I3(\partial_timeout_reg_n_0_[26] ),
        .I4(\partial_timeout_reg_n_0_[0] ),
        .I5(\partial_timeout_reg_n_0_[1] ),
        .O(\partial_timeout[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \partial_timeout[31]_i_8 
       (.I0(\partial_timeout_reg_n_0_[24] ),
        .I1(\partial_timeout_reg_n_0_[30] ),
        .I2(\partial_timeout_reg_n_0_[10] ),
        .I3(\partial_timeout_reg_n_0_[9] ),
        .O(\partial_timeout[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \partial_timeout[31]_i_9 
       (.I0(\partial_timeout_reg_n_0_[15] ),
        .I1(\partial_timeout_reg_n_0_[5] ),
        .I2(\partial_timeout_reg_n_0_[8] ),
        .I3(\partial_timeout_reg_n_0_[7] ),
        .O(\partial_timeout[31]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(\partial_timeout[0]_i_1_n_0 ),
        .Q(\partial_timeout_reg_n_0_[0] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[10]),
        .Q(\partial_timeout_reg_n_0_[10] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[11]),
        .Q(\partial_timeout_reg_n_0_[11] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[12]),
        .Q(\partial_timeout_reg_n_0_[12] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \partial_timeout_reg[12]_i_1 
       (.CI(\partial_timeout_reg[8]_i_1_n_0 ),
        .CO({\partial_timeout_reg[12]_i_1_n_0 ,\NLW_partial_timeout_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[12:9]),
        .S({\partial_timeout_reg_n_0_[12] ,\partial_timeout_reg_n_0_[11] ,\partial_timeout_reg_n_0_[10] ,\partial_timeout_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[13]),
        .Q(\partial_timeout_reg_n_0_[13] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[14]),
        .Q(\partial_timeout_reg_n_0_[14] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[15]),
        .Q(\partial_timeout_reg_n_0_[15] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[16]),
        .Q(\partial_timeout_reg_n_0_[16] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \partial_timeout_reg[16]_i_1 
       (.CI(\partial_timeout_reg[12]_i_1_n_0 ),
        .CO({\partial_timeout_reg[16]_i_1_n_0 ,\NLW_partial_timeout_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[16:13]),
        .S({\partial_timeout_reg_n_0_[16] ,\partial_timeout_reg_n_0_[15] ,\partial_timeout_reg_n_0_[14] ,\partial_timeout_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[17]),
        .Q(\partial_timeout_reg_n_0_[17] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[18]),
        .Q(\partial_timeout_reg_n_0_[18] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[19]),
        .Q(\partial_timeout_reg_n_0_[19] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[1]),
        .Q(\partial_timeout_reg_n_0_[1] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[20]),
        .Q(\partial_timeout_reg_n_0_[20] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \partial_timeout_reg[20]_i_1 
       (.CI(\partial_timeout_reg[16]_i_1_n_0 ),
        .CO({\partial_timeout_reg[20]_i_1_n_0 ,\NLW_partial_timeout_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[20:17]),
        .S({\partial_timeout_reg_n_0_[20] ,\partial_timeout_reg_n_0_[19] ,\partial_timeout_reg_n_0_[18] ,\partial_timeout_reg_n_0_[17] }));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[21]),
        .Q(\partial_timeout_reg_n_0_[21] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[22]),
        .Q(\partial_timeout_reg_n_0_[22] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[23]),
        .Q(\partial_timeout_reg_n_0_[23] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[24]),
        .Q(\partial_timeout_reg_n_0_[24] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \partial_timeout_reg[24]_i_1 
       (.CI(\partial_timeout_reg[20]_i_1_n_0 ),
        .CO({\partial_timeout_reg[24]_i_1_n_0 ,\NLW_partial_timeout_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[24:21]),
        .S({\partial_timeout_reg_n_0_[24] ,\partial_timeout_reg_n_0_[23] ,\partial_timeout_reg_n_0_[22] ,\partial_timeout_reg_n_0_[21] }));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[25]),
        .Q(\partial_timeout_reg_n_0_[25] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[26]),
        .Q(\partial_timeout_reg_n_0_[26] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[27]),
        .Q(\partial_timeout_reg_n_0_[27] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[28]),
        .Q(\partial_timeout_reg_n_0_[28] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \partial_timeout_reg[28]_i_1 
       (.CI(\partial_timeout_reg[24]_i_1_n_0 ),
        .CO({\partial_timeout_reg[28]_i_1_n_0 ,\NLW_partial_timeout_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[28:25]),
        .S({\partial_timeout_reg_n_0_[28] ,\partial_timeout_reg_n_0_[27] ,\partial_timeout_reg_n_0_[26] ,\partial_timeout_reg_n_0_[25] }));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[29]),
        .Q(\partial_timeout_reg_n_0_[29] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[2]),
        .Q(\partial_timeout_reg_n_0_[2] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[30]),
        .Q(\partial_timeout_reg_n_0_[30] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[31]),
        .Q(\partial_timeout_reg_n_0_[31] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \partial_timeout_reg[31]_i_3 
       (.CI(\partial_timeout_reg[28]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[31:29]),
        .S({\<const0> ,\partial_timeout_reg_n_0_[31] ,\partial_timeout_reg_n_0_[30] ,\partial_timeout_reg_n_0_[29] }));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[3]),
        .Q(\partial_timeout_reg_n_0_[3] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[4]),
        .Q(\partial_timeout_reg_n_0_[4] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \partial_timeout_reg[4]_i_1 
       (.CI(\<const0> ),
        .CO({\partial_timeout_reg[4]_i_1_n_0 ,\NLW_partial_timeout_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\partial_timeout_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[4:1]),
        .S({\partial_timeout_reg_n_0_[4] ,\partial_timeout_reg_n_0_[3] ,\partial_timeout_reg_n_0_[2] ,\partial_timeout_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[5]),
        .Q(\partial_timeout_reg_n_0_[5] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[6]),
        .Q(\partial_timeout_reg_n_0_[6] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[7]),
        .Q(\partial_timeout_reg_n_0_[7] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[8]),
        .Q(\partial_timeout_reg_n_0_[8] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \partial_timeout_reg[8]_i_1 
       (.CI(\partial_timeout_reg[4]_i_1_n_0 ),
        .CO({\partial_timeout_reg[8]_i_1_n_0 ,\NLW_partial_timeout_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[8:5]),
        .S({\partial_timeout_reg_n_0_[8] ,\partial_timeout_reg_n_0_[7] ,\partial_timeout_reg_n_0_[6] ,\partial_timeout_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(data0[9]),
        .Q(\partial_timeout_reg_n_0_[9] ),
        .R(\partial_timeout[31]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \por[0]_i_1 
       (.I0(\por_reg_n_0_[0] ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \por[1]_i_1 
       (.I0(\por_reg_n_0_[0] ),
        .I1(\por_reg_n_0_[1] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \por[2]_i_1 
       (.I0(\por_reg_n_0_[0] ),
        .I1(\por_reg_n_0_[1] ),
        .I2(\por_reg_n_0_[2] ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \por[3]_i_1 
       (.I0(\por_reg_n_0_[1] ),
        .I1(\por_reg_n_0_[0] ),
        .I2(\por_reg_n_0_[2] ),
        .I3(\por_reg_n_0_[3] ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \por[4]_inv_i_1 
       (.I0(\por_reg_n_0_[2] ),
        .I1(\por_reg_n_0_[0] ),
        .I2(\por_reg_n_0_[1] ),
        .I3(\por_reg_n_0_[3] ),
        .O(p_0_in[4]));
  FDRE #(
    .INIT(1'b0)) 
    \por_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in[0]),
        .Q(\por_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \por_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in[1]),
        .Q(\por_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \por_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in[2]),
        .Q(\por_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \por_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in[3]),
        .Q(\por_reg_n_0_[3] ),
        .R(\<const0> ));
  (* inverted = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \por_reg[4]_inv 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in[4]),
        .Q(pr),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    send_i_1
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(pr),
        .I3(button),
        .I4(\FSM_onehot_state[2]_i_4_n_0 ),
        .I5(\FSM_onehot_state[2]_i_3_n_0 ),
        .O(send_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    send_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(send_i_1_n_0),
        .Q(send_reg_n_0),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    start_i_1
       (.I0(button),
        .I1(pr),
        .I2(state__0[0]),
        .I3(received),
        .I4(framing),
        .I5(start),
        .O(start_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000004)) 
    start_i_2
       (.I0(start_i_3_n_0),
        .I1(\FSM_onehot_parser_reg_n_0_[3] ),
        .I2(start_i_4_n_0),
        .I3(start_i_5_n_0),
        .I4(start_i_6_n_0),
        .O(start));
  LUT6 #(
    .INIT(64'hFF6969FF69FFFF69)) 
    start_i_3
       (.I0(rd[7]),
        .I1(\challenge_reg_n_0_[15] ),
        .I2(\challenge_reg_n_0_[7] ),
        .I3(rd[6]),
        .I4(\challenge_reg_n_0_[14] ),
        .I5(\challenge_reg_n_0_[6] ),
        .O(start_i_3_n_0));
  LUT6 #(
    .INIT(64'h69FFFF69FF6969FF)) 
    start_i_4
       (.I0(rd[5]),
        .I1(\challenge_reg_n_0_[13] ),
        .I2(\challenge_reg_n_0_[5] ),
        .I3(rd[2]),
        .I4(\challenge_reg_n_0_[10] ),
        .I5(\challenge_reg_n_0_[2] ),
        .O(start_i_4_n_0));
  LUT6 #(
    .INIT(64'hFF6969FF69FFFF69)) 
    start_i_5
       (.I0(rd[1]),
        .I1(\challenge_reg_n_0_[9] ),
        .I2(\challenge_reg_n_0_[1] ),
        .I3(rd[0]),
        .I4(\challenge_reg_n_0_[8] ),
        .I5(\challenge_reg_n_0_[0] ),
        .O(start_i_5_n_0));
  LUT6 #(
    .INIT(64'hFF9696FF96FFFF96)) 
    start_i_6
       (.I0(rd[4]),
        .I1(\challenge_reg_n_0_[12] ),
        .I2(\challenge_reg_n_0_[4] ),
        .I3(rd[3]),
        .I4(\challenge_reg_n_0_[11] ),
        .I5(\challenge_reg_n_0_[3] ),
        .O(start_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    start_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(start_i_1_n_0),
        .Q(start_reg_n_0),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'hCAFFCA0F)) 
    \td[0]_i_2 
       (.I0(\challenge_reg_n_0_[8] ),
        .I1(\flags_reg_n_0_[0] ),
        .I2(index[0]),
        .I3(index[1]),
        .I4(\challenge_reg_n_0_[0] ),
        .O(\td[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h9669FF00)) 
    \td[0]_i_3 
       (.I0(\challenge_reg_n_0_[8] ),
        .I1(\flags_reg_n_0_[0] ),
        .I2(\challenge_reg_n_0_[0] ),
        .I3(led_OBUF[0]),
        .I4(index[0]),
        .O(\td[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h3C005088)) 
    \td[1]_i_1 
       (.I0(index[1]),
        .I1(\challenge_reg_n_0_[9] ),
        .I2(\challenge_reg_n_0_[1] ),
        .I3(index[0]),
        .I4(index[2]),
        .O(td[1]));
  LUT5 #(
    .INIT(32'h3C005088)) 
    \td[2]_i_1 
       (.I0(index[1]),
        .I1(\challenge_reg_n_0_[10] ),
        .I2(\challenge_reg_n_0_[2] ),
        .I3(index[0]),
        .I4(index[2]),
        .O(td[2]));
  LUT5 #(
    .INIT(32'hB0551A11)) 
    \td[3]_i_1 
       (.I0(index[2]),
        .I1(index[1]),
        .I2(\challenge_reg_n_0_[3] ),
        .I3(index[0]),
        .I4(\challenge_reg_n_0_[11] ),
        .O(td[3]));
  LUT5 #(
    .INIT(32'hB0551A11)) 
    \td[4]_i_1 
       (.I0(index[2]),
        .I1(index[1]),
        .I2(\challenge_reg_n_0_[4] ),
        .I3(index[0]),
        .I4(\challenge_reg_n_0_[12] ),
        .O(td[4]));
  LUT6 #(
    .INIT(64'hC3D800AA3CD80000)) 
    \td[5]_i_1 
       (.I0(index[1]),
        .I1(\flags_reg_n_0_[5] ),
        .I2(\challenge_reg_n_0_[5] ),
        .I3(index[2]),
        .I4(index[0]),
        .I5(\challenge_reg_n_0_[13] ),
        .O(td[5]));
  LUT5 #(
    .INIT(32'hB0551A11)) 
    \td[6]_i_1 
       (.I0(index[2]),
        .I1(index[1]),
        .I2(\challenge_reg_n_0_[6] ),
        .I3(index[0]),
        .I4(\challenge_reg_n_0_[14] ),
        .O(td[6]));
  LUT5 #(
    .INIT(32'h00101010)) 
    \td[7]_i_1 
       (.I0(tx_busy),
        .I1(send_reg_n_0),
        .I2(state__0[2]),
        .I3(index[1]),
        .I4(index[2]),
        .O(\td[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCE0A06C20CC8C400)) 
    \td[7]_i_2 
       (.I0(index[1]),
        .I1(index[0]),
        .I2(index[2]),
        .I3(\challenge_reg_n_0_[7] ),
        .I4(\flags_reg_n_0_[7] ),
        .I5(\challenge_reg_n_0_[15] ),
        .O(td[7]));
  FDRE #(
    .INIT(1'b0)) 
    \td_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\td[7]_i_1_n_0 ),
        .D(td[0]),
        .Q(\td_reg_n_0_[0] ),
        .R(reset));
  MUXF7 \td_reg[0]_i_1 
       (.I0(\td[0]_i_2_n_0 ),
        .I1(\td[0]_i_3_n_0 ),
        .O(td[0]),
        .S(index[2]));
  FDRE #(
    .INIT(1'b0)) 
    \td_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\td[7]_i_1_n_0 ),
        .D(td[1]),
        .Q(\td_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \td_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\td[7]_i_1_n_0 ),
        .D(td[2]),
        .Q(\td_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \td_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\td[7]_i_1_n_0 ),
        .D(td[3]),
        .Q(\td_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \td_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\td[7]_i_1_n_0 ),
        .D(td[4]),
        .Q(\td_reg_n_0_[4] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \td_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\td[7]_i_1_n_0 ),
        .D(td[5]),
        .Q(\td_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \td_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\td[7]_i_1_n_0 ),
        .D(td[6]),
        .Q(\td_reg_n_0_[6] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \td_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\td[7]_i_1_n_0 ),
        .D(td[7]),
        .Q(\td_reg_n_0_[7] ),
        .R(reset));
  LUT2 #(
    .INIT(4'h1)) 
    \timeout[0]_i_1 
       (.I0(state__0[0]),
        .I1(\timeout_reg_n_0_[0] ),
        .O(timeout[0]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[10]_i_1 
       (.I0(in11[10]),
        .I1(state__0[0]),
        .O(timeout[10]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[11]_i_1 
       (.I0(in11[11]),
        .I1(state__0[0]),
        .O(timeout[11]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[12]_i_1 
       (.I0(in11[12]),
        .I1(state__0[0]),
        .O(timeout[12]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[13]_i_1 
       (.I0(in11[13]),
        .I1(state__0[0]),
        .O(timeout[13]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[14]_i_1 
       (.I0(in11[14]),
        .I1(state__0[0]),
        .O(timeout[14]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[15]_i_1 
       (.I0(in11[15]),
        .I1(state__0[0]),
        .O(timeout[15]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[16]_i_1 
       (.I0(in11[16]),
        .I1(state__0[0]),
        .O(timeout[16]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[17]_i_1 
       (.I0(in11[17]),
        .I1(state__0[0]),
        .O(timeout[17]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[18]_i_1 
       (.I0(in11[18]),
        .I1(state__0[0]),
        .O(timeout[18]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[19]_i_1 
       (.I0(in11[19]),
        .I1(state__0[0]),
        .O(timeout[19]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[1]_i_1 
       (.I0(in11[1]),
        .I1(state__0[0]),
        .O(timeout[1]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[20]_i_1 
       (.I0(in11[20]),
        .I1(state__0[0]),
        .O(timeout[20]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[21]_i_1 
       (.I0(in11[21]),
        .I1(state__0[0]),
        .O(timeout[21]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[22]_i_1 
       (.I0(in11[22]),
        .I1(state__0[0]),
        .O(timeout[22]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[23]_i_1 
       (.I0(in11[23]),
        .I1(state__0[0]),
        .O(timeout[23]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[24]_i_1 
       (.I0(in11[24]),
        .I1(state__0[0]),
        .O(timeout[24]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[25]_i_1 
       (.I0(in11[25]),
        .I1(state__0[0]),
        .O(timeout[25]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[26]_i_1 
       (.I0(in11[26]),
        .I1(state__0[0]),
        .O(timeout[26]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[27]_i_1 
       (.I0(in11[27]),
        .I1(state__0[0]),
        .O(timeout[27]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[28]_i_1 
       (.I0(in11[28]),
        .I1(state__0[0]),
        .O(timeout[28]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[29]_i_1 
       (.I0(in11[29]),
        .I1(state__0[0]),
        .O(timeout[29]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[2]_i_1 
       (.I0(in11[2]),
        .I1(state__0[0]),
        .O(timeout[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[30]_i_1 
       (.I0(in11[30]),
        .I1(state__0[0]),
        .O(timeout[30]));
  LUT2 #(
    .INIT(4'hE)) 
    \timeout[31]_i_1 
       (.I0(state__0[1]),
        .I1(done),
        .O(\timeout[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[31]_i_2 
       (.I0(in11[31]),
        .I1(state__0[0]),
        .O(timeout[31]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[3]_i_1 
       (.I0(in11[3]),
        .I1(state__0[0]),
        .O(timeout[3]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[4]_i_1 
       (.I0(in11[4]),
        .I1(state__0[0]),
        .O(timeout[4]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[5]_i_1 
       (.I0(in11[5]),
        .I1(state__0[0]),
        .O(timeout[5]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[6]_i_1 
       (.I0(in11[6]),
        .I1(state__0[0]),
        .O(timeout[6]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[7]_i_1 
       (.I0(in11[7]),
        .I1(state__0[0]),
        .O(timeout[7]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[8]_i_1 
       (.I0(in11[8]),
        .I1(state__0[0]),
        .O(timeout[8]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \timeout[9]_i_1 
       (.I0(in11[9]),
        .I1(state__0[0]),
        .O(timeout[9]));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[0]),
        .Q(\timeout_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[10]),
        .Q(\timeout_reg_n_0_[10] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[11]),
        .Q(\timeout_reg_n_0_[11] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[12]),
        .Q(\timeout_reg_n_0_[12] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[12]_i_2 
       (.CI(\timeout_reg[8]_i_2_n_0 ),
        .CO({\timeout_reg[12]_i_2_n_0 ,\NLW_timeout_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[12:9]),
        .S({\timeout_reg_n_0_[12] ,\timeout_reg_n_0_[11] ,\timeout_reg_n_0_[10] ,\timeout_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[13]),
        .Q(\timeout_reg_n_0_[13] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[14]),
        .Q(\timeout_reg_n_0_[14] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[15]),
        .Q(\timeout_reg_n_0_[15] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[16]),
        .Q(\timeout_reg_n_0_[16] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[16]_i_2 
       (.CI(\timeout_reg[12]_i_2_n_0 ),
        .CO({\timeout_reg[16]_i_2_n_0 ,\NLW_timeout_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[16:13]),
        .S({\timeout_reg_n_0_[16] ,\timeout_reg_n_0_[15] ,\timeout_reg_n_0_[14] ,\timeout_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[17]),
        .Q(\timeout_reg_n_0_[17] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[18]),
        .Q(\timeout_reg_n_0_[18] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[19]),
        .Q(\timeout_reg_n_0_[19] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[1]),
        .Q(\timeout_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[20]),
        .Q(\timeout_reg_n_0_[20] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[20]_i_2 
       (.CI(\timeout_reg[16]_i_2_n_0 ),
        .CO({\timeout_reg[20]_i_2_n_0 ,\NLW_timeout_reg[20]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[20:17]),
        .S({\timeout_reg_n_0_[20] ,\timeout_reg_n_0_[19] ,\timeout_reg_n_0_[18] ,\timeout_reg_n_0_[17] }));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[21]),
        .Q(\timeout_reg_n_0_[21] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[22]),
        .Q(\timeout_reg_n_0_[22] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[23]),
        .Q(\timeout_reg_n_0_[23] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[24]),
        .Q(\timeout_reg_n_0_[24] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[24]_i_2 
       (.CI(\timeout_reg[20]_i_2_n_0 ),
        .CO({\timeout_reg[24]_i_2_n_0 ,\NLW_timeout_reg[24]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[24:21]),
        .S({\timeout_reg_n_0_[24] ,\timeout_reg_n_0_[23] ,\timeout_reg_n_0_[22] ,\timeout_reg_n_0_[21] }));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[25]),
        .Q(\timeout_reg_n_0_[25] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[26]),
        .Q(\timeout_reg_n_0_[26] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[27]),
        .Q(\timeout_reg_n_0_[27] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[28]),
        .Q(\timeout_reg_n_0_[28] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[28]_i_2 
       (.CI(\timeout_reg[24]_i_2_n_0 ),
        .CO({\timeout_reg[28]_i_2_n_0 ,\NLW_timeout_reg[28]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[28:25]),
        .S({\timeout_reg_n_0_[28] ,\timeout_reg_n_0_[27] ,\timeout_reg_n_0_[26] ,\timeout_reg_n_0_[25] }));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[29]),
        .Q(\timeout_reg_n_0_[29] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[2]),
        .Q(\timeout_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[30]),
        .Q(\timeout_reg_n_0_[30] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[31]),
        .Q(\timeout_reg_n_0_[31] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[31]_i_3 
       (.CI(\timeout_reg[28]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[31:29]),
        .S({\<const0> ,\timeout_reg_n_0_[31] ,\timeout_reg_n_0_[30] ,\timeout_reg_n_0_[29] }));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[3]),
        .Q(\timeout_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[4]),
        .Q(\timeout_reg_n_0_[4] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[4]_i_2 
       (.CI(\<const0> ),
        .CO({\timeout_reg[4]_i_2_n_0 ,\NLW_timeout_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\timeout_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[4:1]),
        .S({\timeout_reg_n_0_[4] ,\timeout_reg_n_0_[3] ,\timeout_reg_n_0_[2] ,\timeout_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[5]),
        .Q(\timeout_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[6]),
        .Q(\timeout_reg_n_0_[6] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[7]),
        .Q(\timeout_reg_n_0_[7] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[8]),
        .Q(\timeout_reg_n_0_[8] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[8]_i_2 
       (.CI(\timeout_reg[4]_i_2_n_0 ),
        .CO({\timeout_reg[8]_i_2_n_0 ,\NLW_timeout_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(in11[8:5]),
        .S({\timeout_reg_n_0_[8] ,\timeout_reg_n_0_[7] ,\timeout_reg_n_0_[6] ,\timeout_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\timeout[31]_i_1_n_0 ),
        .D(timeout[9]),
        .Q(\timeout_reg_n_0_[9] ),
        .R(reset));
  cbdc_serial_engine u_puf
       (.busy(led_OBUF[3]),
        .challenge({\challenge_reg_n_0_[15] ,\challenge_reg_n_0_[14] ,\challenge_reg_n_0_[13] ,\challenge_reg_n_0_[12] ,\challenge_reg_n_0_[11] ,\challenge_reg_n_0_[10] ,\challenge_reg_n_0_[9] ,\challenge_reg_n_0_[8] ,\challenge_reg_n_0_[7] ,\challenge_reg_n_0_[6] ,\challenge_reg_n_0_[5] ,\challenge_reg_n_0_[4] ,\challenge_reg_n_0_[3] ,\challenge_reg_n_0_[2] ,\challenge_reg_n_0_[1] ,\challenge_reg_n_0_[0] }),
        .clk(clk_IBUF_BUFG),
        .error(error),
        .reset(reset),
        .response(response),
        .start(start_reg_n_0),
        .valid(valid));
  (* STABLE_CYCLES = "1000000" *) 
  (* W = "20" *) 
  cbdc_button u_reset
       (.clk(clk_IBUF_BUFG),
        .level_o(button),
        .raw_i(btnU_IBUF),
        .reset(pr));
  (* CLKS = "868" *) 
  cbdc_uart uart
       (.busy(tx_busy),
        .clk(clk_IBUF_BUFG),
        .framing_error(framing),
        .received(received),
        .reset(reset),
        .rx(uart_rx_IBUF),
        .rx_data(rd),
        .send(send_reg_n_0),
        .tx(uart_tx_OBUF),
        .tx_data({\td_reg_n_0_[7] ,\td_reg_n_0_[6] ,\td_reg_n_0_[5] ,\td_reg_n_0_[4] ,\td_reg_n_0_[3] ,\td_reg_n_0_[2] ,\td_reg_n_0_[1] ,\td_reg_n_0_[0] }));
  LUT2 #(
    .INIT(4'hE)) 
    uart_i_1
       (.I0(button),
        .I1(pr),
        .O(reset));
  IBUF uart_rx_IBUF_inst
       (.I(uart_rx),
        .O(uart_rx_IBUF));
  OBUF uart_tx_OBUF_inst
       (.I(uart_tx_OBUF),
        .O(uart_tx));
endmodule

module cbdc_serial_engine
   (clk,
    reset,
    start,
    challenge,
    valid,
    error,
    busy,
    response,
    edges);
  input clk;
  input reset;
  input start;
  input [15:0]challenge;
  output valid;
  output error;
  output busy;
  output response;
  output [1:0]edges;

  wire busy;
  wire [15:0]c;
  wire [15:0]challenge;
  wire clk;
  wire clr;
  wire error;
  wire excite;
  wire latch;
  wire q;
  wire reset;
  wire response;
  wire start;
  wire valid;

  (* AUTO_PARITY = "0" *) 
  (* CAPTURE_MODE = "0" *) 
  (* CROSS_COUPLE = "1" *) 
  (* DIAGNOSTIC = "0" *) 
  (* DUAL_ARBITER = "0" *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_core u_core
       (.c(c),
        .clr(clr),
        .excite(excite),
        .latch(latch),
        .q(q));
  (* AUTO_PARITY = "0" *) 
  (* CLR_CYCLES = "4" *) 
  (* EXCITE_CYCLES = "8" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* HOLD_CYCLES = "4" *) 
  (* INIT_SETTLE_CYCLES = "4" *) 
  (* LATCH_CYCLES = "8" *) 
  (* N_STAGES = "16" *) 
  (* ST_DONE = "3'b111" *) 
  (* ST_DROP_EXCITE = "3'b110" *) 
  (* ST_DROP_LATCH = "3'b101" *) 
  (* ST_EXCITE = "3'b011" *) 
  (* ST_IDLE = "3'b000" *) 
  (* ST_INIT_CLR = "3'b001" *) 
  (* ST_INIT_SETTLE = "3'b010" *) 
  (* ST_LATCH = "3'b100" *) 
  cbdc_puf_ctrl u_ctrl
       (.busy_o(busy),
        .challenge_i(challenge),
        .clk(clk),
        .puf_c_o(c),
        .puf_clr_o(clr),
        .puf_excite_o(excite),
        .puf_latch_o(latch),
        .puf_q_i(q),
        .request_error_o(error),
        .resp_bit_o(response),
        .resp_valid_o(valid),
        .rst_n(reset),
        .start_i(start));
endmodule

(* CLKS = "868" *) 
module cbdc_uart
   (clk,
    reset,
    rx,
    send,
    tx_data,
    tx,
    busy,
    rx_data,
    received,
    framing_error);
  input clk;
  input reset;
  input rx;
  input send;
  input [7:0]tx_data;
  output tx;
  output busy;
  output [7:0]rx_data;
  output received;
  output framing_error;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_sequential_rs[0]_i_1_n_0 ;
  wire \FSM_sequential_rs[0]_i_2_n_0 ;
  wire \FSM_sequential_rs[0]_i_3_n_0 ;
  wire \FSM_sequential_rs[0]_i_4_n_0 ;
  wire \FSM_sequential_rs[0]_i_5_n_0 ;
  wire \FSM_sequential_rs[0]_i_6_n_0 ;
  wire \FSM_sequential_rs[1]_i_1_n_0 ;
  wire \FSM_sequential_rs[1]_i_2_n_0 ;
  wire busy;
  wire busy_i_1_n_0;
  wire busy_i_2_n_0;
  wire clk;
  wire framing_error;
  wire framing_error_i_1_n_0;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire meta;
  wire [3:0]p_0_in__0;
  wire [0:0]rbit;
  wire \rbit[0]_i_1_n_0 ;
  wire \rbit[1]_i_1_n_0 ;
  wire \rbit[2]_i_1_n_0 ;
  wire \rbit[3]_i_2_n_0 ;
  wire \rbit[3]_i_3_n_0 ;
  wire \rbit[3]_i_4_n_0 ;
  wire \rbit[3]_i_5_n_0 ;
  wire \rbit_reg_n_0_[0] ;
  wire \rbit_reg_n_0_[1] ;
  wire \rbit_reg_n_0_[2] ;
  wire \rbit_reg_n_0_[3] ;
  wire [0:0]rc;
  wire \rc[0]_i_1_n_0 ;
  wire \rc[10]_i_1_n_0 ;
  wire \rc[11]_i_1_n_0 ;
  wire \rc[12]_i_1_n_0 ;
  wire \rc[13]_i_1_n_0 ;
  wire \rc[14]_i_1_n_0 ;
  wire \rc[15]_i_1_n_0 ;
  wire \rc[16]_i_1_n_0 ;
  wire \rc[17]_i_1_n_0 ;
  wire \rc[18]_i_1_n_0 ;
  wire \rc[19]_i_1_n_0 ;
  wire \rc[1]_i_1_n_0 ;
  wire \rc[20]_i_1_n_0 ;
  wire \rc[21]_i_1_n_0 ;
  wire \rc[22]_i_1_n_0 ;
  wire \rc[23]_i_1_n_0 ;
  wire \rc[24]_i_1_n_0 ;
  wire \rc[25]_i_1_n_0 ;
  wire \rc[26]_i_1_n_0 ;
  wire \rc[27]_i_1_n_0 ;
  wire \rc[28]_i_1_n_0 ;
  wire \rc[29]_i_1_n_0 ;
  wire \rc[2]_i_1_n_0 ;
  wire \rc[30]_i_1_n_0 ;
  wire \rc[31]_i_2_n_0 ;
  wire \rc[31]_i_4_n_0 ;
  wire \rc[31]_i_5_n_0 ;
  wire \rc[31]_i_6_n_0 ;
  wire \rc[31]_i_7_n_0 ;
  wire \rc[31]_i_8_n_0 ;
  wire \rc[3]_i_1_n_0 ;
  wire \rc[4]_i_1_n_0 ;
  wire \rc[5]_i_1_n_0 ;
  wire \rc[6]_i_1_n_0 ;
  wire \rc[7]_i_1_n_0 ;
  wire \rc[8]_i_1_n_0 ;
  wire \rc[9]_i_1_n_0 ;
  wire \rc_reg[12]_i_2_n_0 ;
  wire \rc_reg[12]_i_2_n_4 ;
  wire \rc_reg[12]_i_2_n_5 ;
  wire \rc_reg[12]_i_2_n_6 ;
  wire \rc_reg[12]_i_2_n_7 ;
  wire \rc_reg[16]_i_2_n_0 ;
  wire \rc_reg[16]_i_2_n_4 ;
  wire \rc_reg[16]_i_2_n_5 ;
  wire \rc_reg[16]_i_2_n_6 ;
  wire \rc_reg[16]_i_2_n_7 ;
  wire \rc_reg[20]_i_2_n_0 ;
  wire \rc_reg[20]_i_2_n_4 ;
  wire \rc_reg[20]_i_2_n_5 ;
  wire \rc_reg[20]_i_2_n_6 ;
  wire \rc_reg[20]_i_2_n_7 ;
  wire \rc_reg[24]_i_2_n_0 ;
  wire \rc_reg[24]_i_2_n_4 ;
  wire \rc_reg[24]_i_2_n_5 ;
  wire \rc_reg[24]_i_2_n_6 ;
  wire \rc_reg[24]_i_2_n_7 ;
  wire \rc_reg[28]_i_2_n_0 ;
  wire \rc_reg[28]_i_2_n_4 ;
  wire \rc_reg[28]_i_2_n_5 ;
  wire \rc_reg[28]_i_2_n_6 ;
  wire \rc_reg[28]_i_2_n_7 ;
  wire \rc_reg[31]_i_3_n_5 ;
  wire \rc_reg[31]_i_3_n_6 ;
  wire \rc_reg[31]_i_3_n_7 ;
  wire \rc_reg[4]_i_2_n_0 ;
  wire \rc_reg[4]_i_2_n_4 ;
  wire \rc_reg[4]_i_2_n_5 ;
  wire \rc_reg[4]_i_2_n_6 ;
  wire \rc_reg[4]_i_2_n_7 ;
  wire \rc_reg[8]_i_2_n_0 ;
  wire \rc_reg[8]_i_2_n_4 ;
  wire \rc_reg[8]_i_2_n_5 ;
  wire \rc_reg[8]_i_2_n_6 ;
  wire \rc_reg[8]_i_2_n_7 ;
  wire \rc_reg_n_0_[0] ;
  wire \rc_reg_n_0_[10] ;
  wire \rc_reg_n_0_[11] ;
  wire \rc_reg_n_0_[12] ;
  wire \rc_reg_n_0_[13] ;
  wire \rc_reg_n_0_[14] ;
  wire \rc_reg_n_0_[15] ;
  wire \rc_reg_n_0_[16] ;
  wire \rc_reg_n_0_[17] ;
  wire \rc_reg_n_0_[18] ;
  wire \rc_reg_n_0_[19] ;
  wire \rc_reg_n_0_[1] ;
  wire \rc_reg_n_0_[20] ;
  wire \rc_reg_n_0_[21] ;
  wire \rc_reg_n_0_[22] ;
  wire \rc_reg_n_0_[23] ;
  wire \rc_reg_n_0_[24] ;
  wire \rc_reg_n_0_[25] ;
  wire \rc_reg_n_0_[26] ;
  wire \rc_reg_n_0_[27] ;
  wire \rc_reg_n_0_[28] ;
  wire \rc_reg_n_0_[29] ;
  wire \rc_reg_n_0_[2] ;
  wire \rc_reg_n_0_[30] ;
  wire \rc_reg_n_0_[31] ;
  wire \rc_reg_n_0_[3] ;
  wire \rc_reg_n_0_[4] ;
  wire \rc_reg_n_0_[5] ;
  wire \rc_reg_n_0_[6] ;
  wire \rc_reg_n_0_[7] ;
  wire \rc_reg_n_0_[8] ;
  wire \rc_reg_n_0_[9] ;
  wire received;
  wire reset;
  wire [1:0]rs;
  wire \rshift[0]_i_1_n_0 ;
  wire \rshift[1]_i_1_n_0 ;
  wire \rshift[2]_i_1_n_0 ;
  wire \rshift[2]_i_2_n_0 ;
  wire \rshift[3]_i_1_n_0 ;
  wire \rshift[3]_i_2_n_0 ;
  wire \rshift[4]_i_1_n_0 ;
  wire \rshift[5]_i_1_n_0 ;
  wire \rshift[6]_i_1_n_0 ;
  wire \rshift[6]_i_2_n_0 ;
  wire \rshift[6]_i_3_n_0 ;
  wire \rshift[6]_i_4_n_0 ;
  wire \rshift[7]_i_1_n_0 ;
  wire \rshift_reg_n_0_[0] ;
  wire \rshift_reg_n_0_[1] ;
  wire \rshift_reg_n_0_[2] ;
  wire \rshift_reg_n_0_[3] ;
  wire \rshift_reg_n_0_[4] ;
  wire \rshift_reg_n_0_[5] ;
  wire \rshift_reg_n_0_[6] ;
  wire \rshift_reg_n_0_[7] ;
  wire rx;
  wire [7:0]rx_data;
  wire \rx_data[7]_i_10_n_0 ;
  wire \rx_data[7]_i_1_n_0 ;
  wire \rx_data[7]_i_2_n_0 ;
  wire \rx_data[7]_i_3_n_0 ;
  wire \rx_data[7]_i_4_n_0 ;
  wire \rx_data[7]_i_5_n_0 ;
  wire \rx_data[7]_i_6_n_0 ;
  wire \rx_data[7]_i_7_n_0 ;
  wire \rx_data[7]_i_8_n_0 ;
  wire \rx_data[7]_i_9_n_0 ;
  wire send;
  wire [8:1]shift;
  wire \shift[0]_i_10_n_0 ;
  wire \shift[0]_i_11_n_0 ;
  wire \shift[0]_i_1_n_0 ;
  wire \shift[0]_i_2_n_0 ;
  wire \shift[0]_i_3_n_0 ;
  wire \shift[0]_i_4_n_0 ;
  wire \shift[0]_i_5_n_0 ;
  wire \shift[0]_i_6_n_0 ;
  wire \shift[0]_i_7_n_0 ;
  wire \shift[0]_i_8_n_0 ;
  wire \shift[0]_i_9_n_0 ;
  wire \shift[1]_i_1_n_0 ;
  wire \shift[2]_i_1_n_0 ;
  wire \shift[3]_i_1_n_0 ;
  wire \shift[4]_i_1_n_0 ;
  wire \shift[5]_i_1_n_0 ;
  wire \shift[6]_i_1_n_0 ;
  wire \shift[7]_i_1_n_0 ;
  wire \shift[8]_i_1_n_0 ;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire sync;
  wire [0:0]tbit;
  wire \tbit[3]_i_1_n_0 ;
  wire [3:0]tbit_reg;
  wire \tc[0]_i_2_n_0 ;
  wire \tc[0]_i_3_n_0 ;
  wire \tc[0]_i_4_n_0 ;
  wire \tc[0]_i_5_n_0 ;
  wire \tc[0]_i_6_n_0 ;
  wire \tc[12]_i_2_n_0 ;
  wire \tc[12]_i_3_n_0 ;
  wire \tc[12]_i_4_n_0 ;
  wire \tc[12]_i_5_n_0 ;
  wire \tc[16]_i_2_n_0 ;
  wire \tc[16]_i_3_n_0 ;
  wire \tc[16]_i_4_n_0 ;
  wire \tc[16]_i_5_n_0 ;
  wire \tc[20]_i_2_n_0 ;
  wire \tc[20]_i_3_n_0 ;
  wire \tc[20]_i_4_n_0 ;
  wire \tc[20]_i_5_n_0 ;
  wire \tc[24]_i_2_n_0 ;
  wire \tc[24]_i_3_n_0 ;
  wire \tc[24]_i_4_n_0 ;
  wire \tc[24]_i_5_n_0 ;
  wire \tc[28]_i_2_n_0 ;
  wire \tc[28]_i_3_n_0 ;
  wire \tc[28]_i_4_n_0 ;
  wire \tc[28]_i_5_n_0 ;
  wire \tc[4]_i_2_n_0 ;
  wire \tc[4]_i_3_n_0 ;
  wire \tc[4]_i_4_n_0 ;
  wire \tc[4]_i_5_n_0 ;
  wire \tc[8]_i_2_n_0 ;
  wire \tc[8]_i_3_n_0 ;
  wire \tc[8]_i_4_n_0 ;
  wire \tc[8]_i_5_n_0 ;
  wire [31:0]tc_reg;
  wire \tc_reg[0]_i_1_n_0 ;
  wire \tc_reg[0]_i_1_n_4 ;
  wire \tc_reg[0]_i_1_n_5 ;
  wire \tc_reg[0]_i_1_n_6 ;
  wire \tc_reg[0]_i_1_n_7 ;
  wire \tc_reg[12]_i_1_n_0 ;
  wire \tc_reg[12]_i_1_n_4 ;
  wire \tc_reg[12]_i_1_n_5 ;
  wire \tc_reg[12]_i_1_n_6 ;
  wire \tc_reg[12]_i_1_n_7 ;
  wire \tc_reg[16]_i_1_n_0 ;
  wire \tc_reg[16]_i_1_n_4 ;
  wire \tc_reg[16]_i_1_n_5 ;
  wire \tc_reg[16]_i_1_n_6 ;
  wire \tc_reg[16]_i_1_n_7 ;
  wire \tc_reg[20]_i_1_n_0 ;
  wire \tc_reg[20]_i_1_n_4 ;
  wire \tc_reg[20]_i_1_n_5 ;
  wire \tc_reg[20]_i_1_n_6 ;
  wire \tc_reg[20]_i_1_n_7 ;
  wire \tc_reg[24]_i_1_n_0 ;
  wire \tc_reg[24]_i_1_n_4 ;
  wire \tc_reg[24]_i_1_n_5 ;
  wire \tc_reg[24]_i_1_n_6 ;
  wire \tc_reg[24]_i_1_n_7 ;
  wire \tc_reg[28]_i_1_n_4 ;
  wire \tc_reg[28]_i_1_n_5 ;
  wire \tc_reg[28]_i_1_n_6 ;
  wire \tc_reg[28]_i_1_n_7 ;
  wire \tc_reg[4]_i_1_n_0 ;
  wire \tc_reg[4]_i_1_n_4 ;
  wire \tc_reg[4]_i_1_n_5 ;
  wire \tc_reg[4]_i_1_n_6 ;
  wire \tc_reg[4]_i_1_n_7 ;
  wire \tc_reg[8]_i_1_n_0 ;
  wire \tc_reg[8]_i_1_n_4 ;
  wire \tc_reg[8]_i_1_n_5 ;
  wire \tc_reg[8]_i_1_n_6 ;
  wire \tc_reg[8]_i_1_n_7 ;
  wire tx;
  wire [7:0]tx_data;
  wire [3:0]\NLW_rc_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_rc_reg[16]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_rc_reg[20]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_rc_reg[24]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_rc_reg[28]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_rc_reg[4]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_rc_reg[8]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_tc_reg[0]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tc_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tc_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tc_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tc_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tc_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_tc_reg[8]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h00050505FFF2F2F2)) 
    \FSM_sequential_rs[0]_i_1 
       (.I0(\rx_data[7]_i_2_n_0 ),
        .I1(\FSM_sequential_rs[0]_i_2_n_0 ),
        .I2(\FSM_sequential_rs[0]_i_3_n_0 ),
        .I3(\FSM_sequential_rs[0]_i_4_n_0 ),
        .I4(\FSM_sequential_rs[0]_i_5_n_0 ),
        .I5(rs[0]),
        .O(\FSM_sequential_rs[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \FSM_sequential_rs[0]_i_2 
       (.I0(\rbit_reg_n_0_[2] ),
        .I1(\rbit_reg_n_0_[3] ),
        .I2(\rbit_reg_n_0_[1] ),
        .I3(\rbit_reg_n_0_[0] ),
        .O(\FSM_sequential_rs[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \FSM_sequential_rs[0]_i_3 
       (.I0(rs[1]),
        .I1(rs[0]),
        .I2(sync),
        .O(\FSM_sequential_rs[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \FSM_sequential_rs[0]_i_4 
       (.I0(\rx_data[7]_i_3_n_0 ),
        .I1(\rc_reg_n_0_[26] ),
        .I2(\rc_reg_n_0_[27] ),
        .I3(\rx_data[7]_i_5_n_0 ),
        .O(\FSM_sequential_rs[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \FSM_sequential_rs[0]_i_5 
       (.I0(\rc_reg_n_0_[1] ),
        .I1(\rc_reg_n_0_[9] ),
        .I2(rs[0]),
        .I3(rs[1]),
        .I4(\FSM_sequential_rs[0]_i_6_n_0 ),
        .O(\FSM_sequential_rs[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \FSM_sequential_rs[0]_i_6 
       (.I0(\rc_reg_n_0_[7] ),
        .I1(\rc_reg_n_0_[6] ),
        .I2(\rc_reg_n_0_[4] ),
        .O(\FSM_sequential_rs[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h03CC46CC)) 
    \FSM_sequential_rs[1]_i_1 
       (.I0(\FSM_sequential_rs[1]_i_2_n_0 ),
        .I1(rs[1]),
        .I2(sync),
        .I3(rs[0]),
        .I4(\rx_data[7]_i_2_n_0 ),
        .O(\FSM_sequential_rs[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \FSM_sequential_rs[1]_i_2 
       (.I0(\FSM_sequential_rs[0]_i_5_n_0 ),
        .I1(\rx_data[7]_i_5_n_0 ),
        .I2(\rc_reg_n_0_[27] ),
        .I3(\rc_reg_n_0_[26] ),
        .I4(\rx_data[7]_i_3_n_0 ),
        .O(\FSM_sequential_rs[1]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:01,iSTATE0:11,iSTATE1:00,iSTATE2:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rs_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_rs[0]_i_1_n_0 ),
        .Q(rs[0]),
        .R(reset));
  (* FSM_ENCODED_STATES = "iSTATE:01,iSTATE0:11,iSTATE1:00,iSTATE2:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rs_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_rs[1]_i_1_n_0 ),
        .Q(rs[1]),
        .R(reset));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT4 #(
    .INIT(16'h7F70)) 
    busy_i_1
       (.I0(\shift[0]_i_3_n_0 ),
        .I1(busy_i_2_n_0),
        .I2(busy),
        .I3(send),
        .O(busy_i_1_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    busy_i_2
       (.I0(tbit_reg[2]),
        .I1(tbit_reg[1]),
        .I2(tbit_reg[3]),
        .I3(tbit_reg[0]),
        .O(busy_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    busy_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_i_1_n_0),
        .Q(busy),
        .R(reset));
  LUT3 #(
    .INIT(8'h40)) 
    framing_error_i_1
       (.I0(sync),
        .I1(rs[0]),
        .I2(\rx_data[7]_i_2_n_0 ),
        .O(framing_error_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    framing_error_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(framing_error_i_1_n_0),
        .Q(framing_error),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDSE #(
    .INIT(1'b1)) 
    meta_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(rx),
        .Q(meta),
        .S(reset));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \rbit[0]_i_1 
       (.I0(rs[1]),
        .I1(\rbit_reg_n_0_[0] ),
        .O(\rbit[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \rbit[1]_i_1 
       (.I0(\rbit_reg_n_0_[0] ),
        .I1(rs[1]),
        .I2(\rbit_reg_n_0_[1] ),
        .O(\rbit[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \rbit[2]_i_1 
       (.I0(\rbit_reg_n_0_[0] ),
        .I1(\rbit_reg_n_0_[1] ),
        .I2(rs[1]),
        .I3(\rbit_reg_n_0_[2] ),
        .O(\rbit[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF000040000000)) 
    \rbit[3]_i_1 
       (.I0(\rbit[3]_i_3_n_0 ),
        .I1(rs[1]),
        .I2(\rc_reg_n_0_[1] ),
        .I3(\rbit[3]_i_4_n_0 ),
        .I4(\FSM_sequential_rs[0]_i_4_n_0 ),
        .I5(\rbit[3]_i_5_n_0 ),
        .O(rbit));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h6CCC0000)) 
    \rbit[3]_i_2 
       (.I0(\rbit_reg_n_0_[2] ),
        .I1(\rbit_reg_n_0_[3] ),
        .I2(\rbit_reg_n_0_[1] ),
        .I3(\rbit_reg_n_0_[0] ),
        .I4(rs[1]),
        .O(\rbit[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAEAAAAA)) 
    \rbit[3]_i_3 
       (.I0(rs[0]),
        .I1(\rbit_reg_n_0_[0] ),
        .I2(\rbit_reg_n_0_[1] ),
        .I3(\rbit_reg_n_0_[3] ),
        .I4(\rbit_reg_n_0_[2] ),
        .O(\rbit[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \rbit[3]_i_4 
       (.I0(\rc_reg_n_0_[7] ),
        .I1(\rc_reg_n_0_[9] ),
        .I2(\rc_reg_n_0_[4] ),
        .I3(\rc_reg_n_0_[6] ),
        .O(\rbit[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rbit[3]_i_5 
       (.I0(\rc_reg_n_0_[9] ),
        .I1(sync),
        .I2(\rc_reg_n_0_[1] ),
        .I3(rs[1]),
        .I4(rs[0]),
        .I5(\FSM_sequential_rs[0]_i_6_n_0 ),
        .O(\rbit[3]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rbit_reg[0] 
       (.C(clk),
        .CE(rbit),
        .D(\rbit[0]_i_1_n_0 ),
        .Q(\rbit_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rbit_reg[1] 
       (.C(clk),
        .CE(rbit),
        .D(\rbit[1]_i_1_n_0 ),
        .Q(\rbit_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rbit_reg[2] 
       (.C(clk),
        .CE(rbit),
        .D(\rbit[2]_i_1_n_0 ),
        .Q(\rbit_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rbit_reg[3] 
       (.C(clk),
        .CE(rbit),
        .D(\rbit[3]_i_2_n_0 ),
        .Q(\rbit_reg_n_0_[3] ),
        .R(reset));
  LUT4 #(
    .INIT(16'h555C)) 
    \rc[0]_i_1 
       (.I0(\rc_reg_n_0_[0] ),
        .I1(sync),
        .I2(rs[0]),
        .I3(rs[1]),
        .O(\rc[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[10]_i_1 
       (.I0(\rc_reg[12]_i_2_n_6 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[11]_i_1 
       (.I0(\rc_reg[12]_i_2_n_5 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[12]_i_1 
       (.I0(\rc_reg[12]_i_2_n_4 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[13]_i_1 
       (.I0(\rc_reg[16]_i_2_n_7 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[14]_i_1 
       (.I0(\rc_reg[16]_i_2_n_6 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[15]_i_1 
       (.I0(\rc_reg[16]_i_2_n_5 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[16]_i_1 
       (.I0(\rc_reg[16]_i_2_n_4 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[17]_i_1 
       (.I0(\rc_reg[20]_i_2_n_7 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[18]_i_1 
       (.I0(\rc_reg[20]_i_2_n_6 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[19]_i_1 
       (.I0(\rc_reg[20]_i_2_n_5 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[1]_i_1 
       (.I0(\rc_reg[4]_i_2_n_7 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[20]_i_1 
       (.I0(\rc_reg[20]_i_2_n_4 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[21]_i_1 
       (.I0(\rc_reg[24]_i_2_n_7 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[22]_i_1 
       (.I0(\rc_reg[24]_i_2_n_6 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[23]_i_1 
       (.I0(\rc_reg[24]_i_2_n_5 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[24]_i_1 
       (.I0(\rc_reg[24]_i_2_n_4 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[25]_i_1 
       (.I0(\rc_reg[28]_i_2_n_7 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[26]_i_1 
       (.I0(\rc_reg[28]_i_2_n_6 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[27]_i_1 
       (.I0(\rc_reg[28]_i_2_n_5 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[28]_i_1 
       (.I0(\rc_reg[28]_i_2_n_4 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[29]_i_1 
       (.I0(\rc_reg[31]_i_3_n_7 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[2]_i_1 
       (.I0(\rc_reg[4]_i_2_n_6 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[30]_i_1 
       (.I0(\rc_reg[31]_i_3_n_6 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[30]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEF)) 
    \rc[31]_i_1 
       (.I0(rs[1]),
        .I1(rs[0]),
        .I2(sync),
        .O(rc));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[31]_i_2 
       (.I0(\rc_reg[31]_i_3_n_5 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFEAAFEAAFEFEFEEE)) 
    \rc[31]_i_4 
       (.I0(\rc[31]_i_6_n_0 ),
        .I1(rs[1]),
        .I2(rs[0]),
        .I3(\rc_reg_n_0_[26] ),
        .I4(\FSM_sequential_rs[0]_i_6_n_0 ),
        .I5(\rc_reg_n_0_[1] ),
        .O(\rc[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFCA8FCEC)) 
    \rc[31]_i_5 
       (.I0(\rx_data[7]_i_3_n_0 ),
        .I1(rs[1]),
        .I2(rs[0]),
        .I3(\rc_reg_n_0_[31] ),
        .I4(\rc_reg_n_0_[9] ),
        .O(\rc[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEEC0)) 
    \rc[31]_i_6 
       (.I0(\rc_reg_n_0_[4] ),
        .I1(\rc_reg_n_0_[28] ),
        .I2(rs[0]),
        .I3(rs[1]),
        .I4(\rc[31]_i_7_n_0 ),
        .I5(\rc[31]_i_8_n_0 ),
        .O(\rc[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hF4F0FE00)) 
    \rc[31]_i_7 
       (.I0(\rc_reg_n_0_[1] ),
        .I1(\rc_reg_n_0_[9] ),
        .I2(\rc_reg_n_0_[27] ),
        .I3(rs[0]),
        .I4(rs[1]),
        .O(\rc[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFF0FAF0FFF0BAB0)) 
    \rc[31]_i_8 
       (.I0(\rc_reg_n_0_[29] ),
        .I1(\rc_reg_n_0_[6] ),
        .I2(rs[1]),
        .I3(rs[0]),
        .I4(\rc_reg_n_0_[30] ),
        .I5(\rc_reg_n_0_[7] ),
        .O(\rc[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[3]_i_1 
       (.I0(\rc_reg[4]_i_2_n_5 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[4]_i_1 
       (.I0(\rc_reg[4]_i_2_n_4 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[5]_i_1 
       (.I0(\rc_reg[8]_i_2_n_7 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[6]_i_1 
       (.I0(\rc_reg[8]_i_2_n_6 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[7]_i_1 
       (.I0(\rc_reg[8]_i_2_n_5 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[8]_i_1 
       (.I0(\rc_reg[8]_i_2_n_4 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8A8FFA8)) 
    \rc[9]_i_1 
       (.I0(\rc_reg[12]_i_2_n_7 ),
        .I1(\rc[31]_i_4_n_0 ),
        .I2(\rc[31]_i_5_n_0 ),
        .I3(sync),
        .I4(rs[0]),
        .I5(rs[1]),
        .O(\rc[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[0] 
       (.C(clk),
        .CE(rc),
        .D(\rc[0]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[10] 
       (.C(clk),
        .CE(rc),
        .D(\rc[10]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[10] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[11] 
       (.C(clk),
        .CE(rc),
        .D(\rc[11]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[11] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[12] 
       (.C(clk),
        .CE(rc),
        .D(\rc[12]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[12] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rc_reg[12]_i_2 
       (.CI(\rc_reg[8]_i_2_n_0 ),
        .CO({\rc_reg[12]_i_2_n_0 ,\NLW_rc_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\rc_reg[12]_i_2_n_4 ,\rc_reg[12]_i_2_n_5 ,\rc_reg[12]_i_2_n_6 ,\rc_reg[12]_i_2_n_7 }),
        .S({\rc_reg_n_0_[12] ,\rc_reg_n_0_[11] ,\rc_reg_n_0_[10] ,\rc_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[13] 
       (.C(clk),
        .CE(rc),
        .D(\rc[13]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[13] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[14] 
       (.C(clk),
        .CE(rc),
        .D(\rc[14]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[14] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[15] 
       (.C(clk),
        .CE(rc),
        .D(\rc[15]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[15] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[16] 
       (.C(clk),
        .CE(rc),
        .D(\rc[16]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[16] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rc_reg[16]_i_2 
       (.CI(\rc_reg[12]_i_2_n_0 ),
        .CO({\rc_reg[16]_i_2_n_0 ,\NLW_rc_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\rc_reg[16]_i_2_n_4 ,\rc_reg[16]_i_2_n_5 ,\rc_reg[16]_i_2_n_6 ,\rc_reg[16]_i_2_n_7 }),
        .S({\rc_reg_n_0_[16] ,\rc_reg_n_0_[15] ,\rc_reg_n_0_[14] ,\rc_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[17] 
       (.C(clk),
        .CE(rc),
        .D(\rc[17]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[17] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[18] 
       (.C(clk),
        .CE(rc),
        .D(\rc[18]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[18] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[19] 
       (.C(clk),
        .CE(rc),
        .D(\rc[19]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[19] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[1] 
       (.C(clk),
        .CE(rc),
        .D(\rc[1]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[20] 
       (.C(clk),
        .CE(rc),
        .D(\rc[20]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[20] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rc_reg[20]_i_2 
       (.CI(\rc_reg[16]_i_2_n_0 ),
        .CO({\rc_reg[20]_i_2_n_0 ,\NLW_rc_reg[20]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\rc_reg[20]_i_2_n_4 ,\rc_reg[20]_i_2_n_5 ,\rc_reg[20]_i_2_n_6 ,\rc_reg[20]_i_2_n_7 }),
        .S({\rc_reg_n_0_[20] ,\rc_reg_n_0_[19] ,\rc_reg_n_0_[18] ,\rc_reg_n_0_[17] }));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[21] 
       (.C(clk),
        .CE(rc),
        .D(\rc[21]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[21] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[22] 
       (.C(clk),
        .CE(rc),
        .D(\rc[22]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[22] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[23] 
       (.C(clk),
        .CE(rc),
        .D(\rc[23]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[23] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[24] 
       (.C(clk),
        .CE(rc),
        .D(\rc[24]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[24] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rc_reg[24]_i_2 
       (.CI(\rc_reg[20]_i_2_n_0 ),
        .CO({\rc_reg[24]_i_2_n_0 ,\NLW_rc_reg[24]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\rc_reg[24]_i_2_n_4 ,\rc_reg[24]_i_2_n_5 ,\rc_reg[24]_i_2_n_6 ,\rc_reg[24]_i_2_n_7 }),
        .S({\rc_reg_n_0_[24] ,\rc_reg_n_0_[23] ,\rc_reg_n_0_[22] ,\rc_reg_n_0_[21] }));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[25] 
       (.C(clk),
        .CE(rc),
        .D(\rc[25]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[25] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[26] 
       (.C(clk),
        .CE(rc),
        .D(\rc[26]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[26] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[27] 
       (.C(clk),
        .CE(rc),
        .D(\rc[27]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[27] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[28] 
       (.C(clk),
        .CE(rc),
        .D(\rc[28]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[28] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rc_reg[28]_i_2 
       (.CI(\rc_reg[24]_i_2_n_0 ),
        .CO({\rc_reg[28]_i_2_n_0 ,\NLW_rc_reg[28]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\rc_reg[28]_i_2_n_4 ,\rc_reg[28]_i_2_n_5 ,\rc_reg[28]_i_2_n_6 ,\rc_reg[28]_i_2_n_7 }),
        .S({\rc_reg_n_0_[28] ,\rc_reg_n_0_[27] ,\rc_reg_n_0_[26] ,\rc_reg_n_0_[25] }));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[29] 
       (.C(clk),
        .CE(rc),
        .D(\rc[29]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[29] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[2] 
       (.C(clk),
        .CE(rc),
        .D(\rc[2]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[30] 
       (.C(clk),
        .CE(rc),
        .D(\rc[30]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[30] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[31] 
       (.C(clk),
        .CE(rc),
        .D(\rc[31]_i_2_n_0 ),
        .Q(\rc_reg_n_0_[31] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rc_reg[31]_i_3 
       (.CI(\rc_reg[28]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\rc_reg[31]_i_3_n_5 ,\rc_reg[31]_i_3_n_6 ,\rc_reg[31]_i_3_n_7 }),
        .S({\<const0> ,\rc_reg_n_0_[31] ,\rc_reg_n_0_[30] ,\rc_reg_n_0_[29] }));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[3] 
       (.C(clk),
        .CE(rc),
        .D(\rc[3]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[4] 
       (.C(clk),
        .CE(rc),
        .D(\rc[4]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[4] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rc_reg[4]_i_2 
       (.CI(\<const0> ),
        .CO({\rc_reg[4]_i_2_n_0 ,\NLW_rc_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\rc_reg_n_0_[0] ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\rc_reg[4]_i_2_n_4 ,\rc_reg[4]_i_2_n_5 ,\rc_reg[4]_i_2_n_6 ,\rc_reg[4]_i_2_n_7 }),
        .S({\rc_reg_n_0_[4] ,\rc_reg_n_0_[3] ,\rc_reg_n_0_[2] ,\rc_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[5] 
       (.C(clk),
        .CE(rc),
        .D(\rc[5]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[6] 
       (.C(clk),
        .CE(rc),
        .D(\rc[6]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[6] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[7] 
       (.C(clk),
        .CE(rc),
        .D(\rc[7]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[7] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[8] 
       (.C(clk),
        .CE(rc),
        .D(\rc[8]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[8] ),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rc_reg[8]_i_2 
       (.CI(\rc_reg[4]_i_2_n_0 ),
        .CO({\rc_reg[8]_i_2_n_0 ,\NLW_rc_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\rc_reg[8]_i_2_n_4 ,\rc_reg[8]_i_2_n_5 ,\rc_reg[8]_i_2_n_6 ,\rc_reg[8]_i_2_n_7 }),
        .S({\rc_reg_n_0_[8] ,\rc_reg_n_0_[7] ,\rc_reg_n_0_[6] ,\rc_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \rc_reg[9] 
       (.C(clk),
        .CE(rc),
        .D(\rc[9]_i_1_n_0 ),
        .Q(\rc_reg_n_0_[9] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    received_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(\rx_data[7]_i_1_n_0 ),
        .Q(received),
        .R(reset));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \rshift[0]_i_1 
       (.I0(sync),
        .I1(\rbit_reg_n_0_[1] ),
        .I2(\rshift[2]_i_2_n_0 ),
        .I3(\rbit_reg_n_0_[0] ),
        .I4(\rshift[6]_i_3_n_0 ),
        .I5(\rshift_reg_n_0_[0] ),
        .O(\rshift[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \rshift[1]_i_1 
       (.I0(sync),
        .I1(\rshift[2]_i_2_n_0 ),
        .I2(\rbit_reg_n_0_[0] ),
        .I3(\rbit_reg_n_0_[1] ),
        .I4(\rshift[6]_i_3_n_0 ),
        .I5(\rshift_reg_n_0_[1] ),
        .O(\rshift[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \rshift[2]_i_1 
       (.I0(sync),
        .I1(\rbit_reg_n_0_[1] ),
        .I2(\rshift[2]_i_2_n_0 ),
        .I3(\rbit_reg_n_0_[0] ),
        .I4(\rshift[6]_i_3_n_0 ),
        .I5(\rshift_reg_n_0_[2] ),
        .O(\rshift[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \rshift[2]_i_2 
       (.I0(\rbit_reg_n_0_[2] ),
        .I1(\rbit_reg_n_0_[3] ),
        .O(\rshift[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFF00020000)) 
    \rshift[3]_i_1 
       (.I0(sync),
        .I1(\rshift[3]_i_2_n_0 ),
        .I2(\rbit_reg_n_0_[2] ),
        .I3(\rbit_reg_n_0_[3] ),
        .I4(\rshift[6]_i_3_n_0 ),
        .I5(\rshift_reg_n_0_[3] ),
        .O(\rshift[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \rshift[3]_i_2 
       (.I0(\rbit_reg_n_0_[0] ),
        .I1(\rbit_reg_n_0_[1] ),
        .O(\rshift[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFF00020000)) 
    \rshift[4]_i_1 
       (.I0(sync),
        .I1(\rbit_reg_n_0_[1] ),
        .I2(\rshift[6]_i_2_n_0 ),
        .I3(\rbit_reg_n_0_[0] ),
        .I4(\rshift[6]_i_3_n_0 ),
        .I5(\rshift_reg_n_0_[4] ),
        .O(\rshift[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \rshift[5]_i_1 
       (.I0(sync),
        .I1(\rshift[6]_i_2_n_0 ),
        .I2(\rbit_reg_n_0_[0] ),
        .I3(\rbit_reg_n_0_[1] ),
        .I4(\rshift[6]_i_3_n_0 ),
        .I5(\rshift_reg_n_0_[5] ),
        .O(\rshift[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \rshift[6]_i_1 
       (.I0(sync),
        .I1(\rshift[6]_i_2_n_0 ),
        .I2(\rbit_reg_n_0_[1] ),
        .I3(\rbit_reg_n_0_[0] ),
        .I4(\rshift[6]_i_3_n_0 ),
        .I5(\rshift_reg_n_0_[6] ),
        .O(\rshift[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \rshift[6]_i_2 
       (.I0(\rbit_reg_n_0_[3] ),
        .I1(\rbit_reg_n_0_[2] ),
        .O(\rshift[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \rshift[6]_i_3 
       (.I0(\rbit[3]_i_4_n_0 ),
        .I1(\rshift[6]_i_4_n_0 ),
        .I2(\rx_data[7]_i_5_n_0 ),
        .I3(\rx_data[7]_i_4_n_0 ),
        .I4(\rx_data[7]_i_3_n_0 ),
        .I5(rs[0]),
        .O(\rshift[6]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rshift[6]_i_4 
       (.I0(rs[1]),
        .I1(\rc_reg_n_0_[1] ),
        .O(\rshift[6]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    \rshift[7]_i_1 
       (.I0(sync),
        .I1(rs[0]),
        .I2(\rx_data[7]_i_2_n_0 ),
        .I3(\FSM_sequential_rs[0]_i_2_n_0 ),
        .I4(\rshift_reg_n_0_[7] ),
        .O(\rshift[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rshift_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\rshift[0]_i_1_n_0 ),
        .Q(\rshift_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rshift_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\rshift[1]_i_1_n_0 ),
        .Q(\rshift_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rshift_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\rshift[2]_i_1_n_0 ),
        .Q(\rshift_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rshift_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\rshift[3]_i_1_n_0 ),
        .Q(\rshift_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rshift_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\rshift[4]_i_1_n_0 ),
        .Q(\rshift_reg_n_0_[4] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rshift_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\rshift[5]_i_1_n_0 ),
        .Q(\rshift_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rshift_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\rshift[6]_i_1_n_0 ),
        .Q(\rshift_reg_n_0_[6] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rshift_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\rshift[7]_i_1_n_0 ),
        .Q(\rshift_reg_n_0_[7] ),
        .R(reset));
  LUT3 #(
    .INIT(8'h80)) 
    \rx_data[7]_i_1 
       (.I0(sync),
        .I1(rs[0]),
        .I2(\rx_data[7]_i_2_n_0 ),
        .O(\rx_data[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \rx_data[7]_i_10 
       (.I0(\rc_reg_n_0_[8] ),
        .I1(\rc_reg_n_0_[5] ),
        .I2(\rc_reg_n_0_[11] ),
        .I3(\rc_reg_n_0_[10] ),
        .O(\rx_data[7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \rx_data[7]_i_2 
       (.I0(\rx_data[7]_i_3_n_0 ),
        .I1(\rx_data[7]_i_4_n_0 ),
        .I2(\rx_data[7]_i_5_n_0 ),
        .I3(rs[1]),
        .I4(\rc_reg_n_0_[1] ),
        .I5(\rbit[3]_i_4_n_0 ),
        .O(\rx_data[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \rx_data[7]_i_3 
       (.I0(\rx_data[7]_i_6_n_0 ),
        .I1(\rx_data[7]_i_7_n_0 ),
        .I2(\rx_data[7]_i_8_n_0 ),
        .I3(\rx_data[7]_i_9_n_0 ),
        .I4(\rx_data[7]_i_10_n_0 ),
        .O(\rx_data[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \rx_data[7]_i_4 
       (.I0(\rc_reg_n_0_[26] ),
        .I1(\rc_reg_n_0_[27] ),
        .O(\rx_data[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \rx_data[7]_i_5 
       (.I0(\rc_reg_n_0_[31] ),
        .I1(\rc_reg_n_0_[30] ),
        .I2(\rc_reg_n_0_[29] ),
        .I3(\rc_reg_n_0_[28] ),
        .O(\rx_data[7]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    \rx_data[7]_i_6 
       (.I0(\rc_reg_n_0_[0] ),
        .I1(\rc_reg_n_0_[24] ),
        .I2(\rc_reg_n_0_[25] ),
        .I3(\rc_reg_n_0_[3] ),
        .I4(\rc_reg_n_0_[2] ),
        .O(\rx_data[7]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_data[7]_i_7 
       (.I0(\rc_reg_n_0_[17] ),
        .I1(\rc_reg_n_0_[16] ),
        .I2(\rc_reg_n_0_[19] ),
        .I3(\rc_reg_n_0_[18] ),
        .O(\rx_data[7]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_data[7]_i_8 
       (.I0(\rc_reg_n_0_[21] ),
        .I1(\rc_reg_n_0_[20] ),
        .I2(\rc_reg_n_0_[23] ),
        .I3(\rc_reg_n_0_[22] ),
        .O(\rx_data[7]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_data[7]_i_9 
       (.I0(\rc_reg_n_0_[13] ),
        .I1(\rc_reg_n_0_[12] ),
        .I2(\rc_reg_n_0_[15] ),
        .I3(\rc_reg_n_0_[14] ),
        .O(\rx_data[7]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(\rshift_reg_n_0_[0] ),
        .Q(rx_data[0]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(\rshift_reg_n_0_[1] ),
        .Q(rx_data[1]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(\rshift_reg_n_0_[2] ),
        .Q(rx_data[2]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(\rshift_reg_n_0_[3] ),
        .Q(rx_data[3]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(\rshift_reg_n_0_[4] ),
        .Q(rx_data[4]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(\rshift_reg_n_0_[5] ),
        .Q(rx_data[5]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(\rshift_reg_n_0_[6] ),
        .Q(rx_data[6]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(clk),
        .CE(\rx_data[7]_i_1_n_0 ),
        .D(\rshift_reg_n_0_[7] ),
        .Q(rx_data[7]),
        .R(reset));
  LUT3 #(
    .INIT(8'hE2)) 
    \shift[0]_i_1 
       (.I0(send),
        .I1(busy),
        .I2(\shift[0]_i_3_n_0 ),
        .O(\shift[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \shift[0]_i_10 
       (.I0(tc_reg[7]),
        .I1(tc_reg[4]),
        .I2(tc_reg[11]),
        .I3(tc_reg[10]),
        .O(\shift[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \shift[0]_i_11 
       (.I0(tc_reg[1]),
        .I1(tc_reg[0]),
        .I2(tc_reg[6]),
        .I3(tc_reg[5]),
        .O(\shift[0]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \shift[0]_i_2 
       (.I0(busy),
        .I1(shift[1]),
        .O(\shift[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \shift[0]_i_3 
       (.I0(\shift[0]_i_4_n_0 ),
        .I1(\shift[0]_i_5_n_0 ),
        .I2(\shift[0]_i_6_n_0 ),
        .I3(\shift[0]_i_7_n_0 ),
        .O(\shift[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \shift[0]_i_4 
       (.I0(tc_reg[16]),
        .I1(tc_reg[17]),
        .I2(tc_reg[18]),
        .I3(tc_reg[19]),
        .I4(\shift[0]_i_8_n_0 ),
        .O(\shift[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \shift[0]_i_5 
       (.I0(tc_reg[28]),
        .I1(tc_reg[29]),
        .I2(tc_reg[31]),
        .I3(tc_reg[30]),
        .I4(\shift[0]_i_9_n_0 ),
        .O(\shift[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \shift[0]_i_6 
       (.I0(tc_reg[12]),
        .I1(tc_reg[13]),
        .I2(tc_reg[14]),
        .I3(tc_reg[15]),
        .I4(\shift[0]_i_10_n_0 ),
        .O(\shift[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \shift[0]_i_7 
       (.I0(tc_reg[8]),
        .I1(tc_reg[9]),
        .I2(tc_reg[2]),
        .I3(tc_reg[3]),
        .I4(\shift[0]_i_11_n_0 ),
        .O(\shift[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \shift[0]_i_8 
       (.I0(tc_reg[23]),
        .I1(tc_reg[22]),
        .I2(tc_reg[21]),
        .I3(tc_reg[20]),
        .O(\shift[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \shift[0]_i_9 
       (.I0(tc_reg[25]),
        .I1(tc_reg[24]),
        .I2(tc_reg[27]),
        .I3(tc_reg[26]),
        .O(\shift[0]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[1]_i_1 
       (.I0(shift[2]),
        .I1(busy),
        .I2(tx_data[0]),
        .O(\shift[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[2]_i_1 
       (.I0(shift[3]),
        .I1(busy),
        .I2(tx_data[1]),
        .O(\shift[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[3]_i_1 
       (.I0(shift[4]),
        .I1(busy),
        .I2(tx_data[2]),
        .O(\shift[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[4]_i_1 
       (.I0(shift[5]),
        .I1(busy),
        .I2(tx_data[3]),
        .O(\shift[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[5]_i_1 
       (.I0(shift[6]),
        .I1(busy),
        .I2(tx_data[4]),
        .O(\shift[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[6]_i_1 
       (.I0(shift[7]),
        .I1(busy),
        .I2(tx_data[5]),
        .O(\shift[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[7]_i_1 
       (.I0(shift[8]),
        .I1(busy),
        .I2(tx_data[6]),
        .O(\shift[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \shift[8]_i_1 
       (.I0(busy),
        .I1(tx_data[7]),
        .O(\shift[8]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \shift_reg[0] 
       (.C(clk),
        .CE(\shift[0]_i_1_n_0 ),
        .D(\shift[0]_i_2_n_0 ),
        .Q(tx),
        .S(reset));
  FDSE #(
    .INIT(1'b1)) 
    \shift_reg[1] 
       (.C(clk),
        .CE(\shift[0]_i_1_n_0 ),
        .D(\shift[1]_i_1_n_0 ),
        .Q(shift[1]),
        .S(reset));
  FDSE #(
    .INIT(1'b1)) 
    \shift_reg[2] 
       (.C(clk),
        .CE(\shift[0]_i_1_n_0 ),
        .D(\shift[2]_i_1_n_0 ),
        .Q(shift[2]),
        .S(reset));
  FDSE #(
    .INIT(1'b1)) 
    \shift_reg[3] 
       (.C(clk),
        .CE(\shift[0]_i_1_n_0 ),
        .D(\shift[3]_i_1_n_0 ),
        .Q(shift[3]),
        .S(reset));
  FDSE #(
    .INIT(1'b1)) 
    \shift_reg[4] 
       (.C(clk),
        .CE(\shift[0]_i_1_n_0 ),
        .D(\shift[4]_i_1_n_0 ),
        .Q(shift[4]),
        .S(reset));
  FDSE #(
    .INIT(1'b1)) 
    \shift_reg[5] 
       (.C(clk),
        .CE(\shift[0]_i_1_n_0 ),
        .D(\shift[5]_i_1_n_0 ),
        .Q(shift[5]),
        .S(reset));
  FDSE #(
    .INIT(1'b1)) 
    \shift_reg[6] 
       (.C(clk),
        .CE(\shift[0]_i_1_n_0 ),
        .D(\shift[6]_i_1_n_0 ),
        .Q(shift[6]),
        .S(reset));
  FDSE #(
    .INIT(1'b1)) 
    \shift_reg[7] 
       (.C(clk),
        .CE(\shift[0]_i_1_n_0 ),
        .D(\shift[7]_i_1_n_0 ),
        .Q(shift[7]),
        .S(reset));
  FDSE #(
    .INIT(1'b1)) 
    \shift_reg[8] 
       (.C(clk),
        .CE(\shift[0]_i_1_n_0 ),
        .D(\shift[8]_i_1_n_0 ),
        .Q(shift[8]),
        .S(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDSE #(
    .INIT(1'b1)) 
    sync_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(meta),
        .Q(sync),
        .S(reset));
  LUT1 #(
    .INIT(2'h1)) 
    \tbit[0]_i_1 
       (.I0(tbit_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tbit[1]_i_1 
       (.I0(tbit_reg[0]),
        .I1(tbit_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \tbit[2]_i_1 
       (.I0(tbit_reg[0]),
        .I1(tbit_reg[1]),
        .I2(tbit_reg[2]),
        .O(p_0_in__0[2]));
  LUT3 #(
    .INIT(8'hBA)) 
    \tbit[3]_i_1 
       (.I0(reset),
        .I1(busy),
        .I2(send),
        .O(\tbit[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8AAAAAA00000000)) 
    \tbit[3]_i_2 
       (.I0(busy),
        .I1(tbit_reg[2]),
        .I2(tbit_reg[1]),
        .I3(tbit_reg[3]),
        .I4(tbit_reg[0]),
        .I5(\shift[0]_i_3_n_0 ),
        .O(tbit));
  LUT4 #(
    .INIT(16'h7F80)) 
    \tbit[3]_i_3 
       (.I0(tbit_reg[1]),
        .I1(tbit_reg[0]),
        .I2(tbit_reg[2]),
        .I3(tbit_reg[3]),
        .O(p_0_in__0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \tbit_reg[0] 
       (.C(clk),
        .CE(tbit),
        .D(p_0_in__0[0]),
        .Q(tbit_reg[0]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbit_reg[1] 
       (.C(clk),
        .CE(tbit),
        .D(p_0_in__0[1]),
        .Q(tbit_reg[1]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbit_reg[2] 
       (.C(clk),
        .CE(tbit),
        .D(p_0_in__0[2]),
        .Q(tbit_reg[2]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbit_reg[3] 
       (.C(clk),
        .CE(tbit),
        .D(p_0_in__0[3]),
        .Q(tbit_reg[3]),
        .R(\tbit[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[0]_i_2 
       (.I0(tc_reg[0]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[0]_i_3 
       (.I0(tc_reg[3]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[0]_i_4 
       (.I0(tc_reg[2]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[0]_i_5 
       (.I0(tc_reg[1]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \tc[0]_i_6 
       (.I0(tc_reg[0]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[12]_i_2 
       (.I0(tc_reg[15]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[12]_i_3 
       (.I0(tc_reg[14]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[12]_i_4 
       (.I0(tc_reg[13]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[12]_i_5 
       (.I0(tc_reg[12]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[16]_i_2 
       (.I0(tc_reg[19]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[16]_i_3 
       (.I0(tc_reg[18]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[16]_i_4 
       (.I0(tc_reg[17]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[16]_i_5 
       (.I0(tc_reg[16]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[20]_i_2 
       (.I0(tc_reg[23]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[20]_i_3 
       (.I0(tc_reg[22]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[20]_i_4 
       (.I0(tc_reg[21]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[20]_i_5 
       (.I0(tc_reg[20]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[24]_i_2 
       (.I0(tc_reg[27]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[24]_i_3 
       (.I0(tc_reg[26]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[24]_i_4 
       (.I0(tc_reg[25]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[24]_i_5 
       (.I0(tc_reg[24]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[28]_i_2 
       (.I0(tc_reg[31]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[28]_i_3 
       (.I0(tc_reg[30]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[28]_i_4 
       (.I0(tc_reg[29]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[28]_i_5 
       (.I0(tc_reg[28]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[4]_i_2 
       (.I0(tc_reg[7]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[4]_i_3 
       (.I0(tc_reg[6]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[4]_i_4 
       (.I0(tc_reg[5]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[4]_i_5 
       (.I0(tc_reg[4]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[8]_i_2 
       (.I0(tc_reg[11]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[8]_i_3 
       (.I0(tc_reg[10]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[8]_i_4 
       (.I0(tc_reg[9]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tc[8]_i_5 
       (.I0(tc_reg[8]),
        .I1(\shift[0]_i_3_n_0 ),
        .O(\tc[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[0] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[0]_i_1_n_7 ),
        .Q(tc_reg[0]),
        .R(\tbit[3]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tc_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\tc_reg[0]_i_1_n_0 ,\NLW_tc_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\tc[0]_i_2_n_0 }),
        .O({\tc_reg[0]_i_1_n_4 ,\tc_reg[0]_i_1_n_5 ,\tc_reg[0]_i_1_n_6 ,\tc_reg[0]_i_1_n_7 }),
        .S({\tc[0]_i_3_n_0 ,\tc[0]_i_4_n_0 ,\tc[0]_i_5_n_0 ,\tc[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[10] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[8]_i_1_n_5 ),
        .Q(tc_reg[10]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[11] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[8]_i_1_n_4 ),
        .Q(tc_reg[11]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[12] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[12]_i_1_n_7 ),
        .Q(tc_reg[12]),
        .R(\tbit[3]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tc_reg[12]_i_1 
       (.CI(\tc_reg[8]_i_1_n_0 ),
        .CO({\tc_reg[12]_i_1_n_0 ,\NLW_tc_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\tc_reg[12]_i_1_n_4 ,\tc_reg[12]_i_1_n_5 ,\tc_reg[12]_i_1_n_6 ,\tc_reg[12]_i_1_n_7 }),
        .S({\tc[12]_i_2_n_0 ,\tc[12]_i_3_n_0 ,\tc[12]_i_4_n_0 ,\tc[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[13] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[12]_i_1_n_6 ),
        .Q(tc_reg[13]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[14] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[12]_i_1_n_5 ),
        .Q(tc_reg[14]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[15] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[12]_i_1_n_4 ),
        .Q(tc_reg[15]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[16] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[16]_i_1_n_7 ),
        .Q(tc_reg[16]),
        .R(\tbit[3]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tc_reg[16]_i_1 
       (.CI(\tc_reg[12]_i_1_n_0 ),
        .CO({\tc_reg[16]_i_1_n_0 ,\NLW_tc_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\tc_reg[16]_i_1_n_4 ,\tc_reg[16]_i_1_n_5 ,\tc_reg[16]_i_1_n_6 ,\tc_reg[16]_i_1_n_7 }),
        .S({\tc[16]_i_2_n_0 ,\tc[16]_i_3_n_0 ,\tc[16]_i_4_n_0 ,\tc[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[17] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[16]_i_1_n_6 ),
        .Q(tc_reg[17]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[18] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[16]_i_1_n_5 ),
        .Q(tc_reg[18]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[19] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[16]_i_1_n_4 ),
        .Q(tc_reg[19]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[1] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[0]_i_1_n_6 ),
        .Q(tc_reg[1]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[20] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[20]_i_1_n_7 ),
        .Q(tc_reg[20]),
        .R(\tbit[3]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tc_reg[20]_i_1 
       (.CI(\tc_reg[16]_i_1_n_0 ),
        .CO({\tc_reg[20]_i_1_n_0 ,\NLW_tc_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\tc_reg[20]_i_1_n_4 ,\tc_reg[20]_i_1_n_5 ,\tc_reg[20]_i_1_n_6 ,\tc_reg[20]_i_1_n_7 }),
        .S({\tc[20]_i_2_n_0 ,\tc[20]_i_3_n_0 ,\tc[20]_i_4_n_0 ,\tc[20]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[21] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[20]_i_1_n_6 ),
        .Q(tc_reg[21]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[22] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[20]_i_1_n_5 ),
        .Q(tc_reg[22]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[23] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[20]_i_1_n_4 ),
        .Q(tc_reg[23]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[24] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[24]_i_1_n_7 ),
        .Q(tc_reg[24]),
        .R(\tbit[3]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tc_reg[24]_i_1 
       (.CI(\tc_reg[20]_i_1_n_0 ),
        .CO({\tc_reg[24]_i_1_n_0 ,\NLW_tc_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\tc_reg[24]_i_1_n_4 ,\tc_reg[24]_i_1_n_5 ,\tc_reg[24]_i_1_n_6 ,\tc_reg[24]_i_1_n_7 }),
        .S({\tc[24]_i_2_n_0 ,\tc[24]_i_3_n_0 ,\tc[24]_i_4_n_0 ,\tc[24]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[25] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[24]_i_1_n_6 ),
        .Q(tc_reg[25]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[26] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[24]_i_1_n_5 ),
        .Q(tc_reg[26]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[27] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[24]_i_1_n_4 ),
        .Q(tc_reg[27]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[28] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[28]_i_1_n_7 ),
        .Q(tc_reg[28]),
        .R(\tbit[3]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tc_reg[28]_i_1 
       (.CI(\tc_reg[24]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\tc_reg[28]_i_1_n_4 ,\tc_reg[28]_i_1_n_5 ,\tc_reg[28]_i_1_n_6 ,\tc_reg[28]_i_1_n_7 }),
        .S({\tc[28]_i_2_n_0 ,\tc[28]_i_3_n_0 ,\tc[28]_i_4_n_0 ,\tc[28]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[29] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[28]_i_1_n_6 ),
        .Q(tc_reg[29]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[2] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[0]_i_1_n_5 ),
        .Q(tc_reg[2]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[30] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[28]_i_1_n_5 ),
        .Q(tc_reg[30]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[31] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[28]_i_1_n_4 ),
        .Q(tc_reg[31]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[3] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[0]_i_1_n_4 ),
        .Q(tc_reg[3]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[4] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[4]_i_1_n_7 ),
        .Q(tc_reg[4]),
        .R(\tbit[3]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tc_reg[4]_i_1 
       (.CI(\tc_reg[0]_i_1_n_0 ),
        .CO({\tc_reg[4]_i_1_n_0 ,\NLW_tc_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\tc_reg[4]_i_1_n_4 ,\tc_reg[4]_i_1_n_5 ,\tc_reg[4]_i_1_n_6 ,\tc_reg[4]_i_1_n_7 }),
        .S({\tc[4]_i_2_n_0 ,\tc[4]_i_3_n_0 ,\tc[4]_i_4_n_0 ,\tc[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[5] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[4]_i_1_n_6 ),
        .Q(tc_reg[5]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[6] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[4]_i_1_n_5 ),
        .Q(tc_reg[6]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[7] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[4]_i_1_n_4 ),
        .Q(tc_reg[7]),
        .R(\tbit[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[8] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[8]_i_1_n_7 ),
        .Q(tc_reg[8]),
        .R(\tbit[3]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tc_reg[8]_i_1 
       (.CI(\tc_reg[4]_i_1_n_0 ),
        .CO({\tc_reg[8]_i_1_n_0 ,\NLW_tc_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\tc_reg[8]_i_1_n_4 ,\tc_reg[8]_i_1_n_5 ,\tc_reg[8]_i_1_n_6 ,\tc_reg[8]_i_1_n_7 }),
        .S({\tc[8]_i_2_n_0 ,\tc[8]_i_3_n_0 ,\tc[8]_i_4_n_0 ,\tc[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \tc_reg[9] 
       (.C(clk),
        .CE(busy),
        .D(\tc_reg[8]_i_1_n_6 ),
        .Q(tc_reg[9]),
        .R(\tbit[3]_i_1_n_0 ));
endmodule
