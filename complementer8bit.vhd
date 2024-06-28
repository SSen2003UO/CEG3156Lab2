library ieee;
use ieee.std_logic_1164.all;

entity complementer8bit is
port(
	A : in std_logic_vector(7 downto 0);
	B : in std_logic;
	O : out std_logic_vector(7 downto 0)
	);
end;

architecture rtl of complementer8bit is

begin

	O(0) <= A(0) xor B;
	O(1) <= A(1) xor B;
	O(2) <= A(2) xor B;
	O(3) <= A(3) xor B;
	O(4) <= A(4) xor B;
	O(5) <= A(5) xor B;
	O(6) <= A(6) xor B;
	O(7) <= A(7) xor B;

end rtl;