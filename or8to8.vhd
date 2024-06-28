library ieee;
use ieee.std_logic_1164.all;

entity or8to8 is
port(
	A,B : in std_logic_vector(7 downto 0);
	C : out std_logic_vector(7 downto 0)
	);
end;

architecture rtl of or8to8 is

signal int_C : std_logic_vector(7 downto 0);

begin

	int_C(0) <= A(0) or B(0);
	int_C(1) <= A(1) or B(1);
	int_C(2) <= A(2) or B(2);
	int_C(3) <= A(3) or B(3);
	int_C(4) <= A(4) or B(4);
	int_C(5) <= A(5) or B(5);
	int_C(6) <= A(6) or B(6);
	int_C(7) <= A(7) or B(7);
	
	--Output Drivers
	
	C <= int_C;
	
end rtl;