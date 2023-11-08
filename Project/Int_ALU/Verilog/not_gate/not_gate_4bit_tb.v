module not_gate_4bit_tb;		//module name

  /* Make a regular pulsing clock. */	//tracks every 5 ns
  reg clk = 0;
  always #5 clk = !clk;			//every 5 ns clk either 1 or 0S
  
  reg [3:0] x;				//inputs
  initial begin				//load new values
    	 x = 4'b0000;			//every 10 nano	
    # 10 x = 4'b0110;
    # 10 x = 4'b1111;
    # 10 $finish;			//seconds
  end
  
  wire [3:0] o;				//output
  not_gate_4bit a0(x, o);		//call for gate module
  
  initial begin				//code for gtkwave
    $dumpfile("not_gate_4bit.vcd");
    $dumpvars(0,clk);
    $dumpvars(1,x);
    $dumpvars(2,o);
  end
  
  initial
    $monitor("At time %t, x(%b)= o(%b)", 	//prints to screen
				$time, x, o);   //when any value changes
endmodule //test
