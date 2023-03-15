
///////////////////////////////////////////
// popccnt.sv
// Written: Kevin Kim <kekim@hmc.edu>
// Modified: 2/4/2023
//
// Purpose: Population Count
// 
// A component of the CORE-V-WALLY configurable RISC-V project.
// 
// Copyright (C) 2021-23 Harvey Mudd College & Oklahoma State University
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file 
// except in compliance with the License, or, at your option, the Apache License version 2.0. You 
// may obtain a copy of the License at
//
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the 
// License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
// either express or implied. See the License for the specific language governing permissions 
// and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////

module popcntcsa #(parameter WIDTH = 32) (
  input logic  [WIDTH-1:0]            a,    // number to count total ones
  output logic [$clog2(WIDTH):0]  s  // the total number of ones
);
if (WIDTH == 8)begin

  assign {w0_0_7, w0_0_6, w0_0_5, w0_0_4, w0_0_3, w0_0_2, w0_0_1, w0_0_0} = a;
  logic w1_0_0;
  logic w0_1_15;
  csan csan0_0_7_0_0_6_0_0_5(w0_0_7, w0_0_6, w0_0_5, w1_0_0, w0_1_15);
  logic w1_0_1;
  logic w0_1_12;
  csan csan0_0_4_0_0_3_0_0_2(w0_0_4, w0_0_3, w0_0_2, w1_0_1, w0_1_12);
  logic w1_0_2;
  logic w0_2_9;
  csan csan0_0_1_0_0_0_0_1_15(w0_0_1, w0_0_0, w0_1_15, w1_0_2, w0_2_9);
  logic w1_0_3;
  logic w0_3_20;
  csan2 csan0_1_12_0_2_9_X_X_X(w0_1_12, w0_2_9, w1_0_3, w0_3_20);
  assign s0 = w0_3_20;
  logic w2_0_0;
  logic w1_1_8;
  csan csan1_0_0_1_0_1_1_0_2(w1_0_0, w1_0_1, w1_0_2, w2_0_0, w1_1_8);
  logic w2_0_1;
  logic w1_2_11;
  csan2 csan1_0_3_1_1_8_X_X_X(w1_0_3, w1_1_8, w2_0_1, w1_2_11);
  assign s1 = w1_2_11;
  logic w3_0_0;
  logic w2_1_8;
  csan2 csan2_0_0_2_0_1_X_X_X(w2_0_0, w2_0_1, w3_0_0, w2_1_8);
  assign s2 = w2_1_8;
  assign s3 = w3_0_0; 
  assign s = {s3,s2,s1,s0};
