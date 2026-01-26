library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity block_nios_pio is
generic (
    pwm_bits : integer := 8;
    clk_cnt_len : positive := 1
 );
port (
	clk_i rst_i: in std_logic;
	output_o: out std_logic
	);
end block_nios_pio;

architecture structure of block_nios_pio is

component pwm_controller is
port (
    clk : in std_logic;
    rst : in std_logic;
    duty_cycle : in unsigned(pwm_bits - 1 downto 0);
    pwm_out : out std_logic);
end component pwm_controller;


 component nios_pio is
    port (
            clk_clk       : in std_logic := 'X'; -- clk
            reset_reset_n : in std_logic := 'X'  -- reset_n
        );
    end component nios_pio;
signal S_s : std_logic_vector(31 donwto 0);
	 
begin

    u0 : component nios_pio port map (clk_i, rst_i);
	 u1 : component pwm_controller port map (clk_i, rst_i, S_s , output_o);
end structure;
            
