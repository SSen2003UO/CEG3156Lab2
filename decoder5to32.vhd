library ieee;
use ieee.std_logic_1164.all;

entity decoder5to32 is
	port(i_in : in std_logic_vector(4 downto 0);
		o_out: out std_logic_vector(31 downto 0)
		
	);
end decoder5to32;

architecture rtl of decoder5to32 is
signal int_out : std_logic_vector(31 downto 0);

component decoder3to8 is
	port(
		i_en : in std_logic;
		i_in : in std_logic_vector(2 downto 0);
		o_out: out std_logic_vector(7 downto 0)
		);
end component;

begin
  
	decoder1 : decoder3to8 port map(
		i_en => not(i_in(4) or i_in(3)),
		i_in => i_in(2 downto 0),
		o_out => int_out(7 downto 0)
		);
	
	decoder2 : decoder3to8 port map(
		i_en => not(i_in(4)) and i_in(3),
		i_in => i_in(2 downto 0),
		o_out => int_out(15 downto 8)
		);
	
	decoder3 : decoder3to8 port map(
		i_en => i_in(4) and not(i_in(3)),
		i_in => i_in(2 downto 0),
		o_out => int_out(23 downto 16)
		);
	
	decoder4 : decoder3to8 port map(
		i_en => i_in(4) and i_in(3),
		i_in => i_in(2 downto 0),
		o_out => int_out(31 downto 24)
		);
		
	--Output Drivers
	
	o_out <= int_out;

end rtl;

	