library ieee;
use ieee.std_logic_1164.all;

entity extend32leftshift2 is
port(
	i_in : in std_logic_vector(15 downto 0);
	o_out : out std_logic_vector(31 downto 0)
	);
end;

architecture rtl of extend32leftshift2 is
signal int_out : std_logic_vector(31 downto 0);

begin

int_out(1 downto 0) <= (others => '0');
int_out(15 downto 2) <= i_in(15 downto 2);
int_out(31 downto 16) <= (others => i_in(15));

	--Output Drivers
	
	o_out <= int_out;

end rtl;