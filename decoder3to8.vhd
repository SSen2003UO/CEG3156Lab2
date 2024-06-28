library ieee;
use ieee.std_logic_1164.all;

entity decoder3to8 is
	port(
		i_in : in std_logic_vector(2 downto 0);
		o_out : out std_logic_vector(7 downto 0)
	);
end decoder3to8;

architecture rtl of decoder3to8 is
signal int_out : std_logic_vector(7 downto 0);

begin
	
	o_out(0) <=not(i_in(0) or i_in(1) or i_in(2));
	o_out(1) <=i_in(0) and not(i_in(1) or i_in(2));
	o_out(2) <= i_in(1) and not(i_in(0) or i_in(2));
	o_out(3) <=i_in(0) and i_in(1) and not(i_in(2));
	o_out(4) <= i_in(2) and not(i_in(1) or i_in(0));
	o_out(5) <= i_in(2) and i_in(0) and not(i_in(1));
	o_out(6) <= i_in(2) and i_in(1) and not(i_in(0));
	o_out(7) <= i_in(2) and i_in(1) and i_in(0);

end rtl;

