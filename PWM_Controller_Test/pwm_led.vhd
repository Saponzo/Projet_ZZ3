library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_led is
  generic (
    pwm_bits    : integer := 8;  
    cnt_bits    : integer := 25; -- Compteur lent pour voir la variation à l'œil nu
    clk_cnt_len : positive := 47 -- Ajustement de la fréquence
  );
  port (
    clk   : in std_logic;
    rst_n : in std_logic; -- Reset physique (souvent un bouton sur la carte)
    led_5 : out std_logic -- La LED qui va clignoter/varier
  );
end pwm_led;

architecture str of pwm_led is
  signal rst      : std_logic;
  signal cnt      : unsigned(cnt_bits - 1 downto 0);
  signal pwm_out  : std_logic;

  alias duty_cycle is cnt(cnt'high downto cnt'length - pwm_bits);
begin

  led_5 <= pwm_out;
  
  PWM_INST : entity work.pwm_controller(rtl)
    generic map (
      pwm_bits    => pwm_bits,
      clk_cnt_len => clk_cnt_len
    )
    port map (
      clk        => clk,
      rst        => rst,
      duty_cycle => duty_cycle, -- La variation vient du compteur 'cnt'
      pwm_out    => pwm_out
    );

  PROCESS_TEST_CNT : process(clk)
  begin
    if rising_edge(clk) then
        if rst_n = '0' then -- Si bouton pressé (reset actif bas)
            cnt <= (others => '0');
            rst <= '1';
        else
            cnt <= cnt + 1;
            rst <= '0';
        end if;
    end if;
  end process;

end architecture;