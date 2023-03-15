""" 
    genpopcnt.py
    Script that generates tree-based CSA population count
    Written by Kevin Kim <kekim@hmc.edu>
    weights are in the form w_{i}_{j}_{k} where i represents which sum_i the weight contributes to, and j represents the index of the weight (has no relation to the CSA weight index j)
"""

""" 
    i denotes the bit index contribution to the hamming weight [0, log_2(N)]
    j denotes how many CSA's have contributed sequentially to this weight
    k allows us to differentiate between weights that have the same i,j value.
"""

class Weight:
    def __init__(self, i,j,k):
        self.i = i
        self.j = j
        self.k = k


import math

def generate(XLEN):
    lines = ""
    lines += f"""
    module csa(input logic a0, input logic a1, input logic a2, output logic c, output logic s);
        assign c = (a&b) | (a&c) | (b&c);
        assign s = a ^ b ^ c;
    endmodule\n"""
    
    # Queue stores the CSA sum-outs
    sum_queue = []

    # Queue stores the CSA carry-outs
    carry_queue = []



    lines += "assign {"
    for i in reversed(range(XLEN)):
        lines += f"w{0}_{0}_{i}, "
        pairs[0][0][i] = True
    
    # strip trailing comma and space
    lines = lines[0:-2]
    
    index = 0
    
    # bit-width of hamming weight result
    resultwidth = int(math.log2(XLEN)) 

    #total w_{i-1}
    carryouts = XLEN // 2

    # level
    level = XLEN // 2

    # j  index
    indexj = 0

    covered=0
    for w in range(sums):


    
    

def main():
    filename = input("Enter full filename: ")
    n1 = int(input("Line number to begin: "))
    n2 = int(input("Line number to end: "))
    f = open(filename, "r")
    flines = f.readlines()

    #create list of lines from line n1 to n2, inclusive
    lines = flines[(n1-1):(n2-1)]

    #string to be printed
    out = ""

    for i in range(len(lines)):
        lines[i] = addZero(lines[i])
        out += lines[i]
    print(out)

if __name__ == "__main__":
    main()