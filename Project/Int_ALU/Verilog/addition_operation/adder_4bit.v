module adder_4bit(
    input [3:0] A, B,
    input CIN,
    output [3:0] SUM,
    output COUT
);

    assign {COUT, SUM} = A + B + CIN;

endmodule

