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

def csa(width, i1,j1,k1,i2,j2,k2,carryidx, sumidx,i3="X",j3="X",k3="X"):
    if (width == 2):
        return f"csa csa{i1}_{j1}_{k1}_{i2}_{j2}_{k2}_{i3}_{j3}_{k3}(w{i1}_{j1}_{k1}, w{i2}_{j2}_{k2}, 0, w{i_1+1}_{0}_{carryidx}, w{i_1}_{j_1+1}_{sumidx});\n"
    elif (width == 3):
        return f"csa csa{i1}_{j1}_{k1}_{i2}_{j2}_{k2}_{i3}_{j3}_{k3}(w{i1}_{j1}_{k1}, w{i2}_{j2}_{k2}, w{i3}_{j3}_{k3}, w{i_1+1}_{0}_{carryidx}, w{i_1}_{j_1+1}_{sumidx});\n"

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
        w = Weight(0,0,i)
        sum_queue.append(w)
    
    # strip trailing comma and space
    lines = lines[0:-2]

    while (len(sum_queue) > 0 or len(carry_queue) > 0):
        carryidx=0
        while (len(sum_queue) > 0):
            if (len(sum_queue) == 1):
                w1 = sum_queue[0]
                sum_queue=sum_queue[1:]

                # extract indices
                i1 = w1.i
                j1 = w1.j
                k1 = w1.k

                lines += f"assign s{i1} = w{i1}_{j1}_{k1};"
                
            elif (len(sum_queue) == 2):
                # dequeue two weights
                w1 = sum_queue[0]
                w2 = sum_queue[1]
                sum_queue = sum_queue[2:]
                
                # extract indices
                i1 = w1.i
                j1 = w1.j
                k1 = w1.k

                i2 = w2.i
                j2 = w2.j
                k2 = w2.k

                l = csa(2, i1,j1,k1,i2,j2,k2, carryidx,k, i_1+XLEN)
                lines += l
                
            else:
                # dequeue three weights
                w1 = sum_queue[0]
                w2 = sum_queue[1]
                w3 = sum_queue[2]
                sum_queue = sum_queue[3:]
                
                # extract indices
                i1 = w1.i
                j1 = w1.j
                k1 = w1.k

                i2 = w2.i
                j2 = w2.j
                k2 = w2.k

                i3 = w3.i
                j3 = w3.j
                k3 = w3.k

                l = csa(3, i1,j1,k1,i2,j2,k2, carryidx,k, i_1+XLEN,i3,j3,k3)
                lines += l
                



    
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