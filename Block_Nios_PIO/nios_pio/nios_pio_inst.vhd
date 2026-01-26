	component nios_pio is
		port (
			clk_clk               : in  std_logic                     := 'X';             -- clk
			reset_reset_n         : in  std_logic                     := 'X';             -- reset_n
			pio_output_address    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			pio_output_write_n    : in  std_logic                     := 'X';             -- write_n
			pio_output_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			pio_output_chipselect : in  std_logic                     := 'X';             -- chipselect
			pio_output_readdata   : out std_logic_vector(31 downto 0)                     -- readdata
		);
	end component nios_pio;

	u0 : component nios_pio
		port map (
			clk_clk               => CONNECTED_TO_clk_clk,               --        clk.clk
			reset_reset_n         => CONNECTED_TO_reset_reset_n,         --      reset.reset_n
			pio_output_address    => CONNECTED_TO_pio_output_address,    -- pio_output.address
			pio_output_write_n    => CONNECTED_TO_pio_output_write_n,    --           .write_n
			pio_output_writedata  => CONNECTED_TO_pio_output_writedata,  --           .writedata
			pio_output_chipselect => CONNECTED_TO_pio_output_chipselect, --           .chipselect
			pio_output_readdata   => CONNECTED_TO_pio_output_readdata    --           .readdata
		);

