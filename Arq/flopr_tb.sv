module flopr_tb();
	logic clk, reset, d, yexpected;
	logic q;
	parameter DATA_WIDTH = 64;
	
	logic [31:0] vectornum, errors;
	logic [DATA_WIDTH-1:0] testvectors [9:0] = '{ 64'd63, // 64 bits con 64 en binario
													64'd60,
													64'd50,
													64'd40,
													64'd35,
													64'd30,
													64'd25,
													64'd20,
													64'd11,
													64'd0 };
	//instance
	flopr dut(clk, reset, d, q);
	
	//clock generation @100MHz 10ns
	always
		begin
				clk = 1; #10000; clk=0; #10000;
		end
	
	//Test pulse 
	initial 
		begin
			vectornum = 0; errors = 0; reset = 0; #10;
			reset = 1;

		end
		// apply test vectors on rising edge of clk
		always @(posedge clk)
			begin
				#1; {d, yexpected} = testvectors[vectornum];
			end
			
		// falling edge of clk
		always @(negedge clk)
		if (reset) begin // skip during reset
			if (q !== yexpected)
				begin
				$display("Error: inputs = %b", {d});
				$display("outputs = %b (%b expected)",q,yexpected);
				errors = errors + 1;
				end
				
			vectornum = vectornum + 1; //+1 in vector
		
			if (testvectors[vectornum] === 64'bx)
			begin
				$display("%d tests completed with %d errors",vectornum, errors);
				$stop;
			end
			
		else
			if(vectornum <= 5)
				reset = 1;
			else 
				reset = 0;
				
				
		end
endmodule
				