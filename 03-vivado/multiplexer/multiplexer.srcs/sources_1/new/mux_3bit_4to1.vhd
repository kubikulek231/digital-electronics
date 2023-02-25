------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for 3-bit 4 to 1 multiplexer
------------------------------------------------------------
entity mux_3bit_4to1 is

    port(
        sel_i           : in  std_logic_vector(1 downto 0);
        a_i             : in  std_logic_vector(2 downto 0);
        b_i             : in  std_logic_vector(2 downto 0);
        c_i             : in  std_logic_vector(2 downto 0);
        d_i             : in  std_logic_vector(2 downto 0);
        f_o             : out std_logic_vector(2 downto 0)
    );
    
end entity mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for 3-bit 4 to 1 multiplexer
------------------------------------------------------------
architecture Behavioral of mux_3bit_4to1 is
begin

	-- if sel_i == 00 then set f_o to a_i etc
    with sel_i select
    f_o <= a_i when "00",
           b_i when "01",
           c_i when "10",
           d_i when others;

end architecture Behavioral;
