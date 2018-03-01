module PC(pcIN, clock, pcOUTat,pcOUTprox,  jump_stop, halt, reset);
	input [31:0]pcIN;
	input clock, jump_stop, halt, reset;
	output reg[31:0] pcOUTat, pcOUTprox;
	always @(posedge clock) begin
		if(halt == 1) begin
		end
		else if(reset == 1) begin
			
			pcOUTat = 0;
			pcOUTprox = 32'b00000000000000000000000000000001;
		end
		else if(jump_stop == 1) begin
			pcOUTprox = pcIN + 1;
		end
		else if(jump_stop == 0) begin
			pcOUTat = pcIN;
			pcOUTprox = pcIN + 1;
		end
	end
	
endmodule