end
else if (WIDTH == 16) begin

  assign {w0_0_15, w0_0_14, w0_0_13, w0_0_12, w0_0_11, w0_0_10, w0_0_9, w0_0_8, w0_0_7, w0_0_6, w0_0_5, w0_0_4, w0_0_3, w0_0_2, w0_0_1, w0_0_0} = a;
  logic w1_0_0;
  logic w0_1_31;
  csan csan0_0_15_0_0_14_0_0_13(w0_0_15, w0_0_14, w0_0_13, w1_0_0, w0_1_31);
  logic w1_0_1;
  logic w0_1_28;
  csan csan0_0_12_0_0_11_0_0_10(w0_0_12, w0_0_11, w0_0_10, w1_0_1, w0_1_28);
  logic w1_0_2;
  logic w0_1_25;
  csan csan0_0_9_0_0_8_0_0_7(w0_0_9, w0_0_8, w0_0_7, w1_0_2, w0_1_25);
  logic w1_0_3;
  logic w0_1_22;
  csan csan0_0_6_0_0_5_0_0_4(w0_0_6, w0_0_5, w0_0_4, w1_0_3, w0_1_22);
  logic w1_0_4;
  logic w0_1_19;
  csan csan0_0_3_0_0_2_0_0_1(w0_0_3, w0_0_2, w0_0_1, w1_0_4, w0_1_19);
  logic w1_0_5;
  logic w0_2_16;
  csan csan0_0_0_0_1_31_0_1_28(w0_0_0, w0_1_31, w0_1_28, w1_0_5, w0_2_16);
  logic w1_0_6;
  logic w0_2_41;
  csan csan0_1_25_0_1_22_0_1_19(w0_1_25, w0_1_22, w0_1_19, w1_0_6, w0_2_41);
  logic w1_0_7;
  logic w0_3_32;
  csan2 csan0_2_16_0_2_41_X_X_X(w0_2_16, w0_2_41, w1_0_7, w0_3_32);
  assign s0 = w0_3_32;
  logic w2_0_0;
  logic w1_1_16;
  csan csan1_0_0_1_0_1_1_0_2(w1_0_0, w1_0_1, w1_0_2, w2_0_0, w1_1_16);
  logic w2_0_1;
  logic w1_1_19;
  csan csan1_0_3_1_0_4_1_0_5(w1_0_3, w1_0_4, w1_0_5, w2_0_1, w1_1_19);
  logic w2_0_2;
  logic w1_2_22;
  csan csan1_0_6_1_0_7_1_1_16(w1_0_6, w1_0_7, w1_1_16, w2_0_2, w1_2_22);
  logic w2_0_3;
  logic w1_3_35;
  csan2 csan1_1_19_1_2_22_X_X_X(w1_1_19, w1_2_22, w2_0_3, w1_3_35);
  assign s1 = w1_3_35;
  logic w3_0_0;
  logic w2_1_16;
  csan csan2_0_0_2_0_1_2_0_2(w2_0_0, w2_0_1, w2_0_2, w3_0_0, w2_1_16);
  logic w3_0_1;
  logic w2_2_19;
  csan2 csan2_0_3_2_1_16_X_X_X(w2_0_3, w2_1_16, w3_0_1, w2_2_19);
  assign s2 = w2_2_19;
  logic w4_0_0;
  logic w3_1_16;
  csan2 csan3_0_0_3_0_1_X_X_X(w3_0_0, w3_0_1, w4_0_0, w3_1_16);
  assign s3 = w3_1_16;
  assign s4 = w4_0_0;
  assign s = {s4,s3,s2,s1,s0};
