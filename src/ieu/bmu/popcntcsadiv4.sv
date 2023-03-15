module popcntcsadiv4 #(parameter WIDTH = 32) (
  input logic  [WIDTH-1:0]            a,    // number to count total ones
  output logic [$clog2(WIDTH):0]  s  // the total number of ones
);
if (WIDTH == 32) begin
  logic [3:0] s1;
  logic [3:0] s2;
  logic [3:0] s3;
  logic [3:0] s4;
  popcntcsa #(8) pcnt1(a[7:0],s1);
  popcntcsa #(8) pcnt2(a[15:8],s2);
  popcntcsa #(8) pcnt3(a[23:16],s3);
  popcntcsa #(8) pcnt4(a[31:24],s4);
  assign s = s1+s2+s3+s4;


end else begin
  logic [4:0] s1;
  logic [4:0] s2;
  logic [4:0] s3;
  logic [4:0] s4;
  popcntcsa #(16) pcnt1(a[15:0],s1);
  popcntcsa #(16) pcnt2(a[31:16],s2);
  popcntcsa #(16) pcnt3(a[47:32],s3);
  popcntcsa #(16) pcnt4(a[63:48],s4);
  assign s = s1+s2+s3+s4;
 
end


endmodule