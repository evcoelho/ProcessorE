module processorE(clocksis,BC,
						//endi,
						//instructionOUT,
						//ctrlAlu,
						IN,r,
						//	entrada,
					/*	out, */
						saida_centena, saida_dezena, saida_sinal, saida_unidade,
						e_centena, e_dezena, e_sinal, e_unidade,BCOUT,p_or_k,
						prog_kernel_RD,
						prog_kernel_RS_RT);
	wire [31:0]out;
	input wire [8:0]IN;
	wire [31:0]inExt;
	wire [31:0]entrada;
	wire flagout;
	
	wire clk;
	input wire r;
	wire flagIN,bout;
	wire flagbi, flagbo;
	input wire BC,BCOUT;
	input wire clocksis;
	
	wire [31:0]pcin; 
	wire [31:0]endi; 
	wire [31:0]pcprox;
	wire [31:0]pcprog;
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
	
	wire jal;
	wire mux7;
	wire [31:0]dados_stack;
	wire [31:0]dados_mem;
	wire flagstack;
	
	output wire prog_kernel_RD;
	output wire prog_kernel_RS_RT;
	wire control_rd;
	wire control_rsrt;
	wire writehd;
	wire [31:0]outhd;
	
	wire [31:0]dataWriteReg;
	wire mux8;
	output wire p_or_k;
	wire set_prog_os;
	wire write_os;
	wire savepcprog;
	wire set_pc_prog;
	wire flagbios;
	wire [31:0]outbios;
	wire [31:0]outmi;
	wire haltbios;
	
	
	PC programC(.pcIN(pcin), 
					.clock(clk), 
					.pc_at(endi),
					.pc_prox(pcprox),
					.pc_prog_at(pcprog),
					.jump_stop(jump_stop), 
					.halt(haltpc), 
					.reset(resetpc),
					.prog_or_kernel(p_or_k),
					.set_pc_prog(set_pc_prog),
					.pc_reg(RD),
					.flagbios(flagbios),
					.haltbios(haltbios));
					
					
	set_prog_or_kernel set_pk(.clock(clk),.signal_uc(set_prog_os), .prog_or_kernel(p_or_k), .reset(resetpc));
	
	bios abios(.address(endi),.dados_out(outbios),.clock(clk),.clock_a(clocksis));
	mux m9(.in1(outbios), .in2(outmi), .saida(instructionOUT), .c(flagbios));
	
	Inst_Mem MI(.PCend(endi), 
					.write_address(RD),
					.gravar_D(grav_D),
					.write_os(write_os),
					.instructionOUT(outmi), 
					.clock_a(clocksis),
					.clock(clk),
					.set_prog_kernel(p_or_k),
					.data_write(outhd));
	
	BReg BR(		.endRD(instructionOUT[25:21]), 
					.endRS(instructionOUT[20:16]), 
					.endRT(instructionOUT[15:11]), 
					.clock(clk), .dados_Escrita(dataWriteReg), 
					.write(writeBR),
					.out1(RS), .out2(RT), .out3(RD),
					.jal(jal), .pc(endi), 
					.prog_or_kernelRD(prog_kernel_RD), .prog_or_kernel_RS_RT(prog_kernel_RS_RT),
					.pcprog(pcprog),
					.savepcprog(savepcprog));
					
	/*state_machine_kernel_prog select_breg_kernel_prog(	.clock(clk),
																		.control_reg_prog_kernel(control_reg),
																		.prog_or_kernel_RD(prog_kernel_RD), 
																		.prog_or_kernel_RS_RT(prog_kernel_RS_RT));*/
																		
	set_RD setRD(.clock(clk),.signal_uc(control_rd), .out(prog_kernel_RD),.reset(resetpc));
	set_RS_RT setRSRT(.clock(clk),.signal_uc(control_rsrt), .out(prog_kernel_RS_RT),.reset(resetpc));
					
	extensor ext(.in16(instructionOUT[15:0]), .in21(instructionOUT[20:0]), .ctrl(ctrl_ext), .extendido(imt_ext));
	mux m1(.in1(imt_ext), .in2(resultPross), .saida(dados_escrita), .c(mux1));
	
	mux m2(.in1(RT), .in2(imt_ext), .saida(in2_alu), .c(mux2));
	ALUnit ALU(.in1(RS), .in2(in2_alu), .ctrlALU(ctrlAlu), .result(resultAlu),.of(of),.je(je),.ja(ja));
	
	dad_mem MD(	.address(RS),
					.D_escrita(RD), 
					.clock(clk), 
					.write(writeMemD), 
					.dados_lidos(dados_lidos),
					.dados_stack(dados_stack),
					.saida(out), .otflag(flagout), 
					.writeStack(flagstack), 
					.clock_a(clocksis));
					
	mux m7(.in1(dados_lidos), .in2(dados_stack), .saida(dados_mem), .c(mux7));
	mux m3(.in1(dados_mem), .in2(resultAlu), .saida(resultPross), .c(mux3));
	
	mux m4(.in1(RD), .in2(imt_ext), .saida(rmux4), .c(mux4));
	mux m5(.in1(pcprox), .in2(rmux4), .saida(pcin), .c(mux5));
	mux m6(.in1(dados_escrita), .in2(inExt), .saida(escreveNoR), .c(mux6));
	
	botaoin bi(.clk(clk), .bot(flagIN), .saida(flagbi));
	botaoin bo(.clk(clk), .bot(bout), .saida(flagbo));
	
	UnidadeC UC(.reset(r),
					.opcode(instructionOUT[31:26]),
					.jump_stop(jump_stop),
					.HaltPC(haltpc),
					.ResetPC(resetpc),
					.gravar_Dmi(grav_D),
					.WriteBr(writeBR),
					.Ctrl_ext(ctrl_ext),
					.mux1(mux1),.mux2(mux2),
					.ctrlALU(ctrlAlu),
					.WriteMemD(writeMemD),
					.mux3(mux3),.mux4(mux4),.mux5(mux5),
					.JE(je),.JA(ja),
					.flagIN(flagbi),.fout(flagout),.mux6(mux6),
					.jal(jal),
					.ws(flagstack),
					.mux7(mux7),
					.bout(flagbo),
					.control_rd(control_rd),
					.control_rsrt(control_rsrt),
					.writeHD(writehd),
					.mux8(mux8),
					.set_prog_os(set_prog_os),
					.write_os(write_os),
					.savepcprog(savepcprog),
					.set_pc_prog(set_pc_prog),
					.haltbios(haltbios));
					
	extIN ei(.in15(IN), .extendido(inExt));
	
	
	HardDrive HD(.address(RS),.prog(RT),.dados_in(RD),.dados_out(outhd),.write(writehd),.clock(clk),.clock_a(clocksis));
	mux m8(.in1(escreveNoR), .in2(outhd), .saida(dataWriteReg), .c(mux8));
	
	BCD saida(.numBCD(out), .saida_centena(saida_centena), .saida_dezena(saida_dezena), .saida_sinal(saida_sinal), .saida_unidade(saida_unidade),
				.entradaUnidade(entradaUnidade), .entradaDezena(entradaDezena),.entradaCentena(entradaCentena), .entradaSinal(entradaSinal));
	
	//inExt mudou para endi
	BCD entradaIN(.numBCD(endi), .saida_centena(e_centena), .saida_dezena(e_dezena), .saida_sinal(e_sinal), .saida_unidade(e_unidade),
				.entradaUnidade(entradaUnid), .entradaDezena(entradaDez),.entradaCentena(entradaCent), .entradaSinal(entradaSin));
	
	debouncer db(
    .clk(clocksis), //this is a 50MHz clock provided on FPGA pin PIN_Y2
    .PB(~BC),  //this is the input to be debounced
    .PB_state(flagIN)  //this is the debounced switch
	);
	debouncer db2(
    .clk(clocksis), //this is a 50MHz clock provided on FPGA pin PIN_Y2
    .PB(~BCOUT),  //this is the input to be debounced
    .PB_state(bout)  //this is the debounced switch
	);
	
	Temporizador div_clock(.clk_auto(clocksis), .clk(clk));
	
endmodule
