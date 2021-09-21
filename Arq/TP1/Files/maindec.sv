module maindec (input logic [10:0] Op,
					output logic reg2Loc, aluSrc, memToReg, regWrite, memRead, 
					memWrite, branch,
					output logic [1:0] ALUOp);
					
					logic decode_array [0:7] ;
		
		always_comb
		case(Op)
			11'b111_1100_0010: decode_array = '{1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 2'b00}; // LUDR
			11'b111_1100_0000: decode_array = '{1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 2'b00}; //STUR
			
			11'b101_1010_0???: decode_array = '{1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b1, 2'b01}; //CBZ
			
			11'b100_0101_1000: decode_array = '{1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10}; //ADD
			11'b110_0101_1000: decode_array = '{1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10}; //SUB
			11'b100_0101_0000: decode_array = '{1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10}; //AND
			11'b101_0101_0000: decode_array = '{1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10}; //ORR
			default decode_array = '{1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00}; //default
		endcase
		
		assign reg2Loc = decode_array[0];
		assign aluSrc = decode_array[1];
		assign memToReg = decode_array[2];
		assign regWrite = decode_array[3];
		assign memRead = decode_array[4];
		assign memWrite = decode_array[5];
		assign branch = decode_array[6];
		assign ALUOp = decode_array[7];
		
		/*
		Otra forma {reg2Loc, aluSrc,..., ALUOp} = 9'b011110010
		*/
endmodule
