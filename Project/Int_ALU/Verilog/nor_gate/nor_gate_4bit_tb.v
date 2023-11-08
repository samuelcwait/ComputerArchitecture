module nor_gate_4bit_tb;		//module name

  /* Make a regular pulsing clock. */	//tracks every 5 ns
  reg clk = 0;
  always #5 clk = !clk;			//every 5 ns clk either 1 or 0S
  
  reg [3:0] x = 0;			//inputs
  reg [3:0] y = 0;
  initial begin				//load new values
    # 10 x = 4'b1111;			//every 10 nano
    # 10 y = 4'b1111;
    	 x = 4'b0000;			//seconds
    # 10 y = 4'b0110;
    # 10 $finish;
  end
  
  wire [3:0] o;				//output
  nor_gate_4bit a0(x, y, o);		//call for gate module
  
  initial begin				//code for gtkwave
    $dumpfile("nor_gate_4bit.vcd");
    $dumpvars(0,clk);
    $dumpvars(1,x);
    $dumpvars(2,y);
    $dumpvars(3,o);
  end
  
  initial 				//prints to screen when values change
    $monitor("At time %t, x(%b), y(%b) = o(%b)",  
    		$time, x, y, o);   
    									
endmodule //test
