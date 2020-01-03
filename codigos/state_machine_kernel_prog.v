module state_machine_kernel_prog(clock,control_reg_prog_kernel,prog_or_kernel_RD, prog_or_kernel_RS_RT);
	input [1:0]control_reg_prog_kernel;
	input clock;
	output prog_or_kernel_RD, prog_or_kernel_RS_RT;
	reg state_RD, state_RS_RT;
	
	always @(posedge clock)begin
		if((control_reg_prog_kernel == 2'b01) && (state_RD == 1'b0)) begin 
			state_RD <= 1'b1;
		end else
		if((control_reg_prog_kernel == 2'b01) && (state_RD == 1'b1)) begin
			state_RD <= 1'b0;
		end else
		if((control_reg_prog_kernel == 2'b10) && (state_RS_RT == 1'b0)) begin
			state_RS_RT <= 1'b1;
		end else
		if((control_reg_prog_kernel == 2'b10) && (state_RS_RT == 1'b1)) begin
			state_RS_RT <= 1'b0;
		end
			
	end 
	
	assign prog_or_kernel_RD = state_RD;
	assign prog_or_kernel_RS_RT = state_RS_RT;
	
endmodule