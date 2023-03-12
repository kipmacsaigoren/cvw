///////////////////////////////////////////
//
// Written: Kevin Kim <kekim@hmc.edu>
// Modified: 3/11/2023
//
// Purpose: Sets only leading zeros as ones.
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

module lzd #(parameter WIDTH = 1) (
  input logic  [WIDTH-1:0] a,
  output logic [WIDTH-1:0] y
);

  /*genvar i;
  
  always_comb begin
    Y = 0;
    i = WIDTH-1;
    while (~A[i] & (i >= 0)) begin
        Y[i] = 1;
        i = i-1;
    end
  end
  */

logic [WIDTH-1:0] abar;
assign abar = ~a;

/* verilator lint_off IMPLICIT */
if (WIDTH == 32) begin
  assign {g31_31, g30_30, g29_29, g28_28, g27_27, g26_26, g25_25, g24_24, g23_23, g22_22, g21_21, g20_20, g19_19, g18_18, g17_17, g16_16, g15_15, g14_14, g13_13, g12_12, g11_11, g10_10, g9_9, g8_8, g7_7, g6_6, g5_5, g4_4, g3_3, g2_2, g1_1, g0_0} = abar;
  //****************** LEVEL 0 ******************//
  assign g1_0 = g1_1 & g0_0;
  assign g3_2 = g3_3 & g2_2;
  assign g5_4 = g5_5 & g4_4;
  assign g7_6 = g7_7 & g6_6;
  assign g9_8 = g9_9 & g8_8;
  assign g11_10 = g11_11 & g10_10;
  assign g13_12 = g13_13 & g12_12;
  assign g15_14 = g15_15 & g14_14;
  assign g17_16 = g17_17 & g16_16;
  assign g19_18 = g19_19 & g18_18;
  assign g21_20 = g21_21 & g20_20;
  assign g23_22 = g23_23 & g22_22;
  assign g25_24 = g25_25 & g24_24;
  assign g27_26 = g27_27 & g26_26;
  assign g29_28 = g29_29 & g28_28;
  assign g31_30 = g31_31 & g30_30;
  //****************** LEVEL 1 ******************//
  assign g3_0 = g3_2 & g1_0;
  assign g3_1 = g3_2 & g1_1;
  assign g7_4 = g7_6 & g5_4;
  assign g7_5 = g7_6 & g5_5;
  assign g11_8 = g11_10 & g9_8;
  assign g11_9 = g11_10 & g9_9;
  assign g15_12 = g15_14 & g13_12;
  assign g15_13 = g15_14 & g13_13;
  assign g19_16 = g19_18 & g17_16;
  assign g19_17 = g19_18 & g17_17;
  assign g23_20 = g23_22 & g21_20;
  assign g23_21 = g23_22 & g21_21;
  assign g27_24 = g27_26 & g25_24;
  assign g27_25 = g27_26 & g25_25;
  assign g31_28 = g31_30 & g29_28;
  assign g31_29 = g31_30 & g29_29;
  //****************** LEVEL 2 ******************//
  assign g7_0 = g7_4 & g3_0;
  assign g7_1 = g7_4 & g3_1;
  assign g7_2 = g7_4 & g3_2;
  assign g7_3 = g7_4 & g3_3;
  assign g15_8 = g15_12 & g11_8;
  assign g15_9 = g15_12 & g11_9;
  assign g15_10 = g15_12 & g11_10;
  assign g15_11 = g15_12 & g11_11;
  assign g23_16 = g23_20 & g19_16;
  assign g23_17 = g23_20 & g19_17;
  assign g23_18 = g23_20 & g19_18;
  assign g23_19 = g23_20 & g19_19;
  assign g31_24 = g31_28 & g27_24;
  assign g31_25 = g31_28 & g27_25;
  assign g31_26 = g31_28 & g27_26;
  assign g31_27 = g31_28 & g27_27;
  //****************** LEVEL 3 ******************//
  assign g15_0 = g15_8 & g7_0;
  assign g15_1 = g15_8 & g7_1;
  assign g15_2 = g15_8 & g7_2;
  assign g15_3 = g15_8 & g7_3;
  assign g15_4 = g15_8 & g7_4;
  assign g15_5 = g15_8 & g7_5;
  assign g15_6 = g15_8 & g7_6;
  assign g15_7 = g15_8 & g7_7;
  assign g31_16 = g31_24 & g23_16;
  assign g31_17 = g31_24 & g23_17;
  assign g31_18 = g31_24 & g23_18;
  assign g31_19 = g31_24 & g23_19;
  assign g31_20 = g31_24 & g23_20;
  assign g31_21 = g31_24 & g23_21;
  assign g31_22 = g31_24 & g23_22;
  assign g31_23 = g31_24 & g23_23;
  //****************** LEVEL 4 ******************//
  assign g31_0 = g31_16 & g15_0;
  assign g31_1 = g31_16 & g15_1;
  assign g31_2 = g31_16 & g15_2;
  assign g31_3 = g31_16 & g15_3;
  assign g31_4 = g31_16 & g15_4;
  assign g31_5 = g31_16 & g15_5;
  assign g31_6 = g31_16 & g15_6;
  assign g31_7 = g31_16 & g15_7;
  assign g31_8 = g31_16 & g15_8;
  assign g31_9 = g31_16 & g15_9;
  assign g31_10 = g31_16 & g15_10;
  assign g31_11 = g31_16 & g15_11;
  assign g31_12 = g31_16 & g15_12;
  assign g31_13 = g31_16 & g15_13;
  assign g31_14 = g31_16 & g15_14;
  assign g31_15 = g31_16 & g15_15;
  assign y = {g31_31, g31_30, g31_29, g31_28, g31_27, g31_26, g31_25, g31_24, g31_23, g31_22, g31_21, g31_20, g31_19, g31_18, g31_17, g31_16, g31_15, g31_14, g31_13, g31_12, g31_11, g31_10, g31_9, g31_8, g31_7, g31_6, g31_5, g31_4, g31_3, g31_2, g31_1, g31_0};
