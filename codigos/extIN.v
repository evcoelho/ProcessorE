module extIN(in15, extendido);
	input [14:0]in15;
	
	output reg [31:0]extendido;
	always @( * ) begin
		
				if(in15[14] == 1)begin 
					extendido = {17'b11111111111111111,in15};
				end else
					extendido = {17'b00000000000000000,in15};
	
	end
	
endmodule