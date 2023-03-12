# prefixgen.py
# generates parallel prefix hdl for leading zero to ones converter
# current solution runs in O(n^3). Might have a better amortized runtime. This algorithm can most definitely be optimized using clever indexing math.
# Kevin Kim <kekim@hmc.ed> 3/11/2023
import math

def genPrefix(WIDTH):
    lines = ""
    lines += f"logic [WIDTH-1:0] abar;\n"
    lines += f"assign abar = ~a;\n"
    pairs = [[False for i in range(WIDTH)] for i in range(WIDTH)] #pairs[i][j] denotes a proper pair
    
    lines += "assign {"

    # fill i,i entries
    for i in reversed(range(WIDTH)):
        pairs[i][i] = True
        lines += f"g{i}_{i}, "
    
    # strip trailing comma and space
    lines = lines[0:-2]

    
    lines += "} = abar;\n"
    
    # outer loop runs consists of N/2 iterations
    for i in range (1, int(math.log2(WIDTH))+1): #levels are indexed from 1,...,log2(WIDTH)
        lines += f"//****************** LEVEL {i-1} ******************//\n"
        a=2**i-1 # Left hand index
        b=0 # Right hand index
        # inner loop has N/2 iterations
        for j in range(int(WIDTH/2)):
            # this loop has worst case N/2 iterations
            for k in range(a,b-1,-1): #iterate from a to b, inclusive
                if (pairs[a][k] and pairs[k-1][b]):
                    lines += f"assign g{a}_{b} = g{a}_{k} & g{k-1}_{b};\n"
                    pairs[a][b]=True
                    break
            #lines += f"assign g{a}_{b} = g{a}_{a-int(2**(i-2))} & g{a-int(2**(i-2))-1}_{b}\n" NOTE: this was the closest I got it to work. 
            if ((a-b) < 2**(i-1)+1):
                b=a+1
                a=a+2**(i)
            else:
                b=b+1


    # generate assigns for output signal
    lines += "assign y = {"

    # fill i,i entries
    for i in reversed(range(WIDTH)):
        lines += f"g{WIDTH-1}_{i}, "
    
    # strip trailing comma and space
    lines = lines[0:-2]

    
    lines += "};\n"
    print(lines)

def main():
    genPrefix(64)


if __name__ == "__main__":
    main()



