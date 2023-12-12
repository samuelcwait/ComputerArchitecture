module alu_tb;			//module name

  /* Make a regular pulsing clock. */	//tracks every 5 ns
  reg clk = 0;
  always #5 clk = !clk;			//every 5 ns clk either 1 or 0S
  
  reg [3:0] x;				//inputs
  reg [3:0] y;
  reg [3:0] op;
    

  
  initial begin				//load new values of x and y and opcodes
  #10 x = 6; y = 3; op = 1;		//add
  #10 op = 2;				//sub
  #10 op = 3;				//multiply
  #10 op = 4;				//and
  #10 op = 5;				//nand
  #10 op = 6;				//or
  #10 op = 7;				//nor
  #10 op = 8;				//xor
  #10 op = 9;				//xnor
  #10 op = 10;				//not
  #10 op = 11;				//shift left by 2
	$finish;
  end

  wire [3:0] out;			//outputs
  wire cout;
  
  alu a0(x, y, op, out, cout);		//call for alu module 
  
  initial begin				//code for gtkwave
    $dumpfile("alu.vcd");
    $dumpvars(0,clk);
    $dumpvars(1,x);
    $dumpvars(2,y);
    $dumpvars(3,out);
    $dumpvars(4,op);
    $dumpvars(5,cout);
  end
  
  initial				//prints to screen when values change
    $monitor("At time %t, op(%b), x(%b), y(%b) = o(%b), cout(%b)",  
    		$time, op, x, y, out, cout);
endmodule //test
