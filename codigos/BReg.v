module BReg(endRD, endRS, endRT, clock, dados_Escrita, write, out1, out2, out3);
	input [4:0] endRD, endRS, endRT;
	input write,clock;
	input [31:0] dados_Escrita;
	output [31:0] out1, out2, out3;
	//reg [31:0] save; 
	//reg [31:0] save1;
	//reg [31:0] save2;
	reg [31:0] registradores [31:0];
	always @(posedge clock) begin
		if(write) begin // escrever dados na memória
			registradores[endRD] = dados_Escrita;
		end 
			//save  = endRD;
			//save1 = endRT;
			//save2 = endRS;
	end
	assign out1 = registradores[endRS];
	assign out2 = registradores[endRT];
	assign out3 = registradores[endRD];

endmodule
