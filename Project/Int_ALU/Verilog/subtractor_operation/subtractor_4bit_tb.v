module subtractor_4bit_tb;

    reg clk = 0; // 5 ns clock
    always #5 clk = !clk;

    reg [3:0] A = 0;
    reg [3:0] B = 0;
    reg       Cin = 1;

    wire [3:0] DIFF;
    wire BOUT;

    subtractor_4bit  a0(A, B, Cin, DIFF, BOUT);

    initial begin
        #10 A = 4'b0011; 	// 3 - 0 = 0 Out 0
        #10 B = 4'b0010;	// 3 - 2 = 1 Out 0
        #10 A = 4'b0001;	// 1 - 7 = -6 -> 10 Out 1
             B = 4'b0111;
        #10 A = 4'b0000;	// 0 - 1 = -1 -> 15 Out 1
             B = 4'b0001;
        #10 $finish;
    end

    initial begin
        $dumpfile("subtractor_4bit.vcd");
        $dumpvars(0,clk);
        $dumpvars(1,A);
        $dumpvars(2,B);
        $dumpvars(3,DIFF);
        $dumpvars(4,BOUT);
        $dumpvars(5,Cin);
    end

    initial 
        $monitor("At time %t, A(%b), B(%b), Cin(%b) = DIFF(%b), BOUT(%b)", 
                 $time, A, B, Cin, DIFF, BOUT);

endmodule
