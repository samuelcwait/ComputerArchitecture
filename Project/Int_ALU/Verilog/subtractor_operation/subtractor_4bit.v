module subtractor_4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] diff,
    output bout
);
   
    assign {bout, diff} = A + ~B[3:0] + Cin; // A + 1'sComplement{B} + Cin{1}

endmodule