end

if (WIDTH==64) begin
  logic [WIDTH-1:0] abar;
  assign abar = ~a;
  assign {g63_63, g62_62, g61_61, g60_60, g59_59, g58_58, g57_57, g56_56, g55_55, g54_54, g53_53, g52_52, g51_51, g50_50, g49_49, g48_48, g47_47, g46_46, g45_45, g44_44, g43_43, g42_42, g41_41, g40_40, g39_39, g38_38, g37_37, g36_36, g35_35, g34_34, g33_33, g32_32, g31_31, g30_30, g29_29, g28_28, g27_27, g26_26, g25_25, g24_24, g23_23, g22_22, g21_21, g20_20, g19_19, g18_18, g17_17, g16_16, g15_15, g14_14, g13_13, g12_12, g11_11, g10_10, g9_9, g8_8, g7_7, g6_6, g5_5, g4_4, g3_3, g2_2, g1_1, g0_0} = abar;
  //****************** LEVEL 0 ******************//
  assign g1_0 = g1_1 & g0_0;
  assign g3_2 = g3_3 & g2_2;
  assign g5_4 = g5_5 & g4_4;
  assign g7_6 = g7_7 & g6_6;
  assign g9_8 = g9_9 & g8_8;
  assign g11_10 = g11_11 & g10_10;
  assign g13_12 = g13_13 & g12_12;
  assign g15_14 = g15_15 & g14_14;
  assign g17_16 = g17_17 & g16_16;
  assign g19_18 = g19_19 & g18_18;
  assign g21_20 = g21_21 & g20_20;
  assign g23_22 = g23_23 & g22_22;
  assign g25_24 = g25_25 & g24_24;
  assign g27_26 = g27_27 & g26_26;
  assign g29_28 = g29_29 & g28_28;
  assign g31_30 = g31_31 & g30_30;
  assign g33_32 = g33_33 & g32_32;
  assign g35_34 = g35_35 & g34_34;
  assign g37_36 = g37_37 & g36_36;
  assign g39_38 = g39_39 & g38_38;
  assign g41_40 = g41_41 & g40_40;
  assign g43_42 = g43_43 & g42_42;
  assign g45_44 = g45_45 & g44_44;
  assign g47_46 = g47_47 & g46_46;
  assign g49_48 = g49_49 & g48_48;
  assign g51_50 = g51_51 & g50_50;
  assign g53_52 = g53_53 & g52_52;
  assign g55_54 = g55_55 & g54_54;
  assign g57_56 = g57_57 & g56_56;
  assign g59_58 = g59_59 & g58_58;
  assign g61_60 = g61_61 & g60_60;
  assign g63_62 = g63_63 & g62_62;
  //****************** LEVEL 1 ******************//
  assign g3_0 = g3_2 & g1_0;
  assign g3_1 = g3_2 & g1_1;
  assign g7_4 = g7_6 & g5_4;
  assign g7_5 = g7_6 & g5_5;
  assign g11_8 = g11_10 & g9_8;
  assign g11_9 = g11_10 & g9_9;
  assign g15_12 = g15_14 & g13_12;
  assign g15_13 = g15_14 & g13_13;
  assign g19_16 = g19_18 & g17_16;
  assign g19_17 = g19_18 & g17_17;
  assign g23_20 = g23_22 & g21_20;
  assign g23_21 = g23_22 & g21_21;
  assign g27_24 = g27_26 & g25_24;
  assign g27_25 = g27_26 & g25_25;
  assign g31_28 = g31_30 & g29_28;
  assign g31_29 = g31_30 & g29_29;
  assign g35_32 = g35_34 & g33_32;
  assign g35_33 = g35_34 & g33_33;
  assign g39_36 = g39_38 & g37_36;
  assign g39_37 = g39_38 & g37_37;
  assign g43_40 = g43_42 & g41_40;
  assign g43_41 = g43_42 & g41_41;
  assign g47_44 = g47_46 & g45_44;
  assign g47_45 = g47_46 & g45_45;
  assign g51_48 = g51_50 & g49_48;
  assign g51_49 = g51_50 & g49_49;
  assign g55_52 = g55_54 & g53_52;
  assign g55_53 = g55_54 & g53_53;
  assign g59_56 = g59_58 & g57_56;
  assign g59_57 = g59_58 & g57_57;
  assign g63_60 = g63_62 & g61_60;
  assign g63_61 = g63_62 & g61_61;
  //****************** LEVEL 2 ******************//
  assign g7_0 = g7_4 & g3_0;
  assign g7_1 = g7_4 & g3_1;
  assign g7_2 = g7_4 & g3_2;
  assign g7_3 = g7_4 & g3_3;
  assign g15_8 = g15_12 & g11_8;
  assign g15_9 = g15_12 & g11_9;
  assign g15_10 = g15_12 & g11_10;
  assign g15_11 = g15_12 & g11_11;
  assign g23_16 = g23_20 & g19_16;
  assign g23_17 = g23_20 & g19_17;
  assign g23_18 = g23_20 & g19_18;
  assign g23_19 = g23_20 & g19_19;
  assign g31_24 = g31_28 & g27_24;
  assign g31_25 = g31_28 & g27_25;
  assign g31_26 = g31_28 & g27_26;
  assign g31_27 = g31_28 & g27_27;
  assign g39_32 = g39_36 & g35_32;
  assign g39_33 = g39_36 & g35_33;
  assign g39_34 = g39_36 & g35_34;
  assign g39_35 = g39_36 & g35_35;
  assign g47_40 = g47_44 & g43_40;
  assign g47_41 = g47_44 & g43_41;
  assign g47_42 = g47_44 & g43_42;
  assign g47_43 = g47_44 & g43_43;
  assign g55_48 = g55_52 & g51_48;
  assign g55_49 = g55_52 & g51_49;
  assign g55_50 = g55_52 & g51_50;
  assign g55_51 = g55_52 & g51_51;
  assign g63_56 = g63_60 & g59_56;
  assign g63_57 = g63_60 & g59_57;
  assign g63_58 = g63_60 & g59_58;
  assign g63_59 = g63_60 & g59_59;
  //****************** LEVEL 3 ******************//
  assign g15_0 = g15_8 & g7_0;
  assign g15_1 = g15_8 & g7_1;
  assign g15_2 = g15_8 & g7_2;
  assign g15_3 = g15_8 & g7_3;
  assign g15_4 = g15_8 & g7_4;
  assign g15_5 = g15_8 & g7_5;
  assign g15_6 = g15_8 & g7_6;
  assign g15_7 = g15_8 & g7_7;
  assign g31_16 = g31_24 & g23_16;
  assign g31_17 = g31_24 & g23_17;
  assign g31_18 = g31_24 & g23_18;
  assign g31_19 = g31_24 & g23_19;
  assign g31_20 = g31_24 & g23_20;
  assign g31_21 = g31_24 & g23_21;
  assign g31_22 = g31_24 & g23_22;
  assign g31_23 = g31_24 & g23_23;
  assign g47_32 = g47_40 & g39_32;
  assign g47_33 = g47_40 & g39_33;
  assign g47_34 = g47_40 & g39_34;
  assign g47_35 = g47_40 & g39_35;
  assign g47_36 = g47_40 & g39_36;
  assign g47_37 = g47_40 & g39_37;
  assign g47_38 = g47_40 & g39_38;
  assign g47_39 = g47_40 & g39_39;
  assign g63_48 = g63_56 & g55_48;
  assign g63_49 = g63_56 & g55_49;
  assign g63_50 = g63_56 & g55_50;
  assign g63_51 = g63_56 & g55_51;
  assign g63_52 = g63_56 & g55_52;
  assign g63_53 = g63_56 & g55_53;
  assign g63_54 = g63_56 & g55_54;
  assign g63_55 = g63_56 & g55_55;
  //****************** LEVEL 4 ******************//
  assign g31_0 = g31_16 & g15_0;
  assign g31_1 = g31_16 & g15_1;
  assign g31_2 = g31_16 & g15_2;
  assign g31_3 = g31_16 & g15_3;
  assign g31_4 = g31_16 & g15_4;
  assign g31_5 = g31_16 & g15_5;
  assign g31_6 = g31_16 & g15_6;
  assign g31_7 = g31_16 & g15_7;
  assign g31_8 = g31_16 & g15_8;
  assign g31_9 = g31_16 & g15_9;
  assign g31_10 = g31_16 & g15_10;
  assign g31_11 = g31_16 & g15_11;
  assign g31_12 = g31_16 & g15_12;
  assign g31_13 = g31_16 & g15_13;
  assign g31_14 = g31_16 & g15_14;
  assign g31_15 = g31_16 & g15_15;
  assign g63_32 = g63_48 & g47_32;
  assign g63_33 = g63_48 & g47_33;
  assign g63_34 = g63_48 & g47_34;
  assign g63_35 = g63_48 & g47_35;
  assign g63_36 = g63_48 & g47_36;
  assign g63_37 = g63_48 & g47_37;
  assign g63_38 = g63_48 & g47_38;
  assign g63_39 = g63_48 & g47_39;
  assign g63_40 = g63_48 & g47_40;
  assign g63_41 = g63_48 & g47_41;
  assign g63_42 = g63_48 & g47_42;
  assign g63_43 = g63_48 & g47_43;
  assign g63_44 = g63_48 & g47_44;
  assign g63_45 = g63_48 & g47_45;
  assign g63_46 = g63_48 & g47_46;
  assign g63_47 = g63_48 & g47_47;
  //****************** LEVEL 5 ******************//
  assign g63_0 = g63_32 & g31_0;
  assign g63_1 = g63_32 & g31_1;
  assign g63_2 = g63_32 & g31_2;
  assign g63_3 = g63_32 & g31_3;
  assign g63_4 = g63_32 & g31_4;
  assign g63_5 = g63_32 & g31_5;
  assign g63_6 = g63_32 & g31_6;
  assign g63_7 = g63_32 & g31_7;
  assign g63_8 = g63_32 & g31_8;
  assign g63_9 = g63_32 & g31_9;
  assign g63_10 = g63_32 & g31_10;
  assign g63_11 = g63_32 & g31_11;
  assign g63_12 = g63_32 & g31_12;
  assign g63_13 = g63_32 & g31_13;
  assign g63_14 = g63_32 & g31_14;
  assign g63_15 = g63_32 & g31_15;
  assign g63_16 = g63_32 & g31_16;
  assign g63_17 = g63_32 & g31_17;
  assign g63_18 = g63_32 & g31_18;
  assign g63_19 = g63_32 & g31_19;
  assign g63_20 = g63_32 & g31_20;
  assign g63_21 = g63_32 & g31_21;
  assign g63_22 = g63_32 & g31_22;
  assign g63_23 = g63_32 & g31_23;
  assign g63_24 = g63_32 & g31_24;
  assign g63_25 = g63_32 & g31_25;
  assign g63_26 = g63_32 & g31_26;
  assign g63_27 = g63_32 & g31_27;
  assign g63_28 = g63_32 & g31_28;
  assign g63_29 = g63_32 & g31_29;
  assign g63_30 = g63_32 & g31_30;
  assign g63_31 = g63_32 & g31_31;
  assign y = {g63_63, g63_62, g63_61, g63_60, g63_59, g63_58, g63_57, g63_56, g63_55, g63_54, g63_53, g63_52, g63_51, g63_50, g63_49, g63_48, g63_47, g63_46, g63_45, g63_44, g63_43, g63_42, g63_41, g63_40, g63_39, g63_38, g63_37, g63_36, g63_35, g63_34, g63_33, g63_32, g63_31, g63_30, g63_29, g63_28, g63_27, g63_26, g63_25, g63_24, g63_23, g63_22, g63_21, g63_20, g63_19, g63_18, g63_17, g63_16, g63_15, g63_14, g63_13, g63_12, g63_11, g63_10, g63_9, g63_8, g63_7, g63_6, g63_5, g63_4, g63_3, g63_2, g63_1, g63_0};


end


/* verilator lint_on IMPLICIT */








endmodule
