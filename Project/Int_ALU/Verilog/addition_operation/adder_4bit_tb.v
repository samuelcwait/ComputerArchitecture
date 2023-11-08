module adder_4bit_tb;

    reg clk = 0; // 5 ns clock
    always #5 clk = !clk;

    reg [3:0] A = 0;
    reg [3:0] B = 0;
    reg CIN = 0;

    wire [3:0] SUM;
    wire COUT;

    adder_4bit uut (.A(A), .B(B), .CIN(CIN), .SUM(SUM), .COUT(COUT));

    initial begin
        #10 A = 4'b0010;
        #10 B = 4'b0011;
        #10 A = 4'b0111;
             B = 4'b0001;
        #10 A = 4'b1111;
             B = 4'b0001;
        #10 $finish;
    end

    initial begin
        $dumpfile("adder_4bit.vcd");
        $dumpvars(0,clk);
        $dumpvars(1,A);
        $dumpvars(2,B);
        $dumpvars(3,SUM);
        $dumpvars(4,COUT);
    end

    initial 
        $monitor("At time %t, A(%b), B(%b), CIN(%b) = SUM(%b), COUT(%b)", 
                 $time, A, B, CIN, SUM, COUT);

endmodule
