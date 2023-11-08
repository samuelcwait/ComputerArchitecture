module shifter_4bit_tb;

    /* Make a regular pulsing clock. */
    reg clk = 0;
    always #5 clk = !clk;			//every 5 ns clk either 1 or 0
    
    reg [3:0] x = 0;			//input
    reg dir = 0;                //direction: 0 for left, 1 for right
    reg [1:0] shift_amt = 0;    //amount to shift

    initial begin				//load new values
        #10 x = 4'b1100; dir = 0; shift_amt = 2'b01; //shift left by 1
        #10 dir = 1; shift_amt = 2'b10; //shift right by 2
        #10 x = 4'b0011; dir = 0; shift_amt = 2'b10; //shift left by 2
        #10 $finish;
    end
    
    wire [3:0] o;				//output
    shifter_4bit s0(.A(x), .dir(dir), .shift_amt(shift_amt), .out(o));	//call for shifter module
    
    initial begin				//code for gtkwave
        $dumpfile("shifter_4bit_waveform.vcd");
        $dumpvars(0,clk);
        $dumpvars(1,x);
        $dumpvars(2,dir);
        $dumpvars(3,shift_amt);
        $dumpvars(4,o);
    end
    
    initial 				//prints to screen when values change
        $monitor("At time %t, x(%b), dir(%b), shift_amt(%b) = o(%b)",  
                $time, x, dir, shift_amt, o);
    
endmodule
