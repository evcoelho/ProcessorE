module Inst_Mem(PCend,write_address,gravar_D,write_os,instructionOUT, clock_a,clock, set_prog_kernel,data_write);
	input [31:0] PCend;
	input  gravar_D, clock, clock_a;
	input set_prog_kernel;
	input [31:0]data_write;
	input write_os;
	input [31:0]write_address;
	
	output [31:0] instructionOUT;
	
	reg [31:0]inst_os;
	reg [31:0]inst_prog;
	
	reg [31:0] mem_ram_os[2048:0];
	reg [31:0] mem_ram_prog[2048:0];
	
	initial begin
	
	
	end
	
	always @(posedge clock) begin
		if(gravar_D == 1)begin
			if(write_os == 1)begin
				mem_ram_os[write_address] = data_write;
			end
			else begin
				mem_ram_prog[write_address] = data_write;
			end
		
		end
		
	end
	
	
	always @(posedge clock_a) begin
		inst_os = mem_ram_os[PCend];
		inst_prog = mem_ram_prog[PCend];
	end
	
	assign instructionOUT = (set_prog_kernel == 1'b1)? inst_prog:inst_os;

endmodule
