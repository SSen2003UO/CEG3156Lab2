library ieee;
use ieee.std_logic_1164.all;

entity and1to1 is
port(
	i_in1,i_in2: in std_logic;
	o_out : out std_logic
	);
end and1to1;

architecture rtl of and1to1 is

begin

	o_out <= i_in1 and i_in2;

end;