module IO(address,D_escrita, clock, writeIO, writeM, flagIn, in, out, dados_lidos, stop, ctrl);
	input [31:0] address, D_escrita, in;
	input clock, flagIn, ctrl, writeIO, writeM;
	output reg stop = 0;
	output [31:0] dados_lidos;
	output reg[31:0]out;
	reg saidaM;
	reg saidaIO;
	
	reg [31:0] mem_ramD[127:0];
	
	always @(posedge clock) begin
		
		if(writeM) begin // escrever dados na memória
			mem_ramD[address] = D_escrita;
		end 
			saidaM = mem_ramD[address];
		
	end

	
	always @(posedge clock) begin
		
		if(writeIO == 1) begin // escrever dados na memória
			out = D_escrita;
		end 
		else if(flagIn == 0) begin
			stop = 1;   // para o processamento e espera a entrada
		end
		else if(flagIn == 1) begin //ler dados de IO
			saidaIO = in;
			stop = 0;
		end 
	
		
	end
	
	
	mux m(.in1(saidaIO), .in2(saidaM), .saida(dados_lidos), .c(ctrl));
	
endmodule
