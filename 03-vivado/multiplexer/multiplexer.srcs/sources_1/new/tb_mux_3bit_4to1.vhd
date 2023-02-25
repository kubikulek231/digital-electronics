------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_mux_3bit_4to1 is
    -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_mux_3bit_4to1 is

    -- Local signals
    signal s_a           : std_logic_vector(2 downto 0);
    signal s_b           : std_logic_vector(2 downto 0);
    signal s_c           : std_logic_vector(2 downto 0);
    signal s_d           : std_logic_vector(2 downto 0);
    signal s_f_o         : std_logic_vector(2 downto 0);
    signal s_sel_i       : std_logic_vector(1 downto 0);
    -- todo: each input needs a signal - signal is just for the testbench
    -- was it for uploading to the board itself we would not need them at all... :)

begin

    -- Connecting testbench signals with mux_3bit_4to1
    -- entity (Unit Under Test)
    uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
        port map(
            a_i   => s_a,
            b_i   => s_b,
            c_i   => s_c,
            d_i   => s_d,
            f_o   => s_f_o,
            sel_i => s_sel_i
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
    
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started";
        
        -- multiplexer inputs set up
        s_a    <= "000"; 
        s_b    <= "001";
        s_c    <= "011";
        s_d    <= "111";
        
        -- selecting input a_i
        s_sel_i <= "00";
        wait for 100 ns;
        
        -- selecting input b_i
        s_sel_i <= "01";
        wait for 100 ns;
        
        -- selecting input c_i
        s_sel_i <= "10";
        wait for 100 ns;
        
        -- selecting input d_i
        s_sel_i <= "11";
        wait for 100 ns;
        
        report "Stimulus process finished";
        
        wait; -- Data generation process is suspended forever
        
    end process p_stimulus;

end architecture testbench;
