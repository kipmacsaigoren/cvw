module csan(input logic a0, input logic a1, input logic a2, output logic c, output logic s);
    assign c = (a0&a1) | (a0&a2) | (a1&a2);
    assign s = a0 ^ a1 ^ a2;
endmodule