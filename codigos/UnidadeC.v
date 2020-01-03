module UnidadeC(reset, opcode,jump_stop,HaltPC,ResetPC,gravar_Dmi,WriteBr,Ctrl_ext,mux1,mux2,ctrlALU,
					WriteMemD,mux3,mux4,mux5,JE,JA, flagIN, fout,mux6,jal, ws,mux7,bout,
					control_rd,
					control_rsrt,
					writeHD,
					mux8,
					set_prog_os,
					write_os,
					savepcprog,
					set_pc_prog,
					haltbios);
					
	output reg jump_stop,HaltPC,ResetPC,gravar_Dmi,WriteBr,Ctrl_ext,WriteMemD,mux1,mux2,mux3,mux4,mux5,fout,mux6, jal, ws,mux7;
	output reg writeHD;
	output reg mux8;
	output reg set_prog_os;
	output reg write_os;
	output reg savepcprog;
	output reg set_pc_prog;
	output reg haltbios;
	
	output reg [5:0] ctrlALU;
	output reg control_rd;
	output reg control_rsrt;
	input [5:0] opcode;
	input JE, JA, flagIN,bout,reset; // jump equal / jump above / flag de entrada
	
	always @(*) begin
		if(reset) begin
			jump_stop = 0;
			HaltPC = 0;
			ResetPC = 1;
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
			mux7 = 0;
			ws = 0;
			jal = 1'b0;// jump and link recebe zero
			control_rd = 0;
			control_rsrt = 0; 
			writeHD = 1'b0;
			mux8 = 0;
			set_prog_os = 0;
			write_os = 0;
			savepcprog = 0;
			set_pc_prog = 0;
			haltbios = 0;
		end
		else begin
		
				case (opcode[5:0])
					6'b000000:
					begin
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
						control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
			
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
							mux7 = 0;
							ws = 0;
							jal = 1'b0;
							control_rd = 0;
			control_rsrt = 0; 
							writeHD = 1'b0;
							mux8 = 0;
							set_prog_os = 0;
							write_os = 0;
							savepcprog = 0;
							set_pc_prog = 0;
							haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
							mux7 = 0;
							ws = 0;
							jal = 1'b0;
							control_rd = 0;
			control_rsrt = 0; 
							writeHD = 1'b0;
							mux8 = 0;
							set_prog_os = 0;
							write_os = 0;
							savepcprog = 0;
							set_pc_prog = 0;
							haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
							mux7 = 0;
							ws = 0;
							jal = 1'b0;
							control_rd = 0;
			control_rsrt = 0; 
							writeHD = 1'b0;
							mux8 = 0;
							set_prog_os = 0;
							write_os = 0;
							savepcprog = 0;
							set_pc_prog = 0;
							haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
							mux7 = 0;
							ws = 0;
							jal = 1'b0;
							control_rd = 0;
			control_rsrt = 0; 
							writeHD = 1'b0;
							mux8 = 0;
							set_prog_os = 0;
							write_os = 0;
							savepcprog = 0;
							set_pc_prog = 0;
							haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
						end else begin
							jump_stop = 0;
							HaltPC = 1;
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
							mux7 = 0;
							ws = 0;
							jal = 1'b0;
							control_rd = 0;
			control_rsrt = 0; 
							writeHD = 1'b0;
							mux8 = 0;
							set_prog_os = 0;
							write_os = 0;
							savepcprog = 0;
							set_pc_prog = 0;
							haltbios = 0;
						end
					end
					6'b010111:begin //OUT
					if(bout == 1) begin
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
						end else begin
							jump_stop = 0;
							HaltPC = 1;
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
							fout = 0;
							mux6 = 0;
							mux7 = 0;
							ws = 0;
							jal = 1'b0;
							control_rd = 0;
			control_rsrt = 0; 
							writeHD = 1'b0;
							mux8 = 0;
							set_prog_os = 0;
							write_os = 0;
							savepcprog = 0;
							set_pc_prog = 0;
							haltbios = 0;
						end	
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					6'b011010: //Div
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b001010;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end	
					6'b011011: //eq
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b001011;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end	
					6'b011100: //neq
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b001100;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end	
					6'b011101: //abv
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b001101;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end	
					6'b011110: //nabv
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b001110;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end	
					6'b011111: //lt
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b001111;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end	
					6'b100000: //nlt
					begin 
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 1;
						Ctrl_ext = 0;
						ctrlALU =  6'b010000;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end	
					
					6'b100001:begin //Jal
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
						mux7 = 0;
						ws = 0;
						jal = 1'b1;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					6'b100010:begin //jei
					if(JE == 1'b1)begin
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 0;
						WriteBr = 0;
						Ctrl_ext = 1;
						ctrlALU = 1;
						mux1 = 1;
						mux2 = 0;
						mux3 = 1;
						WriteMemD = 0;
						mux4 = 1;
						mux5 = 1;
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
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
							mux7 = 0;
							ws = 0;
							jal = 1'b0;
							control_rd = 0;
			control_rsrt = 0; 
							writeHD = 1'b0;
							mux8 = 0;
							set_prog_os = 0;
							write_os = 0;
							savepcprog = 0;
							set_pc_prog = 0;
							haltbios = 0;
						end
					end
					6'b100011:begin  //push
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
						WriteMemD = 0;
						mux4 = 0;
						mux5 = 0;
						fout = 0;
						mux6 = 0;
						mux7 = 1;
						ws = 1;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					6'b100100:begin //pop
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
						mux7 = 1;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					6'b100101:begin // inverte flag do RD
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 1;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					6'b100110:begin // inverte flag do RS RT
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 1; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					
					
					6'b100111:begin //LOADHD
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 1;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					
					
					6'b101000:begin //STOREHD
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
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b1;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					
					6'b101001:begin //MOVE HD MEM
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 1;
						WriteBr = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					
					
					6'b101010:begin //WRITE OS MEM
						jump_stop = 0;
						HaltPC = 0;
						ResetPC = 0;
						gravar_Dmi = 1;
						WriteBr = 0;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 1;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					
					
					6'b101011:begin //SET PROG OS
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
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 1;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
					
					6'b101100:begin //SAVE PC PROG
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
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 1;
						set_pc_prog = 0;
						haltbios = 0;
					end
					
					6'b101101:begin //SET PC PROG
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
						fout = 0;
						mux6 = 0;
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
						control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 1;
						haltbios = 0;
					end
					
					
					6'b101110:begin //HALTBIOS
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 1;
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
						mux7 = 0;
						ws = 0;
						jal = 1'b0;
						control_rd = 0;
			control_rsrt = 0; 
						writeHD = 1'b0;
						mux8 = 0;
						set_prog_os = 0;
						write_os = 0;
						savepcprog = 0;
						set_pc_prog = 0;
						haltbios = 0;
					end
				endcase
		end
	end
	
endmodule
