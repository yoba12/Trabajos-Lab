/*
32 registros de 64 bits cada uno
puertos de salida (rd1 y rd2) 
puerto de escritura (wd3). 

Las señales de direccionamiento ra1 y ra2 determinan la posición de los
datos de salida rd1 y rd2, respectivamente. 

De forma análoga, el puerto wa3 selecciona el registro
en el que se almacenará el dato contenido de wd3.

> registro de dirección 31 (correspondiente a XZR) debe retornar siempre ‘0’.
La escritura en este registro no debe estar permitida

> El dato contenido en wd3 se guarda en la dirección determinada por wa3 siempre que la
señal we3 tenga valor ‘1’ y se detecte un flanco positivo de clock (escritura síncrona).
> La lectura de los datos de salida rd1 y rd2 es asíncrona.
> Inicializar los registros X0 a X30 con los valores 0 a 30 respectivamente.
*/
module regfile (input logic clk, we3,
					input logic [4:0] ra1, ra2, wa3,
					input logic [63:0] wd3,
					output logic [63:0] rd1,rd2);
//inicializado					
	logic [63:0] regf [0:31] = '{64'd0,64'd1,64'd2,64'd3,64'd4,64'd5,64'd6,64'd7,64'd8,64'd9,64'd10,
										  64'd11,64'd12,64'd13,64'd14,64'd15,64'd16,64'd17,64'd18,64'd19,64'd20,
										  64'd21,64'd22,64'd23,64'd24,64'd25,64'd26,64'd27,64'd28,64'd29,64'd30,64'd0} ;
											//init de arreglo y direccion 31 == 0
	assign rd1 = (ra1 === 5'd31) ? 64'b0 : regf[ra1] ;
	assign rd2 = (ra2 === 5'd31) ? 64'b0 : regf[ra2];
	
	// escritura
	always_ff @(posedge clk)
		if(we3) regf[wa3] <= wd3;
endmodule