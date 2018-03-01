module dad_mem(address,D_escrita, clock, write, dados_lidos, saida, otflag);
	input [31:0] address;
   input	[31:0]D_escrita;
	input clock, write, otflag;
	output[31:0] dados_lidos;
	reg [31:0]out;
	output [31:0]saida;
	
	//reg [31:0] save; 
	reg [31:0] mem_ramD[31:0];
	always @(posedge clock) begin
		
		if(write) begin // escrever dados na memória
			mem_ramD[address] = D_escrita;
		end 
			//save = address;
		
	end
	
	always @(negedge clock) begin
		if(otflag) begin
			out = D_escrita;
		end
	end
	assign saida = out;
	assign dados_lidos = mem_ramD[address];

endmodule
