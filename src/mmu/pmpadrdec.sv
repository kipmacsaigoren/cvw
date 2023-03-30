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
  input  logic [`PA_BITS-3:0]      PMPAdr,
  input  logic                  PAgePMPAdrIn,
  output logic                  PAgePMPAdrOut,
  output logic                  Match, 
  output logic                  L, X, W, R
);
  
  // define PMP addressing mode codes
  localparam                    TOR   = 2'b01;
  localparam                    NA4   = 2'b10;
  localparam                    NAPOT = 2'b11;

  logic                         TORMatch, NAMatch;
  logic                         PAltPMPAdr;
  logic                         TORBoundaryCross;
  logic [`PA_BITS-1:0]          CurrentAdrFull;
  logic [1:0]                   AdrMode;

  assign AdrMode = PMPCfg[4:3];

  // The two lsb of the physical address don't matter for this checking.
  // The following code includes them, but hardwires the PMP checker lsbs to 00
  // and masks them later.  Logic synthesis should optimize away these bottom bits.
 
  // Top-of-range (TOR)
  // Append two implicit trailing 0's to PMPAdr value
  assign CurrentAdrFull  = {PMPAdr[`PA_BITS-3:0],  2'b00};
  assign TORBoundaryCross = (Size == 2'b11) & ({PhysicalAddress[`PA_BITS-1:3], 1'b1} == PMPAdr); // check to see if the physical address + 4 bytes matches the PMP Address for 8 byte accesses. indicating a boundary cross.
  assign PAltPMPAdr = ({1'b0, PhysicalAddress} < {1'b0, CurrentAdrFull}); // unsigned comparison, including matching if top of access comes into this region
  assign PAgePMPAdrOut = ~PAltPMPAdr | TORBoundaryCross; // Match as address being greater than the pmp address if the access goes across the bottom of this region.
  assign TORMatch = PAgePMPAdrIn & PAltPMPAdr; // trigger a match if any part of the access is higher than the previous address and lower than the current one.

  // Naturally aligned regions
  logic [`PA_BITS-3:0] NAMask, NABase, NAMatchIntermediate;

  assign NAMask = (PMPAdr + {{(`PA_BITS-3){1'b0}}, (AdrMode == NAPOT)}) ^ PMPAdr;
  // form a mask where the bottom k bits are 1, corresponding to a size of 2^k bytes for this memory region. 
  // This assumes we're using at least an NA4 region, but works for any size NAPOT region.
  assign NABase = (PMPAdr & ~NAMask); // base physical address of the pmp. 
  
  // We only need to check if the top bits match for NA4 regions. 
  assign NAMatch = &((NABase ~^ PhysicalAddress[`PA_BITS-1:2]) | NAMask | {{(`PA_BITS-3){1'b0}}, (Size == 2'b11)}); // check if upper bits of base address match, match for 64 bit accesses coming across into this region, and ignore lower bits corresponding to inside the memory range

  assign Match = (AdrMode == TOR) ? TORMatch : 
                 (AdrMode == NA4 | AdrMode == NAPOT) ? NAMatch :
                 0;

  assign L = PMPCfg[7];
  assign X = PMPCfg[2];
  assign W = PMPCfg[1];
  assign R = PMPCfg[0];

  // known bug: The size of the access is not yet checked.  For example, if an NA4 entry matches 0xC-0xF and the system
  // attempts an 8-byte access to 0x8, the access should fail (see page 60 of privileged specification 20211203). This
  // implementation will not detect the failure.
 endmodule

