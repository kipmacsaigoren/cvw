///////////////////////////////////////////
//
// WALLY-PMP-edge
//
// Author: Kip Macsai-Goren <kmacsaigoren@g.hmc.edu>
//
// Created 2023-04-18
//
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
// is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
// OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
///////////////////////////////////////////



#include "WALLY-TEST-LIB-64.h" 
RVTEST_ISA("RV64I")
RVTEST_CASE(0,"//check ISA:=regex(.*64.*);check ISA:=regex(.*I.*);def TEST_CASE_1=True;def NO_SAIL=True;",pmp)

INIT_TESTS

TRAP_HANDLER m

j run_test_loop // begin test loop/table tests instead of executing inline code.

INIT_TEST_TABLE

TEST_STACK_AND_DATA

# These tests follow the testing plan in Chapter 12 of the riscv-wally textbook
.align 3
test_cases:

# ---------------------------------------------------------------------------------------------
# Test Contents
#
#   Here is where the actual tests are held, or rather, what the actual tests do.
#   each entry consists of 3 values that will be read in as follows:
#   
#   '.8byte [x28 Value], [x29 Value], [x30 value]'
#                     or
#   '.8byte [address], [value], [test type]'
#
#   The encoding for x30 test type values can be found in the test handler in the framework file
# 
# ---------------------------------------------------------------------------------------------


# write pmpaddr regs. Each of these should output the value of the pmpaddr after being written.
.8byte 0x0, 0x20040081, write_pmpaddr_0  # | 0     | 0x20040081  | 11        | 0 | NA4   | 0 | 0 | 1 | I/O 80100204-80100207 R	    |
.8byte 0x1, 0x20040082, write_pmpaddr_1  # | 1     | 0x20040082  | 10        | 0 | NA4   | 0 | 0 | 0 | I/O 80100208-8010020B No access	   |
.8byte 0x2, 0x20040083, write_pmpaddr_2  # | 2     | 0x20040083  | 11        | 0 | NA4   | 0 | 0 | 1 | I/O 8010020C-8010020F R |
.8byte 0x3, 0x20040101, write_pmpaddr_3  # | 3     | 0x20040101  | 00        | 0 | OFF   | 0 | 0 | 0 |                         |
.8byte 0x4, 0x20040102, write_pmpaddr_4  # | 4     | 0x20040102  | 09        | 0 | TOR   | 0 | 0 | 1 | I/O 80100404-80100407 R |
.8byte 0x5, 0x20040102, write_pmpaddr_5  # | 5     | 0x20040102  | 00        | 0 | OFF   | 0 | 0 | 0 |                         |
.8byte 0x6, 0x20040103, write_pmpaddr_6  # | 6     | 0x20040103  | 08        | 0 | TOR   | 0 | 0 | 0 | I/O 80100408-8010040B No Access |
.8byte 0x7, 0x20040103, write_pmpaddr_7  # | 7     | 0x20040103  | 00        | 0 | OFF   | 0 | 0 | 0 |                         |
.8byte 0x8, 0x20040104, write_pmpaddr_8  # | 8     | 0x20040104  | 08        | 0 | TOR   | 0 | 0 | 1 | I/O 8010040C-8010040F R |

.8byte 0xE, 0x2FFFFFFF, write_pmpaddr_14 # | 14    | 0x2FFFFFFF  | 1F        | 0 | NAPOT | 1 | 1 | 1 | Main mem 80000000-FFFFFFFF RWX|
.8byte 0xF, 0x20040140, write_pmpaddr_15 # | 15    | 0x2004017F  | 10        | 0 | NA4   | 0 | 0 | 0 | 80100500-80100503 no access  |

# write pmpcfg regs with the information in the table above. this should also write the value of these registers to the output.
.8byte 0x0, 0x0008000900111011, write_pmpcfg_0 # write pmpcfg0, output 0x0008000900111011
.8byte 0x2, 0x101F000000000008, write_pmpcfg_2 # write pmpcfg2, output 0x101F000000000008

# write known values to memory where W=0. This should be possible since we're in machine mode.
.8byte 0x80100500, 0x600DAA, write64_test # write to pmpaddr 15 range

.8byte 0x0, 0x0, goto_s_mode # go to S mode To activate PMPs. 0xb written to output

# accesses across PMP region boundaries
# These test to make sure that accesses give a match for the regions they both begin and end in
# the access will be accepted or denied based on whichever of those matches has higher priority
# this testing satisfies the "Priority and Matching Logic" header of section 3.7.1 in the priv spec:

# All of these should cause an access fault no matter the order of the regions, 
# since none of them have regions that completely match the whole access
                                        # Beginning   | Ending    | Type  | Boundary  | Result
                                        # --------------------------------------------------------------
.8byte 0x80100200, 0x0, write64_test    # Allowed     | Protected | NA    | Bottom    | AccessFault
.8byte 0x80100208, 0x0, write64_test    # Protected   | Protected | NA    | Both      | AccessFault
.8byte 0x80100200, 0x0, read64_test     # Allowed     | Allowed   | NA    | Bottom    | AccessFault
.8byte 0x80100208, 0x0, read64_test     # Protected   | Allowed   | NA    | Both      | AccessFault
.8byte 0x80100400, 0x0, write64_test    # Allowed     | Protected | TOR   | Bottom    | AccessFault
.8byte 0x80100408, 0x0, write64_test    # Protected   | Protected | TOR   | Both      | AccessFault
.8byte 0x80100404, 0x0, read64_test     # Allowed     | Allowed   | TOR   | Bottom    | AccessFault
.8byte 0x80100408, 0x0, read64_test     # Protected   | Allowed   | TOR   | Both      | AccessFault


# This test shuold pass even though we cross a boundary since there is a higer priority match that doesn't cross boundaries
.8byte 0x80100500, 0x600DAA, read64_test 

.8byte 0x0, 0x0, terminate_test // terminate tests from S mode wrti
