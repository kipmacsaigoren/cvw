module configurablemultiplier(
    input logic [1:0] x0,x1,x2,x3,
    input logic [1:0] y0,y1,y2,y3,
    input logic xs0,xs1,xs2,xs3,
    input logic ys0,ys1,ys2,ys3,
    input logic [1:0] xo0,xo1,xo2,xo3,
    input logic [1:0] yo0,yo1,yo2,yo3,
    input logic [1:0] mode, // lo: 00, med: 01, hi: 10
    output [16:0] result
);

logic [8:0] p0,p1,p2,p3;
logic [8:0] p0sh2, p0sh4,p1sh2,p2sh2,p3sh2;
logic [8:0] p0sh,p1sh,p2sh,p3sh;
logic [2:0] po0,po1,po2,po3;
logic [2:0] shamt0, shamt1,shamt2, shamt3;


logic [14:0] p0zapp, p1zapp, p2zapp, p3zapp;
logic [14:0] p0norm, p1norm, p2norm, p3norm;
logic hi;

assign hi = (mode == 2'b10);


// offset logic start
assign po0 = xo0 + xo0;
assign po1 = xo1 + xo1;
assign po2 = xo2 + xo2;
assign po3 = xo3 + xo3;

mux2 #(3) shmux0(po0, 3'b0, hi, shamt0);
mux2 #(3) shmux1(po1, 3'b0, hi, shamt1);
mux2 #(3) shmux2(po2, 3'b0, hi, shamt2);
mux2 #(3) shmux3(po3, 3'b0, hi, shamt3);
// offset logic end


mblock block1(x0,y0, xs0,ys0,p0);
mblock block2(x1,y1, xs1,ys1,p1);
mblock block3(x2,y2, xs2,ys2,p2);
mblock block4(x3,y3, xs3,ys3,p3);

assign p0sh2 = p0 >>> 2;
assign p0sh4 = p0 >>> 4;
assign p1sh2 = p1 >>> 2;
assign p2sh2 = p2 >>> 2;

mux3 #(9) p0mux(p0,p0sh2,p0sh4, mode, p0sh);
mux3 #(9) p1mux(p1,p1sh2,p1sh2, mode, p1sh);
mux3 #(9) p2mux(p2,p2sh2,p2sh2, mode, p2sh);
mux3 #(9) p3mux(p3,p3sh2,p3sh2, mode, p3sh);

assign p0zapp = {{6'b0}, p0sh};
assign p1zapp = {{6'b0}, p1sh};
assign p2zapp = {{6'b0}, p2sh};
assign p3zapp = {{6'b0}, p3sh};

assign p0norm = p0zapp >>> shamt0;
assign p1norm = p1zapp >>> shamt1;
assign p2norm = p2zapp >>> shamt2;
assign p3norm = p3zapp >>> shamt3;

assign result = p0norm + p1norm + p2norm + p3norm;


endmodule

module mblock(
    input logic [1:0] a,b,
    input logic as, bs,
    output logic [8:0] y
);

logic [3:0] p;
logic [4:0] zextp;
logic [4:0] compzextp;
logic [4:0] sgndzextp;
logic ps;

assign ps = as ^ bs;
assign p = a*b;
assign zextp = {{1'b0},p};
assign compzextp = ~zextp+1;

mux2 #(5) psignedmux(zextp,invzextpadd,ps,sgndzextp);

assign y = {{sgndzextp},{4'b0000}};

endmodule