end
else if (WIDTH == 32) begin
  assign {w0_0_31, w0_0_30, w0_0_29, w0_0_28, w0_0_27, w0_0_26, w0_0_25, w0_0_24, w0_0_23, w0_0_22, w0_0_21, w0_0_20, w0_0_19, w0_0_18, w0_0_17, w0_0_16, w0_0_15, w0_0_14, w0_0_13, w0_0_12, w0_0_11, w0_0_10, w0_0_9, w0_0_8, w0_0_7, w0_0_6, w0_0_5, w0_0_4, w0_0_3, w0_0_2, w0_0_1, w0_0_0} = a;
  logic w1_0_0;
  logic w0_1_63;
  csan csan0_0_31_0_0_30_0_0_29(w0_0_31, w0_0_30, w0_0_29, w1_0_0, w0_1_63);
  logic w1_0_1;
  logic w0_1_60;
  csan csan0_0_28_0_0_27_0_0_26(w0_0_28, w0_0_27, w0_0_26, w1_0_1, w0_1_60);
  logic w1_0_2;
  logic w0_1_57;
  csan csan0_0_25_0_0_24_0_0_23(w0_0_25, w0_0_24, w0_0_23, w1_0_2, w0_1_57);
  logic w1_0_3;
  logic w0_1_54;
  csan csan0_0_22_0_0_21_0_0_20(w0_0_22, w0_0_21, w0_0_20, w1_0_3, w0_1_54);
  logic w1_0_4;
  logic w0_1_51;
  csan csan0_0_19_0_0_18_0_0_17(w0_0_19, w0_0_18, w0_0_17, w1_0_4, w0_1_51);
  logic w1_0_5;
  logic w0_1_48;
  csan csan0_0_16_0_0_15_0_0_14(w0_0_16, w0_0_15, w0_0_14, w1_0_5, w0_1_48);
  logic w1_0_6;
  logic w0_1_45;
  csan csan0_0_13_0_0_12_0_0_11(w0_0_13, w0_0_12, w0_0_11, w1_0_6, w0_1_45);
  logic w1_0_7;
  logic w0_1_42;
  csan csan0_0_10_0_0_9_0_0_8(w0_0_10, w0_0_9, w0_0_8, w1_0_7, w0_1_42);
  logic w1_0_8;
  logic w0_1_39;
  csan csan0_0_7_0_0_6_0_0_5(w0_0_7, w0_0_6, w0_0_5, w1_0_8, w0_1_39);
  logic w1_0_9;
  logic w0_1_36;
  csan csan0_0_4_0_0_3_0_0_2(w0_0_4, w0_0_3, w0_0_2, w1_0_9, w0_1_36);
  logic w1_0_10;
  logic w0_2_33;
  csan csan0_0_1_0_0_0_0_1_63(w0_0_1, w0_0_0, w0_1_63, w1_0_10, w0_2_33);
  logic w1_0_11;
  logic w0_2_92;
  csan csan0_1_60_0_1_57_0_1_54(w0_1_60, w0_1_57, w0_1_54, w1_0_11, w0_2_92);
  logic w1_0_12;
  logic w0_2_83;
  csan csan0_1_51_0_1_48_0_1_45(w0_1_51, w0_1_48, w0_1_45, w1_0_12, w0_2_83);
  logic w1_0_13;
  logic w0_2_74;
  csan csan0_1_42_0_1_39_0_1_36(w0_1_42, w0_1_39, w0_1_36, w1_0_13, w0_2_74);
  logic w1_0_14;
  logic w0_3_65;
  csan csan0_2_33_0_2_92_0_2_83(w0_2_33, w0_2_92, w0_2_83, w1_0_14, w0_3_65);
  logic w1_0_15;
  logic w0_4_106;
  csan2 csan0_2_74_0_3_65_X_X_X(w0_2_74, w0_3_65, w1_0_15, w0_4_106);
  assign s0 = w0_4_106;
  logic w2_0_0;
  logic w1_1_32;
  csan csan1_0_0_1_0_1_1_0_2(w1_0_0, w1_0_1, w1_0_2, w2_0_0, w1_1_32);
  logic w2_0_1;
  logic w1_1_35;
  csan csan1_0_3_1_0_4_1_0_5(w1_0_3, w1_0_4, w1_0_5, w2_0_1, w1_1_35);
  logic w2_0_2;
  logic w1_1_38;
  csan csan1_0_6_1_0_7_1_0_8(w1_0_6, w1_0_7, w1_0_8, w2_0_2, w1_1_38);
  logic w2_0_3;
  logic w1_1_41;
  csan csan1_0_9_1_0_10_1_0_11(w1_0_9, w1_0_10, w1_0_11, w2_0_3, w1_1_41);
  logic w2_0_4;
  logic w1_1_44;
  csan csan1_0_12_1_0_13_1_0_14(w1_0_12, w1_0_13, w1_0_14, w2_0_4, w1_1_44);
  logic w2_0_5;
  logic w1_2_47;
  csan csan1_0_15_1_1_32_1_1_35(w1_0_15, w1_1_32, w1_1_35, w2_0_5, w1_2_47);
  logic w2_0_6;
  logic w1_2_70;
  csan csan1_1_38_1_1_41_1_1_44(w1_1_38, w1_1_41, w1_1_44, w2_0_6, w1_2_70);
  logic w2_0_7;
  logic w1_3_79;
  csan2 csan1_2_47_1_2_70_X_X_X(w1_2_47, w1_2_70, w2_0_7, w1_3_79);
  assign s1 = w1_3_79;
  logic w3_0_0;
  logic w2_1_32;
  csan csan2_0_0_2_0_1_2_0_2(w2_0_0, w2_0_1, w2_0_2, w3_0_0, w2_1_32);
  logic w3_0_1;
  logic w2_1_35;
  csan csan2_0_3_2_0_4_2_0_5(w2_0_3, w2_0_4, w2_0_5, w3_0_1, w2_1_35);
  logic w3_0_2;
  logic w2_2_38;
  csan csan2_0_6_2_0_7_2_1_32(w2_0_6, w2_0_7, w2_1_32, w3_0_2, w2_2_38);
  logic w3_0_3;
  logic w2_3_67;
  csan2 csan2_1_35_2_2_38_X_X_X(w2_1_35, w2_2_38, w3_0_3, w2_3_67);
  assign s2 = w2_3_67;
  logic w4_0_0;
  logic w3_1_32;
  csan csan3_0_0_3_0_1_3_0_2(w3_0_0, w3_0_1, w3_0_2, w4_0_0, w3_1_32);
  logic w4_0_1;
  logic w3_2_35;
  csan2 csan3_0_3_3_1_32_X_X_X(w3_0_3, w3_1_32, w4_0_1, w3_2_35);
  assign s3 = w3_2_35;
  logic w5_0_0;
  logic w4_1_32;
  csan2 csan4_0_0_4_0_1_X_X_X(w4_0_0, w4_0_1, w5_0_0, w4_1_32);
  assign s4 = w4_1_32;
  assign s5 = w5_0_0;
  assign s = {s5, s4, s3, s2, s1, s0};
