module BCD (numBCD, saida_centena, saida_dezena, saida_sinal, saida_unidade,
				entradaUnidade, entradaDezena,entradaCentena, entradaSinal);
	input [31:0] numBCD;
	integer i;
	reg [9:0] numero;
	output reg [3:0] entradaUnidade, entradaDezena,entradaCentena, entradaSinal;
	output [6:0] saida_centena, saida_dezena, saida_sinal, saida_unidade;
	
	display7seg display_unidade(entradaUnidade, saida_unidade);
	display7seg display_dezena(entradaDezena, saida_dezena);
	display7seg display_centena(entradaCentena, saida_centena);
	display7seg display_sinal(entradaSinal, saida_sinal);
	
	always @ (numBCD) begin
		entradaCentena = 4'd0;
		entradaDezena = 4'd0;
		entradaUnidade = 4'd0;
		
		if(numBCD == 32'b11111111111111111111111111111111)begin //display apagado
			entradaCentena = 4'd11;
			entradaDezena = 4'd11;
			entradaUnidade = 4'd11;
		end
		
		else begin 
			if (numBCD[31] == 1) begin //numBCDero negativo
				numero = numBCD - 1;
				numero = ~numero;
				entradaSinal = 4'd10;
			end	
			else if (numBCD[31] == 0) begin //numero positivo
				entradaSinal = 4'd11;
				numero = numBCD;
			end
			
			for (i=9; i>=0; i=i-1) begin
				if (entradaCentena >= 5) begin
					entradaCentena = entradaCentena + 3;
					end
				if (entradaDezena >= 5) begin
					entradaDezena = entradaDezena +3;
					end
				if (entradaUnidade >= 5) begin
					entradaUnidade = entradaUnidade +3;
					end
				entradaCentena = entradaCentena << 1;
				entradaCentena[0] = entradaDezena[3];
				entradaDezena = entradaDezena << 1;
				entradaDezena[0] = entradaUnidade[3];
				entradaUnidade = entradaUnidade << 1;
				entradaUnidade[0] = numero[i];	
			end
		end

	end	
endmodule
			