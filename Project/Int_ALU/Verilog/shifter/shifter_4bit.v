module shifter_4bit (
    input [3:0] A,       // Data input
    input dir,           // Shift direction: 0 for left, 1 for right
    input [1:0] shift_amt, // Amount to shift (0 to 3 positions)
    output reg [3:0] out    // Shifted output (Changed to 'reg')
);

    always @* begin
        case (shift_amt)
            2'b00: out = A;
            2'b01: out = (dir) ? (A >> 1) : (A << 1);
            2'b10: out = (dir) ? (A >> 2) : (A << 2);
            2'b11: out = (dir) ? (A >> 3) : (A << 3);
            default: out = 4'b0000; // Ideally, this shouldn't be hit
        endcase
    end

endmodule


