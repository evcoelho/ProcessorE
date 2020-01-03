module mux(in1, in2, saida, c);
	input [31:0]in1;
	input [31:0]in2;
	input c;
	output reg[31:0]saida;
	
	always @(*) begin
	
		case(c)
			1'b0: saida = in1;
			1'b1: saida = in2;
		endcase
	end
endmodule
