module csan(input logic a0, input logic a1, input logic a2, output logic c, output logic s);
    assign c = a0&(a1 | a2) + a2&(a1 | a0);
    //assign c = (a0 & a1) | (a1&a2) | (a2&a0);
    assign s = a0 ^ a1 ^ a2;
endmodule
module csan2(input logic a0, input logic a1, output logic c, output logic s);
    assign c = (a0&a1);
    assign s = a0 ^ a1;
endmodule