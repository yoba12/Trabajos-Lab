module flopr #(parameter DATA_WIDTH = 64)(input logic clk, 
											input logic reset, 
											input logic [DATA_WIDTH-1:0] d, 
											output logic [DATA_WIDTH-1:0] q);
	always_ff @(posedge clk, posedge reset)
		if(reset) 
			q <= 64'b0; 
		else 
			q <= d;

endmodule