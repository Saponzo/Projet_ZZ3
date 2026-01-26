
module nios_pio (
	clk_clk,
	reset_reset_n,
	pio_output_address,
	pio_output_write_n,
	pio_output_writedata,
	pio_output_chipselect,
	pio_output_readdata);	

	input		clk_clk;
	input		reset_reset_n;
	input	[1:0]	pio_output_address;
	input		pio_output_write_n;
	input	[31:0]	pio_output_writedata;
	input		pio_output_chipselect;
	output	[31:0]	pio_output_readdata;
endmodule
