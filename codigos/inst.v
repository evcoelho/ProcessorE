
			mem_ram[0] = 32'b010110_01001_000000000000000000000;//RD = IN
			mem_ram[1] = 32'b001101_00101_000000000000000000101;//loadi rd = 5
			mem_ram[2] = 32'b000001_00111_01001_00101_00000000000;//soma rs + rt / in+5
			mem_ram[3] = 32'b010111_00111_000000000000000000000;//out RD resultado da soma
			mem_ram[4] = 32'b010111_01001_000000000000000000000;//out RD entrada
			mem_ram[5] = 32'b001101_00011_000000000000000001010;//loadi mem[3] = 10 imt = 21bits
			mem_ram[6] = 32'b000001_00111_00011_00101_00000000000;//soma rs + rt / 10+5
			mem_ram[7] = 32'b001110_00111_00100_0000000000000100; // store na ram[RS] o resultado da soma
			mem_ram[8] = 32'b001100_01011_00100_0000000000000101; //LOAD da ram[RS] para o registrador 7  
			mem_ram[9] = 32'b001111_01111_01011_0000000000000110;//move RD<=mem[7]
			mem_ram[10] = 32'b010111_01011_000000000000000000111;//out RD registrador com o resultado do load
			mem_ram[11] = 32'b010111_00101_000000000000000000111;//out RD 5
			mem_ram[12] = 32'b010111_01111_000000000000000000111;//out RD registrador do move 
			mem_ram[13] = 32'b001101_10101_000000000000000010000;//loadi rd = imt = 21bits valor da linha do jump = 16;
			mem_ram[14] = 32'b001101_10001_000000000000000000010;//loadi rd = imt = 21bits
			mem_ram[15] = 32'b001101_11001_000000000000000000010;//loadi rd = imt = 21bits
			mem_ram[16] = 32'b000001_10111_10001_11001_00000000000;//soma rs + rt / 
			mem_ram[17] = 32'b000001_11001_10111_10001_00000000000;//soma rs + rt / 
			mem_ram[18] = 32'b010111_11001_000000000000000000111;//out RD
			mem_ram[19] = 32'b010101_10101_11001_01001_00000000000;//JNA if soma=<entrada pula pra linha 16
	