	nios_pio u0 (
		.clk_clk               (<connected-to-clk_clk>),               //        clk.clk
		.reset_reset_n         (<connected-to-reset_reset_n>),         //      reset.reset_n
		.pio_output_address    (<connected-to-pio_output_address>),    // pio_output.address
		.pio_output_write_n    (<connected-to-pio_output_write_n>),    //           .write_n
		.pio_output_writedata  (<connected-to-pio_output_writedata>),  //           .writedata
		.pio_output_chipselect (<connected-to-pio_output_chipselect>), //           .chipselect
		.pio_output_readdata   (<connected-to-pio_output_readdata>)    //           .readdata
	);

