module multiplier_4bit_carry_tb;

    reg clk = 0;  // 5 ns clock
    always #5 clk = !clk;  // Clock generation with 5ns period

    reg [3:0] A = 0;           // First multiplicand
    reg [3:0] B = 0;           // Second multiplicand
    reg carry_in = 0;          // Carry-in input

    initial begin  // Stimulus for the testbench
        #10 A = 4'b0010; B = 4'b0001; carry_in = 1'b0;
        #10 A = 4'b0011; B = 4'b0010; carry_in = 1'b0;
        #10 A = 4'b0001; B = 4'b0111; carry_in = 1'b1;
        #10 A = 4'b1011; B = 4'b0011; carry_in = 1'b0;
        #10 $finish;  // End the simulation
    end

    wire [3:0] PRODUCT;   // Product output
    wire carry_out=0;  // Carry-out output
    multiplier_4bit_carry uut(
        .A(A),
        .B(B),
        .carry_in(carry_in),
        .PRODUCT(PRODUCT),
        .carry_out(carry_out)
    );  // Instantiate the unit under test

    initial begin  // For GTKWave visualization
        $dumpfile("multiplier_4bit_carry_waveform.vcd");
        $dumpvars(0,clk);
        $dumpvars(1,A);
        $dumpvars(2,B);
        $dumpvars(3,carry_in);
        $dumpvars(4,PRODUCT);
        $dumpvars(5,carry_out);
    end

    initial  // Monitor values and print when they change
        $monitor("At time %t, A(%b), B(%b), carry_in(%b) = PRODUCT(%b) with carry_out(%b)", 
                $time, A, B, carry_in, PRODUCT, carry_out);

endmodule
