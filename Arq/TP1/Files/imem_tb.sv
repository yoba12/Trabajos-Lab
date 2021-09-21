module imem_tb();
	logic [5:0] addr;
	parameter DATA_WIDTH = 32;
	logic [DATA_WIDTH-1:0] q;

	imem dut(addr,q);
	initial begin 
	addr = 5'h00; #10;
	$display("outputs = %b",q);
	addr = 5'h01; #10;
	addr = 5'h02; #10;
	addr = 5'h03; #10;
	addr = 5'h04; #10;
	addr = 5'h05; #10;
	addr = 5'h06; #10;
	addr = 5'h07; #10;
	addr = 5'h08; #10;
	addr = 5'h09; #10;
	addr = 5'h0A; #10;
	$display("outputs = %b",q);
	addr = 5'h0B; #10;
	addr = 5'h0C; #10;
	addr = 5'h0D; #10;
	addr = 5'h0E; #10;
	addr = 5'h0F; #10;
	addr = 5'h10; #10;
	addr = 5'h12; #10;
	end
endmodule