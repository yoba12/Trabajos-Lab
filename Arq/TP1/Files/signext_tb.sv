/* 
b) Realizar un testbench que:
	- Ingrese por el puerto a todos los tipos de instrucciones detalladas en la tabla, con
	inmediatos positivos y negativos, y verifique que la salida sea la correcta.
	- Ingrese instrucciones que no estén en la tabla y verifique que la salida sea 0.
*/
module signext_tb();
	logic [31:0]a;
	logic [63:0]y;
	parameter DATA_WIDTH = 32;
	/*
	logic [DATA_WIDTH-1:0] testvectors [0:7] = '{ 
											32'b11111000010_000000011_01_00001_00010, //lurd not signed
											32'b11111000010_100000000_01_00001_00010, //lurd signed
											32'b11111000000_000000011_01_00001_00010, //stur not signed
											32'b11111000000_100000011_01_00001_00010, //stur signed
											32'b10110100_0000000000000000001_00001, //cbz not signed
											32'b10110100_1000000000000000001_00001, //cbz signed
											32'b10001011000_00001_000001_00001_00010, // add
											32'b10001010000_00000_000000_00000_00000}; //other
											*/
 //instance
	signext dut(a,y);
	initial begin
		a = 32'b10001010000_00000_000000_00000_00000; 
		
		$display("outputs = %b",y);
		end
	
	
	
/*
	logic clk, reset,yexpected;
	logic [31:0]a;
	logic [63:0]y;
	parameter DATA_WIDTH = 32;
	
	logic [31:0] vectornum, errors;
	logic [DATA_WIDTH-1:0] testvectors [0:7] = '{ 
											32'b11111000010_00000011_01_00001_00010, //lurd not signed
											32'b11111000010_10000000_01_00001_00010, //lurd signed
											32'b11111000000_00000011_01_00001_00010, //stur not signed
											32'b11111000000_10000011_01_00001_00010, //stur signed
											32'b10110100_0000000000000000001_00001, //cbz not signed
											32'b10110100_1000000000000000001_00001, //cbz signed
											32'b10001011000_00001_000001_00001_00010, // add
											32'b10001010000_00000_000000_00000_00000};
											
	//instance
	signext dut(a,y);
	//clock generation @100MHz 10ns
	always
		begin
				clk = 1; #10000; clk=0; #10000;
		end
		
	initial 
		begin
			vectornum = 0; errors = 0; reset = 1; #27;
			reset = 0;
		end
		
		always @(posedge clk)
		begin
			#1; {a, yexpected} = testvectors[vectornum];
		end
		
		always @(negedge clk)
		if (~reset) begin // skip during reset
			if (y !== yexpected)
				begin
				$display("Error: inputs = %b", {y});
				$display("outputs = %b (%b expected)",y,yexpected);
				errors = errors + 1;
				end
				
			vectornum = vectornum + 1; //+1 in vector
		
			if (testvectors[vectornum] === 32'bx)
			begin
				$display("%d tests completed with %d errors",vectornum, errors);
				$stop;
			end
		end
		*/
	endmodule
