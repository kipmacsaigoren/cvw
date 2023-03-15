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

# define carry out, sum out, and csa module
def csa(width, i1,j1,k1,i2,j2,k2,carryk, sumj, sumk,i3="X",j3="X",k3="X"):
    if (width == 2):
        return f"""logic w{i1+1}_{0}_{carryk};
logic w{i1}_{sumj}_{sumk};
csan csa{i1}_{j1}_{k1}_{i2}_{j2}_{k2}_{i3}_{j3}_{k3}(w{i1}_{j1}_{k1}, w{i2}_{j2}_{k2}, 0, w{i1+1}_{0}_{carryk}, w{i1}_{sumj}_{sumk});\n"""
    elif (width == 3):
        return f"""logic w{i1+1}_{0}_{carryk};
logic w{i1}_{sumj}_{sumk};
csan csa{i1}_{j1}_{k1}_{i2}_{j2}_{k2}_{i3}_{j3}_{k3}(w{i1}_{j1}_{k1}, w{i2}_{j2}_{k2}, w{i3}_{j3}_{k3}, w{i1+1}_{0}_{carryk}, w{i1}_{sumj}_{sumk});\n"""

def generate(XLEN):
    lines = ""
    lines += f"""
module csan(input logic a0, input logic a1, input logic a2, output logic c, output logic s);
    assign c = (a0&a1) | (a0&a2) | (a1&a2);
    assign s = a0 ^ a1 ^ a2;
endmodule\n\n"""
    
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
    lines = lines + "} = a;\n"

    while (len(sum_queue) > 0):
        carryidx=0
        while (len(sum_queue) > 0):
            if (len(sum_queue) == 1):
                w1 = sum_queue[0]
                sum_queue=sum_queue[1:]

                # extract indices
                i1 = w1.i
                j1 = w1.j
                k1 = w1.k

                lines += f"assign s{i1} = w{i1}_{j1}_{k1};\n"
                
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

                # enqueue carry-out
                c = Weight(i1+1, 0, carryidx)
                carry_queue.append(c)

                # enqueue sum-out
                sumj = max(j1,j2)+1
                sumk = k1+XLEN
                s = Weight(i1,sumj,sumk)
                sum_queue.append(s)

                l = csa(2, i1,j1,k1,i2,j2,k2, carryidx,sumj, sumk)
                lines += l

                
            elif (len(sum_queue) >= 3):
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

                # enqueue carry-out
                c = Weight(i1+1, 0, carryidx)
                carry_queue.append(c)

                # enqueue sum-out
                sumj = max(j1,j2,j3)+1
                sumk = k1+XLEN
                s = Weight(i1, sumj, sumk)
                sum_queue.append(s)

                l = csa(3, i1,j1,k1,i2,j2,k2, carryidx, sumj, sumk,i3,j3,k3)
                lines += l
            carryidx = carryidx+1
        # once sum_queue is empty, transfer carry-outs to sums.
        sum_queue = carry_queue
        carry_queue = []
    # done
    print(lines)



    
    

def main():
    generate(32)


if __name__ == "__main__":
    main()