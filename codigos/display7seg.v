module display7seg (entrada, saida);
    input [3:0] entrada;
    output reg [6:0]saida;
      
    always @ (*) begin 
            
				case (entrada)
				0:saida=7'b0000001;
				1:saida=7'b1001111;
				2:saida=7'b0010010;
				3:saida=7'b0000110;
				4:saida=7'b1001100;
				5:saida=7'b0100100;
				6:saida=7'b0100000;
				7:saida=7'b0001111;
				8:saida=7'b0000000;
				9:saida=7'b0000100;
				10:saida=7'b1111110; //sinal de menos
				default:saida=7'b1111111; //display apagado
				endcase 
			end
				
	endmodule