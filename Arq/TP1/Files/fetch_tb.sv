module fetch_tb();
	logic PCSrc_F,clk,reset;
	logic [63:0] PCBranch_F, imem_addr_F;
	
	fetch dut (PCSrc_F, clk, reset,PCBranch_F, imem_addr_F);
	always
		begin
				clk = 1 ;#10; clk=0; #10;
		end
		
	initial 
		begin
			imem_addr_F = '0;
			PCBranch_F = 64'd8;
			PCSrc_F='0;
			reset = 1; #100;reset = 0;
			$display("PCSrc_F 1");
			$display("Imem_addr_f = %b",imem_addr_F);
			#50; PCSrc_F = 1;
			#2000; $stop;
		end
endmodule
