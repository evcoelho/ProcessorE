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
					6'b000010: //ADDI
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 1;
						ctrlALU = 6'b000001;
						mux1 = 1;
						mux2 = 1;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					6'b000011: //SUB
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU = 6'b000010;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					6'b000100: //SUBI
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 1;
						ctrlALU = 6'b000010;
						mux1 = 1;
						mux2 = 1;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					6'b000101: //MULT
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b000011;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end	
					6'b000110: //AND
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b000100;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end	
					6'b000111: //OR
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b000101;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end	
					6'b001000: //XOR
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b000110;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end	
					6'b001001: //NOT
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b000111;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end	
					6'b001010:begin //SHL
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b001000;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					6'b001011:begin //SHR
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b001001;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					6'b001100:begin //LOAD
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU = 0;
						mux1 = 1;
						mux2 = 0;
						mux3 = 0;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					6'b001101:begin //LOADI
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU = 0;
						mux1 = 0;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					6'b001110:begin  //STORE
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 0;
						Ctrl_ext = 0;
						ctrlALU = 1;
						mux1 = 1;
						mux2 = 0;
						mux3 = 0;
						WriteMemD = 1;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					6'b001111:begin //MOVE
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b000000;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
					end
					6'b010000:begin //JUMPI
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 0;
						Ctrl_ext = 0;
						ctrlALU = 1;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 1;
						mux5 = 1;
						fout = 0;
						mux6 = 0;
					end
					6'b010001:begin //JMP
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 0;
						Ctrl_ext = 0;
						ctrlALU = 1;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 1;
						fout = 0;
						mux6 = 0;
					end
					6'b010010:begin //JE
					if(JE == 1'b1)begin
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 0;
						Ctrl_ext = 0;
						ctrlALU =  6'b000010;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 1;
						fout = 0;
						mux6 = 0;
						end else begin
							jump_stop = 0;
							HaltPC = 0;
							ResetPC = 0;
							gravar_Dmi = 0;
							WriteBr = 0;
							Ctrl_ext = 0;
							ctrlALU = 6'b000010;
							mux1 = 0;
							mux2 = 0;
							mux3 = 0;
							WriteMemD = 0;
							mux4 = 0;
							mux5 = 0;
							fout = 0;
							mux6 = 0;
						end
					end
					6'b010011:begin //JNE
						if(JE == 1'b0)begin
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 0;
						Ctrl_ext = 0;
						ctrlALU =  6'b000010;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 1;
						fout = 0;
						mux6 = 0;
						end else begin
							jump_stop = 0;
							HaltPC = 0;
							ResetPC = 0;
							gravar_Dmi = 0;
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
					end
					6'b010100:begin //JA
						if(JA == 1)begin
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 0;
						Ctrl_ext = 0;
						ctrlALU =  6'b000010;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 1;
						fout = 0;
						mux6 = 0;
						end else begin
							jump_stop = 0;
							HaltPC = 0;
							ResetPC = 0;
							gravar_Dmi = 0;
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
					end
					6'b010101:begin //JNA
						if(JA == 0)begin
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 0;
						Ctrl_ext = 0;
						ctrlALU =  6'b000010;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 1;
						fout = 0;
						mux6 = 0;
						end else begin
							jump_stop = 0;
							HaltPC = 0;
							ResetPC = 0;
							gravar_Dmi = 0;
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
					end
					6'b010110:begin //IN
					if(flagIN == 1)begin
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b000010;
						mux1 = 1;
						mux2 = 0;
						mux3 = 0;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 1;
						end else begin
							jump_stop = 1;
							HaltPC = 0;
							ResetPC = 0;
							gravar_Dmi = 0;
							WriteBr = 1;
							Ctrl_ext = 0;
							ctrlALU = 0;
							mux1 = 1;
							mux2 = 0;
							mux3 = 0;
							WriteMemD = 0;
							mux4 = 0;
							mux5 = 0;
							fout = 0;
							mux6 = 1;
						end
					end
					6'b010111:begin //OUT
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 0;
						Ctrl_ext = 0;
						ctrlALU = 0;
						mux1 = 1;
						mux2 = 0;
						mux3 = 0;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 1;
						mux6 = 0;
					end
					6'b011000:begin //NOP
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
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
					6'b011001:begin //HALT
						jump_stop = 0;
						HaltPC = 1;
						ResetPC = 0;
						gravar_Dmi = 0;
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
					default: begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
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
				endcase
		end
	end
	
endmodule
