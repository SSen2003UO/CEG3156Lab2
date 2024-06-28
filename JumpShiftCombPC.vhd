library ieee;
use ieee.std_logic_1164.all;

entity JumpShiftCombPC is
port(
	Jump : in std_logic_vector(25 downto 0);
	PC : in std_logic_vector(3 downto 0);
	O : out std_logic_vector(31 downto 0)
);

end;

architecture rtl of JumpShiftCombPC is

signal int_O : std_logic_vector(31 downto 0);

begin
	O(0) <= '0';
	O(1) <= '0';
	O(27 downto 2) <= Jump;
	O(31 downto 28) <= PC;
	
end rtl;
	