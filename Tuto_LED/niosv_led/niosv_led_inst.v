	niosv_led u0 (
		.clk_clk        (<connected-to-clk_clk>),        //     clk.clk
		.led_pio_export (<connected-to-led_pio_export>), // led_pio.export
		.pb_pio_export  (<connected-to-pb_pio_export>),  //  pb_pio.export
		.reset_reset_n  (<connected-to-reset_reset_n>)   //   reset.reset_n
	);

