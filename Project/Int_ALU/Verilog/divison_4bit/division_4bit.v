module divider_4bit(
    input [3:0] a, // Dividend
    input [3:0] b, // Divisor
    output reg [3:0] quotient,
    output reg division_by_zero
);

    integer i;
    reg [7:0] temp; // Extended bits for division

    always @(a or b) begin
        // Check for division by zero
        if (b == 0) begin
            quotient = 0;
            division_by_zero = 1;
        end else begin
            temp = {4'b0000, a}; // Initialize temp with the dividend
            quotient = 0;
            division_by_zero = 0;

            for (i = 0; i < 4; i = i + 1) begin
                temp = temp << 1; // Shift left by 1
                quotient = quotient << 1; // Shift quotient left

                // Subtract the divisor from the shifted temp
                if (temp[7:4] >= b) begin
                    temp[7:4] = temp[7:4] - b;
                    quotient = quotient + 1;
                end
            end
        end
    end
endmodule