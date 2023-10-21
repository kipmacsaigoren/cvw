///////////////////////////////////////////
// drsuwrapper.sv
//
// Written: kekim@hmc.edu
// Modified:19 May 2023
//
// Purpose: Combined Divide and Square Root Floating Point and Integer Unit with postprocessing
// 
// Documentation: RISC-V System on Chip Design Chapter 13
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
`include "config.vh"

import cvw::*;

`include "parameter-defs.vh"
module drsuwrapper (
  input  logic                clk, 
  input  logic                reset, 
  input  logic [1:0]          FmtE,
  input  logic                XsE, YsE,
  input  logic [52:0]        XmE, YmE,
  input  logic [11:0]      XeE, YeE,
  input  logic                XInfE, YInfE, 
  input  logic                XZeroE, YZeroE, 
  input  logic                XNaNE, YNaNE, 
  input  logic                XSNaNE, YSNaNE,
  input  logic                FDivStartE, IDivStartE,
  input  logic                StallM,
  input  logic                FlushE,
  input  logic                SqrtE, SqrtM,
  input  logic [63:0]    ForwardedSrcAE, ForwardedSrcBE, // these are the src outputs before the mux choosing between them and PCE to put in srcA/B
  input  logic [2:0]          Funct3E, Funct3M,
  input  logic                IntDivE, W64E,
  input  logic [2:0]          Frm,
  input  logic [2:0]          OpCtrl,
  input  logic [1:0]          PostProcSel,
  output logic                FDivBusyE, IFDivStartE, FDivDoneE,
  output logic [63:0]    FResM,
  output logic [63:0]    FIntDivResultM,
  output logic [4:0]          FlgM
);
//`include "parameter-defs.vh"

  drsu #(P) drsucore(.*);


endmodule