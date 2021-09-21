module alu_tb();
logic [63:0] a, b;
logic [3:0] aluCtrl;
logic [63:0] result;
logic zero;
logic [3:0] testvectors [5:0] = '{ 4'b0000, 4'b0001,4'b0010, 4'b0110,4'b0111, 4'b1100};

alu dut(a,b,aluCtrl,result,zero);
	
// REVISAR CASO DE AND Y NOR
// CON OVErflow retorna 0
	
	
	initial begin
	 // ########################### +
		a = 64'd150;
		b = 64'd6;
		
		aluCtrl = testvectors[0]; #10;
		aluCtrl = testvectors[1]; #10;
		aluCtrl = testvectors[2]; #10;
		aluCtrl = testvectors[3]; #10;
		aluCtrl = testvectors[4]; #10;
		aluCtrl = testvectors[5]; #10;
		#100;
		// ########################### + iguales
		a = 64'd10;
		b = 64'd10;
		
		aluCtrl = testvectors[0]; #10;
		aluCtrl = testvectors[1]; #10;
		aluCtrl = testvectors[2]; #10;
		aluCtrl = testvectors[3]; #10;
		aluCtrl = testvectors[4]; #10;
		aluCtrl = testvectors[5]; #10;
		#100;
		// ########################### - 
		a= -64'd50;
		b= -64'd13;
		
		aluCtrl = testvectors[0]; #10;
		aluCtrl = testvectors[1]; #10;
		aluCtrl = testvectors[2]; #10;
		aluCtrl = testvectors[3]; #10;
		aluCtrl = testvectors[4]; #10;
		aluCtrl = testvectors[5]; #10;
		#100;
		// ########################### - iguales
		a= -64'd51;
		b= -64'd51;
		
		aluCtrl = testvectors[0]; #10;
		aluCtrl = testvectors[1]; #10;
		aluCtrl = testvectors[2]; #10;
		aluCtrl = testvectors[3]; #10;
		aluCtrl = testvectors[4]; #10;
		aluCtrl = testvectors[5]; #10;
		#100;
		// ########################### + y -
		a= 64'd100;
		b= -64'd50;
		
		aluCtrl = testvectors[0]; #10;
		aluCtrl = testvectors[1]; #10;
		aluCtrl = testvectors[2]; #10;
		aluCtrl = testvectors[3]; #10;
		aluCtrl = testvectors[4]; #10;
		aluCtrl = testvectors[5]; #10;
		#100;
		// ########################### overflow
		a= -64'd50;
		b= -64'd13;
		
		aluCtrl = testvectors[0]; #10;
		aluCtrl = testvectors[1]; #10;
		aluCtrl = testvectors[2]; #10;
		aluCtrl = testvectors[3]; #10;
		aluCtrl = testvectors[4]; #10;
		aluCtrl = testvectors[5]; #10;
		#100;
	end
	
endmodule
/*	
- Compruebe el funcionamiento de todas las operaciones para la totalidad de los siguientes
casos: entre dos números positivos, entre dos números negativos y siendo uno positivo y uno
negativo.
- Forzar una entrada que genere un overflow y analizar su comportamiento.
- Verifique que la bandera de zero tome valor ‘1’, sólo cuando el resultado de cualquier
operación sea igual a cero.
		
*/
