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
  input  logic                  PAgePMPAdrIn, TORCrossPrevIn,
  output logic                  PAgePMPAdrOut, TORCrossPrevOut,
  output logic                  Match, AllBytesMatch,
  output logic                  L, X, W, R
);
  
  // define PMP addressing mode codes
  localparam                    TOR   = 2'b01;
  localparam                    NA4   = 2'b10;
  localparam                    NAPOT = 2'b11;

  logic                         TORMatch, NAMatch;
  logic [`PA_BITS-3:0]          NAMask, NABase;
  logic                         PAltPMPAdr;
  logic                         TORBoundaryCross, NABoundaryCross;
  logic [1:0]                   AdrMode;

  assign AdrMode = PMPCfg[4:3];

  // The two lsb of the physical address don't matter for this checking 
  // since PMP are allowed a max granularity of 4 bytes.

  // Top-of-range (TOR)
  assign PAltPMPAdr = ({1'b0, PhysicalAddress[`PA_BITS-1:2]} < {1'b0, PMPAdr}); // unsigned comparison
  assign PAgePMPAdrOut = ~PAltPMPAdr | TORCrossPrevOut; // indicates if any byte of this access is greater than this PMPAdr
  assign TORMatch = PAgePMPAdrIn & PAltPMPAdr; 

  // Naturally aligned regions

  // form a mask where the bottom k-2 bits are 1, corresponding to a size of 2^k bytes for this memory region. 
  assign NAMask = (PMPAdr + {{(`PA_BITS-3){1'b0}}, (AdrMode == NAPOT)}) ^ PMPAdr;
  assign NABase = (PMPAdr & ~NAMask); // base physical address of the pmp.
  assign NAMatch = &((NABase ~^ PhysicalAddress[`PA_BITS-1:2]) | NAMask | {{(`PA_BITS-3){1'b0}}, NABoundaryCross}); 

  assign Match = (AdrMode == TOR) ? TORMatch : 
                 (AdrMode == NA4 | AdrMode == NAPOT) ? NAMatch :
                 0;

  assign L = PMPCfg[7];
  assign X = PMPCfg[2];
  assign W = PMPCfg[1];
  assign R = PMPCfg[0];

  // region-crossing accesses

  // check to see if the physical address + 4 bytes matches this PMP Address for 8 byte accesses. indicating a boundary cross.
  assign TORCrossPrevOut = (AdrMode == TOR) & (Size == 2'b11) & ({PhysicalAddress[`PA_BITS-1:3], 1'b1} == PMPAdr); 
  assign TORBoundaryCross = (AdrMode == TOR) & (TORCrossPrevOut | TORCrossPrevIn); 
  // matches either crossing into this region through the address specified in previous PMP or crossing out of this region

  assign NABoundaryCross = (AdrMode == NA4) & (Size == 2'b11) & (({PhysicalAddress[`PA_BITS-1:3], 1'b1} == PMPAdr) | (PhysicalAddress[`PA_BITS-1:2] == PMPAdr)); // Check if access crosses into or out of NA4 boundary
  assign AllBytesMatch = ~(NABoundaryCross | TORBoundaryCross);

 endmodule

