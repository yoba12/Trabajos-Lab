module fetch(input logic PCSrc_F,clk,reset,
				 input logic [63:0] PCBranch_F,
				 output logic [63:0] imem_addr_F
				);
				logic [63:0] muxSrc, pcSrc, addSrc;
				mux2 pc_mux (.d0(addSrc), .d1(PCBranch_F), .s(PCSrc_F),.y(muxSrc));
				flopr pc (.clk(clk),.reset(reset), .d(muxSrc), .q(pcSrc));
				
				assign imem_addr_F = pcSrc;
				adder add (.a(pcSrc), .b(64'd4), .y(addSrc));
endmodule				