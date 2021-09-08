/*
Input a -> 32b
Output y -> 64b
Analisis de opcodes implementados y conectar el campo inmediato al Output
Tiene Campo inmediato -> extender
Sin valor inmediato ->  0
LDUR |      Load Register         | 111_1100_0010
STUR |      Store Register        | 111_1100_0000
CBZ  | Compare and branch if zero | 101_1010_0???*

*/
module signext #(parameter DATA_WIDTH=64)(input logic [31:0] a,
					output logic [DATA_WIDTH-1:0] y);
		always_comb
		casez(a[31:21])
		//LDUR
			11'b11111000010 : y = {{55{a[20]}},a[20:12]};
		
		//STUR
			11'b11111000000 : y = {{55{a[20]}},a[20:12]};
		
		//CBZ
			11'b10110100??? : y = {{43{a[23]}},a[23:5],2'b00}; //aca profe no sigio el greencard
			default: y = '0;
		endcase
endmodule