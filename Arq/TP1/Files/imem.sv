module imem #(parameter DATA_WIDTH=32)
				(input logic [5:0] addr,
				 output logic [DATA_WIDTH-1:0] q);
		always_comb begin
			case(addr)
				8'h00 : q = 32'hf8000000;
				8'h01 : q = 32'hf8008001;
				8'h02 : q = 32'hf8010002;
				8'h03 : q = 32'hf8018003;
				8'h04 : q = 32'hf8020004;
				8'h05 : q = 32'hf8028005;
				8'h06 : q = 32'hf8030006;
				8'h07 : q = 32'hf8400007;
				8'h08 : q = 32'hf8408008;
				8'h09 : q = 32'hf8410009;
				8'h0A : q = 32'hf841800a;
				8'h0B : q = 32'hf842000b;
				8'h0C : q = 32'hf842800c;
				8'h0D : q = 32'hf843000d;
				8'h0E : q = 32'hcb0e01ce;
				8'h0F : q = 32'hb400004e;
				8'h10 : q = 32'hcb01000f;
				8'h11 : q = 32'h8b01000f;
				8'h12 : q = 32'hf803800f;
				default q = 32'h0;
			endcase
			end
endmodule
