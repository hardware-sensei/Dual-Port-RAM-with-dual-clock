`include "true_dpram_dclk.v"

module true_dpram_dclk_tb();
	reg wr_en_A, wr_en_B, clk_A, clk_B;
	reg [WIDTH - 1:0] data_in_A, data_in_B;
	reg [ADDRESS - 1:0] addr_A, addr_B;
	wire [WIDTH - 1:0] data_out_A, data_out_B;

	true_dpram_dclk dut(.*);

	initial begin
		clk_A = 1'b1;
		forever #50 clk_A = ~clk_A;
	end

	initial begin
		clk_B = 1'b1;
		forever #60 clk_B = ~clk_B;
	end

	initial begin
		$monitor("TIME = %0t,\nAddress @ A = %0h , Data @ A = %0h,\nAddress @ B = %0h, Data @ B = %0h", $time, addr_A, data_in_A, addr_B, data_in_B);
		$dumpfile("true_dpram_dclk_tb.vcd");
		$dumpvars;
	end
	
	initial begin
		wr_en_A = 1'b0; wr_en_B = 1'b0;
		#100;
		
		addr_A = 6'h28; data_in_A = 8'hB5;
		addr_B = 6'h3D; data_in_B = 8'h6F;
		wr_en_A = 1'b1; wr_en_B = 1'b1;
		#100;
		
		#1000 $finish;
	end
endmodule
