module subtractor_4bit (
    input [3:0] A,
    input [3:0] B,
    output [3:0] diff,
    output bout
);

    assign {bout, diff} = A - B;

endmodule
