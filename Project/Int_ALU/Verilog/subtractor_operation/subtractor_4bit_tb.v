module subtractor_4bit_tb;

    reg clk = 0; // 5 ns clock
    always #5 clk = !clk;

    reg [3:0] A = 0;
    reg [3:0] B = 0;

    wire [3:0] DIFF;
    wire BOUT;

    subtractor_4bit uut (.A(A), .B(B), .DIFF(DIFF), .BOUT(BOUT));

    initial begin
        #10 A = 4'b0011;
        #10 B = 4'b0010;
        #10 A = 4'b0001;
             B = 4'b0111;
        #10 A = 4'b0000;
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
    end

    initial 
        $monitor("At time %t, A(%b), B(%b) = DIFF(%b), BOUT(%b)", 
                 $time, A, B, DIFF, BOUT);

endmodule
