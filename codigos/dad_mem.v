module dad_mem(address,D_escrita, clock, write, dados_lidos,dados_stack, saida, otflag, writeStack,clock_a);
	input [31:0] address;
   input	[31:0]D_escrita;
	
	input clock, write, otflag, writeStack, clock_a;
	output reg[31:0] dados_lidos;
	output reg[31:0] dados_stack;
	reg [31:0]out;
	output reg[31:0]saida;
	
	//reg [31:0] save; 
	reg [31:0] mem_ramD[4096:0];
	reg [31:0] stack[4096:0];
	always @(posedge clock) begin
		
		if(write) begin // escrever dados na memória
			mem_ramD[address] = D_escrita;
		end 
		if(writeStack) begin
			stack[address] = D_escrita;
		end
		
	end
	
	always @(posedge clock) begin
		if(otflag) begin
			out = D_escrita;
		end
	end
	
	always @(posedge clock_a) begin
		saida = out;
	end
	always @(posedge clock_a) begin
		dados_stack = stack[address];
	end
	always @(posedge clock_a) begin
		dados_lidos = mem_ramD[address];
	end

endmodule
