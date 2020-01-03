module extensor(in16, in21, ctrl, extendido);
	input [15:0]in16;
	input [20:0]in21;
	input ctrl;
	output reg [31:0]extendido;
	always @( * ) begin
		case(ctrl)
			1'b1: begin // extende os 16 bits para 32
				if(in16[15] == 1)begin 
					extendido = {16'b1111111111111111,in16};
				end else
					extendido = {16'b0000000000000000,in16};
			end
			1'b0: begin // extende os 21 bits para 32
				if(in21[20] == 1)begin 
					extendido = {11'b11111111111,in21};
				end else
					extendido = {11'b00000000000,in21};
			end
			default: extendido = 32'b00000000000000000000000000000000;
		endcase
	
	end
	
endmodule
