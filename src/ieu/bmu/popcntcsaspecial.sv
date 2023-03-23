module popcntcsaspecial #(parameter WIDTH = 15) (
  input logic  [WIDTH-1:0]            a,    // number to count total ones
  output logic [$clog2(WIDTH)-1:0]  s  // the total number of ones
);
if (WIDTH == 15) begin
  logic [3:0] s1;
  logic [2:0] s2;

  popcntcsa #(9) pcnt1(a[8:0], s1);
  popcntcsa #(6) pcnt2(a[14:9],s2);
  assign s = {s1+{1'b0,s2}};
end
else if (WIDTH == 32) begin
  /*logic [3:0] s1;
  logic [3:0] s2;
  logic [3:0] s3;
  logic [2:0] s4;

  popcntcsa #(9) pcnt1(a[8:0], s1);
  popcntcsa #(9) pcnt2(a[17:9],s2);
  popcntcsa #(9) pcnt3(a[26:18],s3);
  popcntcsa #(5) pcnt4(a[31:27],s4);
  assign s = s1+s2+s3+s4;*/
  /*logic [4:0] s1;
  popcntcsa #(30) pcnt1(a[29:0],s1);
  assign s=s1+a[30]+a[31];*/
  /*
  logic [2:0] s1;
  logic [2:0] s2;
  logic [2:0] s3;
  logic [2:0] s4;
  logic [2:0] s5;

  popcntcsa #(6) pcnt1(a[5:0],s1);
  popcntcsa #(6) pcnt2(a[11:6],s2);
  popcntcsa #(6) pcnt3(a[17:12],s3);
  popcntcsa #(6) pcnt4(a[23:18],s4);
  popcntcsa #(6) pcnt5(a[29:24],s5);


  assign s = s1+s2+s3+s4+s5+{2'b0,a[30]}+{2'b0,a[31]};
  */
  /*
  logic [3:0] s1;
  logic [3:0] s2;
  logic [2:0] s3;
  logic [2:0] s4;
  popcntcsa #(9) pcnt1(a[8:0], s1);
  popcntcsa #(9) pcnt2(a[17:9], s2);
  popcntcsa #(6) pcnt3(a[23:18], s3);
  popcntcsa #(6) pcnt4(a[29:24], s4);
  
  assign s = s1+s2+{1'b0,s3}+{1'b0,s4}+{3'b0,a[30]}+{3'b0,a[31]};*/
 /*
  logic [3:0] s1,s2;
  popcntcsa #(15) pcnt1(a[14:0], s1);
  popcntcsa #(15) pcnt2(a[29:15],s2);
  assign s = s1+s2+a[30]+a[31];*/
/*
  logic [4:0] s1;
  logic [3:0] s2;

  popcntcsa #(17) pcnt1(a[16:0],s1);
  popcntcsa #(15) pcnt2(a[31:17],s2);
  assign s = s1+s2;
  */
  logic [4:0] s1;
  logic [3:0] s2;

  popcntcsa #(18) pcnt1(a[17:0],s1);
  popcntcsa #(14) pcnt2(a[31:18],s2);
  assign s = s1+s2;
  
end else begin
  logic [5:0] s1;
  logic [5:0] s2;
  popcntcsa #(27) pcnt1(a[26:0],s1);
  popcntcsa #(27) pcnt2(a[53:27],s2);
  assign s = s1+s2+a[54]+a[55]+a[56]+a[57]+a[58]+a[59]+a[60]+a[61]+a[62]+a[63];
end


endmodule