module PC(pcIN, clock, pc_at,pc_prox,pc_prog_at,jump_stop, halt, reset, prog_or_kernel,set_pc_prog, pc_reg, flagbios,haltbios);
	input prog_or_kernel;
	input [31:0]pcIN;
	input [31:0]pc_reg;
	input clock, jump_stop, halt, reset;
	input set_pc_prog;
	input haltbios;
	
	reg[31:0] pcOUTat, pcOUTprox;
	reg[31:0] pcOUTat_prog, pcOUTprox_prog;
	
	output [31:0]pc_at;
	output [31:0]pc_prox;
	output [31:0]pc_prog_at;
	output reg flagbios;
	

	
	always @(posedge clock) begin
		if(reset == 1) begin	
				flagbios = 0;
				pcOUTat <= 0;
				pcOUTprox <= 32'b00000000000000000000000000000001;
				pcOUTat_prog <= 0;
				pcOUTprox_prog <= 32'b00000000000000000000000000000001;
		end else
		if(prog_or_kernel == 1'b0)begin
			if(halt == 1) begin
				
			end else
			if(haltbios == 1)begin
				flagbios = 1;
				pcOUTat <= 0;
				pcOUTprox <= 32'b00000000000000000000000000000001;
				pcOUTat_prog <= 0;
				pcOUTprox_prog <= 32'b00000000000000000000000000000001;
			end
			else if(jump_stop == 1) begin
				pcOUTprox <= pcIN + 1;
			end
			else if(jump_stop == 0) begin
				pcOUTat <= pcIN;
				pcOUTprox <= pcIN + 1;
			end
			
			if(set_pc_prog == 1'b1)begin
				pcOUTat_prog <= pc_reg;
				pcOUTprox_prog <= pc_reg + 1;
			end
			
		end 
		else begin
			if(halt == 1) begin
			end
			else if(jump_stop == 1) begin
				pcOUTprox_prog <= pcIN + 1;
			end
			else if(jump_stop == 0) begin
				pcOUTat_prog <= pcIN;
				pcOUTprox_prog <= pcIN + 1;
			end
		end
		
	end
	
	assign pc_at = (prog_or_kernel == 1'b1)?  pcOUTat_prog: pcOUTat;
	assign pc_prox = (prog_or_kernel == 1'b1)? pcOUTprox_prog: pcOUTprox;
	assign pc_prog_at = pcOUTat_prog;
	
endmodule
