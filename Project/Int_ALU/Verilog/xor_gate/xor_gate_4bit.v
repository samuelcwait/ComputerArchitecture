module xor_gate_4bit(x,y,o);

input [3:0] x,y;
output [3:0] o;

assign o = x ^ y;

endmodule
