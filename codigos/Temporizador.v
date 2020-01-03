module Temporizador(clk_auto, clk);
	input clk_auto;
	output reg clk;
	reg[31:0] cont;
	
	always@(posedge clk_auto)
		begin
			if(cont==50000) //25'b1011111010111100001000000//1s
				begin
					cont <= 0; //registrador usa nao bloqueante (<=)
					clk = ~clk;
				end
			else
				cont <= cont + 32'b1; //1'b1
		end

endmodule