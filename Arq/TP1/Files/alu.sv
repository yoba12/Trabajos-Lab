/*
Nombre del Módulo: alu
Puertos de entrada
a: 64 bits
b: 64 bits
ALUControl: 4 bits
Puertos de salida
result: 64 bits
zero: 1 bit
	*/			
		
module alu #(parameter data_width = 64)
				(input logic [data_width-1:0] a, b,
				 input logic [3:0] ALUControl,
				 output logic [data_width-1:0] result, 
				 output logic zero);
		
		always_comb
		begin
		casez(ALUControl)
			4'b0000: result = a & b;
			4'b0001: result= a | b;
			//4'b0011
			4'b0010: result= a + b;
			//4'b0100
			//4'b0101
			4'b0110: result= a - b;
			4'b0111: result= b;
			//4'b1000
			//4'b1001
			//4'b1010
			//4'b1011
			4'b1100: result= ~(a | b);
			//4'b1101
			//4'b1110
			//4'b1111
			default: result= a+b;
		endcase
		
		if(result == 0) zero <= 1'b1;
		else zero <=  1'b0;
		end
		
		
		
endmodule


