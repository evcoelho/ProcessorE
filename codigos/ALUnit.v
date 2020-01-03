module ALUnit(in1, in2, ctrlALU, result,of,je,ja);
	
	input [5:0] ctrlALU;
	input [31:0] in1, in2;
	output reg of; // overflow
	output reg [31:0]result;
	output reg je, ja; // jump equal / jump above
	always @(ctrlALU or in1 or in2) begin
		of = 0;
		
		case (ctrlALU[5:0])
			6'b000000: result = in1;
			6'b000001: begin 
				result = in1 + in2; //soma
				if(in1[31] == 0 && in2[31] == 0 && result[31] == 1) of = 1;
				if(in1[31] == 1 && in2[31] == 1 && result[31] == 0) of = 1;
			end
			6'b000010: begin
			   result = in1 - in2; // subtração
				if(in1[31] == 0 && in2[31] == 1 && result[31] == 1) of = 1;
				if(in1[31] == 1 && in2[31] == 0 && result[31] == 0) of = 1;
				
				
			end
			6'b000011: result = in1 * in2; // multiplicação
			6'b000100: result = in1 & in2; // and
			6'b000101: result = in1 | in2; // or
			6'b000110: result = in1 ^ in2; // xor
			6'b000111: result = ~in1; // not
			6'b001000: result = in1 << in2; // bit shift esquerda
			6'b001001: result = in1 >> in2; // bit shift direita
			6'b001010: result = in1 / in2; // divisão
			6'b001011: begin // equal
			   if(in1 == in2) result <= 32'b00000000000000000000000000000001;
				else result <= 32'b00000000000000000000000000000000;
			end
			6'b001100: begin // not equal
			   if(in1 != in2) result <= 32'b00000000000000000000000000000001;
				else result <= 32'b00000000000000000000000000000000;
			end
			6'b001101: begin // above
			   if($signed(in1) > $signed(in2)) result <= 32'b00000000000000000000000000000001;
				else result <= 32'b00000000000000000000000000000000;
			end
			6'b001110: begin // not above
			   if($signed(in1) <= $signed(in2)) result <= 32'b00000000000000000000000000000001;
				else result <= 32'b00000000000000000000000000000000;
			end
			6'b001111: begin // less than
			   if($signed(in1) < $signed(in2)) result <= 32'b00000000000000000000000000000001;
				else result <= 32'b00000000000000000000000000000000;
			end
			6'b010000: begin // not less than
			   if($signed(in1) >= $signed(in2)) result <= 32'b00000000000000000000000000000001;
				else result <= 32'b00000000000000000000000000000000;
			end
			
			default: result = 32'b00000000000000000000000000000000;
		endcase
		
		if(in1 == in2) je <= 1'b1;
		else je <= 1'b0;
		
		if($signed(in1) > $signed(in2)) ja <= 1'b1;
		else ja <= 1'b0;
	
	end
	
	
endmodule
