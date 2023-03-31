----------------------------------------------------------
--
-- Template for traffic lights controller testbench.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for testbench
----------------------------------------------------------

entity tb_top is
  -- Entity of testbench is always empty
end entity tb_top;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_top is

  -- Local constants
  constant c_CLK_100MHZ_PERIOD : time := 10 ns;

  -- Local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_rst        : std_logic;
  signal sig_south      : std_logic_vector(2 downto 0);
  signal sig_west       : std_logic_vector(2 downto 0);
  signal sig_iscar      : std_logic_vector(1 downto 0);
  signal sig_speed      : std_logic;
  
begin

  -- Connecting testbench signals with tlc entity
  -- (Unit Under Test)
  uut_tlc : entity work.tlc
    port map (
      clk   => sig_clk_100mhz,
      rst   => sig_rst,
      south => sig_south,
      west  => sig_west,
      sig_iscar  => sig_iscar,
      sig_speed  => sig_speed
    );

  --------------------------------------------------------
  -- Clock generation process
  --------------------------------------------------------
  p_clk_gen : process is
  begin

    while now < 10000 ns loop -- 10 usec of simulation

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;

    wait;

  end process p_clk_gen;
  
  --------------------------------------------------------
  -- sig_speed generation process
  --------------------------------------------------------
  p_speed_gen : process is
  begin
    
    sig_speed <= '0';
    wait for 500 ns;
    sig_speed <= '1';
    wait for 50 ns;
    sig_speed <= '0';
    wait;

  end process p_speed_gen;
  
  --------------------------------------------------------
  -- sig_iscar generation process
  --------------------------------------------------------
  p_iscar_gen : process is
  begin

    sig_iscar <= "11";
    wait;

  end process p_iscar_gen;
  
  --------------------------------------------------------
  -- Reset generation process
  --------------------------------------------------------
  p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 300 ns;

    -- Reset activated
    sig_rst <= '1';
    wait for 100 ns;

    -- Reset deactivated
    sig_rst <= '0';
    wait;

  end process p_reset_gen;

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";
    -- No other input data is needed.
    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
