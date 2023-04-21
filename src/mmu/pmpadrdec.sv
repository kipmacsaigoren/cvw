///////////////////////////////////////////
// pmpadrdec.sv
//
// Written: tfleming@hmc.edu 28 April 2021
// Modified: 
//
// Purpose: Address decoder for the PMP checker. Decides whether a given address
//          falls within the PMP range for each address-matching mode
//          (top-of-range/TOR, naturally aligned four-byte region/NA4, and
//          naturally aligned power-of-two region/NAPOT), then selects the
//          output based on which mode is input.
// 
// Documentation: RISC-V System on Chip Design Chapter 8
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

module pmpadrdec (
  input  logic [`PA_BITS-1:0]   PhysicalAddress,
  input  logic [1:0]            Size,
  input  logic [7:0]            PMPCfg,
  input  logic [`PA_BITS-3:0]   PMPAdr,
  input  logic                  PAgePMPIn, EdgeCrossIn,
  output logic                  PAgePMPOut, EdgeCrossOut,
  output logic                  Match, CrossFail,
  output logic                  L, X, W, R
);
  
  // define PMP addressing mode codes
  localparam                    TOR   = 2'b01;
  localparam                    NA4   = 2'b10;
  localparam                    NAPOT = 2'b11;

  logic                         TORMatch, NAMatch;
  logic [`PA_BITS-3:0]          NAMask;
  logic                         PAltPMP;
  logic [`PA_BITS-4:0]          PAcmpr, PMPcmpr, PAeqPMP; // PMP and PA comparison doesn't need 3 least significant bits
  logic [1:0]                   AdrMode;
  logic                         PMPWordAlgn, EdgeCrossWordAlgn; // needed to detect if an edge cross can happen based on LSB of PMP

  assign AdrMode = PMPCfg[4:3];
  
  assign PAcmpr = PhysicalAddress[`PA_BITS-1:3];
  assign PMPcmpr = PMPAdr[`PA_BITS-3:1];
  assign PMPWordAlgn = PMPAdr[0]; // indicates alignment on address ending in 4
  
  // Compare PA with PMP
  assign PAeqPMP = (PAcmpr ~^ PMPcmpr); // 1 for if each bit is the same
  assign PAltPMP = ({1'b0, PAcmpr} < {1'b0, PMPcmpr}); // unsigned comparison for TOR
  assign PAgePMPOut = ~PAltPMP;

  // detect memory access crossing this PMP address
  assign EdgeCrossWordAlgn = (PMPWordAlgn & ~AdrMode[1]) | AdrMode == NA4;  // indicates if the word alignment is correct to be an edge cross
  assign EdgeCrossOut = &(PAeqPMP) & Size == 2'b11 & EdgeCrossWordAlgn;
  
  assign CrossFail = (EdgeCrossIn & AdrMode == TOR) | EdgeCrossOut;

  // Match, including edge crossings
  assign NAMask = (PMPAdr + {{(`PA_BITS-4){1'b0}}, (AdrMode == NAPOT)}) ^ PMPAdr; // Create a mask with k 1s at the bottom corresponding to 2^(k+2) size region
  assign NAMatch = &({PAeqPMP, PhysicalAddress[3] == PMPAdr[0]} | NAMask) | EdgeCrossOut; // check if the PMP == PA, masking the bits inside the NA region
  assign TORMatch = (PAgePMPIn & PAltPMP) | EdgeCrossOut | EdgeCrossIn; 

  assign Match = (AdrMode == TOR) ? TORMatch : 
                 (AdrMode == NA4 | AdrMode == NAPOT) ? NAMatch :
                 0;

  assign L = PMPCfg[7];
  assign X = PMPCfg[2];
  assign W = PMPCfg[1];
  assign R = PMPCfg[0];

 endmodule

