	component niosv_led is
		port (
			clk_clk        : in  std_logic                    := 'X'; -- clk
			led_pio_export : out std_logic_vector(3 downto 0);        -- export
			pb_pio_export  : in  std_logic                    := 'X'; -- export
			reset_reset_n  : in  std_logic                    := 'X'  -- reset_n
		);
	end component niosv_led;

	u0 : component niosv_led
		port map (
			clk_clk        => CONNECTED_TO_clk_clk,        --     clk.clk
			led_pio_export => CONNECTED_TO_led_pio_export, -- led_pio.export
			pb_pio_export  => CONNECTED_TO_pb_pio_export,  --  pb_pio.export
			reset_reset_n  => CONNECTED_TO_reset_reset_n   --   reset.reset_n
		);

