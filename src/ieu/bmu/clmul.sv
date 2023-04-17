///////////////////////////////////////////
// clmul.sv
//
// Written: Kevin Kim <kekim@hmc.edu> and Kip Macsai-Goren <kmacsaigoren@hmc.edu>
// Created: 1 February 2023
// Modified: 
//
// Purpose: Carry-Less multiplication unit
//
// Documentation: RISC-V System on Chip Design Chapter 15
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

`include "wally-config.vh"

module clmul #(parameter WIDTH=32) (
  input  logic [WIDTH-1:0] X, Y,             // Operands
  output logic [WIDTH-1:0] ClmulResult);     // ZBS result

  logic [(WIDTH*WIDTH)-1:0] S;               // intermediary signals for carry-less multiply
  /*
  genvar i;
  assign S[WIDTH-1:0] = X & {WIDTH{Y[0]}};
    for (i=1;i<WIDTH;i++) begin:clmul
      assign S[(WIDTH)*(i+1)-1:(WIDTH)*(i)] = {{S[(WIDTH)*(i)-1:(WIDTH)*(i-1)+i] ^ {(WIDTH-i){Y[i]}} & X[WIDTH-1-i:0]}, {S[(WIDTH)*(i-1)+i-1:(WIDTH)*(i-1)]}};
    end
  assign ClmulResult = S[(WIDTH*WIDTH)-1:(WIDTH*(WIDTH-1))];
  */
  
  //super vectorized
  genvar i;
  integer l;
  integer r;
  integer pl;
  integer pr;
  integer w;
  assign r=WIDTH;
  assign w=WIDTH-2;
  assign pl=WIDTH-1;
  assign pr=0;
  
  assign S[WIDTH-1:0] = X & {WIDTH{Y[0]}};
  for (i=1;i<(WIDTH*(WIDTH+1)/2);i++) begin:clmul
    assign S[r+:w] = S[pr+:w]^{{(WIDTH-i){Y[i]}} & X[WIDTH-1-i:0]};
    pr=r;
    r=r+(WIDTH-1)-i;
    w=w-1;
    //assign S[(WIDTH)*(i)-i:(WIDTH)*(i-1)-(i-2)] = {{S[(WIDTH)*(i-1)-1:(WIDTH)*(i-2)+(i-1)] ^ {(WIDTH-i+1){Y[i-1]}} & X[WIDTH-1-i+1:0]}};
    
  end
  genvar j;
  integer k;
  assign ClmulResult[0] = S[0];
  for (j=0;j<WIDTH;j++) begin:res
    assign ClmulResult[j+1]=S[(WIDTH)*(j+1)-j];
  end
  
  
  /*
  integer i,j;

  always_comb begin
    for (i=0;i<WIDTH;i++) begin: outer
      S[WIDTH*i] = X[0] & Y[i];
      for (j=1;j<=i;j++) begin: inner
        S[WIDTH*i+j] = (X[j] & Y[i-j]) ^ S[WIDTH*i+j-1];
      end
      ClmulResult[i] = S[WIDTH*i+j-1];
    end
  end
  */
endmodule


