module botaoin( clk, bot, saida );

	input clk, bot;
	output reg saida;
	reg state = 0;
	
	always @( posedge clk )
	begin
		if(bot == 1 && state == 0) begin
			saida <= 1;
			state <= 1;
		end
		else if(bot == 0 && state == 1) begin
			saida <= 0;
			state <= 0;
		end
		else if(bot == 1 && state == 1) begin
			saida <= 0;
			state <= 1;
		end
		else if(bot == 0 && state == 0) begin
			saida <= 0;
			state <= 0;
		end
		

	end

endmodule