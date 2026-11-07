// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sat Nov  7 16:29:05 2026
// Host        : CsKarthik running 64-bit major release  (build 9200)
// Command     : write_verilog C:/BTech/Semester_5/DCMOS/Project/array8_pilot_2026-11-07/build_v2/implemented.v
// Design      : cbdc_array8_serial
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "c8fca75e" *) (* UART_CLKS = "868" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module cbdc_array8_serial
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
  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_2_n_0 ;
  wire \FSM_onehot_state[2]_i_3_n_0 ;
  wire \FSM_onehot_state[2]_i_4_n_0 ;
  wire \FSM_onehot_state[2]_i_5_n_0 ;
  wire \FSM_onehot_state[2]_i_6_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire btnU;
  wire btnU_IBUF;
  wire [7:0]busy;
  wire button;
  wire [127:7]challenge;
  wire \challenge_reg_n_0_[0] ;
  wire \challenge_reg_n_0_[100] ;
  wire \challenge_reg_n_0_[101] ;
  wire \challenge_reg_n_0_[102] ;
  wire \challenge_reg_n_0_[103] ;
  wire \challenge_reg_n_0_[104] ;
  wire \challenge_reg_n_0_[105] ;
  wire \challenge_reg_n_0_[106] ;
  wire \challenge_reg_n_0_[107] ;
  wire \challenge_reg_n_0_[108] ;
  wire \challenge_reg_n_0_[109] ;
  wire \challenge_reg_n_0_[10] ;
  wire \challenge_reg_n_0_[110] ;
  wire \challenge_reg_n_0_[111] ;
  wire \challenge_reg_n_0_[112] ;
  wire \challenge_reg_n_0_[113] ;
  wire \challenge_reg_n_0_[114] ;
  wire \challenge_reg_n_0_[115] ;
  wire \challenge_reg_n_0_[116] ;
  wire \challenge_reg_n_0_[117] ;
  wire \challenge_reg_n_0_[118] ;
  wire \challenge_reg_n_0_[119] ;
  wire \challenge_reg_n_0_[11] ;
  wire \challenge_reg_n_0_[120] ;
  wire \challenge_reg_n_0_[121] ;
  wire \challenge_reg_n_0_[122] ;
  wire \challenge_reg_n_0_[123] ;
  wire \challenge_reg_n_0_[124] ;
  wire \challenge_reg_n_0_[125] ;
  wire \challenge_reg_n_0_[126] ;
  wire \challenge_reg_n_0_[127] ;
  wire \challenge_reg_n_0_[12] ;
  wire \challenge_reg_n_0_[13] ;
  wire \challenge_reg_n_0_[14] ;
  wire \challenge_reg_n_0_[15] ;
  wire \challenge_reg_n_0_[16] ;
  wire \challenge_reg_n_0_[17] ;
  wire \challenge_reg_n_0_[18] ;
  wire \challenge_reg_n_0_[19] ;
  wire \challenge_reg_n_0_[1] ;
  wire \challenge_reg_n_0_[20] ;
  wire \challenge_reg_n_0_[21] ;
  wire \challenge_reg_n_0_[22] ;
  wire \challenge_reg_n_0_[23] ;
  wire \challenge_reg_n_0_[24] ;
  wire \challenge_reg_n_0_[25] ;
  wire \challenge_reg_n_0_[26] ;
  wire \challenge_reg_n_0_[27] ;
  wire \challenge_reg_n_0_[28] ;
  wire \challenge_reg_n_0_[29] ;
  wire \challenge_reg_n_0_[2] ;
  wire \challenge_reg_n_0_[30] ;
  wire \challenge_reg_n_0_[31] ;
  wire \challenge_reg_n_0_[32] ;
  wire \challenge_reg_n_0_[33] ;
  wire \challenge_reg_n_0_[34] ;
  wire \challenge_reg_n_0_[35] ;
  wire \challenge_reg_n_0_[36] ;
  wire \challenge_reg_n_0_[37] ;
  wire \challenge_reg_n_0_[38] ;
  wire \challenge_reg_n_0_[39] ;
  wire \challenge_reg_n_0_[3] ;
  wire \challenge_reg_n_0_[40] ;
  wire \challenge_reg_n_0_[41] ;
  wire \challenge_reg_n_0_[42] ;
  wire \challenge_reg_n_0_[43] ;
  wire \challenge_reg_n_0_[44] ;
  wire \challenge_reg_n_0_[45] ;
  wire \challenge_reg_n_0_[46] ;
  wire \challenge_reg_n_0_[47] ;
  wire \challenge_reg_n_0_[48] ;
  wire \challenge_reg_n_0_[49] ;
  wire \challenge_reg_n_0_[4] ;
  wire \challenge_reg_n_0_[50] ;
  wire \challenge_reg_n_0_[51] ;
  wire \challenge_reg_n_0_[52] ;
  wire \challenge_reg_n_0_[53] ;
  wire \challenge_reg_n_0_[54] ;
  wire \challenge_reg_n_0_[55] ;
  wire \challenge_reg_n_0_[56] ;
  wire \challenge_reg_n_0_[57] ;
  wire \challenge_reg_n_0_[58] ;
  wire \challenge_reg_n_0_[59] ;
  wire \challenge_reg_n_0_[5] ;
  wire \challenge_reg_n_0_[60] ;
  wire \challenge_reg_n_0_[61] ;
  wire \challenge_reg_n_0_[62] ;
  wire \challenge_reg_n_0_[63] ;
  wire \challenge_reg_n_0_[64] ;
  wire \challenge_reg_n_0_[65] ;
  wire \challenge_reg_n_0_[66] ;
  wire \challenge_reg_n_0_[67] ;
  wire \challenge_reg_n_0_[68] ;
  wire \challenge_reg_n_0_[69] ;
  wire \challenge_reg_n_0_[6] ;
  wire \challenge_reg_n_0_[70] ;
  wire \challenge_reg_n_0_[71] ;
  wire \challenge_reg_n_0_[72] ;
  wire \challenge_reg_n_0_[73] ;
  wire \challenge_reg_n_0_[74] ;
  wire \challenge_reg_n_0_[75] ;
  wire \challenge_reg_n_0_[76] ;
  wire \challenge_reg_n_0_[77] ;
  wire \challenge_reg_n_0_[78] ;
  wire \challenge_reg_n_0_[79] ;
  wire \challenge_reg_n_0_[7] ;
  wire \challenge_reg_n_0_[80] ;
  wire \challenge_reg_n_0_[81] ;
  wire \challenge_reg_n_0_[82] ;
  wire \challenge_reg_n_0_[83] ;
  wire \challenge_reg_n_0_[84] ;
  wire \challenge_reg_n_0_[85] ;
  wire \challenge_reg_n_0_[86] ;
  wire \challenge_reg_n_0_[87] ;
  wire \challenge_reg_n_0_[88] ;
  wire \challenge_reg_n_0_[89] ;
  wire \challenge_reg_n_0_[8] ;
  wire \challenge_reg_n_0_[90] ;
  wire \challenge_reg_n_0_[91] ;
  wire \challenge_reg_n_0_[92] ;
  wire \challenge_reg_n_0_[93] ;
  wire \challenge_reg_n_0_[94] ;
  wire \challenge_reg_n_0_[95] ;
  wire \challenge_reg_n_0_[96] ;
  wire \challenge_reg_n_0_[97] ;
  wire \challenge_reg_n_0_[98] ;
  wire \challenge_reg_n_0_[99] ;
  wire \challenge_reg_n_0_[9] ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [5:5]crc;
  wire [6:0]crc0;
  wire \crc[3]_i_1_n_0 ;
  wire \crc[5]_i_1_n_0 ;
  wire \crc[6]_i_1_n_0 ;
  wire \crc[6]_i_2_n_0 ;
  wire \crc[7]_i_1_n_0 ;
  wire \crc_reg_n_0_[0] ;
  wire \crc_reg_n_0_[1] ;
  wire \crc_reg_n_0_[2] ;
  wire \crc_reg_n_0_[3] ;
  wire \crc_reg_n_0_[4] ;
  wire \crc_reg_n_0_[5] ;
  wire \crc_reg_n_0_[6] ;
  wire \crc_reg_n_0_[7] ;
  wire [31:1]data0;
  wire \done_mask[0]_i_1_n_0 ;
  wire \done_mask[1]_i_1_n_0 ;
  wire \done_mask[2]_i_1_n_0 ;
  wire \done_mask[3]_i_1_n_0 ;
  wire \done_mask[4]_i_1_n_0 ;
  wire \done_mask[5]_i_1_n_0 ;
  wire \done_mask[6]_i_1_n_0 ;
  wire \done_mask[7]_i_2_n_0 ;
  wire \done_mask[7]_i_3_n_0 ;
  wire \done_mask[7]_i_4_n_0 ;
  wire \done_mask[7]_i_5_n_0 ;
  wire \done_mask[7]_i_6_n_0 ;
  wire \done_mask[7]_i_7_n_0 ;
  wire \done_mask_reg_n_0_[0] ;
  wire \done_mask_reg_n_0_[1] ;
  wire \done_mask_reg_n_0_[2] ;
  wire \done_mask_reg_n_0_[3] ;
  wire \done_mask_reg_n_0_[4] ;
  wire \done_mask_reg_n_0_[5] ;
  wire \done_mask_reg_n_0_[6] ;
  wire \done_mask_reg_n_0_[7] ;
  wire \flags[0]_i_1_n_0 ;
  wire \flags[6]_i_1_n_0 ;
  wire \flags[7]_i_1_n_0 ;
  wire \flags_reg_n_0_[0] ;
  wire \flags_reg_n_0_[6] ;
  wire \flags_reg_n_0_[7] ;
  wire framing;
  wire [1:0]\gen_core[0].edges ;
  wire [1:0]\gen_core[1].edges ;
  wire [1:0]\gen_core[2].edges ;
  wire [1:0]\gen_core[3].edges ;
  wire [1:0]\gen_core[4].edges ;
  wire [1:0]\gen_core[5].edges ;
  wire [1:0]\gen_core[6].edges ;
  wire [1:0]\gen_core[7].edges ;
  wire \index[0]_i_1_n_0 ;
  wire \index[1]_i_1_n_0 ;
  wire \index[2]_i_1_n_0 ;
  wire \index[3]_i_1_n_0 ;
  wire \index[4]_i_10_n_0 ;
  wire \index[4]_i_11_n_0 ;
  wire \index[4]_i_12_n_0 ;
  wire \index[4]_i_13_n_0 ;
  wire \index[4]_i_14_n_0 ;
  wire \index[4]_i_15_n_0 ;
  wire \index[4]_i_1_n_0 ;
  wire \index[4]_i_2_n_0 ;
  wire \index[4]_i_3_n_0 ;
  wire \index[4]_i_4_n_0 ;
  wire \index[4]_i_5_n_0 ;
  wire \index[4]_i_6_n_0 ;
  wire \index[4]_i_7_n_0 ;
  wire \index[4]_i_8_n_0 ;
  wire \index[4]_i_9_n_0 ;
  wire \index_reg_n_0_[0] ;
  wire \index_reg_n_0_[1] ;
  wire \index_reg_n_0_[2] ;
  wire \index_reg_n_0_[3] ;
  wire \index_reg_n_0_[4] ;
  wire [15:0]led;
  wire [10:0]led_OBUF;
  wire \led_OBUF[10]_inst_i_2_n_0 ;
  wire [7:0]p_0_in;
  wire [4:0]p_0_in__0;
  wire [7:0]p_10_out;
  wire \parser[0]_i_1_n_0 ;
  wire \parser[0]_i_2_n_0 ;
  wire \parser[0]_i_3_n_0 ;
  wire \parser[1]_i_1_n_0 ;
  wire \parser[2]_i_1_n_0 ;
  wire \parser[3]_i_1_n_0 ;
  wire \parser[4]_i_10_n_0 ;
  wire \parser[4]_i_11_n_0 ;
  wire \parser[4]_i_12_n_0 ;
  wire \parser[4]_i_13_n_0 ;
  wire \parser[4]_i_14_n_0 ;
  wire \parser[4]_i_1_n_0 ;
  wire \parser[4]_i_2_n_0 ;
  wire \parser[4]_i_3_n_0 ;
  wire \parser[4]_i_4_n_0 ;
  wire \parser[4]_i_5_n_0 ;
  wire \parser[4]_i_6_n_0 ;
  wire \parser[4]_i_7_n_0 ;
  wire \parser[4]_i_8_n_0 ;
  wire \parser[4]_i_9_n_0 ;
  wire \parser_reg_n_0_[0] ;
  wire \parser_reg_n_0_[1] ;
  wire \parser_reg_n_0_[2] ;
  wire \parser_reg_n_0_[3] ;
  wire \parser_reg_n_0_[4] ;
  wire \partial_timeout[0]_i_1_n_0 ;
  wire \partial_timeout[31]_i_1_n_0 ;
  wire \partial_timeout[31]_i_2_n_0 ;
  wire \partial_timeout[31]_i_4_n_0 ;
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
  wire [7:0]qb_result;
  wire \qb_result[0]_i_1_n_0 ;
  wire \qb_result[1]_i_1_n_0 ;
  wire \qb_result[2]_i_1_n_0 ;
  wire \qb_result[3]_i_1_n_0 ;
  wire \qb_result[4]_i_1_n_0 ;
  wire \qb_result[5]_i_1_n_0 ;
  wire \qb_result[6]_i_1_n_0 ;
  wire \qb_result[7]_i_1_n_0 ;
  wire [0:0]qu_result;
  wire \qu_result[0]_i_1_n_0 ;
  wire \qu_result[1]_i_1_n_0 ;
  wire \qu_result[2]_i_1_n_0 ;
  wire \qu_result[3]_i_1_n_0 ;
  wire \qu_result[4]_i_1_n_0 ;
  wire \qu_result[5]_i_1_n_0 ;
  wire \qu_result[6]_i_1_n_0 ;
  wire \qu_result[7]_i_1_n_0 ;
  wire \qu_result_reg_n_0_[0] ;
  wire \qu_result_reg_n_0_[1] ;
  wire \qu_result_reg_n_0_[2] ;
  wire \qu_result_reg_n_0_[3] ;
  wire \qu_result_reg_n_0_[4] ;
  wire \qu_result_reg_n_0_[5] ;
  wire \qu_result_reg_n_0_[6] ;
  wire \qu_result_reg_n_0_[7] ;
  wire [7:0]rd;
  wire received;
  wire reset;
  wire \result[0]_i_1_n_0 ;
  wire \result[1]_i_1_n_0 ;
  wire \result[2]_i_1_n_0 ;
  wire \result[3]_i_1_n_0 ;
  wire \result[4]_i_1_n_0 ;
  wire \result[5]_i_1_n_0 ;
  wire \result[6]_i_1_n_0 ;
  wire \result[7]_i_1_n_0 ;
  wire send_i_1_n_0;
  wire send_reg_n_0;
  wire start_i_1_n_0;
  wire start_reg_n_0;
  wire [7:0]td;
  wire \td[0]_i_2_n_0 ;
  wire \td[0]_i_3_n_0 ;
  wire \td[0]_i_4_n_0 ;
  wire \td[0]_i_5_n_0 ;
  wire \td[1]_i_10_n_0 ;
  wire \td[1]_i_11_n_0 ;
  wire \td[1]_i_12_n_0 ;
  wire \td[1]_i_13_n_0 ;
  wire \td[1]_i_2_n_0 ;
  wire \td[1]_i_3_n_0 ;
  wire \td[1]_i_4_n_0 ;
  wire \td[1]_i_5_n_0 ;
  wire \td[1]_i_6_n_0 ;
  wire \td[1]_i_7_n_0 ;
  wire \td[1]_i_8_n_0 ;
  wire \td[1]_i_9_n_0 ;
  wire \td[2]_i_2_n_0 ;
  wire \td[2]_i_3_n_0 ;
  wire \td[2]_i_4_n_0 ;
  wire \td[2]_i_5_n_0 ;
  wire \td[2]_i_6_n_0 ;
  wire \td[3]_i_2_n_0 ;
  wire \td[3]_i_3_n_0 ;
  wire \td[3]_i_4_n_0 ;
  wire \td[3]_i_5_n_0 ;
  wire \td[3]_i_6_n_0 ;
  wire \td[3]_i_7_n_0 ;
  wire \td[4]_i_2_n_0 ;
  wire \td[4]_i_3_n_0 ;
  wire \td[4]_i_4_n_0 ;
  wire \td[4]_i_5_n_0 ;
  wire \td[4]_i_6_n_0 ;
  wire \td[4]_i_7_n_0 ;
  wire \td[5]_i_2_n_0 ;
  wire \td[5]_i_3_n_0 ;
  wire \td[5]_i_4_n_0 ;
  wire \td[5]_i_5_n_0 ;
  wire \td[5]_i_6_n_0 ;
  wire \td[5]_i_7_n_0 ;
  wire \td[6]_i_10_n_0 ;
  wire \td[6]_i_2_n_0 ;
  wire \td[6]_i_3_n_0 ;
  wire \td[6]_i_4_n_0 ;
  wire \td[6]_i_5_n_0 ;
  wire \td[6]_i_6_n_0 ;
  wire \td[6]_i_7_n_0 ;
  wire \td[6]_i_8_n_0 ;
  wire \td[6]_i_9_n_0 ;
  wire \td[7]_i_10_n_0 ;
  wire \td[7]_i_11_n_0 ;
  wire \td[7]_i_12_n_0 ;
  wire \td[7]_i_13_n_0 ;
  wire \td[7]_i_1_n_0 ;
  wire \td[7]_i_3_n_0 ;
  wire \td[7]_i_4_n_0 ;
  wire \td[7]_i_5_n_0 ;
  wire \td[7]_i_6_n_0 ;
  wire \td[7]_i_7_n_0 ;
  wire \td[7]_i_8_n_0 ;
  wire \td[7]_i_9_n_0 ;
  wire \td_reg_n_0_[0] ;
  wire \td_reg_n_0_[1] ;
  wire \td_reg_n_0_[2] ;
  wire \td_reg_n_0_[3] ;
  wire \td_reg_n_0_[4] ;
  wire \td_reg_n_0_[5] ;
  wire \td_reg_n_0_[6] ;
  wire \td_reg_n_0_[7] ;
  wire \timeout[0]_i_2_n_0 ;
  wire [31:0]timeout_reg;
  wire \timeout_reg[0]_i_1_n_0 ;
  wire \timeout_reg[0]_i_1_n_4 ;
  wire \timeout_reg[0]_i_1_n_5 ;
  wire \timeout_reg[0]_i_1_n_6 ;
  wire \timeout_reg[0]_i_1_n_7 ;
  wire \timeout_reg[12]_i_1_n_0 ;
  wire \timeout_reg[12]_i_1_n_4 ;
  wire \timeout_reg[12]_i_1_n_5 ;
  wire \timeout_reg[12]_i_1_n_6 ;
  wire \timeout_reg[12]_i_1_n_7 ;
  wire \timeout_reg[16]_i_1_n_0 ;
  wire \timeout_reg[16]_i_1_n_4 ;
  wire \timeout_reg[16]_i_1_n_5 ;
  wire \timeout_reg[16]_i_1_n_6 ;
  wire \timeout_reg[16]_i_1_n_7 ;
  wire \timeout_reg[20]_i_1_n_0 ;
  wire \timeout_reg[20]_i_1_n_4 ;
  wire \timeout_reg[20]_i_1_n_5 ;
  wire \timeout_reg[20]_i_1_n_6 ;
  wire \timeout_reg[20]_i_1_n_7 ;
  wire \timeout_reg[24]_i_1_n_0 ;
  wire \timeout_reg[24]_i_1_n_4 ;
  wire \timeout_reg[24]_i_1_n_5 ;
  wire \timeout_reg[24]_i_1_n_6 ;
  wire \timeout_reg[24]_i_1_n_7 ;
  wire \timeout_reg[28]_i_1_n_4 ;
  wire \timeout_reg[28]_i_1_n_5 ;
  wire \timeout_reg[28]_i_1_n_6 ;
  wire \timeout_reg[28]_i_1_n_7 ;
  wire \timeout_reg[4]_i_1_n_0 ;
  wire \timeout_reg[4]_i_1_n_4 ;
  wire \timeout_reg[4]_i_1_n_5 ;
  wire \timeout_reg[4]_i_1_n_6 ;
  wire \timeout_reg[4]_i_1_n_7 ;
  wire \timeout_reg[8]_i_1_n_0 ;
  wire \timeout_reg[8]_i_1_n_4 ;
  wire \timeout_reg[8]_i_1_n_5 ;
  wire \timeout_reg[8]_i_1_n_6 ;
  wire \timeout_reg[8]_i_1_n_7 ;
  wire tx_busy;
  wire [7:0]txcrc;
  wire \txcrc[0]_i_10_n_0 ;
  wire \txcrc[0]_i_2_n_0 ;
  wire \txcrc[0]_i_3_n_0 ;
  wire \txcrc[0]_i_5_n_0 ;
  wire \txcrc[0]_i_6_n_0 ;
  wire \txcrc[0]_i_7_n_0 ;
  wire \txcrc[0]_i_8_n_0 ;
  wire \txcrc[0]_i_9_n_0 ;
  wire \txcrc[1]_i_2_n_0 ;
  wire \txcrc[1]_i_3_n_0 ;
  wire \txcrc[1]_i_4_n_0 ;
  wire \txcrc[1]_i_5_n_0 ;
  wire \txcrc[1]_i_6_n_0 ;
  wire \txcrc[1]_i_7_n_0 ;
  wire \txcrc[1]_i_8_n_0 ;
  wire \txcrc[1]_i_9_n_0 ;
  wire \txcrc[2]_i_10_n_0 ;
  wire \txcrc[2]_i_2_n_0 ;
  wire \txcrc[2]_i_3_n_0 ;
  wire \txcrc[2]_i_4_n_0 ;
  wire \txcrc[2]_i_5_n_0 ;
  wire \txcrc[2]_i_6_n_0 ;
  wire \txcrc[2]_i_7_n_0 ;
  wire \txcrc[2]_i_8_n_0 ;
  wire \txcrc[2]_i_9_n_0 ;
  wire \txcrc[3]_i_2_n_0 ;
  wire \txcrc[3]_i_3_n_0 ;
  wire \txcrc[3]_i_4_n_0 ;
  wire \txcrc[3]_i_5_n_0 ;
  wire \txcrc[3]_i_6_n_0 ;
  wire \txcrc[3]_i_7_n_0 ;
  wire \txcrc[3]_i_8_n_0 ;
  wire \txcrc[3]_i_9_n_0 ;
  wire \txcrc[4]_i_10_n_0 ;
  wire \txcrc[4]_i_2_n_0 ;
  wire \txcrc[4]_i_3_n_0 ;
  wire \txcrc[4]_i_4_n_0 ;
  wire \txcrc[4]_i_5_n_0 ;
  wire \txcrc[4]_i_6_n_0 ;
  wire \txcrc[4]_i_7_n_0 ;
  wire \txcrc[4]_i_8_n_0 ;
  wire \txcrc[4]_i_9_n_0 ;
  wire \txcrc[5]_i_10_n_0 ;
  wire \txcrc[5]_i_11_n_0 ;
  wire \txcrc[5]_i_2_n_0 ;
  wire \txcrc[5]_i_3_n_0 ;
  wire \txcrc[5]_i_4_n_0 ;
  wire \txcrc[5]_i_5_n_0 ;
  wire \txcrc[5]_i_6_n_0 ;
  wire \txcrc[5]_i_7_n_0 ;
  wire \txcrc[5]_i_8_n_0 ;
  wire \txcrc[5]_i_9_n_0 ;
  wire \txcrc[6]_i_2_n_0 ;
  wire \txcrc[6]_i_3_n_0 ;
  wire \txcrc[6]_i_4_n_0 ;
  wire \txcrc[6]_i_5_n_0 ;
  wire \txcrc[6]_i_6_n_0 ;
  wire \txcrc[6]_i_7_n_0 ;
  wire \txcrc[6]_i_8_n_0 ;
  wire \txcrc[6]_i_9_n_0 ;
  wire \txcrc[7]_i_10_n_0 ;
  wire \txcrc[7]_i_11_n_0 ;
  wire \txcrc[7]_i_12_n_0 ;
  wire \txcrc[7]_i_13_n_0 ;
  wire \txcrc[7]_i_14_n_0 ;
  wire \txcrc[7]_i_1_n_0 ;
  wire \txcrc[7]_i_3_n_0 ;
  wire \txcrc[7]_i_4_n_0 ;
  wire \txcrc[7]_i_5_n_0 ;
  wire \txcrc[7]_i_6_n_0 ;
  wire \txcrc[7]_i_7_n_0 ;
  wire \txcrc[7]_i_8_n_0 ;
  wire \txcrc[7]_i_9_n_0 ;
  wire \txcrc_reg[0]_i_4_n_0 ;
  wire \txcrc_reg_n_0_[0] ;
  wire \txcrc_reg_n_0_[1] ;
  wire \txcrc_reg_n_0_[2] ;
  wire \txcrc_reg_n_0_[3] ;
  wire \txcrc_reg_n_0_[4] ;
  wire \txcrc_reg_n_0_[5] ;
  wire \txcrc_reg_n_0_[6] ;
  wire \txcrc_reg_n_0_[7] ;
  wire uart_rx;
  wire uart_rx_IBUF;
  wire uart_tx;
  wire uart_tx_OBUF;
  wire [3:0]\NLW_partial_timeout_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_partial_timeout_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[0]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_timeout_reg[8]_i_1_CO_UNCONNECTED ;

  LUT3 #(
    .INIT(8'h34)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(led_OBUF[8]),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(led_OBUF[9]),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAA08)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\index[4]_i_5_n_0 ),
        .I2(\FSM_onehot_state[2]_i_3_n_0 ),
        .I3(\index[4]_i_8_n_0 ),
        .I4(\FSM_onehot_state[2]_i_4_n_0 ),
        .I5(\done_mask[7]_i_3_n_0 ),
        .O(\FSM_onehot_state[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_onehot_state[2]_i_3 
       (.I0(\index[4]_i_13_n_0 ),
        .I1(\FSM_onehot_state[2]_i_5_n_0 ),
        .I2(\index[4]_i_14_n_0 ),
        .I3(\FSM_onehot_state[2]_i_6_n_0 ),
        .O(\FSM_onehot_state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    \FSM_onehot_state[2]_i_4 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\txcrc[7]_i_3_n_0 ),
        .I3(send_reg_n_0),
        .I4(tx_busy),
        .I5(led_OBUF[9]),
        .O(\FSM_onehot_state[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \FSM_onehot_state[2]_i_5 
       (.I0(timeout_reg[4]),
        .I1(timeout_reg[0]),
        .I2(timeout_reg[23]),
        .I3(timeout_reg[17]),
        .O(\FSM_onehot_state[2]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \FSM_onehot_state[2]_i_6 
       (.I0(timeout_reg[26]),
        .I1(timeout_reg[6]),
        .I2(timeout_reg[8]),
        .I3(timeout_reg[24]),
        .O(\FSM_onehot_state[2]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:100,iSTATE0:001,iSTATE1:010," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .Q(led_OBUF[8]),
        .S(reset));
  (* FSM_ENCODED_STATES = "iSTATE:100,iSTATE0:001,iSTATE1:010," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .R(reset));
  (* FSM_ENCODED_STATES = "iSTATE:100,iSTATE0:001,iSTATE1:010," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(led_OBUF[9]),
        .R(reset));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  IBUF btnU_IBUF_inst
       (.I(btnU),
        .O(btnU_IBUF));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \challenge[103]_i_1 
       (.I0(\parser_reg_n_0_[3] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[2] ),
        .I3(\parser_reg_n_0_[0] ),
        .I4(\parser_reg_n_0_[1] ),
        .I5(\parser_reg_n_0_[4] ),
        .O(challenge[103]));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \challenge[111]_i_1 
       (.I0(\crc[6]_i_2_n_0 ),
        .I1(\parser_reg_n_0_[4] ),
        .I2(\parser_reg_n_0_[2] ),
        .I3(\parser_reg_n_0_[3] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[1] ),
        .O(challenge[111]));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \challenge[119]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\parser_reg_n_0_[3] ),
        .I2(\parser_reg_n_0_[1] ),
        .I3(\parser_reg_n_0_[0] ),
        .I4(\parser_reg_n_0_[2] ),
        .I5(\crc[6]_i_2_n_0 ),
        .O(challenge[119]));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \challenge[127]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\parser_reg_n_0_[3] ),
        .I2(\parser_reg_n_0_[1] ),
        .I3(\parser_reg_n_0_[0] ),
        .I4(\parser_reg_n_0_[2] ),
        .I5(\crc[6]_i_2_n_0 ),
        .O(challenge[127]));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    \challenge[15]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[3] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(challenge[15]));
  LUT6 #(
    .INIT(64'h0000000004000000)) 
    \challenge[23]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[3] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(challenge[23]));
  LUT6 #(
    .INIT(64'h0000000400000000)) 
    \challenge[31]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[3] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(challenge[31]));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \challenge[39]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[3] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(challenge[39]));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \challenge[47]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[3] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(challenge[47]));
  LUT6 #(
    .INIT(64'h0400000000000000)) 
    \challenge[55]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[3] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(challenge[55]));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \challenge[63]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[3] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(challenge[63]));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \challenge[71]_i_1 
       (.I0(\parser_reg_n_0_[3] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[1] ),
        .I3(\parser_reg_n_0_[4] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(challenge[71]));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \challenge[79]_i_1 
       (.I0(\crc[6]_i_2_n_0 ),
        .I1(\parser_reg_n_0_[4] ),
        .I2(\parser_reg_n_0_[2] ),
        .I3(\parser_reg_n_0_[3] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[1] ),
        .O(challenge[79]));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \challenge[7]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[3] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(challenge[7]));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \challenge[87]_i_1 
       (.I0(\crc[6]_i_2_n_0 ),
        .I1(\parser_reg_n_0_[1] ),
        .I2(\parser_reg_n_0_[0] ),
        .I3(\parser_reg_n_0_[3] ),
        .I4(\parser_reg_n_0_[2] ),
        .I5(\parser_reg_n_0_[4] ),
        .O(challenge[87]));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \challenge[95]_i_1 
       (.I0(\parser_reg_n_0_[3] ),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[0] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[2] ),
        .I5(\parser_reg_n_0_[4] ),
        .O(challenge[95]));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[7]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[100] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[103]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[100] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[101] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[103]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[101] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[102] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[103]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[102] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[103] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[103]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[103] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[104] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[111]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[104] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[105] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[111]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[105] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[106] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[111]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[106] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[107] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[111]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[107] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[108] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[111]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[108] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[109] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[111]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[109] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[15]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[10] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[110] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[111]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[110] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[111] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[111]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[111] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[112] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[119]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[112] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[113] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[119]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[113] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[114] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[119]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[114] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[115] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[119]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[115] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[116] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[119]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[116] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[117] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[119]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[117] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[118] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[119]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[118] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[119] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[119]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[119] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[15]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[11] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[120] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[127]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[120] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[121] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[127]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[121] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[122] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[127]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[122] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[123] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[127]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[123] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[124] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[127]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[124] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[125] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[127]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[125] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[126] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[127]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[126] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[127] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[127]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[127] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[15]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[12] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[15]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[13] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[15]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[14] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[15]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[15] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[23]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[16] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[23]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[17] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[23]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[18] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[23]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[19] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[7]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[23]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[20] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[23]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[21] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[23]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[22] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[23]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[23] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[31]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[24] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[31]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[25] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[31]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[26] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[31]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[27] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[31]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[28] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[31]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[29] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[7]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[31]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[30] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[31]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[31] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[39]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[32] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[39]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[33] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[39]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[34] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[35] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[39]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[35] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[36] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[39]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[36] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[37] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[39]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[37] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[38] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[39]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[38] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[39] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[39]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[39] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[7]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[40] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[47]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[40] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[41] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[47]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[41] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[42] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[47]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[42] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[43] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[47]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[43] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[44] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[47]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[44] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[45] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[47]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[45] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[46] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[47]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[46] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[47] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[47]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[47] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[48] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[55]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[48] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[49] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[55]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[49] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[7]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[4] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[50] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[55]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[50] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[51] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[55]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[51] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[52] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[55]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[52] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[53] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[55]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[53] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[54] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[55]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[54] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[55] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[55]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[55] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[56] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[63]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[56] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[57] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[63]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[57] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[58] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[63]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[58] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[59] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[63]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[59] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[7]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[60] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[63]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[60] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[61] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[63]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[61] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[62] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[63]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[62] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[63] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[63]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[63] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[64] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[71]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[64] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[65] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[71]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[65] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[66] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[71]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[66] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[67] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[71]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[67] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[68] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[71]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[68] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[69] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[71]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[69] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[7]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[6] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[70] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[71]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[70] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[71] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[71]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[71] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[72] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[79]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[72] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[73] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[79]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[73] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[74] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[79]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[74] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[75] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[79]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[75] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[76] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[79]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[76] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[77] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[79]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[77] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[78] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[79]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[78] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[79] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[79]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[79] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[7]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[7] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[80] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[87]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[80] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[81] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[87]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[81] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[82] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[87]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[82] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[83] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[87]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[83] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[84] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[87]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[84] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[85] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[87]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[85] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[86] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[87]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[86] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[87] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[87]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[87] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[88] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[95]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[88] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[89] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[95]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[89] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[15]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[8] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[90] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[95]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[90] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[91] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[95]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[91] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[92] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[95]),
        .D(rd[4]),
        .Q(\challenge_reg_n_0_[92] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[93] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[95]),
        .D(rd[5]),
        .Q(\challenge_reg_n_0_[93] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[94] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[95]),
        .D(rd[6]),
        .Q(\challenge_reg_n_0_[94] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[95] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[95]),
        .D(rd[7]),
        .Q(\challenge_reg_n_0_[95] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[96] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[103]),
        .D(rd[0]),
        .Q(\challenge_reg_n_0_[96] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[97] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[103]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[97] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[98] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[103]),
        .D(rd[2]),
        .Q(\challenge_reg_n_0_[98] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[99] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[103]),
        .D(rd[3]),
        .Q(\challenge_reg_n_0_[99] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \challenge_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(challenge[15]),
        .D(rd[1]),
        .Q(\challenge_reg_n_0_[9] ),
        .R(reset));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT2 #(
    .INIT(4'h6)) 
    \crc[0]_i_1 
       (.I0(rd[0]),
        .I1(\crc_reg_n_0_[0] ),
        .O(crc0[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \crc[1]_i_1 
       (.I0(rd[1]),
        .I1(\crc_reg_n_0_[1] ),
        .O(crc0[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \crc[2]_i_1 
       (.I0(rd[2]),
        .I1(\crc_reg_n_0_[2] ),
        .O(crc0[2]));
  LUT4 #(
    .INIT(16'hF7F8)) 
    \crc[3]_i_1 
       (.I0(rd[3]),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(crc),
        .I3(\crc_reg_n_0_[3] ),
        .O(\crc[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \crc[4]_i_1 
       (.I0(rd[4]),
        .I1(\crc_reg_n_0_[4] ),
        .O(crc0[4]));
  LUT4 #(
    .INIT(16'hF7F8)) 
    \crc[5]_i_1 
       (.I0(rd[5]),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(crc),
        .I3(\crc_reg_n_0_[5] ),
        .O(\crc[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \crc[6]_i_1 
       (.I0(reset),
        .I1(crc),
        .O(\crc[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0008)) 
    \crc[6]_i_2 
       (.I0(led_OBUF[8]),
        .I1(received),
        .I2(framing),
        .I3(\parser[0]_i_3_n_0 ),
        .O(\crc[6]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \crc[6]_i_3 
       (.I0(rd[6]),
        .I1(\crc_reg_n_0_[6] ),
        .O(crc0[6]));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \crc[6]_i_4 
       (.I0(led_OBUF[8]),
        .I1(received),
        .I2(framing),
        .I3(\parser[4]_i_7_n_0 ),
        .I4(\partial_timeout[31]_i_4_n_0 ),
        .I5(\parser_reg_n_0_[4] ),
        .O(crc));
  LUT4 #(
    .INIT(16'hF7F8)) 
    \crc[7]_i_1 
       (.I0(rd[7]),
        .I1(\crc[6]_i_2_n_0 ),
        .I2(crc),
        .I3(\crc_reg_n_0_[7] ),
        .O(\crc[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \crc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\crc[6]_i_2_n_0 ),
        .D(crc0[0]),
        .Q(\crc_reg_n_0_[0] ),
        .R(\crc[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \crc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\crc[6]_i_2_n_0 ),
        .D(crc0[1]),
        .Q(\crc_reg_n_0_[1] ),
        .R(\crc[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \crc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\crc[6]_i_2_n_0 ),
        .D(crc0[2]),
        .Q(\crc_reg_n_0_[2] ),
        .R(\crc[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \crc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\crc[3]_i_1_n_0 ),
        .Q(\crc_reg_n_0_[3] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \crc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\crc[6]_i_2_n_0 ),
        .D(crc0[4]),
        .Q(\crc_reg_n_0_[4] ),
        .R(\crc[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \crc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\crc[5]_i_1_n_0 ),
        .Q(\crc_reg_n_0_[5] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \crc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\crc[6]_i_2_n_0 ),
        .D(crc0[6]),
        .Q(\crc_reg_n_0_[6] ),
        .R(\crc[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \crc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\crc[7]_i_1_n_0 ),
        .Q(\crc_reg_n_0_[7] ),
        .R(reset));
  LUT4 #(
    .INIT(16'hFF40)) 
    \done_mask[0]_i_1 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(p_0_in[0]),
        .I3(\done_mask_reg_n_0_[0] ),
        .O(\done_mask[0]_i_1_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "184" *) 
  LUT4 #(
    .INIT(16'hFF40)) 
    \done_mask[1]_i_1 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(p_0_in[1]),
        .I3(\done_mask_reg_n_0_[1] ),
        .O(\done_mask[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF40)) 
    \done_mask[2]_i_1 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(p_0_in[2]),
        .I3(\done_mask_reg_n_0_[2] ),
        .O(\done_mask[2]_i_1_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "185" *) 
  LUT4 #(
    .INIT(16'hFF40)) 
    \done_mask[3]_i_1 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(p_0_in[3]),
        .I3(\done_mask_reg_n_0_[3] ),
        .O(\done_mask[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF40)) 
    \done_mask[4]_i_1 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(p_0_in[4]),
        .I3(\done_mask_reg_n_0_[4] ),
        .O(\done_mask[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF40)) 
    \done_mask[5]_i_1 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(p_0_in[5]),
        .I3(\done_mask_reg_n_0_[5] ),
        .O(\done_mask[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF40)) 
    \done_mask[6]_i_1 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(p_0_in[6]),
        .I3(\done_mask_reg_n_0_[6] ),
        .O(\done_mask[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \done_mask[7]_i_1 
       (.I0(reset),
        .I1(\done_mask[7]_i_3_n_0 ),
        .O(qu_result));
  LUT4 #(
    .INIT(16'hFF40)) 
    \done_mask[7]_i_2 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(p_0_in[7]),
        .I3(\done_mask_reg_n_0_[7] ),
        .O(\done_mask[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    \done_mask[7]_i_3 
       (.I0(\done_mask[7]_i_4_n_0 ),
        .I1(\done_mask[7]_i_5_n_0 ),
        .I2(\done_mask[7]_i_6_n_0 ),
        .I3(\done_mask[7]_i_7_n_0 ),
        .I4(\parser_reg_n_0_[4] ),
        .I5(\partial_timeout[31]_i_4_n_0 ),
        .O(\done_mask[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \done_mask[7]_i_4 
       (.I0(\crc_reg_n_0_[5] ),
        .I1(rd[5]),
        .I2(\crc_reg_n_0_[1] ),
        .I3(rd[1]),
        .O(\done_mask[7]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF6FFF)) 
    \done_mask[7]_i_5 
       (.I0(\crc_reg_n_0_[0] ),
        .I1(rd[0]),
        .I2(led_OBUF[8]),
        .I3(received),
        .I4(framing),
        .O(\done_mask[7]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \done_mask[7]_i_6 
       (.I0(\crc_reg_n_0_[4] ),
        .I1(rd[4]),
        .I2(\crc_reg_n_0_[2] ),
        .I3(rd[2]),
        .O(\done_mask[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \done_mask[7]_i_7 
       (.I0(\crc_reg_n_0_[6] ),
        .I1(rd[6]),
        .I2(rd[3]),
        .I3(\crc_reg_n_0_[3] ),
        .I4(rd[7]),
        .I5(\crc_reg_n_0_[7] ),
        .O(\done_mask[7]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \done_mask_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\done_mask[0]_i_1_n_0 ),
        .Q(\done_mask_reg_n_0_[0] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \done_mask_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\done_mask[1]_i_1_n_0 ),
        .Q(\done_mask_reg_n_0_[1] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \done_mask_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\done_mask[2]_i_1_n_0 ),
        .Q(\done_mask_reg_n_0_[2] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \done_mask_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\done_mask[3]_i_1_n_0 ),
        .Q(\done_mask_reg_n_0_[3] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \done_mask_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\done_mask[4]_i_1_n_0 ),
        .Q(\done_mask_reg_n_0_[4] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \done_mask_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\done_mask[5]_i_1_n_0 ),
        .Q(\done_mask_reg_n_0_[5] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \done_mask_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\done_mask[6]_i_1_n_0 ),
        .Q(\done_mask_reg_n_0_[6] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \done_mask_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\done_mask[7]_i_2_n_0 ),
        .Q(\done_mask_reg_n_0_[7] ),
        .R(qu_result));
  LUT6 #(
    .INIT(64'h101010FF10101000)) 
    \flags[0]_i_1 
       (.I0(reset),
        .I1(led_OBUF[8]),
        .I2(\index[4]_i_8_n_0 ),
        .I3(\index[4]_i_1_n_0 ),
        .I4(\done_mask[7]_i_3_n_0 ),
        .I5(\flags_reg_n_0_[0] ),
        .O(\flags[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h111F1110)) 
    \flags[6]_i_1 
       (.I0(led_OBUF[8]),
        .I1(reset),
        .I2(\index[4]_i_1_n_0 ),
        .I3(\done_mask[7]_i_3_n_0 ),
        .I4(\flags_reg_n_0_[6] ),
        .O(\flags[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h010101FF01010100)) 
    \flags[7]_i_1 
       (.I0(reset),
        .I1(led_OBUF[8]),
        .I2(\index[4]_i_8_n_0 ),
        .I3(\index[4]_i_1_n_0 ),
        .I4(\done_mask[7]_i_3_n_0 ),
        .I5(\flags_reg_n_0_[7] ),
        .O(\flags[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \flags_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\flags[0]_i_1_n_0 ),
        .Q(\flags_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \flags_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\flags[6]_i_1_n_0 ),
        .Q(\flags_reg_n_0_[6] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \flags_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\flags[7]_i_1_n_0 ),
        .Q(\flags_reg_n_0_[7] ),
        .R(\<const0> ));
  cbdc_serial_engine__1 \gen_core[0].u_engine 
       (.busy(busy[0]),
        .challenge({\challenge_reg_n_0_[15] ,\challenge_reg_n_0_[14] ,\challenge_reg_n_0_[13] ,\challenge_reg_n_0_[12] ,\challenge_reg_n_0_[11] ,\challenge_reg_n_0_[10] ,\challenge_reg_n_0_[9] ,\challenge_reg_n_0_[8] ,\challenge_reg_n_0_[7] ,\challenge_reg_n_0_[6] ,\challenge_reg_n_0_[5] ,\challenge_reg_n_0_[4] ,\challenge_reg_n_0_[3] ,\challenge_reg_n_0_[2] ,\challenge_reg_n_0_[1] ,\challenge_reg_n_0_[0] }),
        .clk(clk_IBUF_BUFG),
        .edges(\gen_core[0].edges ),
        .reset(reset),
        .response(p_10_out[0]),
        .start(start_reg_n_0),
        .valid(p_0_in[0]));
  LUT2 #(
    .INIT(4'hE)) 
    \gen_core[0].u_engine_i_1 
       (.I0(button),
        .I1(pr),
        .O(reset));
  cbdc_serial_engine__2 \gen_core[1].u_engine 
       (.busy(busy[1]),
        .challenge({\challenge_reg_n_0_[31] ,\challenge_reg_n_0_[30] ,\challenge_reg_n_0_[29] ,\challenge_reg_n_0_[28] ,\challenge_reg_n_0_[27] ,\challenge_reg_n_0_[26] ,\challenge_reg_n_0_[25] ,\challenge_reg_n_0_[24] ,\challenge_reg_n_0_[23] ,\challenge_reg_n_0_[22] ,\challenge_reg_n_0_[21] ,\challenge_reg_n_0_[20] ,\challenge_reg_n_0_[19] ,\challenge_reg_n_0_[18] ,\challenge_reg_n_0_[17] ,\challenge_reg_n_0_[16] }),
        .clk(clk_IBUF_BUFG),
        .edges(\gen_core[1].edges ),
        .reset(reset),
        .response(p_10_out[1]),
        .start(start_reg_n_0),
        .valid(p_0_in[1]));
  cbdc_serial_engine__3 \gen_core[2].u_engine 
       (.busy(busy[2]),
        .challenge({\challenge_reg_n_0_[47] ,\challenge_reg_n_0_[46] ,\challenge_reg_n_0_[45] ,\challenge_reg_n_0_[44] ,\challenge_reg_n_0_[43] ,\challenge_reg_n_0_[42] ,\challenge_reg_n_0_[41] ,\challenge_reg_n_0_[40] ,\challenge_reg_n_0_[39] ,\challenge_reg_n_0_[38] ,\challenge_reg_n_0_[37] ,\challenge_reg_n_0_[36] ,\challenge_reg_n_0_[35] ,\challenge_reg_n_0_[34] ,\challenge_reg_n_0_[33] ,\challenge_reg_n_0_[32] }),
        .clk(clk_IBUF_BUFG),
        .edges(\gen_core[2].edges ),
        .reset(reset),
        .response(p_10_out[2]),
        .start(start_reg_n_0),
        .valid(p_0_in[2]));
  cbdc_serial_engine__4 \gen_core[3].u_engine 
       (.busy(busy[3]),
        .challenge({\challenge_reg_n_0_[63] ,\challenge_reg_n_0_[62] ,\challenge_reg_n_0_[61] ,\challenge_reg_n_0_[60] ,\challenge_reg_n_0_[59] ,\challenge_reg_n_0_[58] ,\challenge_reg_n_0_[57] ,\challenge_reg_n_0_[56] ,\challenge_reg_n_0_[55] ,\challenge_reg_n_0_[54] ,\challenge_reg_n_0_[53] ,\challenge_reg_n_0_[52] ,\challenge_reg_n_0_[51] ,\challenge_reg_n_0_[50] ,\challenge_reg_n_0_[49] ,\challenge_reg_n_0_[48] }),
        .clk(clk_IBUF_BUFG),
        .edges(\gen_core[3].edges ),
        .reset(reset),
        .response(p_10_out[3]),
        .start(start_reg_n_0),
        .valid(p_0_in[3]));
  cbdc_serial_engine__5 \gen_core[4].u_engine 
       (.busy(busy[4]),
        .challenge({\challenge_reg_n_0_[79] ,\challenge_reg_n_0_[78] ,\challenge_reg_n_0_[77] ,\challenge_reg_n_0_[76] ,\challenge_reg_n_0_[75] ,\challenge_reg_n_0_[74] ,\challenge_reg_n_0_[73] ,\challenge_reg_n_0_[72] ,\challenge_reg_n_0_[71] ,\challenge_reg_n_0_[70] ,\challenge_reg_n_0_[69] ,\challenge_reg_n_0_[68] ,\challenge_reg_n_0_[67] ,\challenge_reg_n_0_[66] ,\challenge_reg_n_0_[65] ,\challenge_reg_n_0_[64] }),
        .clk(clk_IBUF_BUFG),
        .edges(\gen_core[4].edges ),
        .reset(reset),
        .response(p_10_out[4]),
        .start(start_reg_n_0),
        .valid(p_0_in[4]));
  cbdc_serial_engine__6 \gen_core[5].u_engine 
       (.busy(busy[5]),
        .challenge({\challenge_reg_n_0_[95] ,\challenge_reg_n_0_[94] ,\challenge_reg_n_0_[93] ,\challenge_reg_n_0_[92] ,\challenge_reg_n_0_[91] ,\challenge_reg_n_0_[90] ,\challenge_reg_n_0_[89] ,\challenge_reg_n_0_[88] ,\challenge_reg_n_0_[87] ,\challenge_reg_n_0_[86] ,\challenge_reg_n_0_[85] ,\challenge_reg_n_0_[84] ,\challenge_reg_n_0_[83] ,\challenge_reg_n_0_[82] ,\challenge_reg_n_0_[81] ,\challenge_reg_n_0_[80] }),
        .clk(clk_IBUF_BUFG),
        .edges(\gen_core[5].edges ),
        .reset(reset),
        .response(p_10_out[5]),
        .start(start_reg_n_0),
        .valid(p_0_in[5]));
  cbdc_serial_engine__7 \gen_core[6].u_engine 
       (.busy(busy[6]),
        .challenge({\challenge_reg_n_0_[111] ,\challenge_reg_n_0_[110] ,\challenge_reg_n_0_[109] ,\challenge_reg_n_0_[108] ,\challenge_reg_n_0_[107] ,\challenge_reg_n_0_[106] ,\challenge_reg_n_0_[105] ,\challenge_reg_n_0_[104] ,\challenge_reg_n_0_[103] ,\challenge_reg_n_0_[102] ,\challenge_reg_n_0_[101] ,\challenge_reg_n_0_[100] ,\challenge_reg_n_0_[99] ,\challenge_reg_n_0_[98] ,\challenge_reg_n_0_[97] ,\challenge_reg_n_0_[96] }),
        .clk(clk_IBUF_BUFG),
        .edges(\gen_core[6].edges ),
        .reset(reset),
        .response(p_10_out[6]),
        .start(start_reg_n_0),
        .valid(p_0_in[6]));
  cbdc_serial_engine \gen_core[7].u_engine 
       (.busy(busy[7]),
        .challenge({\challenge_reg_n_0_[127] ,\challenge_reg_n_0_[126] ,\challenge_reg_n_0_[125] ,\challenge_reg_n_0_[124] ,\challenge_reg_n_0_[123] ,\challenge_reg_n_0_[122] ,\challenge_reg_n_0_[121] ,\challenge_reg_n_0_[120] ,\challenge_reg_n_0_[119] ,\challenge_reg_n_0_[118] ,\challenge_reg_n_0_[117] ,\challenge_reg_n_0_[116] ,\challenge_reg_n_0_[115] ,\challenge_reg_n_0_[114] ,\challenge_reg_n_0_[113] ,\challenge_reg_n_0_[112] }),
        .clk(clk_IBUF_BUFG),
        .edges(\gen_core[7].edges ),
        .reset(reset),
        .response(p_10_out[7]),
        .start(start_reg_n_0),
        .valid(p_0_in[7]));
  LUT5 #(
    .INIT(32'h55551555)) 
    \index[0]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[4] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\index[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00F7FF00)) 
    \index[1]_i_1 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[1] ),
        .O(\index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h78783878)) 
    \index[2]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[4] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\index[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \index[3]_i_1 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .O(\index[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBAAAAAABA)) 
    \index[4]_i_1 
       (.I0(reset),
        .I1(\index[4]_i_4_n_0 ),
        .I2(\index[4]_i_5_n_0 ),
        .I3(\index[4]_i_6_n_0 ),
        .I4(\index[4]_i_7_n_0 ),
        .I5(\index[4]_i_8_n_0 ),
        .O(\index[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \index[4]_i_10 
       (.I0(timeout_reg[28]),
        .I1(timeout_reg[22]),
        .I2(timeout_reg[10]),
        .I3(timeout_reg[11]),
        .O(\index[4]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \index[4]_i_11 
       (.I0(timeout_reg[9]),
        .I1(timeout_reg[3]),
        .I2(timeout_reg[29]),
        .I3(timeout_reg[27]),
        .O(\index[4]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \index[4]_i_12 
       (.I0(timeout_reg[13]),
        .I1(timeout_reg[7]),
        .I2(timeout_reg[30]),
        .I3(timeout_reg[25]),
        .O(\index[4]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \index[4]_i_13 
       (.I0(timeout_reg[16]),
        .I1(timeout_reg[12]),
        .I2(timeout_reg[14]),
        .I3(timeout_reg[2]),
        .O(\index[4]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \index[4]_i_14 
       (.I0(timeout_reg[5]),
        .I1(timeout_reg[31]),
        .I2(timeout_reg[20]),
        .I3(timeout_reg[18]),
        .O(\index[4]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \index[4]_i_15 
       (.I0(\done_mask_reg_n_0_[4] ),
        .I1(\done_mask_reg_n_0_[6] ),
        .I2(\done_mask_reg_n_0_[1] ),
        .I3(\done_mask_reg_n_0_[3] ),
        .O(\index[4]_i_15_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \index[4]_i_2 
       (.I0(led_OBUF[9]),
        .I1(tx_busy),
        .I2(send_reg_n_0),
        .O(\index[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h7F80BF00)) 
    \index[4]_i_3 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[4] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\index[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \index[4]_i_4 
       (.I0(led_OBUF[8]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\index[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \index[4]_i_5 
       (.I0(\index[4]_i_9_n_0 ),
        .I1(\index[4]_i_10_n_0 ),
        .I2(\index[4]_i_11_n_0 ),
        .I3(\index[4]_i_12_n_0 ),
        .O(\index[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \index[4]_i_6 
       (.I0(timeout_reg[17]),
        .I1(timeout_reg[23]),
        .I2(timeout_reg[0]),
        .I3(timeout_reg[4]),
        .I4(\index[4]_i_13_n_0 ),
        .O(\index[4]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \index[4]_i_7 
       (.I0(timeout_reg[24]),
        .I1(timeout_reg[8]),
        .I2(timeout_reg[6]),
        .I3(timeout_reg[26]),
        .I4(\index[4]_i_14_n_0 ),
        .O(\index[4]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \index[4]_i_8 
       (.I0(\done_mask_reg_n_0_[7] ),
        .I1(\done_mask_reg_n_0_[5] ),
        .I2(\done_mask_reg_n_0_[2] ),
        .I3(\done_mask_reg_n_0_[0] ),
        .I4(\index[4]_i_15_n_0 ),
        .O(\index[4]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \index[4]_i_9 
       (.I0(timeout_reg[21]),
        .I1(timeout_reg[19]),
        .I2(timeout_reg[15]),
        .I3(timeout_reg[1]),
        .O(\index[4]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[4]_i_2_n_0 ),
        .D(\index[0]_i_1_n_0 ),
        .Q(\index_reg_n_0_[0] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[4]_i_2_n_0 ),
        .D(\index[1]_i_1_n_0 ),
        .Q(\index_reg_n_0_[1] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[4]_i_2_n_0 ),
        .D(\index[2]_i_1_n_0 ),
        .Q(\index_reg_n_0_[2] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[4]_i_2_n_0 ),
        .D(\index[3]_i_1_n_0 ),
        .Q(\index_reg_n_0_[3] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[4]_i_2_n_0 ),
        .D(\index[4]_i_3_n_0 ),
        .Q(\index_reg_n_0_[4] ),
        .R(\index[4]_i_1_n_0 ));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[10]_inst 
       (.I(led_OBUF[10]),
        .O(led[10]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \led_OBUF[10]_inst_i_1 
       (.I0(busy[2]),
        .I1(busy[3]),
        .I2(busy[0]),
        .I3(busy[1]),
        .I4(\led_OBUF[10]_inst_i_2_n_0 ),
        .O(led_OBUF[10]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \led_OBUF[10]_inst_i_2 
       (.I0(busy[5]),
        .I1(busy[4]),
        .I2(busy[7]),
        .I3(busy[6]),
        .O(\led_OBUF[10]_inst_i_2_n_0 ));
  OBUF \led_OBUF[11]_inst 
       (.I(\<const1> ),
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
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  OBUF \led_OBUF[4]_inst 
       (.I(led_OBUF[4]),
        .O(led[4]));
  OBUF \led_OBUF[5]_inst 
       (.I(led_OBUF[5]),
        .O(led[5]));
  OBUF \led_OBUF[6]_inst 
       (.I(led_OBUF[6]),
        .O(led[6]));
  OBUF \led_OBUF[7]_inst 
       (.I(led_OBUF[7]),
        .O(led[7]));
  OBUF \led_OBUF[8]_inst 
       (.I(led_OBUF[8]),
        .O(led[8]));
  OBUF \led_OBUF[9]_inst 
       (.I(led_OBUF[9]),
        .O(led[9]));
  LUT4 #(
    .INIT(16'h888A)) 
    \parser[0]_i_1 
       (.I0(received),
        .I1(\parser[0]_i_2_n_0 ),
        .I2(\parser_reg_n_0_[0] ),
        .I3(\parser[0]_i_3_n_0 ),
        .O(\parser[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \parser[0]_i_2 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\parser_reg_n_0_[3] ),
        .I2(\parser_reg_n_0_[1] ),
        .I3(\parser_reg_n_0_[0] ),
        .I4(\parser_reg_n_0_[2] ),
        .I5(\parser[4]_i_7_n_0 ),
        .O(\parser[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA9)) 
    \parser[0]_i_3 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\parser_reg_n_0_[2] ),
        .I2(\parser_reg_n_0_[0] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[3] ),
        .O(\parser[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h1400)) 
    \parser[1]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(\parser_reg_n_0_[0] ),
        .I2(\parser_reg_n_0_[1] ),
        .I3(received),
        .O(\parser[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT5 #(
    .INIT(32'h04444000)) 
    \parser[2]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(received),
        .I2(\parser_reg_n_0_[1] ),
        .I3(\parser_reg_n_0_[0] ),
        .I4(\parser_reg_n_0_[2] ),
        .O(\parser[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0444444440000000)) 
    \parser[3]_i_1 
       (.I0(\parser_reg_n_0_[4] ),
        .I1(received),
        .I2(\parser_reg_n_0_[0] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[2] ),
        .I5(\parser_reg_n_0_[3] ),
        .O(\parser[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \parser[4]_i_1 
       (.I0(reset),
        .I1(framing),
        .I2(led_OBUF[8]),
        .O(\parser[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \parser[4]_i_10 
       (.I0(\partial_timeout_reg_n_0_[16] ),
        .I1(\partial_timeout_reg_n_0_[21] ),
        .I2(\partial_timeout_reg_n_0_[19] ),
        .I3(\partial_timeout_reg_n_0_[20] ),
        .I4(\parser[4]_i_14_n_0 ),
        .O(\parser[4]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \parser[4]_i_11 
       (.I0(rd[5]),
        .I1(rd[7]),
        .I2(rd[3]),
        .I3(rd[0]),
        .O(\parser[4]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \parser[4]_i_12 
       (.I0(\partial_timeout_reg_n_0_[2] ),
        .I1(\partial_timeout_reg_n_0_[0] ),
        .I2(\partial_timeout_reg_n_0_[5] ),
        .I3(\partial_timeout_reg_n_0_[11] ),
        .O(\parser[4]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \parser[4]_i_13 
       (.I0(\partial_timeout_reg_n_0_[27] ),
        .I1(\partial_timeout_reg_n_0_[28] ),
        .I2(\partial_timeout_reg_n_0_[7] ),
        .I3(\partial_timeout_reg_n_0_[10] ),
        .O(\parser[4]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \parser[4]_i_14 
       (.I0(\partial_timeout_reg_n_0_[23] ),
        .I1(\partial_timeout_reg_n_0_[22] ),
        .I2(\partial_timeout_reg_n_0_[18] ),
        .I3(\partial_timeout_reg_n_0_[17] ),
        .O(\parser[4]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFF20F020F020F020)) 
    \parser[4]_i_2 
       (.I0(\parser[4]_i_4_n_0 ),
        .I1(\parser[4]_i_5_n_0 ),
        .I2(\parser[4]_i_6_n_0 ),
        .I3(received),
        .I4(led_OBUF[8]),
        .I5(\parser[4]_i_7_n_0 ),
        .O(\parser[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2000000000000008)) 
    \parser[4]_i_3 
       (.I0(received),
        .I1(\parser_reg_n_0_[4] ),
        .I2(\parser_reg_n_0_[2] ),
        .I3(\parser_reg_n_0_[0] ),
        .I4(\parser_reg_n_0_[1] ),
        .I5(\parser_reg_n_0_[3] ),
        .O(\parser[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \parser[4]_i_4 
       (.I0(\partial_timeout_reg_n_0_[3] ),
        .I1(\partial_timeout_reg_n_0_[24] ),
        .I2(\partial_timeout_reg_n_0_[26] ),
        .I3(\partial_timeout_reg_n_0_[30] ),
        .I4(\partial_timeout_reg_n_0_[9] ),
        .I5(\partial_timeout_reg_n_0_[8] ),
        .O(\parser[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \parser[4]_i_5 
       (.I0(\parser[4]_i_8_n_0 ),
        .I1(\partial_timeout_reg_n_0_[1] ),
        .I2(\partial_timeout_reg_n_0_[15] ),
        .I3(\partial_timeout_reg_n_0_[6] ),
        .I4(\parser[4]_i_9_n_0 ),
        .I5(\parser[4]_i_10_n_0 ),
        .O(\parser[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \parser[4]_i_6 
       (.I0(led_OBUF[8]),
        .I1(\parser_reg_n_0_[4] ),
        .I2(\parser_reg_n_0_[3] ),
        .I3(\parser_reg_n_0_[1] ),
        .I4(\parser_reg_n_0_[0] ),
        .I5(\parser_reg_n_0_[2] ),
        .O(\parser[4]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \parser[4]_i_7 
       (.I0(rd[6]),
        .I1(rd[4]),
        .I2(rd[2]),
        .I3(rd[1]),
        .I4(\parser[4]_i_11_n_0 ),
        .O(\parser[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \parser[4]_i_8 
       (.I0(\partial_timeout_reg_n_0_[12] ),
        .I1(\partial_timeout_reg_n_0_[14] ),
        .I2(\partial_timeout_reg_n_0_[13] ),
        .I3(\parser[4]_i_12_n_0 ),
        .O(\parser[4]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \parser[4]_i_9 
       (.I0(\partial_timeout_reg_n_0_[29] ),
        .I1(\partial_timeout_reg_n_0_[25] ),
        .I2(\partial_timeout_reg_n_0_[4] ),
        .I3(\partial_timeout_reg_n_0_[31] ),
        .I4(\parser[4]_i_13_n_0 ),
        .O(\parser[4]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \parser_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\parser[4]_i_2_n_0 ),
        .D(\parser[0]_i_1_n_0 ),
        .Q(\parser_reg_n_0_[0] ),
        .R(\parser[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \parser_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\parser[4]_i_2_n_0 ),
        .D(\parser[1]_i_1_n_0 ),
        .Q(\parser_reg_n_0_[1] ),
        .R(\parser[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \parser_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\parser[4]_i_2_n_0 ),
        .D(\parser[2]_i_1_n_0 ),
        .Q(\parser_reg_n_0_[2] ),
        .R(\parser[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \parser_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\parser[4]_i_2_n_0 ),
        .D(\parser[3]_i_1_n_0 ),
        .Q(\parser_reg_n_0_[3] ),
        .R(\parser[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \parser_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\parser[4]_i_2_n_0 ),
        .D(\parser[4]_i_3_n_0 ),
        .Q(\parser_reg_n_0_[4] ),
        .R(\parser[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000045450045)) 
    \partial_timeout[0]_i_1 
       (.I0(reset),
        .I1(framing),
        .I2(received),
        .I3(\parser[4]_i_4_n_0 ),
        .I4(\parser[4]_i_5_n_0 ),
        .I5(\partial_timeout_reg_n_0_[0] ),
        .O(\partial_timeout[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBABAFFBA00000000)) 
    \partial_timeout[31]_i_1 
       (.I0(reset),
        .I1(framing),
        .I2(received),
        .I3(\parser[4]_i_4_n_0 ),
        .I4(\parser[4]_i_5_n_0 ),
        .I5(\partial_timeout[31]_i_2_n_0 ),
        .O(\partial_timeout[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFDFDD0000)) 
    \partial_timeout[31]_i_2 
       (.I0(\partial_timeout[31]_i_4_n_0 ),
        .I1(\parser_reg_n_0_[4] ),
        .I2(framing),
        .I3(received),
        .I4(led_OBUF[8]),
        .I5(reset),
        .O(\partial_timeout[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \partial_timeout[31]_i_4 
       (.I0(\parser_reg_n_0_[3] ),
        .I1(\parser_reg_n_0_[1] ),
        .I2(\parser_reg_n_0_[0] ),
        .I3(\parser_reg_n_0_[2] ),
        .O(\partial_timeout[31]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \partial_timeout_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\partial_timeout[31]_i_2_n_0 ),
        .D(\partial_timeout[0]_i_1_n_0 ),
        .Q(\partial_timeout_reg_n_0_[0] ),
        .R(\<const0> ));
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
        .O(p_0_in__0[0]));
  (* \PinAttr:I1:HOLD_DETOUR  = "193" *) 
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \por[1]_i_1 
       (.I0(\por_reg_n_0_[0] ),
        .I1(\por_reg_n_0_[1] ),
        .O(p_0_in__0[1]));
  (* \PinAttr:I1:HOLD_DETOUR  = "193" *) 
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \por[2]_i_1 
       (.I0(\por_reg_n_0_[2] ),
        .I1(\por_reg_n_0_[1] ),
        .I2(\por_reg_n_0_[0] ),
        .O(p_0_in__0[2]));
  (* \PinAttr:I2:HOLD_DETOUR  = "197" *) 
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \por[3]_i_1 
       (.I0(\por_reg_n_0_[3] ),
        .I1(\por_reg_n_0_[0] ),
        .I2(\por_reg_n_0_[1] ),
        .I3(\por_reg_n_0_[2] ),
        .O(p_0_in__0[3]));
  (* \PinAttr:I1:HOLD_DETOUR  = "197" *) 
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \por[4]_inv_i_1 
       (.I0(\por_reg_n_0_[2] ),
        .I1(\por_reg_n_0_[1] ),
        .I2(\por_reg_n_0_[0] ),
        .I3(\por_reg_n_0_[3] ),
        .O(p_0_in__0[4]));
  FDRE #(
    .INIT(1'b0)) 
    \por_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in__0[0]),
        .Q(\por_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \por_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in__0[1]),
        .Q(\por_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \por_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in__0[2]),
        .Q(\por_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \por_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in__0[3]),
        .Q(\por_reg_n_0_[3] ),
        .R(\<const0> ));
  (* inverted = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \por_reg[4]_inv 
       (.C(clk_IBUF_BUFG),
        .CE(pr),
        .D(p_0_in__0[4]),
        .Q(pr),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qb_result[0]_i_1 
       (.I0(\gen_core[0].edges [0]),
        .I1(p_0_in[0]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(qb_result[0]),
        .O(\qb_result[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qb_result[1]_i_1 
       (.I0(\gen_core[1].edges [0]),
        .I1(p_0_in[1]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(qb_result[1]),
        .O(\qb_result[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qb_result[2]_i_1 
       (.I0(\gen_core[2].edges [0]),
        .I1(p_0_in[2]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(qb_result[2]),
        .O(\qb_result[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qb_result[3]_i_1 
       (.I0(\gen_core[3].edges [0]),
        .I1(p_0_in[3]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(qb_result[3]),
        .O(\qb_result[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qb_result[4]_i_1 
       (.I0(\gen_core[4].edges [0]),
        .I1(p_0_in[4]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(qb_result[4]),
        .O(\qb_result[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qb_result[5]_i_1 
       (.I0(\gen_core[5].edges [0]),
        .I1(p_0_in[5]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(qb_result[5]),
        .O(\qb_result[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qb_result[6]_i_1 
       (.I0(\gen_core[6].edges [0]),
        .I1(p_0_in[6]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(qb_result[6]),
        .O(\qb_result[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qb_result[7]_i_1 
       (.I0(\gen_core[7].edges [0]),
        .I1(p_0_in[7]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(qb_result[7]),
        .O(\qb_result[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \qb_result_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qb_result[0]_i_1_n_0 ),
        .Q(qb_result[0]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qb_result_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qb_result[1]_i_1_n_0 ),
        .Q(qb_result[1]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qb_result_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qb_result[2]_i_1_n_0 ),
        .Q(qb_result[2]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qb_result_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qb_result[3]_i_1_n_0 ),
        .Q(qb_result[3]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qb_result_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qb_result[4]_i_1_n_0 ),
        .Q(qb_result[4]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qb_result_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qb_result[5]_i_1_n_0 ),
        .Q(qb_result[5]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qb_result_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qb_result[6]_i_1_n_0 ),
        .Q(qb_result[6]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qb_result_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qb_result[7]_i_1_n_0 ),
        .Q(qb_result[7]),
        .R(qu_result));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qu_result[0]_i_1 
       (.I0(\gen_core[0].edges [1]),
        .I1(p_0_in[0]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(\qu_result_reg_n_0_[0] ),
        .O(\qu_result[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qu_result[1]_i_1 
       (.I0(\gen_core[1].edges [1]),
        .I1(p_0_in[1]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(\qu_result_reg_n_0_[1] ),
        .O(\qu_result[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qu_result[2]_i_1 
       (.I0(\gen_core[2].edges [1]),
        .I1(p_0_in[2]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(\qu_result_reg_n_0_[2] ),
        .O(\qu_result[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qu_result[3]_i_1 
       (.I0(\gen_core[3].edges [1]),
        .I1(p_0_in[3]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(\qu_result_reg_n_0_[3] ),
        .O(\qu_result[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qu_result[4]_i_1 
       (.I0(\gen_core[4].edges [1]),
        .I1(p_0_in[4]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(\qu_result_reg_n_0_[4] ),
        .O(\qu_result[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qu_result[5]_i_1 
       (.I0(\gen_core[5].edges [1]),
        .I1(p_0_in[5]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(\qu_result_reg_n_0_[5] ),
        .O(\qu_result[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qu_result[6]_i_1 
       (.I0(\gen_core[6].edges [1]),
        .I1(p_0_in[6]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(\qu_result_reg_n_0_[6] ),
        .O(\qu_result[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \qu_result[7]_i_1 
       (.I0(\gen_core[7].edges [1]),
        .I1(p_0_in[7]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(\qu_result_reg_n_0_[7] ),
        .O(\qu_result[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \qu_result_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qu_result[0]_i_1_n_0 ),
        .Q(\qu_result_reg_n_0_[0] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qu_result_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qu_result[1]_i_1_n_0 ),
        .Q(\qu_result_reg_n_0_[1] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qu_result_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qu_result[2]_i_1_n_0 ),
        .Q(\qu_result_reg_n_0_[2] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qu_result_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qu_result[3]_i_1_n_0 ),
        .Q(\qu_result_reg_n_0_[3] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qu_result_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qu_result[4]_i_1_n_0 ),
        .Q(\qu_result_reg_n_0_[4] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qu_result_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qu_result[5]_i_1_n_0 ),
        .Q(\qu_result_reg_n_0_[5] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qu_result_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qu_result[6]_i_1_n_0 ),
        .Q(\qu_result_reg_n_0_[6] ),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \qu_result_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\qu_result[7]_i_1_n_0 ),
        .Q(\qu_result_reg_n_0_[7] ),
        .R(qu_result));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \result[0]_i_1 
       (.I0(p_10_out[0]),
        .I1(p_0_in[0]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(led_OBUF[0]),
        .O(\result[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \result[1]_i_1 
       (.I0(p_10_out[1]),
        .I1(p_0_in[1]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(led_OBUF[1]),
        .O(\result[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \result[2]_i_1 
       (.I0(p_10_out[2]),
        .I1(p_0_in[2]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(led_OBUF[2]),
        .O(\result[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \result[3]_i_1 
       (.I0(p_10_out[3]),
        .I1(p_0_in[3]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(led_OBUF[3]),
        .O(\result[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \result[4]_i_1 
       (.I0(p_10_out[4]),
        .I1(p_0_in[4]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(led_OBUF[4]),
        .O(\result[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \result[5]_i_1 
       (.I0(p_10_out[5]),
        .I1(p_0_in[5]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(led_OBUF[5]),
        .O(\result[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \result[6]_i_1 
       (.I0(p_10_out[6]),
        .I1(p_0_in[6]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(led_OBUF[6]),
        .O(\result[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \result[7]_i_1 
       (.I0(p_10_out[7]),
        .I1(p_0_in[7]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(led_OBUF[8]),
        .I4(led_OBUF[7]),
        .O(\result[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\result[0]_i_1_n_0 ),
        .Q(led_OBUF[0]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\result[1]_i_1_n_0 ),
        .Q(led_OBUF[1]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\result[2]_i_1_n_0 ),
        .Q(led_OBUF[2]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\result[3]_i_1_n_0 ),
        .Q(led_OBUF[3]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\result[4]_i_1_n_0 ),
        .Q(led_OBUF[4]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\result[5]_i_1_n_0 ),
        .Q(led_OBUF[5]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\result[6]_i_1_n_0 ),
        .Q(led_OBUF[6]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\result[7]_i_1_n_0 ),
        .Q(led_OBUF[7]),
        .R(qu_result));
  LUT4 #(
    .INIT(16'h0002)) 
    send_i_1
       (.I0(\td[7]_i_1_n_0 ),
        .I1(led_OBUF[8]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(reset),
        .O(send_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    send_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(send_i_1_n_0),
        .Q(send_reg_n_0),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    start_i_1
       (.I0(\done_mask[7]_i_3_n_0 ),
        .I1(reset),
        .O(start_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    start_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(start_i_1_n_0),
        .Q(start_reg_n_0),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h8F808F80DFD0DFDF)) 
    \td[0]_i_2 
       (.I0(\td[6]_i_2_n_0 ),
        .I1(led_OBUF[0]),
        .I2(\index_reg_n_0_[1] ),
        .I3(\td[0]_i_4_n_0 ),
        .I4(\td[6]_i_6_n_0 ),
        .I5(\txcrc[0]_i_3_n_0 ),
        .O(\td[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hBB8B888B)) 
    \td[0]_i_3 
       (.I0(\td[0]_i_5_n_0 ),
        .I1(\td[5]_i_5_n_0 ),
        .I2(\txcrc[0]_i_3_n_0 ),
        .I3(\td[6]_i_2_n_0 ),
        .I4(qb_result[0]),
        .O(\td[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \td[0]_i_4 
       (.I0(\qu_result_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[3] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[2] ),
        .O(\td[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \td[0]_i_5 
       (.I0(\txcrc_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\flags_reg_n_0_[0] ),
        .O(\td[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF3F1F1FFF3FFF1)) 
    \td[1]_i_1 
       (.I0(\td[1]_i_2_n_0 ),
        .I1(\td[7]_i_4_n_0 ),
        .I2(\td[1]_i_3_n_0 ),
        .I3(\td[1]_i_4_n_0 ),
        .I4(\td[1]_i_5_n_0 ),
        .I5(\td[1]_i_6_n_0 ),
        .O(td[1]));
  LUT3 #(
    .INIT(8'h1D)) 
    \td[1]_i_10 
       (.I0(\txcrc[1]_i_4_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[1]_i_5_n_0 ),
        .O(\td[1]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \td[1]_i_11 
       (.I0(\qu_result_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[3] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[2] ),
        .O(\td[1]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \td[1]_i_12 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .O(\td[1]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h1D331DFF)) 
    \td[1]_i_13 
       (.I0(\challenge_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\challenge_reg_n_0_[17] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\challenge_reg_n_0_[9] ),
        .O(\td[1]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \td[1]_i_2 
       (.I0(led_OBUF[1]),
        .I1(\index_reg_n_0_[3] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[2] ),
        .O(\td[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABBBABBBBBBBBB)) 
    \td[1]_i_3 
       (.I0(\td[1]_i_7_n_0 ),
        .I1(\td[1]_i_8_n_0 ),
        .I2(\td[1]_i_9_n_0 ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\td[1]_i_10_n_0 ),
        .I5(\td[1]_i_11_n_0 ),
        .O(\td[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hAA8A)) 
    \td[1]_i_4 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[3] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[1] ),
        .O(\td[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF303F1F1F3030101)) 
    \td[1]_i_5 
       (.I0(\index_reg_n_0_[4] ),
        .I1(\td[1]_i_9_n_0 ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\txcrc[1]_i_5_n_0 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\txcrc[1]_i_4_n_0 ),
        .O(\td[1]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \td[1]_i_6 
       (.I0(qb_result[1]),
        .I1(\index_reg_n_0_[3] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[2] ),
        .O(\td[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \td[1]_i_7 
       (.I0(\txcrc_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[4] ),
        .I5(\index_reg_n_0_[3] ),
        .O(\td[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEEEFEEEEFF)) 
    \td[1]_i_8 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\qu_result_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[4] ),
        .I5(\index_reg_n_0_[3] ),
        .O(\td[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h4044FFFF40444044)) 
    \td[1]_i_9 
       (.I0(\txcrc[1]_i_8_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\td[1]_i_12_n_0 ),
        .I3(\challenge_reg_n_0_[49] ),
        .I4(\txcrc[1]_i_9_n_0 ),
        .I5(\td[1]_i_13_n_0 ),
        .O(\td[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF88F8)) 
    \td[2]_i_1 
       (.I0(\txcrc_reg_n_0_[2] ),
        .I1(\td[2]_i_2_n_0 ),
        .I2(\td[2]_i_3_n_0 ),
        .I3(\td[2]_i_4_n_0 ),
        .I4(\td[2]_i_5_n_0 ),
        .I5(\td[2]_i_6_n_0 ),
        .O(td[2]));
  LUT5 #(
    .INIT(32'h00004000)) 
    \td[2]_i_2 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[1] ),
        .O(\td[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h5555F33055550330)) 
    \td[2]_i_3 
       (.I0(\txcrc[2]_i_4_n_0 ),
        .I1(\txcrc[2]_i_5_n_0 ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[4] ),
        .I4(\index_reg_n_0_[3] ),
        .I5(\qu_result_reg_n_0_[2] ),
        .O(\td[2]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \td[2]_i_4 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .O(\td[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF1B001B)) 
    \td[2]_i_5 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\txcrc[2]_i_5_n_0 ),
        .I2(\txcrc[2]_i_4_n_0 ),
        .I3(\td[6]_i_2_n_0 ),
        .I4(led_OBUF[2]),
        .I5(\td[7]_i_4_n_0 ),
        .O(\td[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA028A0000028A)) 
    \td[2]_i_6 
       (.I0(\td[1]_i_4_n_0 ),
        .I1(\index_reg_n_0_[3] ),
        .I2(\txcrc[2]_i_5_n_0 ),
        .I3(\txcrc[2]_i_4_n_0 ),
        .I4(\td[6]_i_2_n_0 ),
        .I5(qb_result[2]),
        .O(\td[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hEFE0EFEFEFE0E0E0)) 
    \td[3]_i_1 
       (.I0(\td[3]_i_2_n_0 ),
        .I1(\td[3]_i_3_n_0 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\td[3]_i_4_n_0 ),
        .I4(\td[3]_i_5_n_0 ),
        .I5(\td[3]_i_6_n_0 ),
        .O(td[3]));
  LUT6 #(
    .INIT(64'h0404040000000400)) 
    \td[3]_i_2 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(led_OBUF[3]),
        .I4(\index_reg_n_0_[0] ),
        .I5(qb_result[3]),
        .O(\td[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF303F1F1F3030101)) 
    \td[3]_i_3 
       (.I0(\index_reg_n_0_[4] ),
        .I1(\txcrc[3]_i_6_n_0 ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\txcrc[3]_i_5_n_0 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\txcrc[3]_i_4_n_0 ),
        .O(\td[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \td[3]_i_4 
       (.I0(\txcrc_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[2] ),
        .O(\td[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4440)) 
    \td[3]_i_5 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\txcrc[3]_i_6_n_0 ),
        .I3(\index_reg_n_0_[4] ),
        .O(\td[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h55F05533553355FF)) 
    \td[3]_i_6 
       (.I0(\td[3]_i_7_n_0 ),
        .I1(\txcrc[3]_i_6_n_0 ),
        .I2(\qu_result_reg_n_0_[3] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\index_reg_n_0_[4] ),
        .I5(\index_reg_n_0_[2] ),
        .O(\td[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \td[3]_i_7 
       (.I0(\txcrc[3]_i_4_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[3]_i_5_n_0 ),
        .O(\td[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hEFE0EFEFEFE0E0E0)) 
    \td[4]_i_1 
       (.I0(\td[4]_i_2_n_0 ),
        .I1(\td[4]_i_3_n_0 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\td[4]_i_4_n_0 ),
        .I4(\td[4]_i_5_n_0 ),
        .I5(\td[4]_i_6_n_0 ),
        .O(td[4]));
  LUT6 #(
    .INIT(64'h0404040000000400)) 
    \td[4]_i_2 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(led_OBUF[4]),
        .I4(\index_reg_n_0_[0] ),
        .I5(qb_result[4]),
        .O(\td[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF303F1F1F3030101)) 
    \td[4]_i_3 
       (.I0(\index_reg_n_0_[4] ),
        .I1(\txcrc[4]_i_6_n_0 ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\txcrc[4]_i_5_n_0 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\txcrc[4]_i_4_n_0 ),
        .O(\td[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \td[4]_i_4 
       (.I0(\txcrc_reg_n_0_[4] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[2] ),
        .O(\td[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4440)) 
    \td[4]_i_5 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\txcrc[4]_i_6_n_0 ),
        .I3(\index_reg_n_0_[4] ),
        .O(\td[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h55F05533553355FF)) 
    \td[4]_i_6 
       (.I0(\td[4]_i_7_n_0 ),
        .I1(\txcrc[4]_i_6_n_0 ),
        .I2(\qu_result_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\index_reg_n_0_[4] ),
        .I5(\index_reg_n_0_[2] ),
        .O(\td[4]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \td[4]_i_7 
       (.I0(\txcrc[4]_i_4_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[4]_i_5_n_0 ),
        .O(\td[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hEFEEEFFFEEEEEEEE)) 
    \td[5]_i_1 
       (.I0(\td[5]_i_2_n_0 ),
        .I1(\td[5]_i_3_n_0 ),
        .I2(\td[5]_i_4_n_0 ),
        .I3(\td[5]_i_5_n_0 ),
        .I4(\td[5]_i_6_n_0 ),
        .I5(\index_reg_n_0_[0] ),
        .O(td[5]));
  LUT6 #(
    .INIT(64'h00FF004700000047)) 
    \td[5]_i_2 
       (.I0(\txcrc[5]_i_4_n_0 ),
        .I1(\index_reg_n_0_[3] ),
        .I2(\txcrc[5]_i_5_n_0 ),
        .I3(\td[5]_i_7_n_0 ),
        .I4(\txcrc[7]_i_3_n_0 ),
        .I5(\qu_result_reg_n_0_[5] ),
        .O(\td[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF1B001B)) 
    \td[5]_i_3 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\txcrc[5]_i_5_n_0 ),
        .I2(\txcrc[5]_i_4_n_0 ),
        .I3(\td[6]_i_2_n_0 ),
        .I4(led_OBUF[5]),
        .I5(\td[7]_i_4_n_0 ),
        .O(\td[5]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \td[5]_i_4 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\txcrc_reg_n_0_[5] ),
        .O(\td[5]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \td[5]_i_5 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[3] ),
        .O(\td[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFDF00DFFF100010)) 
    \td[5]_i_6 
       (.I0(qb_result[5]),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\txcrc[5]_i_4_n_0 ),
        .I5(\txcrc[5]_i_5_n_0 ),
        .O(\td[5]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hEEEEEEEF)) 
    \td[5]_i_7 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\td[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hF1FFF100F1FFF1FF)) 
    \td[6]_i_1 
       (.I0(\txcrc[6]_i_3_n_0 ),
        .I1(\td[6]_i_2_n_0 ),
        .I2(\td[6]_i_3_n_0 ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\td[6]_i_4_n_0 ),
        .I5(\td[6]_i_5_n_0 ),
        .O(td[6]));
  LUT4 #(
    .INIT(16'hABFB)) 
    \td[6]_i_10 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\challenge_reg_n_0_[30] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\challenge_reg_n_0_[38] ),
        .O(\td[6]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \td[6]_i_2 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[3] ),
        .O(\td[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0404040000000400)) 
    \td[6]_i_3 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(led_OBUF[6]),
        .I4(\index_reg_n_0_[0] ),
        .I5(qb_result[6]),
        .O(\td[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2000000)) 
    \td[6]_i_4 
       (.I0(\flags_reg_n_0_[6] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc_reg_n_0_[6] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[4] ),
        .I5(\index_reg_n_0_[3] ),
        .O(\td[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF75314400)) 
    \td[6]_i_5 
       (.I0(\td[6]_i_6_n_0 ),
        .I1(\index_reg_n_0_[3] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\td[6]_i_7_n_0 ),
        .I4(\td[6]_i_8_n_0 ),
        .I5(\td[6]_i_9_n_0 ),
        .O(\td[6]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h41)) 
    \td[6]_i_6 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[2] ),
        .O(\td[6]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \td[6]_i_7 
       (.I0(\txcrc[6]_i_4_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[6]_i_5_n_0 ),
        .O(\td[6]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h4F4F444F)) 
    \td[6]_i_8 
       (.I0(\txcrc[6]_i_8_n_0 ),
        .I1(\td[6]_i_10_n_0 ),
        .I2(\txcrc[6]_i_9_n_0 ),
        .I3(\challenge_reg_n_0_[126] ),
        .I4(\txcrc[5]_i_8_n_0 ),
        .O(\td[6]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h00A000E0)) 
    \td[6]_i_9 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\qu_result_reg_n_0_[6] ),
        .O(\td[6]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h1000101010101010)) 
    \td[7]_i_1 
       (.I0(send_reg_n_0),
        .I1(tx_busy),
        .I2(led_OBUF[9]),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[1] ),
        .I5(\txcrc[7]_i_3_n_0 ),
        .O(\td[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F444F4F44444444)) 
    \td[7]_i_10 
       (.I0(\txcrc[7]_i_13_n_0 ),
        .I1(\td[7]_i_12_n_0 ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\txcrc[5]_i_8_n_0 ),
        .I4(\challenge_reg_n_0_[127] ),
        .I5(\td[7]_i_13_n_0 ),
        .O(\td[7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEFEEEEEEFEF)) 
    \td[7]_i_11 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\qu_result_reg_n_0_[7] ),
        .I4(\index_reg_n_0_[3] ),
        .I5(\index_reg_n_0_[4] ),
        .O(\td[7]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \td[7]_i_12 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\challenge_reg_n_0_[31] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\challenge_reg_n_0_[39] ),
        .O(\td[7]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h503F5F3F)) 
    \td[7]_i_13 
       (.I0(\challenge_reg_n_0_[23] ),
        .I1(\challenge_reg_n_0_[15] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\challenge_reg_n_0_[7] ),
        .O(\td[7]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hF3F3F1F1FFFFFFF1)) 
    \td[7]_i_2 
       (.I0(\td[7]_i_3_n_0 ),
        .I1(\td[7]_i_4_n_0 ),
        .I2(\td[7]_i_5_n_0 ),
        .I3(\td[7]_i_6_n_0 ),
        .I4(\td[7]_i_7_n_0 ),
        .I5(\td[7]_i_8_n_0 ),
        .O(td[7]));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \td[7]_i_3 
       (.I0(led_OBUF[7]),
        .I1(\index_reg_n_0_[3] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[2] ),
        .O(\td[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \td[7]_i_4 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .O(\td[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000008F888FFF)) 
    \td[7]_i_5 
       (.I0(\qu_result_reg_n_0_[7] ),
        .I1(\txcrc[7]_i_3_n_0 ),
        .I2(\td[7]_i_9_n_0 ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\td[7]_i_10_n_0 ),
        .I5(\td[7]_i_11_n_0 ),
        .O(\td[7]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00700050)) 
    \td[7]_i_6 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(qb_result[7]),
        .O(\td[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF303F1F1F3030101)) 
    \td[7]_i_7 
       (.I0(\index_reg_n_0_[4] ),
        .I1(\td[7]_i_10_n_0 ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\txcrc[7]_i_10_n_0 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\txcrc[7]_i_9_n_0 ),
        .O(\td[7]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h4700FFFF)) 
    \td[7]_i_8 
       (.I0(\txcrc_reg_n_0_[7] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\flags_reg_n_0_[7] ),
        .I3(\td[5]_i_5_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .O(\td[7]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \td[7]_i_9 
       (.I0(\txcrc[7]_i_9_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[7]_i_10_n_0 ),
        .O(\td[7]_i_9_n_0 ));
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
        .S(\index_reg_n_0_[0] ));
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
  LUT1 #(
    .INIT(2'h1)) 
    \timeout[0]_i_2 
       (.I0(timeout_reg[0]),
        .O(\timeout[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[0]_i_1_n_7 ),
        .Q(timeout_reg[0]),
        .R(qu_result));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\timeout_reg[0]_i_1_n_0 ,\NLW_timeout_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\timeout_reg[0]_i_1_n_4 ,\timeout_reg[0]_i_1_n_5 ,\timeout_reg[0]_i_1_n_6 ,\timeout_reg[0]_i_1_n_7 }),
        .S({timeout_reg[3:1],\timeout[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[8]_i_1_n_5 ),
        .Q(timeout_reg[10]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[8]_i_1_n_4 ),
        .Q(timeout_reg[11]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[12]_i_1_n_7 ),
        .Q(timeout_reg[12]),
        .R(qu_result));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[12]_i_1 
       (.CI(\timeout_reg[8]_i_1_n_0 ),
        .CO({\timeout_reg[12]_i_1_n_0 ,\NLW_timeout_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timeout_reg[12]_i_1_n_4 ,\timeout_reg[12]_i_1_n_5 ,\timeout_reg[12]_i_1_n_6 ,\timeout_reg[12]_i_1_n_7 }),
        .S(timeout_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[12]_i_1_n_6 ),
        .Q(timeout_reg[13]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[12]_i_1_n_5 ),
        .Q(timeout_reg[14]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[12]_i_1_n_4 ),
        .Q(timeout_reg[15]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[16]_i_1_n_7 ),
        .Q(timeout_reg[16]),
        .R(qu_result));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[16]_i_1 
       (.CI(\timeout_reg[12]_i_1_n_0 ),
        .CO({\timeout_reg[16]_i_1_n_0 ,\NLW_timeout_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timeout_reg[16]_i_1_n_4 ,\timeout_reg[16]_i_1_n_5 ,\timeout_reg[16]_i_1_n_6 ,\timeout_reg[16]_i_1_n_7 }),
        .S(timeout_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[16]_i_1_n_6 ),
        .Q(timeout_reg[17]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[16]_i_1_n_5 ),
        .Q(timeout_reg[18]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[16]_i_1_n_4 ),
        .Q(timeout_reg[19]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[0]_i_1_n_6 ),
        .Q(timeout_reg[1]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[20]_i_1_n_7 ),
        .Q(timeout_reg[20]),
        .R(qu_result));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[20]_i_1 
       (.CI(\timeout_reg[16]_i_1_n_0 ),
        .CO({\timeout_reg[20]_i_1_n_0 ,\NLW_timeout_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timeout_reg[20]_i_1_n_4 ,\timeout_reg[20]_i_1_n_5 ,\timeout_reg[20]_i_1_n_6 ,\timeout_reg[20]_i_1_n_7 }),
        .S(timeout_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[20]_i_1_n_6 ),
        .Q(timeout_reg[21]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[20]_i_1_n_5 ),
        .Q(timeout_reg[22]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[20]_i_1_n_4 ),
        .Q(timeout_reg[23]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[24]_i_1_n_7 ),
        .Q(timeout_reg[24]),
        .R(qu_result));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[24]_i_1 
       (.CI(\timeout_reg[20]_i_1_n_0 ),
        .CO({\timeout_reg[24]_i_1_n_0 ,\NLW_timeout_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timeout_reg[24]_i_1_n_4 ,\timeout_reg[24]_i_1_n_5 ,\timeout_reg[24]_i_1_n_6 ,\timeout_reg[24]_i_1_n_7 }),
        .S(timeout_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[24]_i_1_n_6 ),
        .Q(timeout_reg[25]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[24]_i_1_n_5 ),
        .Q(timeout_reg[26]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[24]_i_1_n_4 ),
        .Q(timeout_reg[27]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[28]_i_1_n_7 ),
        .Q(timeout_reg[28]),
        .R(qu_result));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[28]_i_1 
       (.CI(\timeout_reg[24]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timeout_reg[28]_i_1_n_4 ,\timeout_reg[28]_i_1_n_5 ,\timeout_reg[28]_i_1_n_6 ,\timeout_reg[28]_i_1_n_7 }),
        .S(timeout_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[28]_i_1_n_6 ),
        .Q(timeout_reg[29]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[0]_i_1_n_5 ),
        .Q(timeout_reg[2]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[28]_i_1_n_5 ),
        .Q(timeout_reg[30]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[28]_i_1_n_4 ),
        .Q(timeout_reg[31]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[0]_i_1_n_4 ),
        .Q(timeout_reg[3]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[4]_i_1_n_7 ),
        .Q(timeout_reg[4]),
        .R(qu_result));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[4]_i_1 
       (.CI(\timeout_reg[0]_i_1_n_0 ),
        .CO({\timeout_reg[4]_i_1_n_0 ,\NLW_timeout_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timeout_reg[4]_i_1_n_4 ,\timeout_reg[4]_i_1_n_5 ,\timeout_reg[4]_i_1_n_6 ,\timeout_reg[4]_i_1_n_7 }),
        .S(timeout_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[4]_i_1_n_6 ),
        .Q(timeout_reg[5]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[4]_i_1_n_5 ),
        .Q(timeout_reg[6]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[4]_i_1_n_4 ),
        .Q(timeout_reg[7]),
        .R(qu_result));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[8]_i_1_n_7 ),
        .Q(timeout_reg[8]),
        .R(qu_result));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timeout_reg[8]_i_1 
       (.CI(\timeout_reg[4]_i_1_n_0 ),
        .CO({\timeout_reg[8]_i_1_n_0 ,\NLW_timeout_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timeout_reg[8]_i_1_n_4 ,\timeout_reg[8]_i_1_n_5 ,\timeout_reg[8]_i_1_n_6 ,\timeout_reg[8]_i_1_n_7 }),
        .S(timeout_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \timeout_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_onehot_state_reg_n_0_[1] ),
        .D(\timeout_reg[8]_i_1_n_6 ),
        .Q(timeout_reg[9]),
        .R(qu_result));
  LUT6 #(
    .INIT(64'hB8B88BB88B8B8BB8)) 
    \txcrc[0]_i_1 
       (.I0(\txcrc[0]_i_2_n_0 ),
        .I1(\txcrc[7]_i_5_n_0 ),
        .I2(\txcrc_reg_n_0_[0] ),
        .I3(\qu_result_reg_n_0_[0] ),
        .I4(\txcrc[7]_i_6_n_0 ),
        .I5(\txcrc[0]_i_3_n_0 ),
        .O(txcrc[0]));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    \txcrc[0]_i_10 
       (.I0(\challenge_reg_n_0_[112] ),
        .I1(\challenge_reg_n_0_[104] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[96] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[88] ),
        .O(\txcrc[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h5050A0A0303FCFC0)) 
    \txcrc[0]_i_2 
       (.I0(led_OBUF[0]),
        .I1(qb_result[0]),
        .I2(\txcrc[7]_i_6_n_0 ),
        .I3(\flags_reg_n_0_[0] ),
        .I4(\txcrc_reg_n_0_[0] ),
        .I5(\txcrc[7]_i_8_n_0 ),
        .O(\txcrc[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8B888B88BBBB8B88)) 
    \txcrc[0]_i_3 
       (.I0(\txcrc_reg[0]_i_4_n_0 ),
        .I1(\index_reg_n_0_[3] ),
        .I2(\txcrc[0]_i_5_n_0 ),
        .I3(\txcrc[0]_i_6_n_0 ),
        .I4(\txcrc[0]_i_7_n_0 ),
        .I5(\txcrc[0]_i_8_n_0 ),
        .O(\txcrc[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \txcrc[0]_i_5 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[4] ),
        .I4(\challenge_reg_n_0_[120] ),
        .O(\txcrc[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h503F5F3F)) 
    \txcrc[0]_i_6 
       (.I0(\challenge_reg_n_0_[16] ),
        .I1(\challenge_reg_n_0_[8] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\challenge_reg_n_0_[0] ),
        .O(\txcrc[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \txcrc[0]_i_7 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\challenge_reg_n_0_[24] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\challenge_reg_n_0_[32] ),
        .O(\txcrc[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hF3BB3333)) 
    \txcrc[0]_i_8 
       (.I0(\challenge_reg_n_0_[40] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\challenge_reg_n_0_[48] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[1] ),
        .O(\txcrc[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h05F5030305F5F3F3)) 
    \txcrc[0]_i_9 
       (.I0(\challenge_reg_n_0_[64] ),
        .I1(\challenge_reg_n_0_[56] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[80] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[72] ),
        .O(\txcrc[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB88B8B8BB88BB8B8)) 
    \txcrc[1]_i_1 
       (.I0(\txcrc[1]_i_2_n_0 ),
        .I1(\txcrc[7]_i_5_n_0 ),
        .I2(\txcrc_reg_n_0_[1] ),
        .I3(\txcrc[1]_i_3_n_0 ),
        .I4(\txcrc[7]_i_6_n_0 ),
        .I5(\qu_result_reg_n_0_[1] ),
        .O(txcrc[1]));
  LUT5 #(
    .INIT(32'h50A03FC0)) 
    \txcrc[1]_i_2 
       (.I0(led_OBUF[1]),
        .I1(qb_result[1]),
        .I2(\txcrc[7]_i_6_n_0 ),
        .I3(\txcrc_reg_n_0_[1] ),
        .I4(\txcrc[7]_i_8_n_0 ),
        .O(\txcrc[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1DFF1DFF1DFF1D00)) 
    \txcrc[1]_i_3 
       (.I0(\txcrc[1]_i_4_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[1]_i_5_n_0 ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\txcrc[1]_i_6_n_0 ),
        .I5(\txcrc[1]_i_7_n_0 ),
        .O(\txcrc[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[1]_i_4 
       (.I0(\challenge_reg_n_0_[81] ),
        .I1(\challenge_reg_n_0_[73] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[65] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[57] ),
        .O(\txcrc[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[1]_i_5 
       (.I0(\challenge_reg_n_0_[113] ),
        .I1(\challenge_reg_n_0_[105] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[97] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[89] ),
        .O(\txcrc[1]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00007F00)) 
    \txcrc[1]_i_6 
       (.I0(\challenge_reg_n_0_[49] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\txcrc[1]_i_8_n_0 ),
        .O(\txcrc[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h000000001D331DFF)) 
    \txcrc[1]_i_7 
       (.I0(\challenge_reg_n_0_[9] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\challenge_reg_n_0_[17] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\challenge_reg_n_0_[1] ),
        .I5(\txcrc[1]_i_9_n_0 ),
        .O(\txcrc[1]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h0FAC00AC)) 
    \txcrc[1]_i_8 
       (.I0(\challenge_reg_n_0_[33] ),
        .I1(\challenge_reg_n_0_[25] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\challenge_reg_n_0_[41] ),
        .O(\txcrc[1]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \txcrc[1]_i_9 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[4] ),
        .I4(\challenge_reg_n_0_[121] ),
        .O(\txcrc[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h8B8B8BB8B8B88BB8)) 
    \txcrc[2]_i_1 
       (.I0(\txcrc[2]_i_2_n_0 ),
        .I1(\txcrc[7]_i_5_n_0 ),
        .I2(\txcrc_reg_n_0_[2] ),
        .I3(\qu_result_reg_n_0_[2] ),
        .I4(\txcrc[7]_i_6_n_0 ),
        .I5(\txcrc[2]_i_3_n_0 ),
        .O(txcrc[2]));
  LUT5 #(
    .INIT(32'h503F5F3F)) 
    \txcrc[2]_i_10 
       (.I0(\challenge_reg_n_0_[18] ),
        .I1(\challenge_reg_n_0_[10] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\challenge_reg_n_0_[2] ),
        .O(\txcrc[2]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h50A03FC0)) 
    \txcrc[2]_i_2 
       (.I0(led_OBUF[2]),
        .I1(qb_result[2]),
        .I2(\txcrc[7]_i_6_n_0 ),
        .I3(\txcrc_reg_n_0_[2] ),
        .I4(\txcrc[7]_i_8_n_0 ),
        .O(\txcrc[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h53)) 
    \txcrc[2]_i_3 
       (.I0(\txcrc[2]_i_4_n_0 ),
        .I1(\txcrc[2]_i_5_n_0 ),
        .I2(\index_reg_n_0_[3] ),
        .O(\txcrc[2]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \txcrc[2]_i_4 
       (.I0(\txcrc[2]_i_6_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[2]_i_7_n_0 ),
        .O(\txcrc[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h44F4444444F444F4)) 
    \txcrc[2]_i_5 
       (.I0(\txcrc[2]_i_8_n_0 ),
        .I1(\txcrc[2]_i_9_n_0 ),
        .I2(\txcrc[2]_i_10_n_0 ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\txcrc[5]_i_8_n_0 ),
        .I5(\challenge_reg_n_0_[122] ),
        .O(\txcrc[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[2]_i_6 
       (.I0(\challenge_reg_n_0_[82] ),
        .I1(\challenge_reg_n_0_[74] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[66] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[58] ),
        .O(\txcrc[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[2]_i_7 
       (.I0(\challenge_reg_n_0_[114] ),
        .I1(\challenge_reg_n_0_[106] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[98] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[90] ),
        .O(\txcrc[2]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hDF55D555)) 
    \txcrc[2]_i_8 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\challenge_reg_n_0_[50] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\challenge_reg_n_0_[42] ),
        .O(\txcrc[2]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hABFB)) 
    \txcrc[2]_i_9 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\challenge_reg_n_0_[26] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\challenge_reg_n_0_[34] ),
        .O(\txcrc[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB88B8B8BB8B88BB8)) 
    \txcrc[3]_i_1 
       (.I0(\txcrc[3]_i_2_n_0 ),
        .I1(\txcrc[7]_i_5_n_0 ),
        .I2(\txcrc_reg_n_0_[3] ),
        .I3(\txcrc[7]_i_6_n_0 ),
        .I4(\txcrc[3]_i_3_n_0 ),
        .I5(\qu_result_reg_n_0_[3] ),
        .O(txcrc[3]));
  LUT5 #(
    .INIT(32'h5FAF3FC0)) 
    \txcrc[3]_i_2 
       (.I0(led_OBUF[3]),
        .I1(qb_result[3]),
        .I2(\txcrc[7]_i_6_n_0 ),
        .I3(\txcrc_reg_n_0_[3] ),
        .I4(\txcrc[7]_i_8_n_0 ),
        .O(\txcrc[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h1DFF1D00)) 
    \txcrc[3]_i_3 
       (.I0(\txcrc[3]_i_4_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[3]_i_5_n_0 ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\txcrc[3]_i_6_n_0 ),
        .O(\txcrc[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[3]_i_4 
       (.I0(\challenge_reg_n_0_[83] ),
        .I1(\challenge_reg_n_0_[75] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[67] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[59] ),
        .O(\txcrc[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[3]_i_5 
       (.I0(\challenge_reg_n_0_[115] ),
        .I1(\challenge_reg_n_0_[107] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[99] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[91] ),
        .O(\txcrc[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4044FFFF40444044)) 
    \txcrc[3]_i_6 
       (.I0(\txcrc[3]_i_7_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\td[7]_i_4_n_0 ),
        .I3(\challenge_reg_n_0_[43] ),
        .I4(\txcrc[3]_i_8_n_0 ),
        .I5(\txcrc[3]_i_9_n_0 ),
        .O(\txcrc[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hC0AFC0A0)) 
    \txcrc[3]_i_7 
       (.I0(\challenge_reg_n_0_[35] ),
        .I1(\challenge_reg_n_0_[51] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\challenge_reg_n_0_[27] ),
        .O(\txcrc[3]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \txcrc[3]_i_8 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[4] ),
        .I4(\challenge_reg_n_0_[123] ),
        .O(\txcrc[3]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h1D331DFF)) 
    \txcrc[3]_i_9 
       (.I0(\challenge_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\challenge_reg_n_0_[19] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\challenge_reg_n_0_[11] ),
        .O(\txcrc[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B88BB88B8B8BB8)) 
    \txcrc[4]_i_1 
       (.I0(\txcrc[4]_i_2_n_0 ),
        .I1(\txcrc[7]_i_5_n_0 ),
        .I2(\txcrc_reg_n_0_[4] ),
        .I3(\qu_result_reg_n_0_[4] ),
        .I4(\txcrc[7]_i_6_n_0 ),
        .I5(\txcrc[4]_i_3_n_0 ),
        .O(txcrc[4]));
  LUT2 #(
    .INIT(4'hB)) 
    \txcrc[4]_i_10 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .O(\txcrc[4]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h5FAF3FC0)) 
    \txcrc[4]_i_2 
       (.I0(led_OBUF[4]),
        .I1(qb_result[4]),
        .I2(\txcrc[7]_i_6_n_0 ),
        .I3(\txcrc_reg_n_0_[4] ),
        .I4(\txcrc[7]_i_8_n_0 ),
        .O(\txcrc[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h1DFF1D00)) 
    \txcrc[4]_i_3 
       (.I0(\txcrc[4]_i_4_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[4]_i_5_n_0 ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\txcrc[4]_i_6_n_0 ),
        .O(\txcrc[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[4]_i_4 
       (.I0(\challenge_reg_n_0_[84] ),
        .I1(\challenge_reg_n_0_[76] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[68] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[60] ),
        .O(\txcrc[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[4]_i_5 
       (.I0(\challenge_reg_n_0_[116] ),
        .I1(\challenge_reg_n_0_[108] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[100] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[92] ),
        .O(\txcrc[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4F4444444F444F44)) 
    \txcrc[4]_i_6 
       (.I0(\txcrc[4]_i_7_n_0 ),
        .I1(\txcrc[4]_i_8_n_0 ),
        .I2(\txcrc[4]_i_9_n_0 ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\txcrc[4]_i_10_n_0 ),
        .I5(\challenge_reg_n_0_[36] ),
        .O(\txcrc[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFCEEFFCCFCEECCCC)) 
    \txcrc[4]_i_7 
       (.I0(\challenge_reg_n_0_[12] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\challenge_reg_n_0_[20] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[1] ),
        .I5(\challenge_reg_n_0_[4] ),
        .O(\txcrc[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFDFF)) 
    \txcrc[4]_i_8 
       (.I0(\index_reg_n_0_[4] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\challenge_reg_n_0_[124] ),
        .O(\txcrc[4]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hA0CFA0C0)) 
    \txcrc[4]_i_9 
       (.I0(\challenge_reg_n_0_[52] ),
        .I1(\challenge_reg_n_0_[44] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\challenge_reg_n_0_[28] ),
        .O(\txcrc[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h8B8B8BB8B8B88BB8)) 
    \txcrc[5]_i_1 
       (.I0(\txcrc[5]_i_2_n_0 ),
        .I1(\txcrc[7]_i_5_n_0 ),
        .I2(\txcrc_reg_n_0_[5] ),
        .I3(\qu_result_reg_n_0_[5] ),
        .I4(\txcrc[7]_i_6_n_0 ),
        .I5(\txcrc[5]_i_3_n_0 ),
        .O(txcrc[5]));
  LUT4 #(
    .INIT(16'hABFB)) 
    \txcrc[5]_i_10 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\challenge_reg_n_0_[29] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\challenge_reg_n_0_[37] ),
        .O(\txcrc[5]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hDF55D555)) 
    \txcrc[5]_i_11 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\challenge_reg_n_0_[53] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\challenge_reg_n_0_[45] ),
        .O(\txcrc[5]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h50A03FC0)) 
    \txcrc[5]_i_2 
       (.I0(led_OBUF[5]),
        .I1(qb_result[5]),
        .I2(\txcrc[7]_i_6_n_0 ),
        .I3(\txcrc_reg_n_0_[5] ),
        .I4(\txcrc[7]_i_8_n_0 ),
        .O(\txcrc[5]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h53)) 
    \txcrc[5]_i_3 
       (.I0(\txcrc[5]_i_4_n_0 ),
        .I1(\txcrc[5]_i_5_n_0 ),
        .I2(\index_reg_n_0_[3] ),
        .O(\txcrc[5]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \txcrc[5]_i_4 
       (.I0(\txcrc[5]_i_6_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[5]_i_7_n_0 ),
        .O(\txcrc[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h45004500FFFF4500)) 
    \txcrc[5]_i_5 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\txcrc[5]_i_8_n_0 ),
        .I2(\challenge_reg_n_0_[125] ),
        .I3(\txcrc[5]_i_9_n_0 ),
        .I4(\txcrc[5]_i_10_n_0 ),
        .I5(\txcrc[5]_i_11_n_0 ),
        .O(\txcrc[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[5]_i_6 
       (.I0(\challenge_reg_n_0_[85] ),
        .I1(\challenge_reg_n_0_[77] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[69] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[61] ),
        .O(\txcrc[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[5]_i_7 
       (.I0(\challenge_reg_n_0_[117] ),
        .I1(\challenge_reg_n_0_[109] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[101] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[93] ),
        .O(\txcrc[5]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hEF)) 
    \txcrc[5]_i_8 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[4] ),
        .O(\txcrc[5]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h503F5F3F)) 
    \txcrc[5]_i_9 
       (.I0(\challenge_reg_n_0_[21] ),
        .I1(\challenge_reg_n_0_[13] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\challenge_reg_n_0_[5] ),
        .O(\txcrc[5]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB8B88BB88B8B8BB8)) 
    \txcrc[6]_i_1 
       (.I0(\txcrc[6]_i_2_n_0 ),
        .I1(\txcrc[7]_i_5_n_0 ),
        .I2(\txcrc_reg_n_0_[6] ),
        .I3(\qu_result_reg_n_0_[6] ),
        .I4(\txcrc[7]_i_6_n_0 ),
        .I5(\txcrc[6]_i_3_n_0 ),
        .O(txcrc[6]));
  LUT6 #(
    .INIT(64'h3F503F5FCFAFCFA0)) 
    \txcrc[6]_i_2 
       (.I0(qb_result[6]),
        .I1(led_OBUF[6]),
        .I2(\txcrc[7]_i_6_n_0 ),
        .I3(\txcrc[7]_i_8_n_0 ),
        .I4(\flags_reg_n_0_[6] ),
        .I5(\txcrc_reg_n_0_[6] ),
        .O(\txcrc[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1DFF1D001DFF1DFF)) 
    \txcrc[6]_i_3 
       (.I0(\txcrc[6]_i_4_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[6]_i_5_n_0 ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\txcrc[6]_i_6_n_0 ),
        .I5(\txcrc[6]_i_7_n_0 ),
        .O(\txcrc[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[6]_i_4 
       (.I0(\challenge_reg_n_0_[86] ),
        .I1(\challenge_reg_n_0_[78] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[70] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[62] ),
        .O(\txcrc[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[6]_i_5 
       (.I0(\challenge_reg_n_0_[118] ),
        .I1(\challenge_reg_n_0_[110] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[102] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[94] ),
        .O(\txcrc[6]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0000FF47)) 
    \txcrc[6]_i_6 
       (.I0(\challenge_reg_n_0_[38] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\challenge_reg_n_0_[30] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\txcrc[6]_i_8_n_0 ),
        .O(\txcrc[6]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF1000)) 
    \txcrc[6]_i_7 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[4] ),
        .I3(\challenge_reg_n_0_[126] ),
        .I4(\txcrc[6]_i_9_n_0 ),
        .O(\txcrc[6]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hF3BB3333)) 
    \txcrc[6]_i_8 
       (.I0(\challenge_reg_n_0_[46] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\challenge_reg_n_0_[54] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[1] ),
        .O(\txcrc[6]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFCEEFFCCFCEECCCC)) 
    \txcrc[6]_i_9 
       (.I0(\challenge_reg_n_0_[14] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\challenge_reg_n_0_[22] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[1] ),
        .I5(\challenge_reg_n_0_[6] ),
        .O(\txcrc[6]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0200000202020202)) 
    \txcrc[7]_i_1 
       (.I0(led_OBUF[9]),
        .I1(tx_busy),
        .I2(send_reg_n_0),
        .I3(\index_reg_n_0_[1] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\txcrc[7]_i_3_n_0 ),
        .O(\txcrc[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[7]_i_10 
       (.I0(\challenge_reg_n_0_[119] ),
        .I1(\challenge_reg_n_0_[111] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[103] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[95] ),
        .O(\txcrc[7]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h0000FF47)) 
    \txcrc[7]_i_11 
       (.I0(\challenge_reg_n_0_[39] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\challenge_reg_n_0_[31] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\txcrc[7]_i_13_n_0 ),
        .O(\txcrc[7]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h000000000737C7F7)) 
    \txcrc[7]_i_12 
       (.I0(\challenge_reg_n_0_[7] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[15] ),
        .I4(\challenge_reg_n_0_[23] ),
        .I5(\txcrc[7]_i_14_n_0 ),
        .O(\txcrc[7]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hF3BB3333)) 
    \txcrc[7]_i_13 
       (.I0(\challenge_reg_n_0_[47] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\challenge_reg_n_0_[55] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[1] ),
        .O(\txcrc[7]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \txcrc[7]_i_14 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[4] ),
        .I4(\challenge_reg_n_0_[127] ),
        .O(\txcrc[7]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hB8B88BB88B8B8BB8)) 
    \txcrc[7]_i_2 
       (.I0(\txcrc[7]_i_4_n_0 ),
        .I1(\txcrc[7]_i_5_n_0 ),
        .I2(\txcrc_reg_n_0_[7] ),
        .I3(\qu_result_reg_n_0_[7] ),
        .I4(\txcrc[7]_i_6_n_0 ),
        .I5(\txcrc[7]_i_7_n_0 ),
        .O(txcrc[7]));
  LUT3 #(
    .INIT(8'h08)) 
    \txcrc[7]_i_3 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[4] ),
        .I2(\index_reg_n_0_[3] ),
        .O(\txcrc[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5050A0A0303FCFC0)) 
    \txcrc[7]_i_4 
       (.I0(led_OBUF[7]),
        .I1(qb_result[7]),
        .I2(\txcrc[7]_i_6_n_0 ),
        .I3(\flags_reg_n_0_[7] ),
        .I4(\txcrc_reg_n_0_[7] ),
        .I5(\txcrc[7]_i_8_n_0 ),
        .O(\txcrc[7]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h11100001)) 
    \txcrc[7]_i_5 
       (.I0(\index_reg_n_0_[3] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[4] ),
        .O(\txcrc[7]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFF56)) 
    \txcrc[7]_i_6 
       (.I0(\index_reg_n_0_[4] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\index_reg_n_0_[1] ),
        .O(\txcrc[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1DFF1DFF1DFF1D00)) 
    \txcrc[7]_i_7 
       (.I0(\txcrc[7]_i_9_n_0 ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\txcrc[7]_i_10_n_0 ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\txcrc[7]_i_11_n_0 ),
        .I5(\txcrc[7]_i_12_n_0 ),
        .O(\txcrc[7]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8FFF)) 
    \txcrc[7]_i_8 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[4] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\txcrc[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \txcrc[7]_i_9 
       (.I0(\challenge_reg_n_0_[87] ),
        .I1(\challenge_reg_n_0_[79] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\challenge_reg_n_0_[71] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\challenge_reg_n_0_[63] ),
        .O(\txcrc[7]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txcrc_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\txcrc[7]_i_1_n_0 ),
        .D(txcrc[0]),
        .Q(\txcrc_reg_n_0_[0] ),
        .R(\index[4]_i_1_n_0 ));
  MUXF7 \txcrc_reg[0]_i_4 
       (.I0(\txcrc[0]_i_9_n_0 ),
        .I1(\txcrc[0]_i_10_n_0 ),
        .O(\txcrc_reg[0]_i_4_n_0 ),
        .S(\index_reg_n_0_[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \txcrc_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\txcrc[7]_i_1_n_0 ),
        .D(txcrc[1]),
        .Q(\txcrc_reg_n_0_[1] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txcrc_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\txcrc[7]_i_1_n_0 ),
        .D(txcrc[2]),
        .Q(\txcrc_reg_n_0_[2] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txcrc_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\txcrc[7]_i_1_n_0 ),
        .D(txcrc[3]),
        .Q(\txcrc_reg_n_0_[3] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txcrc_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\txcrc[7]_i_1_n_0 ),
        .D(txcrc[4]),
        .Q(\txcrc_reg_n_0_[4] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txcrc_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\txcrc[7]_i_1_n_0 ),
        .D(txcrc[5]),
        .Q(\txcrc_reg_n_0_[5] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txcrc_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\txcrc[7]_i_1_n_0 ),
        .D(txcrc[6]),
        .Q(\txcrc_reg_n_0_[6] ),
        .R(\index[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txcrc_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\txcrc[7]_i_1_n_0 ),
        .D(txcrc[7]),
        .Q(\txcrc_reg_n_0_[7] ),
        .R(\index[4]_i_1_n_0 ));
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
  IBUF uart_rx_IBUF_inst
       (.I(uart_rx),
        .O(uart_rx_IBUF));
  OBUF uart_tx_OBUF_inst
       (.I(uart_tx_OBUF),
        .O(uart_tx));
endmodule

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

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
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
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
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
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
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
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
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
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__10
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__175 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__165 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__164 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__163 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__162 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__161 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__160 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__174 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__173 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__172 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__171 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__170 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__169 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__168 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__167 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__166 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__11
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__191 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__181 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__180 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__179 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__178 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__177 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__176 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__190 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__189 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__188 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__187 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__186 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__185 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__184 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__183 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__182 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__12
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__207 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__197 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__196 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__195 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__194 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__193 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__192 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__206 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__205 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__204 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__203 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__202 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__201 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__200 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__199 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__198 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__13
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__223 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__213 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__212 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__211 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__210 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__209 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__208 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__222 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__221 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__220 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__219 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__218 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__217 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__216 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__215 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__214 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__14
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__239 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__229 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__228 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__227 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__226 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__225 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__224 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__238 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__237 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__236 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__235 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__234 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__233 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__232 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__231 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__230 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__15
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__255 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__245 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__244 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__243 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__242 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__241 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__240 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__254 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__253 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__252 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__251 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__250 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__249 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__248 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__247 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__246 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__2
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__47 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__37 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__36 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__35 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__34 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__33 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__32 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__46 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__45 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__44 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__43 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__42 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__41 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__40 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__39 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__38 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__3
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__63 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__53 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__52 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__51 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__50 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__49 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__48 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__62 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__61 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__60 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__59 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__58 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__57 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__56 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__55 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__54 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__4
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__79 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__69 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__68 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__67 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__66 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__65 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__64 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__78 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__77 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__76 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__75 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__74 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__73 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__72 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__71 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__70 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__5
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__95 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__85 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__84 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__83 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__82 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__81 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__80 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__94 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__93 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__92 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__91 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__90 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__89 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__88 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__87 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__86 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__6
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__111 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__101 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__100 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__99 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__98 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__97 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__96 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__110 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__109 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__108 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__107 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__106 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__105 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__104 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__103 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__102 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__7
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__127 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__117 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__116 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__115 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__114 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__113 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__112 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__126 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__125 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__124 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__123 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__122 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__121 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__120 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__119 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__118 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__8
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__143 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__133 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__132 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__131 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__130 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__129 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__128 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__142 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__141 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__140 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__139 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__138 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__137 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__136 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__135 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__134 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* ELEMENT_STYLE = "0" *) (* GATE_INIT = "4'b1000" *) 
(* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_chain" *) 
module cbdc_puf_chain__9
   (excite_i,
    feedback_i,
    c_i,
    .chain_o(node_w[16]));
  input excite_i;
  input feedback_i;
  input [15:0]c_i;
     output [16:0]node_w;

  wire [15:0]c_i;
  wire c_parity;
  wire excite_i;
  wire feedback_i;
  wire \gen_auto_parity_gate.u_head_gate_i_2_n_0 ;
  wire \gen_auto_parity_gate.u_head_gate_i_3_n_0 ;
  (* DONT_TOUCH *) wire [16:0]node_w;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT3 #(
    .INIT(8'h87)) 
    \gen_auto_parity_gate.u_head_gate 
       (.I0(excite_i),
        .I1(feedback_i),
        .I2(c_parity),
        .O(node_w[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_1 
       (.I0(c_i[3]),
        .I1(c_i[2]),
        .I2(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ),
        .I3(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ),
        .I4(c_i[0]),
        .I5(c_i[1]),
        .O(c_parity));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_2 
       (.I0(c_i[11]),
        .I1(c_i[10]),
        .I2(c_i[14]),
        .I3(c_i[15]),
        .I4(c_i[12]),
        .I5(c_i[13]),
        .O(\gen_auto_parity_gate.u_head_gate_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \gen_auto_parity_gate.u_head_gate_i_3 
       (.I0(c_i[4]),
        .I1(c_i[5]),
        .I2(c_i[8]),
        .I3(c_i[9]),
        .I4(c_i[7]),
        .I5(c_i[6]),
        .O(\gen_auto_parity_gate.u_head_gate_i_3_n_0 ));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__159 \gen_elem[0].u_elem 
       (.c_i(c_i[0]),
        .sig_i(node_w[0]),
        .sig_o(node_w[1]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__149 \gen_elem[10].u_elem 
       (.c_i(c_i[10]),
        .sig_i(node_w[10]),
        .sig_o(node_w[11]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__148 \gen_elem[11].u_elem 
       (.c_i(c_i[11]),
        .sig_i(node_w[11]),
        .sig_o(node_w[12]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__147 \gen_elem[12].u_elem 
       (.c_i(c_i[12]),
        .sig_i(node_w[12]),
        .sig_o(node_w[13]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__146 \gen_elem[13].u_elem 
       (.c_i(c_i[13]),
        .sig_i(node_w[13]),
        .sig_o(node_w[14]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__145 \gen_elem[14].u_elem 
       (.c_i(c_i[14]),
        .sig_i(node_w[14]),
        .sig_o(node_w[15]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__144 \gen_elem[15].u_elem 
       (.c_i(c_i[15]),
        .sig_i(node_w[15]),
        .sig_o(node_w[16]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__158 \gen_elem[1].u_elem 
       (.c_i(c_i[1]),
        .sig_i(node_w[1]),
        .sig_o(node_w[2]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__157 \gen_elem[2].u_elem 
       (.c_i(c_i[2]),
        .sig_i(node_w[2]),
        .sig_o(node_w[3]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__156 \gen_elem[3].u_elem 
       (.c_i(c_i[3]),
        .sig_i(node_w[3]),
        .sig_o(node_w[4]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__155 \gen_elem[4].u_elem 
       (.c_i(c_i[4]),
        .sig_i(node_w[4]),
        .sig_o(node_w[5]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__154 \gen_elem[5].u_elem 
       (.c_i(c_i[5]),
        .sig_i(node_w[5]),
        .sig_o(node_w[6]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__153 \gen_elem[6].u_elem 
       (.c_i(c_i[6]),
        .sig_i(node_w[6]),
        .sig_o(node_w[7]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__152 \gen_elem[7].u_elem 
       (.c_i(c_i[7]),
        .sig_i(node_w[7]),
        .sig_o(node_w[8]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__151 \gen_elem[8].u_elem 
       (.c_i(c_i[8]),
        .sig_i(node_w[8]),
        .sig_o(node_w[9]));
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  cbdc_puf_element__150 \gen_elem[9].u_elem 
       (.c_i(c_i[9]),
        .sig_i(node_w[9]),
        .sig_o(node_w[10]));
endmodule

(* AUTO_PARITY = "1" *) (* CAPTURE_MODE = "1" *) (* CROSS_COUPLE = "1" *) 
(* DIAGNOSTIC = "1" *) (* DUAL_ARBITER = "1" *) (* ELEMENT_STYLE = "0" *) 
(* GATE_INIT = "4'b1000" *) (* N_STAGES = "16" *) 
module cbdc_puf_core
   (c,
    excite,
    latch,
    clr,
    q,
    q_comp_o,
    race_valid_o,
    .qb_capture_seen_o(qb_first_edge_seen_w),
    .qu_capture_seen_o(qu_first_edge_seen_w));
  input [15:0]c;
  input excite;
  input latch;
  input clr;
  output q;
  output q_comp_o;
  output race_valid_o;
  output qb_first_edge_seen_w;
  output qu_first_edge_seen_w;

  wire \<const1> ;
  wire arbiter_a_ce_w;
  wire arbiter_b_ce_w;
  wire [15:0]c;
  wire clr;
  wire excite;
  wire q;
  (* DONT_TOUCH *) wire qb_first_edge_seen_w;
  (* DONT_TOUCH *) wire qb_w;
  (* DONT_TOUCH *) wire qu_first_edge_seen_w;
  (* DONT_TOUCH *) wire qu_w;

  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_dual_arbiter.u_arbiter_b_dff 
       (.C(qu_w),
        .CE(arbiter_b_ce_w),
        .CLR(clr),
        .D(qb_w));
  LUT2 #(
    .INIT(4'h2)) 
    \gen_dual_arbiter.u_arbiter_b_dff_i_1 
       (.I0(excite),
        .I1(qu_first_edge_seen_w),
        .O(arbiter_b_ce_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qb_edge_lock 
       (.C(qb_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qb_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qu_edge_lock 
       (.C(qu_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qu_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    u_arbiter_dff
       (.C(qb_w),
        .CE(arbiter_a_ce_w),
        .CLR(clr),
        .D(qu_w),
        .Q(q));
  LUT2 #(
    .INIT(4'h2)) 
    u_arbiter_dff_i_1
       (.I0(excite),
        .I1(qb_first_edge_seen_w),
        .O(arbiter_a_ce_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain u_chain_lower
       (.c_i(c),
        .chain_o(qb_w),
        .excite_i(excite),
        .feedback_i(qu_w));
  (* AUTO_PARITY = "1" *) 
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

(* AUTO_PARITY = "1" *) (* CAPTURE_MODE = "1" *) (* CROSS_COUPLE = "1" *) 
(* DIAGNOSTIC = "1" *) (* DUAL_ARBITER = "1" *) (* ELEMENT_STYLE = "0" *) 
(* GATE_INIT = "4'b1000" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_core" *) 
module cbdc_puf_core__1
   (c,
    excite,
    latch,
    clr,
    q,
    q_comp_o,
    race_valid_o,
    .qb_capture_seen_o(qb_first_edge_seen_w),
    .qu_capture_seen_o(qu_first_edge_seen_w));
  input [15:0]c;
  input excite;
  input latch;
  input clr;
  output q;
  output q_comp_o;
  output race_valid_o;
  output qb_first_edge_seen_w;
  output qu_first_edge_seen_w;

  wire \<const1> ;
  wire arbiter_a_ce_w;
  wire arbiter_b_ce_w;
  wire [15:0]c;
  wire clr;
  wire excite;
  wire q;
  (* DONT_TOUCH *) wire qb_first_edge_seen_w;
  (* DONT_TOUCH *) wire qb_w;
  (* DONT_TOUCH *) wire qu_first_edge_seen_w;
  (* DONT_TOUCH *) wire qu_w;

  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_dual_arbiter.u_arbiter_b_dff 
       (.C(qu_w),
        .CE(arbiter_b_ce_w),
        .CLR(clr),
        .D(qb_w));
  LUT2 #(
    .INIT(4'h2)) 
    \gen_dual_arbiter.u_arbiter_b_dff_i_1 
       (.I0(excite),
        .I1(qu_first_edge_seen_w),
        .O(arbiter_b_ce_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qb_edge_lock 
       (.C(qb_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qb_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qu_edge_lock 
       (.C(qu_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qu_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    u_arbiter_dff
       (.C(qb_w),
        .CE(arbiter_a_ce_w),
        .CLR(clr),
        .D(qu_w),
        .Q(q));
  LUT2 #(
    .INIT(4'h2)) 
    u_arbiter_dff_i_1
       (.I0(excite),
        .I1(qb_first_edge_seen_w),
        .O(arbiter_a_ce_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__2 u_chain_lower
       (.c_i(c),
        .chain_o(qb_w),
        .excite_i(excite),
        .feedback_i(qu_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__3 u_chain_upper
       (.c_i(c),
        .chain_o(qu_w),
        .excite_i(excite),
        .feedback_i(qb_w));
endmodule

(* AUTO_PARITY = "1" *) (* CAPTURE_MODE = "1" *) (* CROSS_COUPLE = "1" *) 
(* DIAGNOSTIC = "1" *) (* DUAL_ARBITER = "1" *) (* ELEMENT_STYLE = "0" *) 
(* GATE_INIT = "4'b1000" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_core" *) 
module cbdc_puf_core__2
   (c,
    excite,
    latch,
    clr,
    q,
    q_comp_o,
    race_valid_o,
    .qb_capture_seen_o(qb_first_edge_seen_w),
    .qu_capture_seen_o(qu_first_edge_seen_w));
  input [15:0]c;
  input excite;
  input latch;
  input clr;
  output q;
  output q_comp_o;
  output race_valid_o;
  output qb_first_edge_seen_w;
  output qu_first_edge_seen_w;

  wire \<const1> ;
  wire arbiter_a_ce_w;
  wire arbiter_b_ce_w;
  wire [15:0]c;
  wire clr;
  wire excite;
  wire q;
  (* DONT_TOUCH *) wire qb_first_edge_seen_w;
  (* DONT_TOUCH *) wire qb_w;
  (* DONT_TOUCH *) wire qu_first_edge_seen_w;
  (* DONT_TOUCH *) wire qu_w;

  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_dual_arbiter.u_arbiter_b_dff 
       (.C(qu_w),
        .CE(arbiter_b_ce_w),
        .CLR(clr),
        .D(qb_w));
  LUT2 #(
    .INIT(4'h2)) 
    \gen_dual_arbiter.u_arbiter_b_dff_i_1 
       (.I0(excite),
        .I1(qu_first_edge_seen_w),
        .O(arbiter_b_ce_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qb_edge_lock 
       (.C(qb_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qb_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qu_edge_lock 
       (.C(qu_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qu_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    u_arbiter_dff
       (.C(qb_w),
        .CE(arbiter_a_ce_w),
        .CLR(clr),
        .D(qu_w),
        .Q(q));
  LUT2 #(
    .INIT(4'h2)) 
    u_arbiter_dff_i_1
       (.I0(excite),
        .I1(qb_first_edge_seen_w),
        .O(arbiter_a_ce_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__4 u_chain_lower
       (.c_i(c),
        .chain_o(qb_w),
        .excite_i(excite),
        .feedback_i(qu_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__5 u_chain_upper
       (.c_i(c),
        .chain_o(qu_w),
        .excite_i(excite),
        .feedback_i(qb_w));
endmodule

(* AUTO_PARITY = "1" *) (* CAPTURE_MODE = "1" *) (* CROSS_COUPLE = "1" *) 
(* DIAGNOSTIC = "1" *) (* DUAL_ARBITER = "1" *) (* ELEMENT_STYLE = "0" *) 
(* GATE_INIT = "4'b1000" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_core" *) 
module cbdc_puf_core__3
   (c,
    excite,
    latch,
    clr,
    q,
    q_comp_o,
    race_valid_o,
    .qb_capture_seen_o(qb_first_edge_seen_w),
    .qu_capture_seen_o(qu_first_edge_seen_w));
  input [15:0]c;
  input excite;
  input latch;
  input clr;
  output q;
  output q_comp_o;
  output race_valid_o;
  output qb_first_edge_seen_w;
  output qu_first_edge_seen_w;

  wire \<const1> ;
  wire arbiter_a_ce_w;
  wire arbiter_b_ce_w;
  wire [15:0]c;
  wire clr;
  wire excite;
  wire q;
  (* DONT_TOUCH *) wire qb_first_edge_seen_w;
  (* DONT_TOUCH *) wire qb_w;
  (* DONT_TOUCH *) wire qu_first_edge_seen_w;
  (* DONT_TOUCH *) wire qu_w;

  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_dual_arbiter.u_arbiter_b_dff 
       (.C(qu_w),
        .CE(arbiter_b_ce_w),
        .CLR(clr),
        .D(qb_w));
  LUT2 #(
    .INIT(4'h2)) 
    \gen_dual_arbiter.u_arbiter_b_dff_i_1 
       (.I0(excite),
        .I1(qu_first_edge_seen_w),
        .O(arbiter_b_ce_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qb_edge_lock 
       (.C(qb_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qb_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qu_edge_lock 
       (.C(qu_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qu_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    u_arbiter_dff
       (.C(qb_w),
        .CE(arbiter_a_ce_w),
        .CLR(clr),
        .D(qu_w),
        .Q(q));
  LUT2 #(
    .INIT(4'h2)) 
    u_arbiter_dff_i_1
       (.I0(excite),
        .I1(qb_first_edge_seen_w),
        .O(arbiter_a_ce_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__6 u_chain_lower
       (.c_i(c),
        .chain_o(qb_w),
        .excite_i(excite),
        .feedback_i(qu_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__7 u_chain_upper
       (.c_i(c),
        .chain_o(qu_w),
        .excite_i(excite),
        .feedback_i(qb_w));
endmodule

(* AUTO_PARITY = "1" *) (* CAPTURE_MODE = "1" *) (* CROSS_COUPLE = "1" *) 
(* DIAGNOSTIC = "1" *) (* DUAL_ARBITER = "1" *) (* ELEMENT_STYLE = "0" *) 
(* GATE_INIT = "4'b1000" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_core" *) 
module cbdc_puf_core__4
   (c,
    excite,
    latch,
    clr,
    q,
    q_comp_o,
    race_valid_o,
    .qb_capture_seen_o(qb_first_edge_seen_w),
    .qu_capture_seen_o(qu_first_edge_seen_w));
  input [15:0]c;
  input excite;
  input latch;
  input clr;
  output q;
  output q_comp_o;
  output race_valid_o;
  output qb_first_edge_seen_w;
  output qu_first_edge_seen_w;

  wire \<const1> ;
  wire arbiter_a_ce_w;
  wire arbiter_b_ce_w;
  wire [15:0]c;
  wire clr;
  wire excite;
  wire q;
  (* DONT_TOUCH *) wire qb_first_edge_seen_w;
  (* DONT_TOUCH *) wire qb_w;
  (* DONT_TOUCH *) wire qu_first_edge_seen_w;
  (* DONT_TOUCH *) wire qu_w;

  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_dual_arbiter.u_arbiter_b_dff 
       (.C(qu_w),
        .CE(arbiter_b_ce_w),
        .CLR(clr),
        .D(qb_w));
  LUT2 #(
    .INIT(4'h2)) 
    \gen_dual_arbiter.u_arbiter_b_dff_i_1 
       (.I0(excite),
        .I1(qu_first_edge_seen_w),
        .O(arbiter_b_ce_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qb_edge_lock 
       (.C(qb_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qb_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qu_edge_lock 
       (.C(qu_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qu_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    u_arbiter_dff
       (.C(qb_w),
        .CE(arbiter_a_ce_w),
        .CLR(clr),
        .D(qu_w),
        .Q(q));
  LUT2 #(
    .INIT(4'h2)) 
    u_arbiter_dff_i_1
       (.I0(excite),
        .I1(qb_first_edge_seen_w),
        .O(arbiter_a_ce_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__8 u_chain_lower
       (.c_i(c),
        .chain_o(qb_w),
        .excite_i(excite),
        .feedback_i(qu_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__9 u_chain_upper
       (.c_i(c),
        .chain_o(qu_w),
        .excite_i(excite),
        .feedback_i(qb_w));
endmodule

(* AUTO_PARITY = "1" *) (* CAPTURE_MODE = "1" *) (* CROSS_COUPLE = "1" *) 
(* DIAGNOSTIC = "1" *) (* DUAL_ARBITER = "1" *) (* ELEMENT_STYLE = "0" *) 
(* GATE_INIT = "4'b1000" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_core" *) 
module cbdc_puf_core__5
   (c,
    excite,
    latch,
    clr,
    q,
    q_comp_o,
    race_valid_o,
    .qb_capture_seen_o(qb_first_edge_seen_w),
    .qu_capture_seen_o(qu_first_edge_seen_w));
  input [15:0]c;
  input excite;
  input latch;
  input clr;
  output q;
  output q_comp_o;
  output race_valid_o;
  output qb_first_edge_seen_w;
  output qu_first_edge_seen_w;

  wire \<const1> ;
  wire arbiter_a_ce_w;
  wire arbiter_b_ce_w;
  wire [15:0]c;
  wire clr;
  wire excite;
  wire q;
  (* DONT_TOUCH *) wire qb_first_edge_seen_w;
  (* DONT_TOUCH *) wire qb_w;
  (* DONT_TOUCH *) wire qu_first_edge_seen_w;
  (* DONT_TOUCH *) wire qu_w;

  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_dual_arbiter.u_arbiter_b_dff 
       (.C(qu_w),
        .CE(arbiter_b_ce_w),
        .CLR(clr),
        .D(qb_w));
  LUT2 #(
    .INIT(4'h2)) 
    \gen_dual_arbiter.u_arbiter_b_dff_i_1 
       (.I0(excite),
        .I1(qu_first_edge_seen_w),
        .O(arbiter_b_ce_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qb_edge_lock 
       (.C(qb_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qb_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qu_edge_lock 
       (.C(qu_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qu_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    u_arbiter_dff
       (.C(qb_w),
        .CE(arbiter_a_ce_w),
        .CLR(clr),
        .D(qu_w),
        .Q(q));
  LUT2 #(
    .INIT(4'h2)) 
    u_arbiter_dff_i_1
       (.I0(excite),
        .I1(qb_first_edge_seen_w),
        .O(arbiter_a_ce_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__10 u_chain_lower
       (.c_i(c),
        .chain_o(qb_w),
        .excite_i(excite),
        .feedback_i(qu_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__11 u_chain_upper
       (.c_i(c),
        .chain_o(qu_w),
        .excite_i(excite),
        .feedback_i(qb_w));
endmodule

(* AUTO_PARITY = "1" *) (* CAPTURE_MODE = "1" *) (* CROSS_COUPLE = "1" *) 
(* DIAGNOSTIC = "1" *) (* DUAL_ARBITER = "1" *) (* ELEMENT_STYLE = "0" *) 
(* GATE_INIT = "4'b1000" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_core" *) 
module cbdc_puf_core__6
   (c,
    excite,
    latch,
    clr,
    q,
    q_comp_o,
    race_valid_o,
    .qb_capture_seen_o(qb_first_edge_seen_w),
    .qu_capture_seen_o(qu_first_edge_seen_w));
  input [15:0]c;
  input excite;
  input latch;
  input clr;
  output q;
  output q_comp_o;
  output race_valid_o;
  output qb_first_edge_seen_w;
  output qu_first_edge_seen_w;

  wire \<const1> ;
  wire arbiter_a_ce_w;
  wire arbiter_b_ce_w;
  wire [15:0]c;
  wire clr;
  wire excite;
  wire q;
  (* DONT_TOUCH *) wire qb_first_edge_seen_w;
  (* DONT_TOUCH *) wire qb_w;
  (* DONT_TOUCH *) wire qu_first_edge_seen_w;
  (* DONT_TOUCH *) wire qu_w;

  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_dual_arbiter.u_arbiter_b_dff 
       (.C(qu_w),
        .CE(arbiter_b_ce_w),
        .CLR(clr),
        .D(qb_w));
  LUT2 #(
    .INIT(4'h2)) 
    \gen_dual_arbiter.u_arbiter_b_dff_i_1 
       (.I0(excite),
        .I1(qu_first_edge_seen_w),
        .O(arbiter_b_ce_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qb_edge_lock 
       (.C(qb_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qb_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qu_edge_lock 
       (.C(qu_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qu_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    u_arbiter_dff
       (.C(qb_w),
        .CE(arbiter_a_ce_w),
        .CLR(clr),
        .D(qu_w),
        .Q(q));
  LUT2 #(
    .INIT(4'h2)) 
    u_arbiter_dff_i_1
       (.I0(excite),
        .I1(qb_first_edge_seen_w),
        .O(arbiter_a_ce_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__12 u_chain_lower
       (.c_i(c),
        .chain_o(qb_w),
        .excite_i(excite),
        .feedback_i(qu_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__13 u_chain_upper
       (.c_i(c),
        .chain_o(qu_w),
        .excite_i(excite),
        .feedback_i(qb_w));
endmodule

(* AUTO_PARITY = "1" *) (* CAPTURE_MODE = "1" *) (* CROSS_COUPLE = "1" *) 
(* DIAGNOSTIC = "1" *) (* DUAL_ARBITER = "1" *) (* ELEMENT_STYLE = "0" *) 
(* GATE_INIT = "4'b1000" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_core" *) 
module cbdc_puf_core__7
   (c,
    excite,
    latch,
    clr,
    q,
    q_comp_o,
    race_valid_o,
    .qb_capture_seen_o(qb_first_edge_seen_w),
    .qu_capture_seen_o(qu_first_edge_seen_w));
  input [15:0]c;
  input excite;
  input latch;
  input clr;
  output q;
  output q_comp_o;
  output race_valid_o;
  output qb_first_edge_seen_w;
  output qu_first_edge_seen_w;

  wire \<const1> ;
  wire arbiter_a_ce_w;
  wire arbiter_b_ce_w;
  wire [15:0]c;
  wire clr;
  wire excite;
  wire q;
  (* DONT_TOUCH *) wire qb_first_edge_seen_w;
  (* DONT_TOUCH *) wire qb_w;
  (* DONT_TOUCH *) wire qu_first_edge_seen_w;
  (* DONT_TOUCH *) wire qu_w;

  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_dual_arbiter.u_arbiter_b_dff 
       (.C(qu_w),
        .CE(arbiter_b_ce_w),
        .CLR(clr),
        .D(qb_w));
  LUT2 #(
    .INIT(4'h2)) 
    \gen_dual_arbiter.u_arbiter_b_dff_i_1 
       (.I0(excite),
        .I1(qu_first_edge_seen_w),
        .O(arbiter_b_ce_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qb_edge_lock 
       (.C(qb_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qb_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \gen_first_edge_lock.u_qu_edge_lock 
       (.C(qu_w),
        .CE(excite),
        .CLR(clr),
        .D(\<const1> ),
        .Q(qu_first_edge_seen_w));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* XILINX_LEGACY_PRIM = "FDCE_1" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    u_arbiter_dff
       (.C(qb_w),
        .CE(arbiter_a_ce_w),
        .CLR(clr),
        .D(qu_w),
        .Q(q));
  LUT2 #(
    .INIT(4'h2)) 
    u_arbiter_dff_i_1
       (.I0(excite),
        .I1(qb_first_edge_seen_w),
        .O(arbiter_a_ce_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__14 u_chain_lower
       (.c_i(c),
        .chain_o(qb_w),
        .excite_i(excite),
        .feedback_i(qu_w));
  (* AUTO_PARITY = "1" *) 
  (* DONT_TOUCH *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_chain__15 u_chain_upper
       (.c_i(c),
        .chain_o(qu_w),
        .excite_i(excite),
        .feedback_i(qb_w));
endmodule

(* AUTO_PARITY = "1" *) (* CLR_CYCLES = "4" *) (* EXCITE_CYCLES = "8" *) 
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
  wire \FSM_sequential_state_r[2]_i_2_n_0 ;
  wire busy_o;
  wire busy_o_i_1_n_0;
  wire busy_o_i_2_n_0;
  wire [15:0]challenge_i;
  wire clk;
  wire [15:0]puf_c_o;
  wire \puf_c_o[15]_i_1_n_0 ;
  wire puf_clr_o;
  wire puf_clr_o_i_1_n_0;
  wire puf_excite_o;
  wire puf_excite_o_i_1_n_0;
  wire puf_excite_o_i_2_n_0;
  wire puf_excite_o_i_3_n_0;
  wire puf_q_i;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync1_r;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync2_r;
  wire resp_bit_o;
  wire resp_bit_o_i_1_n_0;
  wire resp_bit_o_i_2_n_0;
  wire resp_valid_o;
  wire resp_valid_o_i_1_n_0;
  wire start_i;
  wire [2:0]state_r;
  wire [15:0]timer_r;
  wire \timer_r[15]_i_1_n_0 ;
  wire \timer_r[15]_i_3_n_0 ;
  wire \timer_r[15]_i_4_n_0 ;
  wire \timer_r[15]_i_5_n_0 ;
  wire \timer_r[15]_i_6_n_0 ;
  wire \timer_r_reg[12]_i_2_n_0 ;
  wire \timer_r_reg[12]_i_2_n_4 ;
  wire \timer_r_reg[12]_i_2_n_5 ;
  wire \timer_r_reg[12]_i_2_n_6 ;
  wire \timer_r_reg[12]_i_2_n_7 ;
  wire \timer_r_reg[15]_i_7_n_5 ;
  wire \timer_r_reg[15]_i_7_n_6 ;
  wire \timer_r_reg[15]_i_7_n_7 ;
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
    .INIT(64'h0000003FFFFFFEC2)) 
    \FSM_sequential_state_r[0]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(puf_excite_o_i_2_n_0),
        .I4(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h0E1EF0F0)) 
    \FSM_sequential_state_r[1]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h0FE0FF00)) 
    \FSM_sequential_state_r[2]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC000FCCCFCCC8000)) 
    \FSM_sequential_state_r[2]_i_2 
       (.I0(state_r[2]),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(\timer_r_reg_n_0_[1] ),
        .I3(\timer_r_reg_n_0_[0] ),
        .I4(state_r[1]),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[0]_i_1_n_0 ),
        .Q(state_r[0]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[1]_i_1_n_0 ),
        .Q(state_r[1]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[2]_i_1_n_0 ),
        .Q(state_r[2]),
        .R(busy_o_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h3FFE0002)) 
    busy_o_i_2
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(busy_o),
        .O(busy_o_i_2_n_0));
  FDRE busy_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_o_i_2_n_0),
        .Q(busy_o),
        .R(busy_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    \puf_c_o[15]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .O(\puf_c_o[15]_i_1_n_0 ));
  FDRE \puf_c_o_reg[0] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[0]),
        .Q(puf_c_o[0]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[10] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[10]),
        .Q(puf_c_o[10]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[11] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[11]),
        .Q(puf_c_o[11]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[12] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[12]),
        .Q(puf_c_o[12]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[13] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[13]),
        .Q(puf_c_o[13]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[14] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[14]),
        .Q(puf_c_o[14]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[15] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[15]),
        .Q(puf_c_o[15]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[1] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[1]),
        .Q(puf_c_o[1]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[2] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[2]),
        .Q(puf_c_o[2]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[3] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[3]),
        .Q(puf_c_o[3]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[4] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[4]),
        .Q(puf_c_o[4]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[5] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[5]),
        .Q(puf_c_o[5]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[6] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[6]),
        .Q(puf_c_o[6]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[7] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[7]),
        .Q(puf_c_o[7]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[8] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[8]),
        .Q(puf_c_o[8]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[9] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[9]),
        .Q(puf_c_o[9]),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hF003000A0003000A)) 
    puf_clr_o_i_1
       (.I0(start_i),
        .I1(resp_bit_o_i_2_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_clr_o),
        .O(puf_clr_o_i_1_n_0));
  FDRE puf_clr_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_clr_o_i_1_n_0),
        .Q(puf_clr_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF100EF00F100EF0)) 
    puf_excite_o_i_1
       (.I0(puf_excite_o_i_2_n_0),
        .I1(puf_excite_o_i_3_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_excite_o),
        .O(puf_excite_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    puf_excite_o_i_2
       (.I0(\timer_r[15]_i_6_n_0 ),
        .I1(\timer_r_reg_n_0_[7] ),
        .I2(\timer_r_reg_n_0_[6] ),
        .I3(\timer_r_reg_n_0_[9] ),
        .I4(\timer_r_reg_n_0_[8] ),
        .I5(\timer_r[15]_i_4_n_0 ),
        .O(puf_excite_o_i_2_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    puf_excite_o_i_3
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(puf_excite_o_i_3_n_0));
  FDRE puf_excite_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_excite_o_i_1_n_0),
        .Q(puf_excite_o),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync1_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_q_i),
        .Q(q_sync1_r),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync2_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(q_sync1_r),
        .Q(q_sync2_r),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    resp_bit_o_i_1
       (.I0(q_sync2_r),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(resp_bit_o_i_2_n_0),
        .I5(resp_bit_o),
        .O(resp_bit_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    resp_bit_o_i_2
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(\timer_r[15]_i_4_n_0 ),
        .I4(\timer_r[15]_i_5_n_0 ),
        .I5(\timer_r[15]_i_6_n_0 ),
        .O(resp_bit_o_i_2_n_0));
  FDRE resp_bit_o_reg
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
  FDRE resp_valid_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_valid_o_i_1_n_0),
        .Q(resp_valid_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000055511150)) 
    \timer_r[0]_i_1 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(state_r[2]),
        .I3(state_r[0]),
        .I4(state_r[1]),
        .I5(puf_excite_o_i_2_n_0),
        .O(timer_r[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[10]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_6 ),
        .O(timer_r[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[11]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_5 ),
        .O(timer_r[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[12]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_4 ),
        .O(timer_r[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[13]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_7 ),
        .O(timer_r[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[14]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_6 ),
        .O(timer_r[14]));
  LUT4 #(
    .INIT(16'h5F5E)) 
    \timer_r[15]_i_1 
       (.I0(state_r[2]),
        .I1(state_r[0]),
        .I2(state_r[1]),
        .I3(start_i),
        .O(\timer_r[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[15]_i_2 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_5 ),
        .O(timer_r[15]));
  LUT6 #(
    .INIT(64'h7F077F7F7F070700)) 
    \timer_r[15]_i_3 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(state_r[2]),
        .O(\timer_r[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer_r[15]_i_4 
       (.I0(\timer_r_reg_n_0_[3] ),
        .I1(\timer_r_reg_n_0_[14] ),
        .I2(\timer_r_reg_n_0_[15] ),
        .I3(\timer_r_reg_n_0_[5] ),
        .I4(\timer_r_reg_n_0_[4] ),
        .O(\timer_r[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_5 
       (.I0(\timer_r_reg_n_0_[7] ),
        .I1(\timer_r_reg_n_0_[6] ),
        .I2(\timer_r_reg_n_0_[9] ),
        .I3(\timer_r_reg_n_0_[8] ),
        .O(\timer_r[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_6 
       (.I0(\timer_r_reg_n_0_[11] ),
        .I1(\timer_r_reg_n_0_[10] ),
        .I2(\timer_r_reg_n_0_[13] ),
        .I3(\timer_r_reg_n_0_[12] ),
        .O(\timer_r[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[1]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_7 ),
        .O(timer_r[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[2]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_6 ),
        .O(timer_r[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[3]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_5 ),
        .O(timer_r[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[4]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_4 ),
        .O(timer_r[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[5]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_7 ),
        .O(timer_r[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[6]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_6 ),
        .O(timer_r[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[7]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_5 ),
        .O(timer_r[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[8]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_4 ),
        .O(timer_r[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[9]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_7 ),
        .O(timer_r[9]));
  FDRE \timer_r_reg[0] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[0]),
        .Q(\timer_r_reg_n_0_[0] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[10] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[10]),
        .Q(\timer_r_reg_n_0_[10] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[11] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[11]),
        .Q(\timer_r_reg_n_0_[11] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[12] 
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
  FDRE \timer_r_reg[13] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[13]),
        .Q(\timer_r_reg_n_0_[13] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[14] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[14]),
        .Q(\timer_r_reg_n_0_[14] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[15] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[15]),
        .Q(\timer_r_reg_n_0_[15] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[15]_i_7 
       (.CI(\timer_r_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[15]_i_7_n_5 ,\timer_r_reg[15]_i_7_n_6 ,\timer_r_reg[15]_i_7_n_7 }),
        .S({\<const0> ,\timer_r_reg_n_0_[15] ,\timer_r_reg_n_0_[14] ,\timer_r_reg_n_0_[13] }));
  FDRE \timer_r_reg[1] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[1]),
        .Q(\timer_r_reg_n_0_[1] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[2] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[2]),
        .Q(\timer_r_reg_n_0_[2] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[3] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[3]),
        .Q(\timer_r_reg_n_0_[3] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[4] 
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
  FDRE \timer_r_reg[5] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[5]),
        .Q(\timer_r_reg_n_0_[5] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[6] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[6]),
        .Q(\timer_r_reg_n_0_[6] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[7] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[7]),
        .Q(\timer_r_reg_n_0_[7] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[8] 
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
  FDRE \timer_r_reg[9] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[9]),
        .Q(\timer_r_reg_n_0_[9] ),
        .R(busy_o_i_1_n_0));
endmodule

(* AUTO_PARITY = "1" *) (* CLR_CYCLES = "4" *) (* EXCITE_CYCLES = "8" *) 
(* GATE_INIT = "4'b1000" *) (* HOLD_CYCLES = "4" *) (* INIT_SETTLE_CYCLES = "4" *) 
(* LATCH_CYCLES = "8" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_ctrl" *) 
(* ST_DONE = "3'b111" *) (* ST_DROP_EXCITE = "3'b110" *) (* ST_DROP_LATCH = "3'b101" *) 
(* ST_EXCITE = "3'b011" *) (* ST_IDLE = "3'b000" *) (* ST_INIT_CLR = "3'b001" *) 
(* ST_INIT_SETTLE = "3'b010" *) (* ST_LATCH = "3'b100" *) 
module cbdc_puf_ctrl__1
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
  wire \FSM_sequential_state_r[2]_i_2_n_0 ;
  wire busy_o;
  wire busy_o_i_1_n_0;
  wire busy_o_i_2_n_0;
  wire [15:0]challenge_i;
  wire clk;
  wire [15:0]puf_c_o;
  wire \puf_c_o[15]_i_1_n_0 ;
  wire puf_clr_o;
  wire puf_clr_o_i_1_n_0;
  wire puf_excite_o;
  wire puf_excite_o_i_1_n_0;
  wire puf_excite_o_i_2_n_0;
  wire puf_excite_o_i_3_n_0;
  wire puf_q_i;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync1_r;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync2_r;
  wire resp_bit_o;
  wire resp_bit_o_i_1_n_0;
  wire resp_bit_o_i_2_n_0;
  wire resp_valid_o;
  wire resp_valid_o_i_1_n_0;
  wire start_i;
  wire [2:0]state_r;
  wire [15:0]timer_r;
  wire \timer_r[15]_i_1_n_0 ;
  wire \timer_r[15]_i_3_n_0 ;
  wire \timer_r[15]_i_4_n_0 ;
  wire \timer_r[15]_i_5_n_0 ;
  wire \timer_r[15]_i_6_n_0 ;
  wire \timer_r_reg[12]_i_2_n_0 ;
  wire \timer_r_reg[12]_i_2_n_4 ;
  wire \timer_r_reg[12]_i_2_n_5 ;
  wire \timer_r_reg[12]_i_2_n_6 ;
  wire \timer_r_reg[12]_i_2_n_7 ;
  wire \timer_r_reg[15]_i_7_n_5 ;
  wire \timer_r_reg[15]_i_7_n_6 ;
  wire \timer_r_reg[15]_i_7_n_7 ;
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
    .INIT(64'h0000003FFFFFFEC2)) 
    \FSM_sequential_state_r[0]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(puf_excite_o_i_2_n_0),
        .I4(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0E1EF0F0)) 
    \FSM_sequential_state_r[1]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0FE0FF00)) 
    \FSM_sequential_state_r[2]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC000FCCCFCCC8000)) 
    \FSM_sequential_state_r[2]_i_2 
       (.I0(state_r[2]),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(\timer_r_reg_n_0_[1] ),
        .I3(\timer_r_reg_n_0_[0] ),
        .I4(state_r[1]),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[0]_i_1_n_0 ),
        .Q(state_r[0]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[1]_i_1_n_0 ),
        .Q(state_r[1]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[2]_i_1_n_0 ),
        .Q(state_r[2]),
        .R(busy_o_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* \PinAttr:I4:HOLD_DETOUR  = "177" *) 
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h3FFE0002)) 
    busy_o_i_2
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(busy_o),
        .O(busy_o_i_2_n_0));
  FDRE busy_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_o_i_2_n_0),
        .Q(busy_o),
        .R(busy_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    \puf_c_o[15]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .O(\puf_c_o[15]_i_1_n_0 ));
  FDRE \puf_c_o_reg[0] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[0]),
        .Q(puf_c_o[0]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[10] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[10]),
        .Q(puf_c_o[10]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[11] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[11]),
        .Q(puf_c_o[11]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[12] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[12]),
        .Q(puf_c_o[12]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[13] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[13]),
        .Q(puf_c_o[13]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[14] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[14]),
        .Q(puf_c_o[14]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[15] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[15]),
        .Q(puf_c_o[15]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[1] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[1]),
        .Q(puf_c_o[1]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[2] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[2]),
        .Q(puf_c_o[2]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[3] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[3]),
        .Q(puf_c_o[3]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[4] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[4]),
        .Q(puf_c_o[4]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[5] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[5]),
        .Q(puf_c_o[5]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[6] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[6]),
        .Q(puf_c_o[6]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[7] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[7]),
        .Q(puf_c_o[7]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[8] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[8]),
        .Q(puf_c_o[8]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[9] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[9]),
        .Q(puf_c_o[9]),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hF003000A0003000A)) 
    puf_clr_o_i_1
       (.I0(start_i),
        .I1(resp_bit_o_i_2_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_clr_o),
        .O(puf_clr_o_i_1_n_0));
  FDRE puf_clr_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_clr_o_i_1_n_0),
        .Q(puf_clr_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF100EF00F100EF0)) 
    puf_excite_o_i_1
       (.I0(puf_excite_o_i_2_n_0),
        .I1(puf_excite_o_i_3_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_excite_o),
        .O(puf_excite_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    puf_excite_o_i_2
       (.I0(\timer_r[15]_i_6_n_0 ),
        .I1(\timer_r_reg_n_0_[7] ),
        .I2(\timer_r_reg_n_0_[6] ),
        .I3(\timer_r_reg_n_0_[9] ),
        .I4(\timer_r_reg_n_0_[8] ),
        .I5(\timer_r[15]_i_4_n_0 ),
        .O(puf_excite_o_i_2_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    puf_excite_o_i_3
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(puf_excite_o_i_3_n_0));
  FDRE puf_excite_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_excite_o_i_1_n_0),
        .Q(puf_excite_o),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync1_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_q_i),
        .Q(q_sync1_r),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync2_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(q_sync1_r),
        .Q(q_sync2_r),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    resp_bit_o_i_1
       (.I0(q_sync2_r),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(resp_bit_o_i_2_n_0),
        .I5(resp_bit_o),
        .O(resp_bit_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    resp_bit_o_i_2
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(\timer_r[15]_i_4_n_0 ),
        .I4(\timer_r[15]_i_5_n_0 ),
        .I5(\timer_r[15]_i_6_n_0 ),
        .O(resp_bit_o_i_2_n_0));
  FDRE resp_bit_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_bit_o_i_1_n_0),
        .Q(resp_bit_o),
        .R(busy_o_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h80)) 
    resp_valid_o_i_1
       (.I0(state_r[0]),
        .I1(state_r[1]),
        .I2(state_r[2]),
        .O(resp_valid_o_i_1_n_0));
  FDRE resp_valid_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_valid_o_i_1_n_0),
        .Q(resp_valid_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000055511150)) 
    \timer_r[0]_i_1 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(state_r[2]),
        .I3(state_r[0]),
        .I4(state_r[1]),
        .I5(puf_excite_o_i_2_n_0),
        .O(timer_r[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[10]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_6 ),
        .O(timer_r[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[11]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_5 ),
        .O(timer_r[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[12]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_4 ),
        .O(timer_r[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[13]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_7 ),
        .O(timer_r[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[14]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_6 ),
        .O(timer_r[14]));
  LUT4 #(
    .INIT(16'h5F5E)) 
    \timer_r[15]_i_1 
       (.I0(state_r[2]),
        .I1(state_r[0]),
        .I2(state_r[1]),
        .I3(start_i),
        .O(\timer_r[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[15]_i_2 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_5 ),
        .O(timer_r[15]));
  LUT6 #(
    .INIT(64'h7F077F7F7F070700)) 
    \timer_r[15]_i_3 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(state_r[2]),
        .O(\timer_r[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer_r[15]_i_4 
       (.I0(\timer_r_reg_n_0_[3] ),
        .I1(\timer_r_reg_n_0_[14] ),
        .I2(\timer_r_reg_n_0_[15] ),
        .I3(\timer_r_reg_n_0_[5] ),
        .I4(\timer_r_reg_n_0_[4] ),
        .O(\timer_r[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_5 
       (.I0(\timer_r_reg_n_0_[7] ),
        .I1(\timer_r_reg_n_0_[6] ),
        .I2(\timer_r_reg_n_0_[9] ),
        .I3(\timer_r_reg_n_0_[8] ),
        .O(\timer_r[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_6 
       (.I0(\timer_r_reg_n_0_[11] ),
        .I1(\timer_r_reg_n_0_[10] ),
        .I2(\timer_r_reg_n_0_[13] ),
        .I3(\timer_r_reg_n_0_[12] ),
        .O(\timer_r[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[1]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_7 ),
        .O(timer_r[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[2]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_6 ),
        .O(timer_r[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[3]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_5 ),
        .O(timer_r[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[4]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_4 ),
        .O(timer_r[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[5]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_7 ),
        .O(timer_r[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[6]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_6 ),
        .O(timer_r[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[7]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_5 ),
        .O(timer_r[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[8]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_4 ),
        .O(timer_r[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[9]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_7 ),
        .O(timer_r[9]));
  FDRE \timer_r_reg[0] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[0]),
        .Q(\timer_r_reg_n_0_[0] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[10] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[10]),
        .Q(\timer_r_reg_n_0_[10] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[11] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[11]),
        .Q(\timer_r_reg_n_0_[11] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[12] 
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
  FDRE \timer_r_reg[13] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[13]),
        .Q(\timer_r_reg_n_0_[13] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[14] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[14]),
        .Q(\timer_r_reg_n_0_[14] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[15] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[15]),
        .Q(\timer_r_reg_n_0_[15] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[15]_i_7 
       (.CI(\timer_r_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[15]_i_7_n_5 ,\timer_r_reg[15]_i_7_n_6 ,\timer_r_reg[15]_i_7_n_7 }),
        .S({\<const0> ,\timer_r_reg_n_0_[15] ,\timer_r_reg_n_0_[14] ,\timer_r_reg_n_0_[13] }));
  FDRE \timer_r_reg[1] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[1]),
        .Q(\timer_r_reg_n_0_[1] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[2] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[2]),
        .Q(\timer_r_reg_n_0_[2] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[3] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[3]),
        .Q(\timer_r_reg_n_0_[3] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[4] 
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
  FDRE \timer_r_reg[5] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[5]),
        .Q(\timer_r_reg_n_0_[5] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[6] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[6]),
        .Q(\timer_r_reg_n_0_[6] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[7] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[7]),
        .Q(\timer_r_reg_n_0_[7] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[8] 
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
  FDRE \timer_r_reg[9] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[9]),
        .Q(\timer_r_reg_n_0_[9] ),
        .R(busy_o_i_1_n_0));
endmodule

(* AUTO_PARITY = "1" *) (* CLR_CYCLES = "4" *) (* EXCITE_CYCLES = "8" *) 
(* GATE_INIT = "4'b1000" *) (* HOLD_CYCLES = "4" *) (* INIT_SETTLE_CYCLES = "4" *) 
(* LATCH_CYCLES = "8" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_ctrl" *) 
(* ST_DONE = "3'b111" *) (* ST_DROP_EXCITE = "3'b110" *) (* ST_DROP_LATCH = "3'b101" *) 
(* ST_EXCITE = "3'b011" *) (* ST_IDLE = "3'b000" *) (* ST_INIT_CLR = "3'b001" *) 
(* ST_INIT_SETTLE = "3'b010" *) (* ST_LATCH = "3'b100" *) 
module cbdc_puf_ctrl__2
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
  wire \FSM_sequential_state_r[2]_i_2_n_0 ;
  wire busy_o;
  wire busy_o_i_1_n_0;
  wire busy_o_i_2_n_0;
  wire [15:0]challenge_i;
  wire clk;
  wire [15:0]puf_c_o;
  wire \puf_c_o[15]_i_1_n_0 ;
  wire puf_clr_o;
  wire puf_clr_o_i_1_n_0;
  wire puf_excite_o;
  wire puf_excite_o_i_1_n_0;
  wire puf_excite_o_i_2_n_0;
  wire puf_excite_o_i_3_n_0;
  wire puf_q_i;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync1_r;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync2_r;
  wire resp_bit_o;
  wire resp_bit_o_i_1_n_0;
  wire resp_bit_o_i_2_n_0;
  wire resp_valid_o;
  wire resp_valid_o_i_1_n_0;
  wire start_i;
  wire [2:0]state_r;
  wire [15:0]timer_r;
  wire \timer_r[15]_i_1_n_0 ;
  wire \timer_r[15]_i_3_n_0 ;
  wire \timer_r[15]_i_4_n_0 ;
  wire \timer_r[15]_i_5_n_0 ;
  wire \timer_r[15]_i_6_n_0 ;
  wire \timer_r_reg[12]_i_2_n_0 ;
  wire \timer_r_reg[12]_i_2_n_4 ;
  wire \timer_r_reg[12]_i_2_n_5 ;
  wire \timer_r_reg[12]_i_2_n_6 ;
  wire \timer_r_reg[12]_i_2_n_7 ;
  wire \timer_r_reg[15]_i_7_n_5 ;
  wire \timer_r_reg[15]_i_7_n_6 ;
  wire \timer_r_reg[15]_i_7_n_7 ;
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
    .INIT(64'h0000003FFFFFFEC2)) 
    \FSM_sequential_state_r[0]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(puf_excite_o_i_2_n_0),
        .I4(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0E1EF0F0)) 
    \FSM_sequential_state_r[1]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0FE0FF00)) 
    \FSM_sequential_state_r[2]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC000FCCCFCCC8000)) 
    \FSM_sequential_state_r[2]_i_2 
       (.I0(state_r[2]),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(\timer_r_reg_n_0_[1] ),
        .I3(\timer_r_reg_n_0_[0] ),
        .I4(state_r[1]),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[0]_i_1_n_0 ),
        .Q(state_r[0]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[1]_i_1_n_0 ),
        .Q(state_r[1]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[2]_i_1_n_0 ),
        .Q(state_r[2]),
        .R(busy_o_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* \PinAttr:I4:HOLD_DETOUR  = "179" *) 
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h3FFE0002)) 
    busy_o_i_2
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(busy_o),
        .O(busy_o_i_2_n_0));
  FDRE busy_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_o_i_2_n_0),
        .Q(busy_o),
        .R(busy_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    \puf_c_o[15]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .O(\puf_c_o[15]_i_1_n_0 ));
  FDRE \puf_c_o_reg[0] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[0]),
        .Q(puf_c_o[0]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[10] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[10]),
        .Q(puf_c_o[10]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[11] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[11]),
        .Q(puf_c_o[11]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[12] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[12]),
        .Q(puf_c_o[12]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[13] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[13]),
        .Q(puf_c_o[13]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[14] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[14]),
        .Q(puf_c_o[14]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[15] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[15]),
        .Q(puf_c_o[15]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[1] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[1]),
        .Q(puf_c_o[1]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[2] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[2]),
        .Q(puf_c_o[2]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[3] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[3]),
        .Q(puf_c_o[3]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[4] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[4]),
        .Q(puf_c_o[4]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[5] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[5]),
        .Q(puf_c_o[5]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[6] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[6]),
        .Q(puf_c_o[6]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[7] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[7]),
        .Q(puf_c_o[7]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[8] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[8]),
        .Q(puf_c_o[8]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[9] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[9]),
        .Q(puf_c_o[9]),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hF003000A0003000A)) 
    puf_clr_o_i_1
       (.I0(start_i),
        .I1(resp_bit_o_i_2_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_clr_o),
        .O(puf_clr_o_i_1_n_0));
  FDRE puf_clr_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_clr_o_i_1_n_0),
        .Q(puf_clr_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF100EF00F100EF0)) 
    puf_excite_o_i_1
       (.I0(puf_excite_o_i_2_n_0),
        .I1(puf_excite_o_i_3_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_excite_o),
        .O(puf_excite_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    puf_excite_o_i_2
       (.I0(\timer_r[15]_i_6_n_0 ),
        .I1(\timer_r_reg_n_0_[7] ),
        .I2(\timer_r_reg_n_0_[6] ),
        .I3(\timer_r_reg_n_0_[9] ),
        .I4(\timer_r_reg_n_0_[8] ),
        .I5(\timer_r[15]_i_4_n_0 ),
        .O(puf_excite_o_i_2_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    puf_excite_o_i_3
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(puf_excite_o_i_3_n_0));
  FDRE puf_excite_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_excite_o_i_1_n_0),
        .Q(puf_excite_o),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync1_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_q_i),
        .Q(q_sync1_r),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync2_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(q_sync1_r),
        .Q(q_sync2_r),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    resp_bit_o_i_1
       (.I0(q_sync2_r),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(resp_bit_o_i_2_n_0),
        .I5(resp_bit_o),
        .O(resp_bit_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    resp_bit_o_i_2
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(\timer_r[15]_i_4_n_0 ),
        .I4(\timer_r[15]_i_5_n_0 ),
        .I5(\timer_r[15]_i_6_n_0 ),
        .O(resp_bit_o_i_2_n_0));
  FDRE resp_bit_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_bit_o_i_1_n_0),
        .Q(resp_bit_o),
        .R(busy_o_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    resp_valid_o_i_1
       (.I0(state_r[0]),
        .I1(state_r[1]),
        .I2(state_r[2]),
        .O(resp_valid_o_i_1_n_0));
  FDRE resp_valid_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_valid_o_i_1_n_0),
        .Q(resp_valid_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000055511150)) 
    \timer_r[0]_i_1 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(state_r[2]),
        .I3(state_r[0]),
        .I4(state_r[1]),
        .I5(puf_excite_o_i_2_n_0),
        .O(timer_r[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[10]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_6 ),
        .O(timer_r[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[11]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_5 ),
        .O(timer_r[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[12]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_4 ),
        .O(timer_r[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[13]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_7 ),
        .O(timer_r[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[14]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_6 ),
        .O(timer_r[14]));
  LUT4 #(
    .INIT(16'h5F5E)) 
    \timer_r[15]_i_1 
       (.I0(state_r[2]),
        .I1(state_r[0]),
        .I2(state_r[1]),
        .I3(start_i),
        .O(\timer_r[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[15]_i_2 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_5 ),
        .O(timer_r[15]));
  LUT6 #(
    .INIT(64'h7F077F7F7F070700)) 
    \timer_r[15]_i_3 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(state_r[2]),
        .O(\timer_r[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer_r[15]_i_4 
       (.I0(\timer_r_reg_n_0_[3] ),
        .I1(\timer_r_reg_n_0_[14] ),
        .I2(\timer_r_reg_n_0_[15] ),
        .I3(\timer_r_reg_n_0_[5] ),
        .I4(\timer_r_reg_n_0_[4] ),
        .O(\timer_r[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_5 
       (.I0(\timer_r_reg_n_0_[7] ),
        .I1(\timer_r_reg_n_0_[6] ),
        .I2(\timer_r_reg_n_0_[9] ),
        .I3(\timer_r_reg_n_0_[8] ),
        .O(\timer_r[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_6 
       (.I0(\timer_r_reg_n_0_[11] ),
        .I1(\timer_r_reg_n_0_[10] ),
        .I2(\timer_r_reg_n_0_[13] ),
        .I3(\timer_r_reg_n_0_[12] ),
        .O(\timer_r[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[1]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_7 ),
        .O(timer_r[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[2]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_6 ),
        .O(timer_r[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[3]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_5 ),
        .O(timer_r[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[4]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_4 ),
        .O(timer_r[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[5]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_7 ),
        .O(timer_r[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[6]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_6 ),
        .O(timer_r[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[7]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_5 ),
        .O(timer_r[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[8]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_4 ),
        .O(timer_r[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[9]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_7 ),
        .O(timer_r[9]));
  FDRE \timer_r_reg[0] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[0]),
        .Q(\timer_r_reg_n_0_[0] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[10] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[10]),
        .Q(\timer_r_reg_n_0_[10] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[11] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[11]),
        .Q(\timer_r_reg_n_0_[11] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[12] 
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
  FDRE \timer_r_reg[13] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[13]),
        .Q(\timer_r_reg_n_0_[13] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[14] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[14]),
        .Q(\timer_r_reg_n_0_[14] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[15] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[15]),
        .Q(\timer_r_reg_n_0_[15] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[15]_i_7 
       (.CI(\timer_r_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[15]_i_7_n_5 ,\timer_r_reg[15]_i_7_n_6 ,\timer_r_reg[15]_i_7_n_7 }),
        .S({\<const0> ,\timer_r_reg_n_0_[15] ,\timer_r_reg_n_0_[14] ,\timer_r_reg_n_0_[13] }));
  FDRE \timer_r_reg[1] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[1]),
        .Q(\timer_r_reg_n_0_[1] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[2] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[2]),
        .Q(\timer_r_reg_n_0_[2] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[3] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[3]),
        .Q(\timer_r_reg_n_0_[3] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[4] 
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
  FDRE \timer_r_reg[5] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[5]),
        .Q(\timer_r_reg_n_0_[5] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[6] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[6]),
        .Q(\timer_r_reg_n_0_[6] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[7] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[7]),
        .Q(\timer_r_reg_n_0_[7] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[8] 
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
  FDRE \timer_r_reg[9] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[9]),
        .Q(\timer_r_reg_n_0_[9] ),
        .R(busy_o_i_1_n_0));
endmodule

(* AUTO_PARITY = "1" *) (* CLR_CYCLES = "4" *) (* EXCITE_CYCLES = "8" *) 
(* GATE_INIT = "4'b1000" *) (* HOLD_CYCLES = "4" *) (* INIT_SETTLE_CYCLES = "4" *) 
(* LATCH_CYCLES = "8" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_ctrl" *) 
(* ST_DONE = "3'b111" *) (* ST_DROP_EXCITE = "3'b110" *) (* ST_DROP_LATCH = "3'b101" *) 
(* ST_EXCITE = "3'b011" *) (* ST_IDLE = "3'b000" *) (* ST_INIT_CLR = "3'b001" *) 
(* ST_INIT_SETTLE = "3'b010" *) (* ST_LATCH = "3'b100" *) 
module cbdc_puf_ctrl__3
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
  wire \FSM_sequential_state_r[2]_i_2_n_0 ;
  wire busy_o;
  wire busy_o_i_1_n_0;
  wire busy_o_i_2_n_0;
  wire [15:0]challenge_i;
  wire clk;
  wire [15:0]puf_c_o;
  wire \puf_c_o[15]_i_1_n_0 ;
  wire puf_clr_o;
  wire puf_clr_o_i_1_n_0;
  wire puf_excite_o;
  wire puf_excite_o_i_1_n_0;
  wire puf_excite_o_i_2_n_0;
  wire puf_excite_o_i_3_n_0;
  wire puf_q_i;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync1_r;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync2_r;
  wire resp_bit_o;
  wire resp_bit_o_i_1_n_0;
  wire resp_bit_o_i_2_n_0;
  wire resp_valid_o;
  wire resp_valid_o_i_1_n_0;
  wire start_i;
  wire [2:0]state_r;
  wire [15:0]timer_r;
  wire \timer_r[15]_i_1_n_0 ;
  wire \timer_r[15]_i_3_n_0 ;
  wire \timer_r[15]_i_4_n_0 ;
  wire \timer_r[15]_i_5_n_0 ;
  wire \timer_r[15]_i_6_n_0 ;
  wire \timer_r_reg[12]_i_2_n_0 ;
  wire \timer_r_reg[12]_i_2_n_4 ;
  wire \timer_r_reg[12]_i_2_n_5 ;
  wire \timer_r_reg[12]_i_2_n_6 ;
  wire \timer_r_reg[12]_i_2_n_7 ;
  wire \timer_r_reg[15]_i_7_n_5 ;
  wire \timer_r_reg[15]_i_7_n_6 ;
  wire \timer_r_reg[15]_i_7_n_7 ;
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
    .INIT(64'h0000003FFFFFFEC2)) 
    \FSM_sequential_state_r[0]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(puf_excite_o_i_2_n_0),
        .I4(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0E1EF0F0)) 
    \FSM_sequential_state_r[1]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0FE0FF00)) 
    \FSM_sequential_state_r[2]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC000FCCCFCCC8000)) 
    \FSM_sequential_state_r[2]_i_2 
       (.I0(state_r[2]),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(\timer_r_reg_n_0_[1] ),
        .I3(\timer_r_reg_n_0_[0] ),
        .I4(state_r[1]),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[0]_i_1_n_0 ),
        .Q(state_r[0]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[1]_i_1_n_0 ),
        .Q(state_r[1]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[2]_i_1_n_0 ),
        .Q(state_r[2]),
        .R(busy_o_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* \PinAttr:I4:HOLD_DETOUR  = "183" *) 
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h3FFE0002)) 
    busy_o_i_2
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(busy_o),
        .O(busy_o_i_2_n_0));
  FDRE busy_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_o_i_2_n_0),
        .Q(busy_o),
        .R(busy_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    \puf_c_o[15]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .O(\puf_c_o[15]_i_1_n_0 ));
  FDRE \puf_c_o_reg[0] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[0]),
        .Q(puf_c_o[0]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[10] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[10]),
        .Q(puf_c_o[10]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[11] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[11]),
        .Q(puf_c_o[11]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[12] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[12]),
        .Q(puf_c_o[12]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[13] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[13]),
        .Q(puf_c_o[13]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[14] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[14]),
        .Q(puf_c_o[14]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[15] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[15]),
        .Q(puf_c_o[15]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[1] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[1]),
        .Q(puf_c_o[1]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[2] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[2]),
        .Q(puf_c_o[2]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[3] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[3]),
        .Q(puf_c_o[3]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[4] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[4]),
        .Q(puf_c_o[4]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[5] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[5]),
        .Q(puf_c_o[5]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[6] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[6]),
        .Q(puf_c_o[6]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[7] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[7]),
        .Q(puf_c_o[7]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[8] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[8]),
        .Q(puf_c_o[8]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[9] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[9]),
        .Q(puf_c_o[9]),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hF003000A0003000A)) 
    puf_clr_o_i_1
       (.I0(start_i),
        .I1(resp_bit_o_i_2_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_clr_o),
        .O(puf_clr_o_i_1_n_0));
  FDRE puf_clr_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_clr_o_i_1_n_0),
        .Q(puf_clr_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF100EF00F100EF0)) 
    puf_excite_o_i_1
       (.I0(puf_excite_o_i_2_n_0),
        .I1(puf_excite_o_i_3_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_excite_o),
        .O(puf_excite_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    puf_excite_o_i_2
       (.I0(\timer_r[15]_i_6_n_0 ),
        .I1(\timer_r_reg_n_0_[7] ),
        .I2(\timer_r_reg_n_0_[6] ),
        .I3(\timer_r_reg_n_0_[9] ),
        .I4(\timer_r_reg_n_0_[8] ),
        .I5(\timer_r[15]_i_4_n_0 ),
        .O(puf_excite_o_i_2_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    puf_excite_o_i_3
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(puf_excite_o_i_3_n_0));
  FDRE puf_excite_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_excite_o_i_1_n_0),
        .Q(puf_excite_o),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync1_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_q_i),
        .Q(q_sync1_r),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync2_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(q_sync1_r),
        .Q(q_sync2_r),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    resp_bit_o_i_1
       (.I0(q_sync2_r),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(resp_bit_o_i_2_n_0),
        .I5(resp_bit_o),
        .O(resp_bit_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    resp_bit_o_i_2
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(\timer_r[15]_i_4_n_0 ),
        .I4(\timer_r[15]_i_5_n_0 ),
        .I5(\timer_r[15]_i_6_n_0 ),
        .O(resp_bit_o_i_2_n_0));
  FDRE resp_bit_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_bit_o_i_1_n_0),
        .Q(resp_bit_o),
        .R(busy_o_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h80)) 
    resp_valid_o_i_1
       (.I0(state_r[0]),
        .I1(state_r[1]),
        .I2(state_r[2]),
        .O(resp_valid_o_i_1_n_0));
  FDRE resp_valid_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_valid_o_i_1_n_0),
        .Q(resp_valid_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000055511150)) 
    \timer_r[0]_i_1 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(state_r[2]),
        .I3(state_r[0]),
        .I4(state_r[1]),
        .I5(puf_excite_o_i_2_n_0),
        .O(timer_r[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[10]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_6 ),
        .O(timer_r[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[11]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_5 ),
        .O(timer_r[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[12]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_4 ),
        .O(timer_r[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[13]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_7 ),
        .O(timer_r[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[14]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_6 ),
        .O(timer_r[14]));
  LUT4 #(
    .INIT(16'h5F5E)) 
    \timer_r[15]_i_1 
       (.I0(state_r[2]),
        .I1(state_r[0]),
        .I2(state_r[1]),
        .I3(start_i),
        .O(\timer_r[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[15]_i_2 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_5 ),
        .O(timer_r[15]));
  LUT6 #(
    .INIT(64'h7F077F7F7F070700)) 
    \timer_r[15]_i_3 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(state_r[2]),
        .O(\timer_r[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer_r[15]_i_4 
       (.I0(\timer_r_reg_n_0_[3] ),
        .I1(\timer_r_reg_n_0_[14] ),
        .I2(\timer_r_reg_n_0_[15] ),
        .I3(\timer_r_reg_n_0_[5] ),
        .I4(\timer_r_reg_n_0_[4] ),
        .O(\timer_r[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_5 
       (.I0(\timer_r_reg_n_0_[7] ),
        .I1(\timer_r_reg_n_0_[6] ),
        .I2(\timer_r_reg_n_0_[9] ),
        .I3(\timer_r_reg_n_0_[8] ),
        .O(\timer_r[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_6 
       (.I0(\timer_r_reg_n_0_[11] ),
        .I1(\timer_r_reg_n_0_[10] ),
        .I2(\timer_r_reg_n_0_[13] ),
        .I3(\timer_r_reg_n_0_[12] ),
        .O(\timer_r[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[1]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_7 ),
        .O(timer_r[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[2]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_6 ),
        .O(timer_r[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[3]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_5 ),
        .O(timer_r[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[4]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_4 ),
        .O(timer_r[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[5]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_7 ),
        .O(timer_r[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[6]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_6 ),
        .O(timer_r[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[7]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_5 ),
        .O(timer_r[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[8]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_4 ),
        .O(timer_r[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[9]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_7 ),
        .O(timer_r[9]));
  FDRE \timer_r_reg[0] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[0]),
        .Q(\timer_r_reg_n_0_[0] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[10] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[10]),
        .Q(\timer_r_reg_n_0_[10] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[11] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[11]),
        .Q(\timer_r_reg_n_0_[11] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[12] 
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
  FDRE \timer_r_reg[13] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[13]),
        .Q(\timer_r_reg_n_0_[13] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[14] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[14]),
        .Q(\timer_r_reg_n_0_[14] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[15] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[15]),
        .Q(\timer_r_reg_n_0_[15] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[15]_i_7 
       (.CI(\timer_r_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[15]_i_7_n_5 ,\timer_r_reg[15]_i_7_n_6 ,\timer_r_reg[15]_i_7_n_7 }),
        .S({\<const0> ,\timer_r_reg_n_0_[15] ,\timer_r_reg_n_0_[14] ,\timer_r_reg_n_0_[13] }));
  FDRE \timer_r_reg[1] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[1]),
        .Q(\timer_r_reg_n_0_[1] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[2] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[2]),
        .Q(\timer_r_reg_n_0_[2] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[3] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[3]),
        .Q(\timer_r_reg_n_0_[3] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[4] 
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
  FDRE \timer_r_reg[5] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[5]),
        .Q(\timer_r_reg_n_0_[5] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[6] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[6]),
        .Q(\timer_r_reg_n_0_[6] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[7] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[7]),
        .Q(\timer_r_reg_n_0_[7] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[8] 
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
  FDRE \timer_r_reg[9] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[9]),
        .Q(\timer_r_reg_n_0_[9] ),
        .R(busy_o_i_1_n_0));
endmodule

(* AUTO_PARITY = "1" *) (* CLR_CYCLES = "4" *) (* EXCITE_CYCLES = "8" *) 
(* GATE_INIT = "4'b1000" *) (* HOLD_CYCLES = "4" *) (* INIT_SETTLE_CYCLES = "4" *) 
(* LATCH_CYCLES = "8" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_ctrl" *) 
(* ST_DONE = "3'b111" *) (* ST_DROP_EXCITE = "3'b110" *) (* ST_DROP_LATCH = "3'b101" *) 
(* ST_EXCITE = "3'b011" *) (* ST_IDLE = "3'b000" *) (* ST_INIT_CLR = "3'b001" *) 
(* ST_INIT_SETTLE = "3'b010" *) (* ST_LATCH = "3'b100" *) 
module cbdc_puf_ctrl__4
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
  wire \FSM_sequential_state_r[2]_i_2_n_0 ;
  wire busy_o;
  wire busy_o_i_1_n_0;
  wire busy_o_i_2_n_0;
  wire [15:0]challenge_i;
  wire clk;
  wire [15:0]puf_c_o;
  wire \puf_c_o[15]_i_1_n_0 ;
  wire puf_clr_o;
  wire puf_clr_o_i_1_n_0;
  wire puf_excite_o;
  wire puf_excite_o_i_1_n_0;
  wire puf_excite_o_i_2_n_0;
  wire puf_excite_o_i_3_n_0;
  wire puf_q_i;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync1_r;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync2_r;
  wire resp_bit_o;
  wire resp_bit_o_i_1_n_0;
  wire resp_bit_o_i_2_n_0;
  wire resp_valid_o;
  wire resp_valid_o_i_1_n_0;
  wire start_i;
  wire [2:0]state_r;
  wire [15:0]timer_r;
  wire \timer_r[15]_i_1_n_0 ;
  wire \timer_r[15]_i_3_n_0 ;
  wire \timer_r[15]_i_4_n_0 ;
  wire \timer_r[15]_i_5_n_0 ;
  wire \timer_r[15]_i_6_n_0 ;
  wire \timer_r_reg[12]_i_2_n_0 ;
  wire \timer_r_reg[12]_i_2_n_4 ;
  wire \timer_r_reg[12]_i_2_n_5 ;
  wire \timer_r_reg[12]_i_2_n_6 ;
  wire \timer_r_reg[12]_i_2_n_7 ;
  wire \timer_r_reg[15]_i_7_n_5 ;
  wire \timer_r_reg[15]_i_7_n_6 ;
  wire \timer_r_reg[15]_i_7_n_7 ;
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
    .INIT(64'h0000003FFFFFFEC2)) 
    \FSM_sequential_state_r[0]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(puf_excite_o_i_2_n_0),
        .I4(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h0E1EF0F0)) 
    \FSM_sequential_state_r[1]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h0FE0FF00)) 
    \FSM_sequential_state_r[2]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC000FCCCFCCC8000)) 
    \FSM_sequential_state_r[2]_i_2 
       (.I0(state_r[2]),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(\timer_r_reg_n_0_[1] ),
        .I3(\timer_r_reg_n_0_[0] ),
        .I4(state_r[1]),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[0]_i_1_n_0 ),
        .Q(state_r[0]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[1]_i_1_n_0 ),
        .Q(state_r[1]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[2]_i_1_n_0 ),
        .Q(state_r[2]),
        .R(busy_o_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h3FFE0002)) 
    busy_o_i_2
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(busy_o),
        .O(busy_o_i_2_n_0));
  FDRE busy_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_o_i_2_n_0),
        .Q(busy_o),
        .R(busy_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    \puf_c_o[15]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .O(\puf_c_o[15]_i_1_n_0 ));
  FDRE \puf_c_o_reg[0] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[0]),
        .Q(puf_c_o[0]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[10] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[10]),
        .Q(puf_c_o[10]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[11] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[11]),
        .Q(puf_c_o[11]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[12] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[12]),
        .Q(puf_c_o[12]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[13] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[13]),
        .Q(puf_c_o[13]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[14] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[14]),
        .Q(puf_c_o[14]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[15] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[15]),
        .Q(puf_c_o[15]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[1] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[1]),
        .Q(puf_c_o[1]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[2] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[2]),
        .Q(puf_c_o[2]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[3] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[3]),
        .Q(puf_c_o[3]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[4] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[4]),
        .Q(puf_c_o[4]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[5] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[5]),
        .Q(puf_c_o[5]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[6] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[6]),
        .Q(puf_c_o[6]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[7] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[7]),
        .Q(puf_c_o[7]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[8] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[8]),
        .Q(puf_c_o[8]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[9] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[9]),
        .Q(puf_c_o[9]),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hF003000A0003000A)) 
    puf_clr_o_i_1
       (.I0(start_i),
        .I1(resp_bit_o_i_2_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_clr_o),
        .O(puf_clr_o_i_1_n_0));
  FDRE puf_clr_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_clr_o_i_1_n_0),
        .Q(puf_clr_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF100EF00F100EF0)) 
    puf_excite_o_i_1
       (.I0(puf_excite_o_i_2_n_0),
        .I1(puf_excite_o_i_3_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_excite_o),
        .O(puf_excite_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    puf_excite_o_i_2
       (.I0(\timer_r[15]_i_6_n_0 ),
        .I1(\timer_r_reg_n_0_[7] ),
        .I2(\timer_r_reg_n_0_[6] ),
        .I3(\timer_r_reg_n_0_[9] ),
        .I4(\timer_r_reg_n_0_[8] ),
        .I5(\timer_r[15]_i_4_n_0 ),
        .O(puf_excite_o_i_2_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    puf_excite_o_i_3
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(puf_excite_o_i_3_n_0));
  FDRE puf_excite_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_excite_o_i_1_n_0),
        .Q(puf_excite_o),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync1_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_q_i),
        .Q(q_sync1_r),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync2_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(q_sync1_r),
        .Q(q_sync2_r),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    resp_bit_o_i_1
       (.I0(q_sync2_r),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(resp_bit_o_i_2_n_0),
        .I5(resp_bit_o),
        .O(resp_bit_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    resp_bit_o_i_2
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(\timer_r[15]_i_4_n_0 ),
        .I4(\timer_r[15]_i_5_n_0 ),
        .I5(\timer_r[15]_i_6_n_0 ),
        .O(resp_bit_o_i_2_n_0));
  FDRE resp_bit_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_bit_o_i_1_n_0),
        .Q(resp_bit_o),
        .R(busy_o_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h80)) 
    resp_valid_o_i_1
       (.I0(state_r[0]),
        .I1(state_r[1]),
        .I2(state_r[2]),
        .O(resp_valid_o_i_1_n_0));
  FDRE resp_valid_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_valid_o_i_1_n_0),
        .Q(resp_valid_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000055511150)) 
    \timer_r[0]_i_1 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(state_r[2]),
        .I3(state_r[0]),
        .I4(state_r[1]),
        .I5(puf_excite_o_i_2_n_0),
        .O(timer_r[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[10]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_6 ),
        .O(timer_r[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[11]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_5 ),
        .O(timer_r[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[12]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_4 ),
        .O(timer_r[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[13]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_7 ),
        .O(timer_r[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[14]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_6 ),
        .O(timer_r[14]));
  LUT4 #(
    .INIT(16'h5F5E)) 
    \timer_r[15]_i_1 
       (.I0(state_r[2]),
        .I1(state_r[0]),
        .I2(state_r[1]),
        .I3(start_i),
        .O(\timer_r[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[15]_i_2 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_5 ),
        .O(timer_r[15]));
  LUT6 #(
    .INIT(64'h7F077F7F7F070700)) 
    \timer_r[15]_i_3 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(state_r[2]),
        .O(\timer_r[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer_r[15]_i_4 
       (.I0(\timer_r_reg_n_0_[3] ),
        .I1(\timer_r_reg_n_0_[14] ),
        .I2(\timer_r_reg_n_0_[15] ),
        .I3(\timer_r_reg_n_0_[5] ),
        .I4(\timer_r_reg_n_0_[4] ),
        .O(\timer_r[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_5 
       (.I0(\timer_r_reg_n_0_[7] ),
        .I1(\timer_r_reg_n_0_[6] ),
        .I2(\timer_r_reg_n_0_[9] ),
        .I3(\timer_r_reg_n_0_[8] ),
        .O(\timer_r[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_6 
       (.I0(\timer_r_reg_n_0_[11] ),
        .I1(\timer_r_reg_n_0_[10] ),
        .I2(\timer_r_reg_n_0_[13] ),
        .I3(\timer_r_reg_n_0_[12] ),
        .O(\timer_r[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[1]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_7 ),
        .O(timer_r[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[2]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_6 ),
        .O(timer_r[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[3]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_5 ),
        .O(timer_r[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[4]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_4 ),
        .O(timer_r[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[5]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_7 ),
        .O(timer_r[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[6]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_6 ),
        .O(timer_r[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[7]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_5 ),
        .O(timer_r[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[8]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_4 ),
        .O(timer_r[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[9]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_7 ),
        .O(timer_r[9]));
  FDRE \timer_r_reg[0] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[0]),
        .Q(\timer_r_reg_n_0_[0] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[10] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[10]),
        .Q(\timer_r_reg_n_0_[10] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[11] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[11]),
        .Q(\timer_r_reg_n_0_[11] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[12] 
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
  FDRE \timer_r_reg[13] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[13]),
        .Q(\timer_r_reg_n_0_[13] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[14] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[14]),
        .Q(\timer_r_reg_n_0_[14] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[15] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[15]),
        .Q(\timer_r_reg_n_0_[15] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[15]_i_7 
       (.CI(\timer_r_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[15]_i_7_n_5 ,\timer_r_reg[15]_i_7_n_6 ,\timer_r_reg[15]_i_7_n_7 }),
        .S({\<const0> ,\timer_r_reg_n_0_[15] ,\timer_r_reg_n_0_[14] ,\timer_r_reg_n_0_[13] }));
  FDRE \timer_r_reg[1] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[1]),
        .Q(\timer_r_reg_n_0_[1] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[2] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[2]),
        .Q(\timer_r_reg_n_0_[2] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[3] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[3]),
        .Q(\timer_r_reg_n_0_[3] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[4] 
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
  FDRE \timer_r_reg[5] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[5]),
        .Q(\timer_r_reg_n_0_[5] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[6] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[6]),
        .Q(\timer_r_reg_n_0_[6] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[7] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[7]),
        .Q(\timer_r_reg_n_0_[7] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[8] 
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
  FDRE \timer_r_reg[9] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[9]),
        .Q(\timer_r_reg_n_0_[9] ),
        .R(busy_o_i_1_n_0));
endmodule

(* AUTO_PARITY = "1" *) (* CLR_CYCLES = "4" *) (* EXCITE_CYCLES = "8" *) 
(* GATE_INIT = "4'b1000" *) (* HOLD_CYCLES = "4" *) (* INIT_SETTLE_CYCLES = "4" *) 
(* LATCH_CYCLES = "8" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_ctrl" *) 
(* ST_DONE = "3'b111" *) (* ST_DROP_EXCITE = "3'b110" *) (* ST_DROP_LATCH = "3'b101" *) 
(* ST_EXCITE = "3'b011" *) (* ST_IDLE = "3'b000" *) (* ST_INIT_CLR = "3'b001" *) 
(* ST_INIT_SETTLE = "3'b010" *) (* ST_LATCH = "3'b100" *) 
module cbdc_puf_ctrl__5
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
  wire \FSM_sequential_state_r[2]_i_2_n_0 ;
  wire busy_o;
  wire busy_o_i_1_n_0;
  wire busy_o_i_2_n_0;
  wire [15:0]challenge_i;
  wire clk;
  wire [15:0]puf_c_o;
  wire \puf_c_o[15]_i_1_n_0 ;
  wire puf_clr_o;
  wire puf_clr_o_i_1_n_0;
  wire puf_excite_o;
  wire puf_excite_o_i_1_n_0;
  wire puf_excite_o_i_2_n_0;
  wire puf_excite_o_i_3_n_0;
  wire puf_q_i;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync1_r;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync2_r;
  wire resp_bit_o;
  wire resp_bit_o_i_1_n_0;
  wire resp_bit_o_i_2_n_0;
  wire resp_valid_o;
  wire resp_valid_o_i_1_n_0;
  wire start_i;
  wire [2:0]state_r;
  wire [15:0]timer_r;
  wire \timer_r[15]_i_1_n_0 ;
  wire \timer_r[15]_i_3_n_0 ;
  wire \timer_r[15]_i_4_n_0 ;
  wire \timer_r[15]_i_5_n_0 ;
  wire \timer_r[15]_i_6_n_0 ;
  wire \timer_r_reg[12]_i_2_n_0 ;
  wire \timer_r_reg[12]_i_2_n_4 ;
  wire \timer_r_reg[12]_i_2_n_5 ;
  wire \timer_r_reg[12]_i_2_n_6 ;
  wire \timer_r_reg[12]_i_2_n_7 ;
  wire \timer_r_reg[15]_i_7_n_5 ;
  wire \timer_r_reg[15]_i_7_n_6 ;
  wire \timer_r_reg[15]_i_7_n_7 ;
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
    .INIT(64'h0000003FFFFFFEC2)) 
    \FSM_sequential_state_r[0]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(puf_excite_o_i_2_n_0),
        .I4(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h0E1EF0F0)) 
    \FSM_sequential_state_r[1]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h0FE0FF00)) 
    \FSM_sequential_state_r[2]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC000FCCCFCCC8000)) 
    \FSM_sequential_state_r[2]_i_2 
       (.I0(state_r[2]),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(\timer_r_reg_n_0_[1] ),
        .I3(\timer_r_reg_n_0_[0] ),
        .I4(state_r[1]),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[0]_i_1_n_0 ),
        .Q(state_r[0]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[1]_i_1_n_0 ),
        .Q(state_r[1]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[2]_i_1_n_0 ),
        .Q(state_r[2]),
        .R(busy_o_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h3FFE0002)) 
    busy_o_i_2
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(busy_o),
        .O(busy_o_i_2_n_0));
  FDRE busy_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_o_i_2_n_0),
        .Q(busy_o),
        .R(busy_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    \puf_c_o[15]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .O(\puf_c_o[15]_i_1_n_0 ));
  FDRE \puf_c_o_reg[0] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[0]),
        .Q(puf_c_o[0]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[10] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[10]),
        .Q(puf_c_o[10]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[11] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[11]),
        .Q(puf_c_o[11]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[12] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[12]),
        .Q(puf_c_o[12]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[13] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[13]),
        .Q(puf_c_o[13]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[14] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[14]),
        .Q(puf_c_o[14]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[15] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[15]),
        .Q(puf_c_o[15]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[1] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[1]),
        .Q(puf_c_o[1]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[2] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[2]),
        .Q(puf_c_o[2]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[3] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[3]),
        .Q(puf_c_o[3]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[4] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[4]),
        .Q(puf_c_o[4]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[5] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[5]),
        .Q(puf_c_o[5]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[6] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[6]),
        .Q(puf_c_o[6]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[7] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[7]),
        .Q(puf_c_o[7]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[8] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[8]),
        .Q(puf_c_o[8]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[9] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[9]),
        .Q(puf_c_o[9]),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hF003000A0003000A)) 
    puf_clr_o_i_1
       (.I0(start_i),
        .I1(resp_bit_o_i_2_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_clr_o),
        .O(puf_clr_o_i_1_n_0));
  FDRE puf_clr_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_clr_o_i_1_n_0),
        .Q(puf_clr_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF100EF00F100EF0)) 
    puf_excite_o_i_1
       (.I0(puf_excite_o_i_2_n_0),
        .I1(puf_excite_o_i_3_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_excite_o),
        .O(puf_excite_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    puf_excite_o_i_2
       (.I0(\timer_r[15]_i_6_n_0 ),
        .I1(\timer_r_reg_n_0_[7] ),
        .I2(\timer_r_reg_n_0_[6] ),
        .I3(\timer_r_reg_n_0_[9] ),
        .I4(\timer_r_reg_n_0_[8] ),
        .I5(\timer_r[15]_i_4_n_0 ),
        .O(puf_excite_o_i_2_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    puf_excite_o_i_3
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(puf_excite_o_i_3_n_0));
  FDRE puf_excite_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_excite_o_i_1_n_0),
        .Q(puf_excite_o),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync1_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_q_i),
        .Q(q_sync1_r),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync2_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(q_sync1_r),
        .Q(q_sync2_r),
        .R(busy_o_i_1_n_0));
  (* \PinAttr:I0:HOLD_DETOUR  = "147" *) 
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    resp_bit_o_i_1
       (.I0(q_sync2_r),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(resp_bit_o_i_2_n_0),
        .I5(resp_bit_o),
        .O(resp_bit_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    resp_bit_o_i_2
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(\timer_r[15]_i_4_n_0 ),
        .I4(\timer_r[15]_i_5_n_0 ),
        .I5(\timer_r[15]_i_6_n_0 ),
        .O(resp_bit_o_i_2_n_0));
  FDRE resp_bit_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_bit_o_i_1_n_0),
        .Q(resp_bit_o),
        .R(busy_o_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    resp_valid_o_i_1
       (.I0(state_r[0]),
        .I1(state_r[1]),
        .I2(state_r[2]),
        .O(resp_valid_o_i_1_n_0));
  FDRE resp_valid_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_valid_o_i_1_n_0),
        .Q(resp_valid_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000055511150)) 
    \timer_r[0]_i_1 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(state_r[2]),
        .I3(state_r[0]),
        .I4(state_r[1]),
        .I5(puf_excite_o_i_2_n_0),
        .O(timer_r[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[10]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_6 ),
        .O(timer_r[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[11]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_5 ),
        .O(timer_r[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[12]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_4 ),
        .O(timer_r[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[13]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_7 ),
        .O(timer_r[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[14]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_6 ),
        .O(timer_r[14]));
  LUT4 #(
    .INIT(16'h5F5E)) 
    \timer_r[15]_i_1 
       (.I0(state_r[2]),
        .I1(state_r[0]),
        .I2(state_r[1]),
        .I3(start_i),
        .O(\timer_r[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[15]_i_2 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_5 ),
        .O(timer_r[15]));
  LUT6 #(
    .INIT(64'h7F077F7F7F070700)) 
    \timer_r[15]_i_3 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(state_r[2]),
        .O(\timer_r[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer_r[15]_i_4 
       (.I0(\timer_r_reg_n_0_[3] ),
        .I1(\timer_r_reg_n_0_[14] ),
        .I2(\timer_r_reg_n_0_[15] ),
        .I3(\timer_r_reg_n_0_[5] ),
        .I4(\timer_r_reg_n_0_[4] ),
        .O(\timer_r[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_5 
       (.I0(\timer_r_reg_n_0_[7] ),
        .I1(\timer_r_reg_n_0_[6] ),
        .I2(\timer_r_reg_n_0_[9] ),
        .I3(\timer_r_reg_n_0_[8] ),
        .O(\timer_r[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_6 
       (.I0(\timer_r_reg_n_0_[11] ),
        .I1(\timer_r_reg_n_0_[10] ),
        .I2(\timer_r_reg_n_0_[13] ),
        .I3(\timer_r_reg_n_0_[12] ),
        .O(\timer_r[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[1]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_7 ),
        .O(timer_r[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[2]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_6 ),
        .O(timer_r[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[3]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_5 ),
        .O(timer_r[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[4]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_4 ),
        .O(timer_r[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[5]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_7 ),
        .O(timer_r[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[6]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_6 ),
        .O(timer_r[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[7]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_5 ),
        .O(timer_r[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[8]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_4 ),
        .O(timer_r[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[9]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_7 ),
        .O(timer_r[9]));
  FDRE \timer_r_reg[0] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[0]),
        .Q(\timer_r_reg_n_0_[0] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[10] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[10]),
        .Q(\timer_r_reg_n_0_[10] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[11] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[11]),
        .Q(\timer_r_reg_n_0_[11] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[12] 
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
  FDRE \timer_r_reg[13] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[13]),
        .Q(\timer_r_reg_n_0_[13] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[14] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[14]),
        .Q(\timer_r_reg_n_0_[14] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[15] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[15]),
        .Q(\timer_r_reg_n_0_[15] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[15]_i_7 
       (.CI(\timer_r_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[15]_i_7_n_5 ,\timer_r_reg[15]_i_7_n_6 ,\timer_r_reg[15]_i_7_n_7 }),
        .S({\<const0> ,\timer_r_reg_n_0_[15] ,\timer_r_reg_n_0_[14] ,\timer_r_reg_n_0_[13] }));
  FDRE \timer_r_reg[1] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[1]),
        .Q(\timer_r_reg_n_0_[1] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[2] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[2]),
        .Q(\timer_r_reg_n_0_[2] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[3] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[3]),
        .Q(\timer_r_reg_n_0_[3] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[4] 
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
  FDRE \timer_r_reg[5] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[5]),
        .Q(\timer_r_reg_n_0_[5] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[6] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[6]),
        .Q(\timer_r_reg_n_0_[6] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[7] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[7]),
        .Q(\timer_r_reg_n_0_[7] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[8] 
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
  FDRE \timer_r_reg[9] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[9]),
        .Q(\timer_r_reg_n_0_[9] ),
        .R(busy_o_i_1_n_0));
endmodule

(* AUTO_PARITY = "1" *) (* CLR_CYCLES = "4" *) (* EXCITE_CYCLES = "8" *) 
(* GATE_INIT = "4'b1000" *) (* HOLD_CYCLES = "4" *) (* INIT_SETTLE_CYCLES = "4" *) 
(* LATCH_CYCLES = "8" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_ctrl" *) 
(* ST_DONE = "3'b111" *) (* ST_DROP_EXCITE = "3'b110" *) (* ST_DROP_LATCH = "3'b101" *) 
(* ST_EXCITE = "3'b011" *) (* ST_IDLE = "3'b000" *) (* ST_INIT_CLR = "3'b001" *) 
(* ST_INIT_SETTLE = "3'b010" *) (* ST_LATCH = "3'b100" *) 
module cbdc_puf_ctrl__6
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
  wire \FSM_sequential_state_r[2]_i_2_n_0 ;
  wire busy_o;
  wire busy_o_i_1_n_0;
  wire busy_o_i_2_n_0;
  wire [15:0]challenge_i;
  wire clk;
  wire [15:0]puf_c_o;
  wire \puf_c_o[15]_i_1_n_0 ;
  wire puf_clr_o;
  wire puf_clr_o_i_1_n_0;
  wire puf_excite_o;
  wire puf_excite_o_i_1_n_0;
  wire puf_excite_o_i_2_n_0;
  wire puf_excite_o_i_3_n_0;
  wire puf_q_i;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync1_r;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync2_r;
  wire resp_bit_o;
  wire resp_bit_o_i_1_n_0;
  wire resp_bit_o_i_2_n_0;
  wire resp_valid_o;
  wire resp_valid_o_i_1_n_0;
  wire start_i;
  wire [2:0]state_r;
  wire [15:0]timer_r;
  wire \timer_r[15]_i_1_n_0 ;
  wire \timer_r[15]_i_3_n_0 ;
  wire \timer_r[15]_i_4_n_0 ;
  wire \timer_r[15]_i_5_n_0 ;
  wire \timer_r[15]_i_6_n_0 ;
  wire \timer_r_reg[12]_i_2_n_0 ;
  wire \timer_r_reg[12]_i_2_n_4 ;
  wire \timer_r_reg[12]_i_2_n_5 ;
  wire \timer_r_reg[12]_i_2_n_6 ;
  wire \timer_r_reg[12]_i_2_n_7 ;
  wire \timer_r_reg[15]_i_7_n_5 ;
  wire \timer_r_reg[15]_i_7_n_6 ;
  wire \timer_r_reg[15]_i_7_n_7 ;
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
    .INIT(64'h0000003FFFFFFEC2)) 
    \FSM_sequential_state_r[0]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(puf_excite_o_i_2_n_0),
        .I4(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h0E1EF0F0)) 
    \FSM_sequential_state_r[1]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h0FE0FF00)) 
    \FSM_sequential_state_r[2]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC000FCCCFCCC8000)) 
    \FSM_sequential_state_r[2]_i_2 
       (.I0(state_r[2]),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(\timer_r_reg_n_0_[1] ),
        .I3(\timer_r_reg_n_0_[0] ),
        .I4(state_r[1]),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[0]_i_1_n_0 ),
        .Q(state_r[0]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[1]_i_1_n_0 ),
        .Q(state_r[1]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[2]_i_1_n_0 ),
        .Q(state_r[2]),
        .R(busy_o_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* \PinAttr:I4:HOLD_DETOUR  = "185" *) 
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h3FFE0002)) 
    busy_o_i_2
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(busy_o),
        .O(busy_o_i_2_n_0));
  FDRE busy_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_o_i_2_n_0),
        .Q(busy_o),
        .R(busy_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    \puf_c_o[15]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .O(\puf_c_o[15]_i_1_n_0 ));
  FDRE \puf_c_o_reg[0] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[0]),
        .Q(puf_c_o[0]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[10] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[10]),
        .Q(puf_c_o[10]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[11] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[11]),
        .Q(puf_c_o[11]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[12] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[12]),
        .Q(puf_c_o[12]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[13] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[13]),
        .Q(puf_c_o[13]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[14] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[14]),
        .Q(puf_c_o[14]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[15] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[15]),
        .Q(puf_c_o[15]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[1] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[1]),
        .Q(puf_c_o[1]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[2] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[2]),
        .Q(puf_c_o[2]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[3] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[3]),
        .Q(puf_c_o[3]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[4] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[4]),
        .Q(puf_c_o[4]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[5] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[5]),
        .Q(puf_c_o[5]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[6] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[6]),
        .Q(puf_c_o[6]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[7] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[7]),
        .Q(puf_c_o[7]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[8] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[8]),
        .Q(puf_c_o[8]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[9] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[9]),
        .Q(puf_c_o[9]),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hF003000A0003000A)) 
    puf_clr_o_i_1
       (.I0(start_i),
        .I1(resp_bit_o_i_2_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_clr_o),
        .O(puf_clr_o_i_1_n_0));
  FDRE puf_clr_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_clr_o_i_1_n_0),
        .Q(puf_clr_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF100EF00F100EF0)) 
    puf_excite_o_i_1
       (.I0(puf_excite_o_i_2_n_0),
        .I1(puf_excite_o_i_3_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_excite_o),
        .O(puf_excite_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    puf_excite_o_i_2
       (.I0(\timer_r[15]_i_6_n_0 ),
        .I1(\timer_r_reg_n_0_[7] ),
        .I2(\timer_r_reg_n_0_[6] ),
        .I3(\timer_r_reg_n_0_[9] ),
        .I4(\timer_r_reg_n_0_[8] ),
        .I5(\timer_r[15]_i_4_n_0 ),
        .O(puf_excite_o_i_2_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    puf_excite_o_i_3
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(puf_excite_o_i_3_n_0));
  FDRE puf_excite_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_excite_o_i_1_n_0),
        .Q(puf_excite_o),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync1_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_q_i),
        .Q(q_sync1_r),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync2_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(q_sync1_r),
        .Q(q_sync2_r),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    resp_bit_o_i_1
       (.I0(q_sync2_r),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(resp_bit_o_i_2_n_0),
        .I5(resp_bit_o),
        .O(resp_bit_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    resp_bit_o_i_2
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(\timer_r[15]_i_4_n_0 ),
        .I4(\timer_r[15]_i_5_n_0 ),
        .I5(\timer_r[15]_i_6_n_0 ),
        .O(resp_bit_o_i_2_n_0));
  FDRE resp_bit_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_bit_o_i_1_n_0),
        .Q(resp_bit_o),
        .R(busy_o_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h80)) 
    resp_valid_o_i_1
       (.I0(state_r[0]),
        .I1(state_r[1]),
        .I2(state_r[2]),
        .O(resp_valid_o_i_1_n_0));
  FDRE resp_valid_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_valid_o_i_1_n_0),
        .Q(resp_valid_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000055511150)) 
    \timer_r[0]_i_1 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(state_r[2]),
        .I3(state_r[0]),
        .I4(state_r[1]),
        .I5(puf_excite_o_i_2_n_0),
        .O(timer_r[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[10]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_6 ),
        .O(timer_r[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[11]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_5 ),
        .O(timer_r[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[12]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_4 ),
        .O(timer_r[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[13]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_7 ),
        .O(timer_r[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[14]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_6 ),
        .O(timer_r[14]));
  LUT4 #(
    .INIT(16'h5F5E)) 
    \timer_r[15]_i_1 
       (.I0(state_r[2]),
        .I1(state_r[0]),
        .I2(state_r[1]),
        .I3(start_i),
        .O(\timer_r[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[15]_i_2 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_5 ),
        .O(timer_r[15]));
  LUT6 #(
    .INIT(64'h7F077F7F7F070700)) 
    \timer_r[15]_i_3 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(state_r[2]),
        .O(\timer_r[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer_r[15]_i_4 
       (.I0(\timer_r_reg_n_0_[3] ),
        .I1(\timer_r_reg_n_0_[14] ),
        .I2(\timer_r_reg_n_0_[15] ),
        .I3(\timer_r_reg_n_0_[5] ),
        .I4(\timer_r_reg_n_0_[4] ),
        .O(\timer_r[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_5 
       (.I0(\timer_r_reg_n_0_[7] ),
        .I1(\timer_r_reg_n_0_[6] ),
        .I2(\timer_r_reg_n_0_[9] ),
        .I3(\timer_r_reg_n_0_[8] ),
        .O(\timer_r[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_6 
       (.I0(\timer_r_reg_n_0_[11] ),
        .I1(\timer_r_reg_n_0_[10] ),
        .I2(\timer_r_reg_n_0_[13] ),
        .I3(\timer_r_reg_n_0_[12] ),
        .O(\timer_r[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[1]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_7 ),
        .O(timer_r[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[2]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_6 ),
        .O(timer_r[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[3]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_5 ),
        .O(timer_r[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[4]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_4 ),
        .O(timer_r[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[5]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_7 ),
        .O(timer_r[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[6]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_6 ),
        .O(timer_r[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[7]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_5 ),
        .O(timer_r[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[8]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_4 ),
        .O(timer_r[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[9]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_7 ),
        .O(timer_r[9]));
  FDRE \timer_r_reg[0] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[0]),
        .Q(\timer_r_reg_n_0_[0] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[10] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[10]),
        .Q(\timer_r_reg_n_0_[10] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[11] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[11]),
        .Q(\timer_r_reg_n_0_[11] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[12] 
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
  FDRE \timer_r_reg[13] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[13]),
        .Q(\timer_r_reg_n_0_[13] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[14] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[14]),
        .Q(\timer_r_reg_n_0_[14] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[15] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[15]),
        .Q(\timer_r_reg_n_0_[15] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[15]_i_7 
       (.CI(\timer_r_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[15]_i_7_n_5 ,\timer_r_reg[15]_i_7_n_6 ,\timer_r_reg[15]_i_7_n_7 }),
        .S({\<const0> ,\timer_r_reg_n_0_[15] ,\timer_r_reg_n_0_[14] ,\timer_r_reg_n_0_[13] }));
  FDRE \timer_r_reg[1] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[1]),
        .Q(\timer_r_reg_n_0_[1] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[2] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[2]),
        .Q(\timer_r_reg_n_0_[2] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[3] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[3]),
        .Q(\timer_r_reg_n_0_[3] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[4] 
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
  FDRE \timer_r_reg[5] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[5]),
        .Q(\timer_r_reg_n_0_[5] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[6] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[6]),
        .Q(\timer_r_reg_n_0_[6] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[7] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[7]),
        .Q(\timer_r_reg_n_0_[7] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[8] 
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
  FDRE \timer_r_reg[9] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[9]),
        .Q(\timer_r_reg_n_0_[9] ),
        .R(busy_o_i_1_n_0));
endmodule

(* AUTO_PARITY = "1" *) (* CLR_CYCLES = "4" *) (* EXCITE_CYCLES = "8" *) 
(* GATE_INIT = "4'b1000" *) (* HOLD_CYCLES = "4" *) (* INIT_SETTLE_CYCLES = "4" *) 
(* LATCH_CYCLES = "8" *) (* N_STAGES = "16" *) (* ORIG_REF_NAME = "cbdc_puf_ctrl" *) 
(* ST_DONE = "3'b111" *) (* ST_DROP_EXCITE = "3'b110" *) (* ST_DROP_LATCH = "3'b101" *) 
(* ST_EXCITE = "3'b011" *) (* ST_IDLE = "3'b000" *) (* ST_INIT_CLR = "3'b001" *) 
(* ST_INIT_SETTLE = "3'b010" *) (* ST_LATCH = "3'b100" *) 
module cbdc_puf_ctrl__7
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
  wire \FSM_sequential_state_r[2]_i_2_n_0 ;
  wire busy_o;
  wire busy_o_i_1_n_0;
  wire busy_o_i_2_n_0;
  wire [15:0]challenge_i;
  wire clk;
  wire [15:0]puf_c_o;
  wire \puf_c_o[15]_i_1_n_0 ;
  wire puf_clr_o;
  wire puf_clr_o_i_1_n_0;
  wire puf_excite_o;
  wire puf_excite_o_i_1_n_0;
  wire puf_excite_o_i_2_n_0;
  wire puf_excite_o_i_3_n_0;
  wire puf_q_i;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync1_r;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire q_sync2_r;
  wire resp_bit_o;
  wire resp_bit_o_i_1_n_0;
  wire resp_bit_o_i_2_n_0;
  wire resp_valid_o;
  wire resp_valid_o_i_1_n_0;
  wire start_i;
  wire [2:0]state_r;
  wire [15:0]timer_r;
  wire \timer_r[15]_i_1_n_0 ;
  wire \timer_r[15]_i_3_n_0 ;
  wire \timer_r[15]_i_4_n_0 ;
  wire \timer_r[15]_i_5_n_0 ;
  wire \timer_r[15]_i_6_n_0 ;
  wire \timer_r_reg[12]_i_2_n_0 ;
  wire \timer_r_reg[12]_i_2_n_4 ;
  wire \timer_r_reg[12]_i_2_n_5 ;
  wire \timer_r_reg[12]_i_2_n_6 ;
  wire \timer_r_reg[12]_i_2_n_7 ;
  wire \timer_r_reg[15]_i_7_n_5 ;
  wire \timer_r_reg[15]_i_7_n_6 ;
  wire \timer_r_reg[15]_i_7_n_7 ;
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
    .INIT(64'h0000003FFFFFFEC2)) 
    \FSM_sequential_state_r[0]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[1]),
        .I3(puf_excite_o_i_2_n_0),
        .I4(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h0E1EF0F0)) 
    \FSM_sequential_state_r[1]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h0FE0FF00)) 
    \FSM_sequential_state_r[2]_i_1 
       (.I0(\FSM_sequential_state_r[2]_i_2_n_0 ),
        .I1(puf_excite_o_i_2_n_0),
        .I2(state_r[1]),
        .I3(state_r[2]),
        .I4(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC000FCCCFCCC8000)) 
    \FSM_sequential_state_r[2]_i_2 
       (.I0(state_r[2]),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(\timer_r_reg_n_0_[1] ),
        .I3(\timer_r_reg_n_0_[0] ),
        .I4(state_r[1]),
        .I5(state_r[0]),
        .O(\FSM_sequential_state_r[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[0]_i_1_n_0 ),
        .Q(state_r[0]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[1]_i_1_n_0 ),
        .Q(state_r[1]),
        .R(busy_o_i_1_n_0));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_INIT_CLR:001,ST_INIT_SETTLE:010,ST_EXCITE:011,ST_LATCH:100,ST_DROP_LATCH:101,ST_DROP_EXCITE:110,ST_DONE:111" *) 
  FDRE \FSM_sequential_state_r_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_sequential_state_r[2]_i_1_n_0 ),
        .Q(state_r[2]),
        .R(busy_o_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h3FFE0002)) 
    busy_o_i_2
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .I4(busy_o),
        .O(busy_o_i_2_n_0));
  FDRE busy_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_o_i_2_n_0),
        .Q(busy_o),
        .R(busy_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    \puf_c_o[15]_i_1 
       (.I0(start_i),
        .I1(state_r[2]),
        .I2(state_r[0]),
        .I3(state_r[1]),
        .O(\puf_c_o[15]_i_1_n_0 ));
  FDRE \puf_c_o_reg[0] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[0]),
        .Q(puf_c_o[0]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[10] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[10]),
        .Q(puf_c_o[10]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[11] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[11]),
        .Q(puf_c_o[11]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[12] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[12]),
        .Q(puf_c_o[12]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[13] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[13]),
        .Q(puf_c_o[13]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[14] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[14]),
        .Q(puf_c_o[14]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[15] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[15]),
        .Q(puf_c_o[15]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[1] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[1]),
        .Q(puf_c_o[1]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[2] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[2]),
        .Q(puf_c_o[2]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[3] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[3]),
        .Q(puf_c_o[3]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[4] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[4]),
        .Q(puf_c_o[4]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[5] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[5]),
        .Q(puf_c_o[5]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[6] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[6]),
        .Q(puf_c_o[6]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[7] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[7]),
        .Q(puf_c_o[7]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[8] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[8]),
        .Q(puf_c_o[8]),
        .R(busy_o_i_1_n_0));
  FDRE \puf_c_o_reg[9] 
       (.C(clk),
        .CE(\puf_c_o[15]_i_1_n_0 ),
        .D(challenge_i[9]),
        .Q(puf_c_o[9]),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hF003000A0003000A)) 
    puf_clr_o_i_1
       (.I0(start_i),
        .I1(resp_bit_o_i_2_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_clr_o),
        .O(puf_clr_o_i_1_n_0));
  FDRE puf_clr_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_clr_o_i_1_n_0),
        .Q(puf_clr_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF100EF00F100EF0)) 
    puf_excite_o_i_1
       (.I0(puf_excite_o_i_2_n_0),
        .I1(puf_excite_o_i_3_n_0),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(puf_excite_o),
        .O(puf_excite_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    puf_excite_o_i_2
       (.I0(\timer_r[15]_i_6_n_0 ),
        .I1(\timer_r_reg_n_0_[7] ),
        .I2(\timer_r_reg_n_0_[6] ),
        .I3(\timer_r_reg_n_0_[9] ),
        .I4(\timer_r_reg_n_0_[8] ),
        .I5(\timer_r[15]_i_4_n_0 ),
        .O(puf_excite_o_i_2_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    puf_excite_o_i_3
       (.I0(\timer_r_reg_n_0_[2] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[0] ),
        .O(puf_excite_o_i_3_n_0));
  FDRE puf_excite_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_excite_o_i_1_n_0),
        .Q(puf_excite_o),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync1_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(puf_q_i),
        .Q(q_sync1_r),
        .R(busy_o_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE q_sync2_r_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(q_sync1_r),
        .Q(q_sync2_r),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    resp_bit_o_i_1
       (.I0(q_sync2_r),
        .I1(state_r[0]),
        .I2(state_r[2]),
        .I3(state_r[1]),
        .I4(resp_bit_o_i_2_n_0),
        .I5(resp_bit_o),
        .O(resp_bit_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    resp_bit_o_i_2
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(\timer_r[15]_i_4_n_0 ),
        .I4(\timer_r[15]_i_5_n_0 ),
        .I5(\timer_r[15]_i_6_n_0 ),
        .O(resp_bit_o_i_2_n_0));
  FDRE resp_bit_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_bit_o_i_1_n_0),
        .Q(resp_bit_o),
        .R(busy_o_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h80)) 
    resp_valid_o_i_1
       (.I0(state_r[0]),
        .I1(state_r[1]),
        .I2(state_r[2]),
        .O(resp_valid_o_i_1_n_0));
  FDRE resp_valid_o_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(resp_valid_o_i_1_n_0),
        .Q(resp_valid_o),
        .R(busy_o_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000055511150)) 
    \timer_r[0]_i_1 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[2] ),
        .I2(state_r[2]),
        .I3(state_r[0]),
        .I4(state_r[1]),
        .I5(puf_excite_o_i_2_n_0),
        .O(timer_r[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[10]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_6 ),
        .O(timer_r[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[11]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_5 ),
        .O(timer_r[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[12]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_4 ),
        .O(timer_r[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[13]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_7 ),
        .O(timer_r[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[14]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_6 ),
        .O(timer_r[14]));
  LUT4 #(
    .INIT(16'h5F5E)) 
    \timer_r[15]_i_1 
       (.I0(state_r[2]),
        .I1(state_r[0]),
        .I2(state_r[1]),
        .I3(start_i),
        .O(\timer_r[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[15]_i_2 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[15]_i_7_n_5 ),
        .O(timer_r[15]));
  LUT6 #(
    .INIT(64'h7F077F7F7F070700)) 
    \timer_r[15]_i_3 
       (.I0(\timer_r_reg_n_0_[0] ),
        .I1(\timer_r_reg_n_0_[1] ),
        .I2(\timer_r_reg_n_0_[2] ),
        .I3(state_r[1]),
        .I4(state_r[0]),
        .I5(state_r[2]),
        .O(\timer_r[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer_r[15]_i_4 
       (.I0(\timer_r_reg_n_0_[3] ),
        .I1(\timer_r_reg_n_0_[14] ),
        .I2(\timer_r_reg_n_0_[15] ),
        .I3(\timer_r_reg_n_0_[5] ),
        .I4(\timer_r_reg_n_0_[4] ),
        .O(\timer_r[15]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_5 
       (.I0(\timer_r_reg_n_0_[7] ),
        .I1(\timer_r_reg_n_0_[6] ),
        .I2(\timer_r_reg_n_0_[9] ),
        .I3(\timer_r_reg_n_0_[8] ),
        .O(\timer_r[15]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer_r[15]_i_6 
       (.I0(\timer_r_reg_n_0_[11] ),
        .I1(\timer_r_reg_n_0_[10] ),
        .I2(\timer_r_reg_n_0_[13] ),
        .I3(\timer_r_reg_n_0_[12] ),
        .O(\timer_r[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[1]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_7 ),
        .O(timer_r[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[2]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_6 ),
        .O(timer_r[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[3]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_5 ),
        .O(timer_r[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[4]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[4]_i_2_n_4 ),
        .O(timer_r[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[5]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_7 ),
        .O(timer_r[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[6]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_6 ),
        .O(timer_r[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[7]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_5 ),
        .O(timer_r[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[8]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[8]_i_2_n_4 ),
        .O(timer_r[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \timer_r[9]_i_1 
       (.I0(\timer_r[15]_i_3_n_0 ),
        .I1(\timer_r[15]_i_4_n_0 ),
        .I2(\timer_r[15]_i_5_n_0 ),
        .I3(\timer_r[15]_i_6_n_0 ),
        .I4(\timer_r_reg[12]_i_2_n_7 ),
        .O(timer_r[9]));
  FDRE \timer_r_reg[0] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[0]),
        .Q(\timer_r_reg_n_0_[0] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[10] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[10]),
        .Q(\timer_r_reg_n_0_[10] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[11] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[11]),
        .Q(\timer_r_reg_n_0_[11] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[12] 
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
  FDRE \timer_r_reg[13] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[13]),
        .Q(\timer_r_reg_n_0_[13] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[14] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[14]),
        .Q(\timer_r_reg_n_0_[14] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[15] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[15]),
        .Q(\timer_r_reg_n_0_[15] ),
        .R(busy_o_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \timer_r_reg[15]_i_7 
       (.CI(\timer_r_reg[12]_i_2_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\timer_r_reg[15]_i_7_n_5 ,\timer_r_reg[15]_i_7_n_6 ,\timer_r_reg[15]_i_7_n_7 }),
        .S({\<const0> ,\timer_r_reg_n_0_[15] ,\timer_r_reg_n_0_[14] ,\timer_r_reg_n_0_[13] }));
  FDRE \timer_r_reg[1] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[1]),
        .Q(\timer_r_reg_n_0_[1] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[2] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[2]),
        .Q(\timer_r_reg_n_0_[2] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[3] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[3]),
        .Q(\timer_r_reg_n_0_[3] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[4] 
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
  FDRE \timer_r_reg[5] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[5]),
        .Q(\timer_r_reg_n_0_[5] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[6] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[6]),
        .Q(\timer_r_reg_n_0_[6] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[7] 
       (.C(clk),
        .CE(\timer_r[15]_i_1_n_0 ),
        .D(timer_r[7]),
        .Q(\timer_r_reg_n_0_[7] ),
        .R(busy_o_i_1_n_0));
  FDRE \timer_r_reg[8] 
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
  FDRE \timer_r_reg[9] 
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
module cbdc_puf_element__100
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
module cbdc_puf_element__101
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
module cbdc_puf_element__102
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
module cbdc_puf_element__103
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
module cbdc_puf_element__104
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
module cbdc_puf_element__105
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
module cbdc_puf_element__106
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
module cbdc_puf_element__107
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
module cbdc_puf_element__108
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
module cbdc_puf_element__109
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
module cbdc_puf_element__110
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
module cbdc_puf_element__111
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
module cbdc_puf_element__112
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
module cbdc_puf_element__113
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
module cbdc_puf_element__114
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
module cbdc_puf_element__115
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
module cbdc_puf_element__116
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
module cbdc_puf_element__117
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
module cbdc_puf_element__118
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
module cbdc_puf_element__119
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
module cbdc_puf_element__120
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
module cbdc_puf_element__121
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
module cbdc_puf_element__122
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
module cbdc_puf_element__123
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
module cbdc_puf_element__124
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
module cbdc_puf_element__125
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
module cbdc_puf_element__126
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
module cbdc_puf_element__127
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
module cbdc_puf_element__128
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
module cbdc_puf_element__129
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
module cbdc_puf_element__130
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
module cbdc_puf_element__131
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
module cbdc_puf_element__132
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
module cbdc_puf_element__133
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
module cbdc_puf_element__134
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
module cbdc_puf_element__135
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
module cbdc_puf_element__136
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
module cbdc_puf_element__137
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
module cbdc_puf_element__138
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
module cbdc_puf_element__139
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
module cbdc_puf_element__140
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
module cbdc_puf_element__141
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
module cbdc_puf_element__142
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
module cbdc_puf_element__143
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
module cbdc_puf_element__144
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
module cbdc_puf_element__145
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
module cbdc_puf_element__146
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
module cbdc_puf_element__147
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
module cbdc_puf_element__148
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
module cbdc_puf_element__149
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
module cbdc_puf_element__150
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
module cbdc_puf_element__151
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
module cbdc_puf_element__152
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
module cbdc_puf_element__153
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
module cbdc_puf_element__154
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
module cbdc_puf_element__155
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
module cbdc_puf_element__156
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
module cbdc_puf_element__157
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
module cbdc_puf_element__158
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
module cbdc_puf_element__159
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
module cbdc_puf_element__160
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
module cbdc_puf_element__161
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
module cbdc_puf_element__162
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
module cbdc_puf_element__163
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
module cbdc_puf_element__164
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
module cbdc_puf_element__165
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
module cbdc_puf_element__166
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
module cbdc_puf_element__167
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
module cbdc_puf_element__168
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
module cbdc_puf_element__169
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
module cbdc_puf_element__170
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
module cbdc_puf_element__171
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
module cbdc_puf_element__172
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
module cbdc_puf_element__173
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
module cbdc_puf_element__174
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
module cbdc_puf_element__175
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
module cbdc_puf_element__176
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
module cbdc_puf_element__177
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
module cbdc_puf_element__178
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
module cbdc_puf_element__179
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
module cbdc_puf_element__180
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
module cbdc_puf_element__181
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
module cbdc_puf_element__182
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
module cbdc_puf_element__183
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
module cbdc_puf_element__184
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
module cbdc_puf_element__185
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
module cbdc_puf_element__186
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
module cbdc_puf_element__187
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
module cbdc_puf_element__188
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
module cbdc_puf_element__189
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
module cbdc_puf_element__190
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
module cbdc_puf_element__191
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
module cbdc_puf_element__192
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
module cbdc_puf_element__193
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
module cbdc_puf_element__194
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
module cbdc_puf_element__195
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
module cbdc_puf_element__196
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
module cbdc_puf_element__197
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
module cbdc_puf_element__198
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
module cbdc_puf_element__199
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
module cbdc_puf_element__200
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
module cbdc_puf_element__201
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
module cbdc_puf_element__202
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
module cbdc_puf_element__203
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
module cbdc_puf_element__204
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
module cbdc_puf_element__205
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
module cbdc_puf_element__206
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
module cbdc_puf_element__207
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
module cbdc_puf_element__208
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
module cbdc_puf_element__209
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
module cbdc_puf_element__210
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
module cbdc_puf_element__211
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
module cbdc_puf_element__212
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
module cbdc_puf_element__213
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
module cbdc_puf_element__214
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
module cbdc_puf_element__215
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
module cbdc_puf_element__216
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
module cbdc_puf_element__217
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
module cbdc_puf_element__218
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
module cbdc_puf_element__219
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
module cbdc_puf_element__220
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
module cbdc_puf_element__221
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
module cbdc_puf_element__222
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
module cbdc_puf_element__223
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
module cbdc_puf_element__224
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
module cbdc_puf_element__225
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
module cbdc_puf_element__226
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
module cbdc_puf_element__227
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
module cbdc_puf_element__228
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
module cbdc_puf_element__229
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
module cbdc_puf_element__230
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
module cbdc_puf_element__231
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
module cbdc_puf_element__232
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
module cbdc_puf_element__233
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
module cbdc_puf_element__234
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
module cbdc_puf_element__235
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
module cbdc_puf_element__236
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
module cbdc_puf_element__237
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
module cbdc_puf_element__238
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
module cbdc_puf_element__239
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
module cbdc_puf_element__240
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
module cbdc_puf_element__241
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
module cbdc_puf_element__242
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
module cbdc_puf_element__243
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
module cbdc_puf_element__244
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
module cbdc_puf_element__245
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
module cbdc_puf_element__246
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
module cbdc_puf_element__247
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
module cbdc_puf_element__248
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
module cbdc_puf_element__249
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
module cbdc_puf_element__250
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
module cbdc_puf_element__251
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
module cbdc_puf_element__252
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
module cbdc_puf_element__253
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
module cbdc_puf_element__254
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
module cbdc_puf_element__255
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
module cbdc_puf_element__32
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
module cbdc_puf_element__33
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
module cbdc_puf_element__34
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
module cbdc_puf_element__35
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
module cbdc_puf_element__36
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
module cbdc_puf_element__37
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
module cbdc_puf_element__38
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
module cbdc_puf_element__39
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
module cbdc_puf_element__40
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
module cbdc_puf_element__41
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
module cbdc_puf_element__42
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
module cbdc_puf_element__43
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
module cbdc_puf_element__44
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
module cbdc_puf_element__45
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
module cbdc_puf_element__46
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
module cbdc_puf_element__47
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
module cbdc_puf_element__48
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
module cbdc_puf_element__49
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
module cbdc_puf_element__50
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
module cbdc_puf_element__51
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
module cbdc_puf_element__52
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
module cbdc_puf_element__53
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
module cbdc_puf_element__54
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
module cbdc_puf_element__55
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
module cbdc_puf_element__56
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
module cbdc_puf_element__57
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
module cbdc_puf_element__58
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
module cbdc_puf_element__59
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
module cbdc_puf_element__60
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
module cbdc_puf_element__61
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
module cbdc_puf_element__62
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
module cbdc_puf_element__63
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
module cbdc_puf_element__64
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
module cbdc_puf_element__65
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
module cbdc_puf_element__66
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
module cbdc_puf_element__67
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
module cbdc_puf_element__68
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
module cbdc_puf_element__69
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
module cbdc_puf_element__70
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
module cbdc_puf_element__71
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
module cbdc_puf_element__72
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
module cbdc_puf_element__73
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
module cbdc_puf_element__74
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
module cbdc_puf_element__75
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
module cbdc_puf_element__76
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
module cbdc_puf_element__77
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
module cbdc_puf_element__78
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
module cbdc_puf_element__79
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
module cbdc_puf_element__80
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
module cbdc_puf_element__81
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
module cbdc_puf_element__82
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
module cbdc_puf_element__83
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
module cbdc_puf_element__84
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
module cbdc_puf_element__85
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
module cbdc_puf_element__86
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
module cbdc_puf_element__87
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
module cbdc_puf_element__88
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
module cbdc_puf_element__89
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

(* ELEMENT_STYLE = "0" *) (* ORIG_REF_NAME = "cbdc_puf_element" *) 
module cbdc_puf_element__90
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
module cbdc_puf_element__91
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
module cbdc_puf_element__92
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
module cbdc_puf_element__93
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
module cbdc_puf_element__94
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
module cbdc_puf_element__95
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
module cbdc_puf_element__96
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
module cbdc_puf_element__97
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
module cbdc_puf_element__98
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
module cbdc_puf_element__99
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

module cbdc_serial_engine
   (clk,
    reset,
    start,
    challenge,
    valid,
    error,
    busy,
    response,
    .edges({e2[1],e2[0]}));
  input clk;
  input reset;
  input start;
  input [15:0]challenge;
  output valid;
  output error;
  output busy;
  output response;
     output [1:0]e2;

  wire \<const1> ;
  wire busy;
  wire [15:0]c;
  wire [15:0]challenge;
  wire clk;
  wire clr;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e2;
  wire excite;
  wire q;
  wire qb_seen;
  wire qu_seen;
  wire reset;
  wire response;
  wire start;
  wire valid;

  VCC VCC
       (.P(\<const1> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qb_seen),
        .Q(e1[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qu_seen),
        .Q(e1[1]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[0]),
        .Q(e2[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[1]),
        .Q(e2[1]),
        .R(reset));
  (* AUTO_PARITY = "1" *) 
  (* CAPTURE_MODE = "1" *) 
  (* CROSS_COUPLE = "1" *) 
  (* DIAGNOSTIC = "1" *) 
  (* DUAL_ARBITER = "1" *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_core u_core
       (.c(c),
        .clr(clr),
        .excite(excite),
        .q(q),
        .qb_capture_seen_o(qb_seen),
        .qu_capture_seen_o(qu_seen));
  (* AUTO_PARITY = "1" *) 
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
        .puf_q_i(q),
        .resp_bit_o(response),
        .resp_valid_o(valid),
        .rst_n(reset),
        .start_i(start));
endmodule

(* ORIG_REF_NAME = "cbdc_serial_engine" *) 
module cbdc_serial_engine__1
   (clk,
    reset,
    start,
    challenge,
    valid,
    error,
    busy,
    response,
    .edges({e2[1],e2[0]}));
  input clk;
  input reset;
  input start;
  input [15:0]challenge;
  output valid;
  output error;
  output busy;
  output response;
     output [1:0]e2;

  wire \<const1> ;
  wire busy;
  wire [15:0]c;
  wire [15:0]challenge;
  wire clk;
  wire clr;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e2;
  wire excite;
  wire q;
  wire qb_seen;
  wire qu_seen;
  wire reset;
  wire response;
  wire start;
  wire valid;

  VCC VCC
       (.P(\<const1> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qb_seen),
        .Q(e1[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qu_seen),
        .Q(e1[1]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[0]),
        .Q(e2[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[1]),
        .Q(e2[1]),
        .R(reset));
  (* AUTO_PARITY = "1" *) 
  (* CAPTURE_MODE = "1" *) 
  (* CROSS_COUPLE = "1" *) 
  (* DIAGNOSTIC = "1" *) 
  (* DUAL_ARBITER = "1" *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_core__1 u_core
       (.c(c),
        .clr(clr),
        .excite(excite),
        .q(q),
        .qb_capture_seen_o(qb_seen),
        .qu_capture_seen_o(qu_seen));
  (* AUTO_PARITY = "1" *) 
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
  cbdc_puf_ctrl__1 u_ctrl
       (.busy_o(busy),
        .challenge_i(challenge),
        .clk(clk),
        .puf_c_o(c),
        .puf_clr_o(clr),
        .puf_excite_o(excite),
        .puf_q_i(q),
        .resp_bit_o(response),
        .resp_valid_o(valid),
        .rst_n(reset),
        .start_i(start));
endmodule

(* ORIG_REF_NAME = "cbdc_serial_engine" *) 
module cbdc_serial_engine__2
   (clk,
    reset,
    start,
    challenge,
    valid,
    error,
    busy,
    response,
    .edges({e2[1],e2[0]}));
  input clk;
  input reset;
  input start;
  input [15:0]challenge;
  output valid;
  output error;
  output busy;
  output response;
     output [1:0]e2;

  wire \<const1> ;
  wire busy;
  wire [15:0]c;
  wire [15:0]challenge;
  wire clk;
  wire clr;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e2;
  wire excite;
  wire q;
  wire qb_seen;
  wire qu_seen;
  wire reset;
  wire response;
  wire start;
  wire valid;

  VCC VCC
       (.P(\<const1> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qb_seen),
        .Q(e1[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qu_seen),
        .Q(e1[1]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[0]),
        .Q(e2[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[1]),
        .Q(e2[1]),
        .R(reset));
  (* AUTO_PARITY = "1" *) 
  (* CAPTURE_MODE = "1" *) 
  (* CROSS_COUPLE = "1" *) 
  (* DIAGNOSTIC = "1" *) 
  (* DUAL_ARBITER = "1" *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_core__2 u_core
       (.c(c),
        .clr(clr),
        .excite(excite),
        .q(q),
        .qb_capture_seen_o(qb_seen),
        .qu_capture_seen_o(qu_seen));
  (* AUTO_PARITY = "1" *) 
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
  cbdc_puf_ctrl__2 u_ctrl
       (.busy_o(busy),
        .challenge_i(challenge),
        .clk(clk),
        .puf_c_o(c),
        .puf_clr_o(clr),
        .puf_excite_o(excite),
        .puf_q_i(q),
        .resp_bit_o(response),
        .resp_valid_o(valid),
        .rst_n(reset),
        .start_i(start));
endmodule

(* ORIG_REF_NAME = "cbdc_serial_engine" *) 
module cbdc_serial_engine__3
   (clk,
    reset,
    start,
    challenge,
    valid,
    error,
    busy,
    response,
    .edges({e2[1],e2[0]}));
  input clk;
  input reset;
  input start;
  input [15:0]challenge;
  output valid;
  output error;
  output busy;
  output response;
     output [1:0]e2;

  wire \<const1> ;
  wire busy;
  wire [15:0]c;
  wire [15:0]challenge;
  wire clk;
  wire clr;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e2;
  wire excite;
  wire q;
  wire qb_seen;
  wire qu_seen;
  wire reset;
  wire response;
  wire start;
  wire valid;

  VCC VCC
       (.P(\<const1> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qb_seen),
        .Q(e1[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qu_seen),
        .Q(e1[1]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[0]),
        .Q(e2[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[1]),
        .Q(e2[1]),
        .R(reset));
  (* AUTO_PARITY = "1" *) 
  (* CAPTURE_MODE = "1" *) 
  (* CROSS_COUPLE = "1" *) 
  (* DIAGNOSTIC = "1" *) 
  (* DUAL_ARBITER = "1" *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_core__3 u_core
       (.c(c),
        .clr(clr),
        .excite(excite),
        .q(q),
        .qb_capture_seen_o(qb_seen),
        .qu_capture_seen_o(qu_seen));
  (* AUTO_PARITY = "1" *) 
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
  cbdc_puf_ctrl__3 u_ctrl
       (.busy_o(busy),
        .challenge_i(challenge),
        .clk(clk),
        .puf_c_o(c),
        .puf_clr_o(clr),
        .puf_excite_o(excite),
        .puf_q_i(q),
        .resp_bit_o(response),
        .resp_valid_o(valid),
        .rst_n(reset),
        .start_i(start));
endmodule

(* ORIG_REF_NAME = "cbdc_serial_engine" *) 
module cbdc_serial_engine__4
   (clk,
    reset,
    start,
    challenge,
    valid,
    error,
    busy,
    response,
    .edges({e2[1],e2[0]}));
  input clk;
  input reset;
  input start;
  input [15:0]challenge;
  output valid;
  output error;
  output busy;
  output response;
     output [1:0]e2;

  wire \<const1> ;
  wire busy;
  wire [15:0]c;
  wire [15:0]challenge;
  wire clk;
  wire clr;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e2;
  wire excite;
  wire q;
  wire qb_seen;
  wire qu_seen;
  wire reset;
  wire response;
  wire start;
  wire valid;

  VCC VCC
       (.P(\<const1> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qb_seen),
        .Q(e1[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qu_seen),
        .Q(e1[1]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[0]),
        .Q(e2[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[1]),
        .Q(e2[1]),
        .R(reset));
  (* AUTO_PARITY = "1" *) 
  (* CAPTURE_MODE = "1" *) 
  (* CROSS_COUPLE = "1" *) 
  (* DIAGNOSTIC = "1" *) 
  (* DUAL_ARBITER = "1" *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_core__4 u_core
       (.c(c),
        .clr(clr),
        .excite(excite),
        .q(q),
        .qb_capture_seen_o(qb_seen),
        .qu_capture_seen_o(qu_seen));
  (* AUTO_PARITY = "1" *) 
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
  cbdc_puf_ctrl__4 u_ctrl
       (.busy_o(busy),
        .challenge_i(challenge),
        .clk(clk),
        .puf_c_o(c),
        .puf_clr_o(clr),
        .puf_excite_o(excite),
        .puf_q_i(q),
        .resp_bit_o(response),
        .resp_valid_o(valid),
        .rst_n(reset),
        .start_i(start));
endmodule

(* ORIG_REF_NAME = "cbdc_serial_engine" *) 
module cbdc_serial_engine__5
   (clk,
    reset,
    start,
    challenge,
    valid,
    error,
    busy,
    response,
    .edges({e2[1],e2[0]}));
  input clk;
  input reset;
  input start;
  input [15:0]challenge;
  output valid;
  output error;
  output busy;
  output response;
     output [1:0]e2;

  wire \<const1> ;
  wire busy;
  wire [15:0]c;
  wire [15:0]challenge;
  wire clk;
  wire clr;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e2;
  wire excite;
  wire q;
  wire qb_seen;
  wire qu_seen;
  wire reset;
  wire response;
  wire start;
  wire valid;

  VCC VCC
       (.P(\<const1> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qb_seen),
        .Q(e1[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qu_seen),
        .Q(e1[1]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[0]),
        .Q(e2[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[1]),
        .Q(e2[1]),
        .R(reset));
  (* AUTO_PARITY = "1" *) 
  (* CAPTURE_MODE = "1" *) 
  (* CROSS_COUPLE = "1" *) 
  (* DIAGNOSTIC = "1" *) 
  (* DUAL_ARBITER = "1" *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_core__5 u_core
       (.c(c),
        .clr(clr),
        .excite(excite),
        .q(q),
        .qb_capture_seen_o(qb_seen),
        .qu_capture_seen_o(qu_seen));
  (* AUTO_PARITY = "1" *) 
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
  cbdc_puf_ctrl__5 u_ctrl
       (.busy_o(busy),
        .challenge_i(challenge),
        .clk(clk),
        .puf_c_o(c),
        .puf_clr_o(clr),
        .puf_excite_o(excite),
        .puf_q_i(q),
        .resp_bit_o(response),
        .resp_valid_o(valid),
        .rst_n(reset),
        .start_i(start));
endmodule

(* ORIG_REF_NAME = "cbdc_serial_engine" *) 
module cbdc_serial_engine__6
   (clk,
    reset,
    start,
    challenge,
    valid,
    error,
    busy,
    response,
    .edges({e2[1],e2[0]}));
  input clk;
  input reset;
  input start;
  input [15:0]challenge;
  output valid;
  output error;
  output busy;
  output response;
     output [1:0]e2;

  wire \<const1> ;
  wire busy;
  wire [15:0]c;
  wire [15:0]challenge;
  wire clk;
  wire clr;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e2;
  wire excite;
  wire q;
  wire qb_seen;
  wire qu_seen;
  wire reset;
  wire response;
  wire start;
  wire valid;

  VCC VCC
       (.P(\<const1> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qb_seen),
        .Q(e1[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qu_seen),
        .Q(e1[1]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[0]),
        .Q(e2[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[1]),
        .Q(e2[1]),
        .R(reset));
  (* AUTO_PARITY = "1" *) 
  (* CAPTURE_MODE = "1" *) 
  (* CROSS_COUPLE = "1" *) 
  (* DIAGNOSTIC = "1" *) 
  (* DUAL_ARBITER = "1" *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_core__6 u_core
       (.c(c),
        .clr(clr),
        .excite(excite),
        .q(q),
        .qb_capture_seen_o(qb_seen),
        .qu_capture_seen_o(qu_seen));
  (* AUTO_PARITY = "1" *) 
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
  cbdc_puf_ctrl__6 u_ctrl
       (.busy_o(busy),
        .challenge_i(challenge),
        .clk(clk),
        .puf_c_o(c),
        .puf_clr_o(clr),
        .puf_excite_o(excite),
        .puf_q_i(q),
        .resp_bit_o(response),
        .resp_valid_o(valid),
        .rst_n(reset),
        .start_i(start));
endmodule

(* ORIG_REF_NAME = "cbdc_serial_engine" *) 
module cbdc_serial_engine__7
   (clk,
    reset,
    start,
    challenge,
    valid,
    error,
    busy,
    response,
    .edges({e2[1],e2[0]}));
  input clk;
  input reset;
  input start;
  input [15:0]challenge;
  output valid;
  output error;
  output busy;
  output response;
     output [1:0]e2;

  wire \<const1> ;
  wire busy;
  wire [15:0]c;
  wire [15:0]challenge;
  wire clk;
  wire clr;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e1;
  (* async_reg = "true" *) (* shreg_extract = "no" *) wire [1:0]e2;
  wire excite;
  wire q;
  wire qb_seen;
  wire qu_seen;
  wire reset;
  wire response;
  wire start;
  wire valid;

  VCC VCC
       (.P(\<const1> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qb_seen),
        .Q(e1[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e1_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(qu_seen),
        .Q(e1[1]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[0]),
        .Q(e2[0]),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHREG_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    \e2_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(e1[1]),
        .Q(e2[1]),
        .R(reset));
  (* AUTO_PARITY = "1" *) 
  (* CAPTURE_MODE = "1" *) 
  (* CROSS_COUPLE = "1" *) 
  (* DIAGNOSTIC = "1" *) 
  (* DUAL_ARBITER = "1" *) 
  (* ELEMENT_STYLE = "0" *) 
  (* GATE_INIT = "4'b1000" *) 
  (* N_STAGES = "16" *) 
  cbdc_puf_core__7 u_core
       (.c(c),
        .clr(clr),
        .excite(excite),
        .q(q),
        .qb_capture_seen_o(qb_seen),
        .qu_capture_seen_o(qu_seen));
  (* AUTO_PARITY = "1" *) 
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
  cbdc_puf_ctrl__7 u_ctrl
       (.busy_o(busy),
        .challenge_i(challenge),
        .clk(clk),
        .puf_c_o(c),
        .puf_clr_o(clr),
        .puf_excite_o(excite),
        .puf_q_i(q),
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
  (* \PinAttr:I2:HOLD_DETOUR  = "193" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \rbit[0]_i_1 
       (.I0(rs[1]),
        .I1(\rbit_reg_n_0_[0] ),
        .O(\rbit[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \rbit[1]_i_1 
       (.I0(\rbit_reg_n_0_[0] ),
        .I1(rs[1]),
        .I2(\rbit_reg_n_0_[1] ),
        .O(\rbit[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[1]_i_1 
       (.I0(shift[2]),
        .I1(busy),
        .I2(tx_data[0]),
        .O(\shift[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[2]_i_1 
       (.I0(shift[3]),
        .I1(busy),
        .I2(tx_data[1]),
        .O(\shift[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[3]_i_1 
       (.I0(shift[4]),
        .I1(busy),
        .I2(tx_data[2]),
        .O(\shift[3]_i_1_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "199" *) 
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[4]_i_1 
       (.I0(shift[5]),
        .I1(busy),
        .I2(tx_data[3]),
        .O(\shift[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[5]_i_1 
       (.I0(shift[6]),
        .I1(busy),
        .I2(tx_data[4]),
        .O(\shift[5]_i_1_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "158" *) 
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift[6]_i_1 
       (.I0(shift[7]),
        .I1(busy),
        .I2(tx_data[5]),
        .O(\shift[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tbit[1]_i_1 
       (.I0(tbit_reg[0]),
        .I1(tbit_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
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
  (* \PinAttr:I3:HOLD_DETOUR  = "193" *) 
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
