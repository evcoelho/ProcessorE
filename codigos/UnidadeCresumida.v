module UnidadeC(reset, opcode,jump_stop,HaltPC,ResetPC,gravar_Dmi,WriteBr,Ctrl_ext,mux1,mux2,ctrlALU,WriteMemD,mux3,mux4,mux5,JE,JA, flagIN, fout,mux6);
	output reg jump_stop,HaltPC,ResetPC,gravar_Dmi,WriteBr,Ctrl_ext,WriteMemD,mux1,mux2,mux3,mux4,mux5,fout,mux6;
	output reg [5:0] ctrlALU;
	input [5:0] opcode;
	input JE, JA, flagIN,reset; // jump equal / jump above / flag de entrada
	always @(*) begin
		if(reset) begin
			jump_stop = 0;
			HaltPC = 0;
			ResetPC = 1;
			gravar_Dmi = 1;
			WriteBr = 0;
			Ctrl_ext = 0;
			ctrlALU = 0;
			mux1 = 0;
			mux2 = 0;
			mux3 = 0;
			WriteMemD = 0;
			mux4 = 0;
			mux5 = 0;
			fout = 0;
			mux6 = 0;
		end
		else begin
		
				case (opcode[5:0])
					6'b000000:;
			
					6'b000001: //ADD
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b000001;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					
				endcase
		end
	end
	
endmodule
