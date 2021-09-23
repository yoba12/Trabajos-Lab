module execute (input logic AluSrc,zero_E,
			input logic [3:0] AluControl,
			input logic [63:0] PC_E,signImm_E, readData1_E, readData2_E,
			output logic [63:0] PCBranch_E, aluResult_E, writeData_E );
			
			logic [63:0] srcAlu, slSrc;
			mux2 alumux ( .d0(readData2_E), .d1(signImm_E), .s(AluSrc), .y(srcAlu));
			alu  alu (.a(readData1_E), .b(srcAlu), .AluControl(AluControl) .result(aluResult_E) .zero(zero_E);
			
			
			sl2 shift (.a(signImm_E), .y(slSrc));
			adder add (.a(PC_E), .b(slSrc), .y(PCBranch_E));
			
			assign readData2_E = writeData_E;
endmodule
