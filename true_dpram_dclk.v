parameter WIDTH = 8;
parameter DEPTH = 64;
parameter ADDRESS = 6;

module true_dpram_dclk(
	input [WIDTH - 1:0] data_in_A, data_in_B, 
	input [ADDRESS - 1:0] addr_A, addr_B,
	input wr_en_A, wr_en_B, clk_A, clk_B,
	output reg [WIDTH - 1:0] data_out_A, data_out_B);

	reg [WIDTH - 1:0] ram[DEPTH - 1:0];
	// RAM data structure 8 bit x 64 bit = 64 bytes
	
	always @ (posedge clk_A) // Port A
	begin
		if (!wr_en_A)
		begin
			data_out_A <= ram[addr_A];
		end
		else
			ram[addr_A] <= data_in_A;
			data_out_A <= ram[addr_A];
	end
	
	always @ (posedge clk_B) // Port B
	begin
		if (!wr_en_B)
		begin
			data_out_B <= ram[addr_B];
		end
		else
			ram[addr_B] <= data_in_B;
			data_out_B <= ram[addr_B];
	end
endmodule