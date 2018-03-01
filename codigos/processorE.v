module processorE(clocksis,BC,
						//endi,
						//instructionOUT,
						//ctrlAlu,
						flagIN,IN,r,
						//	entrada,
					/*	out, */
						saida_centena, saida_dezena, saida_sinal, saida_unidade,
						e_centena, e_dezena, e_sinal, e_unidade);
	wire [31:0]out;
	input wire [14:0]IN;
	wire [31:0]inExt;
	wire [31:0]entrada;
	wire flagout;
	
	wire clk;
	input wire flagIN, r;
	input wire BC;
	input wire clocksis;
	
	wire [31:0]pcin; 
	wire [31:0]endi; 
	wire [31:0]pcprox;
	wire jump_stop, haltpc, resetpc;
	
	wire [31:0]instructionOUT;
	wire grav_D;
	
	wire [31:0]dados_escrita;
	wire writeBR;
	 wire [31:0] RS, RT, RD;
	
	wire [31:0]imt_ext;
	wire ctrl_ext;
	wire [31:0]resultPross;
	wire mux1;
	
	wire mux2;
	wire [31:0]in2_alu;
	
	wire [5:0]ctrlAlu;
	wire [31:0]resultAlu;
	wire of, je, ja;
	
	wire writeMemD;
	wire [31:0]dados_lidos;
	wire mux3;
	wire mux4;
	wire mux5;
	wire [31:0] rmux4;
	wire mux6;
	wire [31:0]escreveNoR;
	output wire[6:0] saida_centena, saida_dezena, saida_sinal, saida_unidade;
	output wire[6:0] e_centena, e_dezena, e_sinal, e_unidade;
	
	PC programC(.pcIN(pcin), .clock(clk), .pcOUTat(endi),.pcOUTprox(pcprox), .jump_stop(jump_stop), .halt(haltpc), .reset(resetpc));
	Inst_Mem MI(.PCend(endi), .clock(clk),.gravar_D(grav_D),.instructionOUT(instructionOUT));
	BReg BR(.endRD(instructionOUT[25:21]), 
					.endRS(instructionOUT[20:16]), 
					.endRT(instructionOUT[15:11]), 
					.clock(clk), .dados_Escrita(escreveNoR), 
					.write(writeBR), .out1(RS), .out2(RT), .out3(RD));
					
	extensor ext(.in16(instructionOUT[15:0]), .in21(instructionOUT[20:0]), .ctrl(ctrl_ext), .extendido(imt_ext));
	mux m1(.in1(imt_ext), .in2(resultPross), .saida(dados_escrita), .c(mux1));
	
	mux m2(.in1(RT), .in2(imt_ext), .saida(in2_alu), .c(mux2));
	ALUnit ALU(.in1(RS), .in2(in2_alu), .ctrlALU(ctrlAlu), .result(resultAlu),.of(of),.je(je),.ja(ja));
	
	dad_mem MD(.address(RS),.D_escrita(RD), .clock(clk), .write(writeMemD), .dados_lidos(dados_lidos),.saida(out), .otflag(flagout));
	mux m3(.in1(dados_lidos), .in2(resultAlu), .saida(resultPross), .c(mux3));
	
	mux m4(.in1(RD), .in2(imt_ext), .saida(rmux4), .c(mux4));
	mux m5(.in1(pcprox), .in2(rmux4), .saida(pcin), .c(mux5));
	mux m6(.in1(dados_escrita), .in2(inExt), .saida(escreveNoR), .c(mux6));
	
	UnidadeC UC(.reset(r),.opcode(instructionOUT[31:26]),.jump_stop(jump_stop),.HaltPC(haltpc),.ResetPC(resetpc),
					.gravar_Dmi(grav_D),
					.WriteBr(writeBR),
					.Ctrl_ext(ctrl_ext),
					.mux1(mux1),.mux2(mux2),
					.ctrlALU(ctrlAlu),
					.WriteMemD(writeMemD),
					.mux3(mux3),.mux4(mux4),.mux5(mux5),
					.JE(je),.JA(ja),
					.flagIN(flagIN),.fout(flagout),.mux6(mux6));
					
	extIN ei(.in15(IN), .extendido(inExt));
	
	BCD saida(.numBCD(out), .saida_centena(saida_centena), .saida_dezena(saida_dezena), .saida_sinal(saida_sinal), .saida_unidade(saida_unidade),
				.entradaUnidade(entradaUnidade), .entradaDezena(entradaDezena),.entradaCentena(entradaCentena), .entradaSinal(entradaSinal));
	BCD entradaIN(.numBCD(inExt), .saida_centena(e_centena), .saida_dezena(e_dezena), .saida_sinal(e_sinal), .saida_unidade(e_unidade),
				.entradaUnidade(entradaUnid), .entradaDezena(entradaDez),.entradaCentena(entradaCent), .entradaSinal(entradaSin));
	
	debouncer db(
    .clk(clocksis), //this is a 50MHz clock provided on FPGA pin PIN_Y2
    .PB(~BC),  //this is the input to be debounced
    .PB_state(clk)  //this is the debounced switch
	);
endmodule
