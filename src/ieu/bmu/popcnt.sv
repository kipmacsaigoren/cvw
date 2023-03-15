
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

module popcnt #(parameter WIDTH = 32) (
  input logic  [WIDTH-1:0]            a,    // number to count total ones
  output logic [$clog2(WIDTH):0]  s  // the total number of ones
);
/*
  logic [$clog2(WIDTH):0] sum; 
  
  always_comb begin
    sum = 0;
    for (int i=0;i<WIDTH;i++) begin:loop
      sum = (num[i]) ? sum + 1 : sum;
    end
  end

  assign PopCnt = sum[$clog2(WIDTH):0];

  */

assign {w0_0_31, w0_0_30, w0_0_29, w0_0_28, w0_0_27, w0_0_26, w0_0_25, w0_0_24, w0_0_23, w0_0_22, w0_0_21, w0_0_20, w0_0_19, w0_0_18, w0_0_17, w0_0_16, w0_0_15, w0_0_14, w0_0_13, w0_0_12, w0_0_11, w0_0_10, w0_0_9, w0_0_8, w0_0_7, w0_0_6, w0_0_5, w0_0_4, w0_0_3, w0_0_2, w0_0_1, w0_0_0} = a;
logic w1_0_0;
logic w0_1_63;
csan csa0_0_31_0_0_30_0_0_29(w0_0_31, w0_0_30, w0_0_29, w1_0_0, w0_1_63);
logic w1_0_1;
logic w0_1_60;
csan csa0_0_28_0_0_27_0_0_26(w0_0_28, w0_0_27, w0_0_26, w1_0_1, w0_1_60);
logic w1_0_2;
logic w0_1_57;
csan csa0_0_25_0_0_24_0_0_23(w0_0_25, w0_0_24, w0_0_23, w1_0_2, w0_1_57);
logic w1_0_3;
logic w0_1_54;
csan csa0_0_22_0_0_21_0_0_20(w0_0_22, w0_0_21, w0_0_20, w1_0_3, w0_1_54);
logic w1_0_4;
logic w0_1_51;
csan csa0_0_19_0_0_18_0_0_17(w0_0_19, w0_0_18, w0_0_17, w1_0_4, w0_1_51);
logic w1_0_5;
logic w0_1_48;
csan csa0_0_16_0_0_15_0_0_14(w0_0_16, w0_0_15, w0_0_14, w1_0_5, w0_1_48);
logic w1_0_6;
logic w0_1_45;
csan csa0_0_13_0_0_12_0_0_11(w0_0_13, w0_0_12, w0_0_11, w1_0_6, w0_1_45);
logic w1_0_7;
logic w0_1_42;
csan csa0_0_10_0_0_9_0_0_8(w0_0_10, w0_0_9, w0_0_8, w1_0_7, w0_1_42);
logic w1_0_8;
logic w0_1_39;
csan csa0_0_7_0_0_6_0_0_5(w0_0_7, w0_0_6, w0_0_5, w1_0_8, w0_1_39);
logic w1_0_9;
logic w0_1_36;
csan csa0_0_4_0_0_3_0_0_2(w0_0_4, w0_0_3, w0_0_2, w1_0_9, w0_1_36);
logic w1_0_10;
logic w0_2_33;
csan csa0_0_1_0_0_0_0_1_63(w0_0_1, w0_0_0, w0_1_63, w1_0_10, w0_2_33);
logic w1_0_11;
logic w0_2_92;
csan csa0_1_60_0_1_57_0_1_54(w0_1_60, w0_1_57, w0_1_54, w1_0_11, w0_2_92);
logic w1_0_12;
logic w0_2_83;
csan csa0_1_51_0_1_48_0_1_45(w0_1_51, w0_1_48, w0_1_45, w1_0_12, w0_2_83);
logic w1_0_13;
logic w0_2_74;
csan csa0_1_42_0_1_39_0_1_36(w0_1_42, w0_1_39, w0_1_36, w1_0_13, w0_2_74);
logic w1_0_14;
logic w0_3_65;
csan csa0_2_33_0_2_92_0_2_83(w0_2_33, w0_2_92, w0_2_83, w1_0_14, w0_3_65);
logic w1_0_15;
logic w0_4_106;
csan csa0_2_74_0_3_65_X_X_X(w0_2_74, w0_3_65, 0, w1_0_15, w0_4_106);
assign s0 = w0_4_106;
logic w2_0_0;
logic w1_1_32;
csan csa1_0_0_1_0_1_1_0_2(w1_0_0, w1_0_1, w1_0_2, w2_0_0, w1_1_32);
logic w2_0_1;
logic w1_1_35;
csan csa1_0_3_1_0_4_1_0_5(w1_0_3, w1_0_4, w1_0_5, w2_0_1, w1_1_35);
logic w2_0_2;
logic w1_1_38;
csan csa1_0_6_1_0_7_1_0_8(w1_0_6, w1_0_7, w1_0_8, w2_0_2, w1_1_38);
logic w2_0_3;
logic w1_1_41;
csan csa1_0_9_1_0_10_1_0_11(w1_0_9, w1_0_10, w1_0_11, w2_0_3, w1_1_41);
logic w2_0_4;
logic w1_1_44;
csan csa1_0_12_1_0_13_1_0_14(w1_0_12, w1_0_13, w1_0_14, w2_0_4, w1_1_44);
logic w2_0_5;
logic w1_2_47;
csan csa1_0_15_1_1_32_1_1_35(w1_0_15, w1_1_32, w1_1_35, w2_0_5, w1_2_47);
logic w2_0_6;
logic w1_2_70;
csan csa1_1_38_1_1_41_1_1_44(w1_1_38, w1_1_41, w1_1_44, w2_0_6, w1_2_70);
logic w2_0_7;
logic w1_3_79;
csan csa1_2_47_1_2_70_X_X_X(w1_2_47, w1_2_70, 0, w2_0_7, w1_3_79);
assign s1 = w1_3_79;
logic w3_0_0;
logic w2_1_32;
csan csa2_0_0_2_0_1_2_0_2(w2_0_0, w2_0_1, w2_0_2, w3_0_0, w2_1_32);
logic w3_0_1;
logic w2_1_35;
csan csa2_0_3_2_0_4_2_0_5(w2_0_3, w2_0_4, w2_0_5, w3_0_1, w2_1_35);
logic w3_0_2;
logic w2_2_38;
csan csa2_0_6_2_0_7_2_1_32(w2_0_6, w2_0_7, w2_1_32, w3_0_2, w2_2_38);
logic w3_0_3;
logic w2_3_67;
csan csa2_1_35_2_2_38_X_X_X(w2_1_35, w2_2_38, 0, w3_0_3, w2_3_67);
assign s2 = w2_3_67;
logic w4_0_0;
logic w3_1_32;
csan csa3_0_0_3_0_1_3_0_2(w3_0_0, w3_0_1, w3_0_2, w4_0_0, w3_1_32);
logic w4_0_1;
logic w3_2_35;
csan csa3_0_3_3_1_32_X_X_X(w3_0_3, w3_1_32, 0, w4_0_1, w3_2_35);
assign s3 = w3_2_35;
logic w5_0_0;
logic w4_1_32;
csan csa4_0_0_4_0_1_X_X_X(w4_0_0, w4_0_1, 0, w5_0_0, w4_1_32);
assign s4 = w4_1_32;
assign s5 = w5_0_0;

assign s = {s5, s4, s3, s2, s1, s0};
endmodule

module csan(input logic a0, input logic a1, input logic a2, output logic c, output logic s);
    assign c = (a0&a1) | (a0&a2) | (a1&a2);
    assign s = a0 ^ a1 ^ a2;
endmodule