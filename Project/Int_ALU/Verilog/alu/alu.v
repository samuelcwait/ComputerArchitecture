module alu(						//module name
input [3:0] x, y, op,
output reg [3:0] o,
output reg cout=0
);



wire [1:0] shift_amt = 2;				//preset

wire [3:0] r1;						//all outputs from modules
wire [3:0] r2;
wire [3:0] r3;
wire [3:0] r4;
wire [3:0] r5;
wire [3:0] r6;
wire [3:0] r7;
wire [3:0] r8;
wire [3:0] r9;
wire [3:0] r10;
wire [3:0] r11;


wire Cout1;						//Couts for arithmetic op's
wire Cout2;
wire Cout3;

adder_4bit d1(x, y, 1'b0, r1, Cout1);			//adder
subtractor_4bit d2(x, y, 1'b1, r2, Cout2);		//subtractor
multiplier_4bit_carry d3(x, y, 1'b0, r3, Cout3);	//multiplier
and_gate_4bit d4(x, y, r4);				//and_gate
nand_gate_4bit d5(x, y, r5);				//nand_gate
or_gate_4bit d6(x, y, r6);				//or_gate
nor_gate_4bit d7(x, y, r7);				//nor_gate
xor_gate_4bit d8(x, y, r8);				//xor_gate
xnor_gate_4bit d9(x, y, r9);				//xnor_gate
not_gate_4bit d10(x, r10);				//not_gate
shifter_4bit d11(x, 1'b0, shift_amt, r11); 		//shifts left by 2




  always@* begin					//functions as a mux
    case(op)
      4'b0001: begin o = r1; cout = Cout1; end		//adder
      4'b0010: begin o = r2; cout = Cout2; end		//subtractor
      4'b0011: begin o = r3; cout = Cout3; end		//multiplier
      4'b0100: begin o = r4; cout = 0; end		//and_gate
      4'b0101: begin o = r5; cout = 0; end		//nand_gate
      4'b0110: begin o = r6; cout = 0; end		//or_gate
      4'b0111: begin o = r7; cout = 0; end		//nor_gate
      4'b1000: begin o = r8; cout = 0; end		//xor_gate
      4'b1001: begin o = r9; cout = 0; end		//xnor_gate
      4'b1010: begin o = r10; cout = 0; end		//not_gate
      4'b1011: begin o = r11; cout = 0; end		//shifts left by 2

  
    endcase

  end
							

endmodule //test
