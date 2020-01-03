module BReg(endRD, endRS, endRT, clock, 
				dados_Escrita, write, out1, 
				out2, out3, jal,pc, prog_or_kernelRD,
				prog_or_kernel_RS_RT,
				pcprog,
				savepcprog);
	input [4:0] endRD, endRS, endRT;
	input write,clock,jal;
	input [31:0] dados_Escrita;
	input [31:0] pc;
	input [31:0] pcprog;
	input savepcprog;
	output [31:0] out1, out2, out3;
	
	input prog_or_kernelRD, prog_or_kernel_RS_RT;
	
	
	reg [31:0] registradores [63:0];
	always @(posedge clock) begin
		if(write) begin // escrever dados na memória
			registradores[(32 * prog_or_kernelRD) + endRD] <= dados_Escrita; // se prog_or_kernel == 1, salva no programa(32-63), se for 0 salva no kernel(0-31)
		end 
		if(jal) begin // escreve no $ra o endereço atual
			registradores[(32 * prog_or_kernelRD) + 31] <= pc+1;
		end 
		if(savepcprog)begin
			registradores[(32 * prog_or_kernelRD) + 27] <= pcprog+1;
		end
			
	end
	assign out1 = registradores[(32 * prog_or_kernel_RS_RT) + endRS];
	assign out2 = registradores[(32 * prog_or_kernel_RS_RT) + endRT];
	assign out3 = registradores[(32 * prog_or_kernelRD) + endRD];

endmodule
