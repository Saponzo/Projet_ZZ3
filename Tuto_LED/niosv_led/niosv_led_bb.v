
module niosv_led (
	clk_clk,
	led_pio_export,
	pb_pio_export,
	reset_reset_n);	

	input		clk_clk;
	output	[3:0]	led_pio_export;
	input		pb_pio_export;
	input		reset_reset_n;
endmodule
