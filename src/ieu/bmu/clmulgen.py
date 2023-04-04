"""
    clmulgen.py
    generates behavior verilog for carry-less multiplier
"""

"""
always_comb begin
    for (i=0;i<WIDTH;i++) begin: outer
      S[WIDTH*i] = X[0] & Y[i];
      for (j=1;j<=i;j++) begin: inner
        S[WIDTH*i+j] = (X[j] & Y[i-j]) ^ S[WIDTH*i+j-1];
      end
      ClmulResult[i] = S[WIDTH*i+j-1];
    end
  end
"""
f = open("clmul.txt", "w")
lines = ""


rv64 = int(input("1 for RV64, 0 for RV32: ")) == 1
WIDTH = 64 if rv64 else 32
for i in range(WIDTH):
    lines += f"assign S{WIDTH*i} = X[0] & Y[{i}];\n"
    for j in range(1, i+1):
        lines += f"assign S{WIDTH*i+j} = (X[{j}] & Y[{i-j}]) ^ S{WIDTH*i+j-1};\n"
    lines += f"assign ClmulResult[{i}] = S{WIDTH*i+(i+1)-1};\n"

print(lines)
f.write(lines)
f.close()