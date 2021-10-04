module pc ( input logic clk,reset,
				input logic [63:0] d,
				output logic [63:0] q);
				
				flopr flop (.clk(clk), .reset(reset), .d(d), .q(q));
				endmodule
				
