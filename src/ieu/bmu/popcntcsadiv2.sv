module popcntcsadiv2 #(parameter WIDTH = 32) (
  input logic  [WIDTH-1:0]            a,    // number to count total ones
  output logic [$clog2(WIDTH):0]  s  // the total number of ones
);
if (WIDTH == 32) begin
  logic [4:0] s1;
  logic [4:0] s2;
  popcntcsa #(16) pcnt1(a[15:0],s1);
  popcntcsa #(16) pcnt2(a[31:16],s2);
  assign s = s1+s2;


end else begin
  logic [5:0] s1;
  logic [5:0] s2;
  popcntcsa #(32) pcnt1(a[31:0],s1);
  popcntcsa #(32) pcnt2(a[63:32],s2);
  assign s = s1+s2;
end


endmodule