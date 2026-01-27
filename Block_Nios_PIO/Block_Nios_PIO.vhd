library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity block_nios_pio is
generic (
    pwm_bits : integer := 8;
    clk_cnt_len : positive := 1
 );
port (
	clk_i, rst_i: in std_logic;
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
            clk_clk                          : in  std_logic                    := 'X'; -- clk
            reset_reset_n                    : in  std_logic                    := 'X'; -- reset_n
            pio_0_external_connection_export : out std_logic_vector(7 downto 0)         -- export
        );
 end component nios_pio;

signal output_nios_s : std_logic_vector(7 downto 0);
signal input_pwm_s : unsigned(7 downto 0);
	 
begin
	input_pwm_s <= unsigned(output_nios_s);
    u0 : component nios_pio port map (clk_i, rst_i, output_nios_s);
	 u1 : component pwm_controller port map (clk_i, rst_i, input_pwm_s , output_o);
end structure;
            
