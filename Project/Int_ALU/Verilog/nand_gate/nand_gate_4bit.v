module nand_gate_4bit(x, y, o);	//module name

input [3:0] x, y;		//inputs
output [3:0] o;			//outputs

assign o = ~(x & y);		//o = not(x and y)

endmodule			//end