end else begin

  assign {w0_0_63, w0_0_62, w0_0_61, w0_0_60, w0_0_59, w0_0_58, w0_0_57, w0_0_56, w0_0_55, w0_0_54, w0_0_53, w0_0_52, w0_0_51, w0_0_50, w0_0_49, w0_0_48, w0_0_47, w0_0_46, w0_0_45, w0_0_44, w0_0_43, w0_0_42, w0_0_41, w0_0_40, w0_0_39, w0_0_38, w0_0_37, w0_0_36, w0_0_35, w0_0_34, w0_0_33, w0_0_32, w0_0_31, w0_0_30, w0_0_29, w0_0_28, w0_0_27, w0_0_26, w0_0_25, w0_0_24, w0_0_23, w0_0_22, w0_0_21, w0_0_20, w0_0_19, w0_0_18, w0_0_17, w0_0_16, w0_0_15, w0_0_14, w0_0_13, w0_0_12, w0_0_11, w0_0_10, w0_0_9, w0_0_8, w0_0_7, w0_0_6, w0_0_5, w0_0_4, w0_0_3, w0_0_2, w0_0_1, w0_0_0} = a;
  logic w1_0_0;
  logic w0_1_127;
  csan csan0_0_63_0_0_62_0_0_61(w0_0_63, w0_0_62, w0_0_61, w1_0_0, w0_1_127);
  logic w1_0_1;
  logic w0_1_124;
  csan csan0_0_60_0_0_59_0_0_58(w0_0_60, w0_0_59, w0_0_58, w1_0_1, w0_1_124);
  logic w1_0_2;
  logic w0_1_121;
  csan csan0_0_57_0_0_56_0_0_55(w0_0_57, w0_0_56, w0_0_55, w1_0_2, w0_1_121);
  logic w1_0_3;
  logic w0_1_118;
  csan csan0_0_54_0_0_53_0_0_52(w0_0_54, w0_0_53, w0_0_52, w1_0_3, w0_1_118);
  logic w1_0_4;
  logic w0_1_115;
  csan csan0_0_51_0_0_50_0_0_49(w0_0_51, w0_0_50, w0_0_49, w1_0_4, w0_1_115);
  logic w1_0_5;
  logic w0_1_112;
  csan csan0_0_48_0_0_47_0_0_46(w0_0_48, w0_0_47, w0_0_46, w1_0_5, w0_1_112);
  logic w1_0_6;
  logic w0_1_109;
  csan csan0_0_45_0_0_44_0_0_43(w0_0_45, w0_0_44, w0_0_43, w1_0_6, w0_1_109);
  logic w1_0_7;
  logic w0_1_106;
  csan csan0_0_42_0_0_41_0_0_40(w0_0_42, w0_0_41, w0_0_40, w1_0_7, w0_1_106);
  logic w1_0_8;
  logic w0_1_103;
  csan csan0_0_39_0_0_38_0_0_37(w0_0_39, w0_0_38, w0_0_37, w1_0_8, w0_1_103);
  logic w1_0_9;
  logic w0_1_100;
  csan csan0_0_36_0_0_35_0_0_34(w0_0_36, w0_0_35, w0_0_34, w1_0_9, w0_1_100);
  logic w1_0_10;
  logic w0_1_97;
  csan csan0_0_33_0_0_32_0_0_31(w0_0_33, w0_0_32, w0_0_31, w1_0_10, w0_1_97);
  logic w1_0_11;
  logic w0_1_94;
  csan csan0_0_30_0_0_29_0_0_28(w0_0_30, w0_0_29, w0_0_28, w1_0_11, w0_1_94);
  logic w1_0_12;
  logic w0_1_91;
  csan csan0_0_27_0_0_26_0_0_25(w0_0_27, w0_0_26, w0_0_25, w1_0_12, w0_1_91);
  logic w1_0_13;
  logic w0_1_88;
  csan csan0_0_24_0_0_23_0_0_22(w0_0_24, w0_0_23, w0_0_22, w1_0_13, w0_1_88);
  logic w1_0_14;
  logic w0_1_85;
  csan csan0_0_21_0_0_20_0_0_19(w0_0_21, w0_0_20, w0_0_19, w1_0_14, w0_1_85);
  logic w1_0_15;
  logic w0_1_82;
  csan csan0_0_18_0_0_17_0_0_16(w0_0_18, w0_0_17, w0_0_16, w1_0_15, w0_1_82);
  logic w1_0_16;
  logic w0_1_79;
  csan csan0_0_15_0_0_14_0_0_13(w0_0_15, w0_0_14, w0_0_13, w1_0_16, w0_1_79);
  logic w1_0_17;
  logic w0_1_76;
  csan csan0_0_12_0_0_11_0_0_10(w0_0_12, w0_0_11, w0_0_10, w1_0_17, w0_1_76);
  logic w1_0_18;
  logic w0_1_73;
  csan csan0_0_9_0_0_8_0_0_7(w0_0_9, w0_0_8, w0_0_7, w1_0_18, w0_1_73);
  logic w1_0_19;
  logic w0_1_70;
  csan csan0_0_6_0_0_5_0_0_4(w0_0_6, w0_0_5, w0_0_4, w1_0_19, w0_1_70);
  logic w1_0_20;
  logic w0_1_67;
  csan csan0_0_3_0_0_2_0_0_1(w0_0_3, w0_0_2, w0_0_1, w1_0_20, w0_1_67);
  logic w1_0_21;
  logic w0_2_64;
  csan csan0_0_0_0_1_127_0_1_124(w0_0_0, w0_1_127, w0_1_124, w1_0_21, w0_2_64);
  logic w1_0_22;
  logic w0_2_185;
  csan csan0_1_121_0_1_118_0_1_115(w0_1_121, w0_1_118, w0_1_115, w1_0_22, w0_2_185);
  logic w1_0_23;
  logic w0_2_176;
  csan csan0_1_112_0_1_109_0_1_106(w0_1_112, w0_1_109, w0_1_106, w1_0_23, w0_2_176);
  logic w1_0_24;
  logic w0_2_167;
  csan csan0_1_103_0_1_100_0_1_97(w0_1_103, w0_1_100, w0_1_97, w1_0_24, w0_2_167);
  logic w1_0_25;
  logic w0_2_158;
  csan csan0_1_94_0_1_91_0_1_88(w0_1_94, w0_1_91, w0_1_88, w1_0_25, w0_2_158);
  logic w1_0_26;
  logic w0_2_149;
  csan csan0_1_85_0_1_82_0_1_79(w0_1_85, w0_1_82, w0_1_79, w1_0_26, w0_2_149);
  logic w1_0_27;
  logic w0_2_140;
  csan csan0_1_76_0_1_73_0_1_70(w0_1_76, w0_1_73, w0_1_70, w1_0_27, w0_2_140);
  logic w1_0_28;
  logic w0_3_131;
  csan csan0_1_67_0_2_64_0_2_185(w0_1_67, w0_2_64, w0_2_185, w1_0_28, w0_3_131);
  logic w1_0_29;
  logic w0_3_240;
  csan csan0_2_176_0_2_167_0_2_158(w0_2_176, w0_2_167, w0_2_158, w1_0_29, w0_3_240);
  logic w1_0_30;
  logic w0_4_213;
  csan csan0_2_149_0_2_140_0_3_131(w0_2_149, w0_2_140, w0_3_131, w1_0_30, w0_4_213);
  logic w1_0_31;
  logic w0_5_304;
  csan2 csan0_3_240_0_4_213_X_X_X(w0_3_240, w0_4_213, w1_0_31, w0_5_304);
  assign s0 = w0_5_304;
  logic w2_0_0;
  logic w1_1_64;
  csan csan1_0_0_1_0_1_1_0_2(w1_0_0, w1_0_1, w1_0_2, w2_0_0, w1_1_64);
  logic w2_0_1;
  logic w1_1_67;
  csan csan1_0_3_1_0_4_1_0_5(w1_0_3, w1_0_4, w1_0_5, w2_0_1, w1_1_67);
  logic w2_0_2;
  logic w1_1_70;
  csan csan1_0_6_1_0_7_1_0_8(w1_0_6, w1_0_7, w1_0_8, w2_0_2, w1_1_70);
  logic w2_0_3;
  logic w1_1_73;
  csan csan1_0_9_1_0_10_1_0_11(w1_0_9, w1_0_10, w1_0_11, w2_0_3, w1_1_73);
  logic w2_0_4;
  logic w1_1_76;
  csan csan1_0_12_1_0_13_1_0_14(w1_0_12, w1_0_13, w1_0_14, w2_0_4, w1_1_76);
  logic w2_0_5;
  logic w1_1_79;
  csan csan1_0_15_1_0_16_1_0_17(w1_0_15, w1_0_16, w1_0_17, w2_0_5, w1_1_79);
  logic w2_0_6;
  logic w1_1_82;
  csan csan1_0_18_1_0_19_1_0_20(w1_0_18, w1_0_19, w1_0_20, w2_0_6, w1_1_82);
  logic w2_0_7;
  logic w1_1_85;
  csan csan1_0_21_1_0_22_1_0_23(w1_0_21, w1_0_22, w1_0_23, w2_0_7, w1_1_85);
  logic w2_0_8;
  logic w1_1_88;
  csan csan1_0_24_1_0_25_1_0_26(w1_0_24, w1_0_25, w1_0_26, w2_0_8, w1_1_88);
  logic w2_0_9;
  logic w1_1_91;
  csan csan1_0_27_1_0_28_1_0_29(w1_0_27, w1_0_28, w1_0_29, w2_0_9, w1_1_91);
  logic w2_0_10;
  logic w1_2_94;
  csan csan1_0_30_1_0_31_1_1_64(w1_0_30, w1_0_31, w1_1_64, w2_0_10, w1_2_94);
  logic w2_0_11;
  logic w1_2_131;
  csan csan1_1_67_1_1_70_1_1_73(w1_1_67, w1_1_70, w1_1_73, w2_0_11, w1_2_131);
  logic w2_0_12;
  logic w1_2_140;
  csan csan1_1_76_1_1_79_1_1_82(w1_1_76, w1_1_79, w1_1_82, w2_0_12, w1_2_140);
  logic w2_0_13;
  logic w1_2_149;
  csan csan1_1_85_1_1_88_1_1_91(w1_1_85, w1_1_88, w1_1_91, w2_0_13, w1_2_149);
  logic w2_0_14;
  logic w1_3_158;
  csan csan1_2_94_1_2_131_1_2_140(w1_2_94, w1_2_131, w1_2_140, w2_0_14, w1_3_158);
  logic w2_0_15;
  logic w1_4_213;
  csan2 csan1_2_149_1_3_158_X_X_X(w1_2_149, w1_3_158, w2_0_15, w1_4_213);
  assign s1 = w1_4_213;
  logic w3_0_0;
  logic w2_1_64;
  csan csan2_0_0_2_0_1_2_0_2(w2_0_0, w2_0_1, w2_0_2, w3_0_0, w2_1_64);
  logic w3_0_1;
  logic w2_1_67;
  csan csan2_0_3_2_0_4_2_0_5(w2_0_3, w2_0_4, w2_0_5, w3_0_1, w2_1_67);
  logic w3_0_2;
  logic w2_1_70;
  csan csan2_0_6_2_0_7_2_0_8(w2_0_6, w2_0_7, w2_0_8, w3_0_2, w2_1_70);
  logic w3_0_3;
  logic w2_1_73;
  csan csan2_0_9_2_0_10_2_0_11(w2_0_9, w2_0_10, w2_0_11, w3_0_3, w2_1_73);
  logic w3_0_4;
  logic w2_1_76;
  csan csan2_0_12_2_0_13_2_0_14(w2_0_12, w2_0_13, w2_0_14, w3_0_4, w2_1_76);
  logic w3_0_5;
  logic w2_2_79;
  csan csan2_0_15_2_1_64_2_1_67(w2_0_15, w2_1_64, w2_1_67, w3_0_5, w2_2_79);
  logic w3_0_6;
  logic w2_2_134;
  csan csan2_1_70_2_1_73_2_1_76(w2_1_70, w2_1_73, w2_1_76, w3_0_6, w2_2_134);
  logic w3_0_7;
  logic w2_3_143;
  csan2 csan2_2_79_2_2_134_X_X_X(w2_2_79, w2_2_134, w3_0_7, w2_3_143);
  assign s2 = w2_3_143;
  logic w4_0_0;
  logic w3_1_64;
  csan csan3_0_0_3_0_1_3_0_2(w3_0_0, w3_0_1, w3_0_2, w4_0_0, w3_1_64);
  logic w4_0_1;
  logic w3_1_67;
  csan csan3_0_3_3_0_4_3_0_5(w3_0_3, w3_0_4, w3_0_5, w4_0_1, w3_1_67);
  logic w4_0_2;
  logic w3_2_70;
  csan csan3_0_6_3_0_7_3_1_64(w3_0_6, w3_0_7, w3_1_64, w4_0_2, w3_2_70);
  logic w4_0_3;
  logic w3_3_131;
  csan2 csan3_1_67_3_2_70_X_X_X(w3_1_67, w3_2_70, w4_0_3, w3_3_131);
  assign s3 = w3_3_131;
  logic w5_0_0;
  logic w4_1_64;
  csan csan4_0_0_4_0_1_4_0_2(w4_0_0, w4_0_1, w4_0_2, w5_0_0, w4_1_64);
  logic w5_0_1;
  logic w4_2_67;
  csan2 csan4_0_3_4_1_64_X_X_X(w4_0_3, w4_1_64, w5_0_1, w4_2_67);
  assign s4 = w4_2_67;
  logic w6_0_0;
  logic w5_1_64;
  csan2 csan5_0_0_5_0_1_X_X_X(w5_0_0, w5_0_1, w6_0_0, w5_1_64);
  assign s5 = w5_1_64;
  assign s6 = w6_0_0;

  assign s = {s6,s5, s4, s3, s2, s1, s0};
end

endmodule