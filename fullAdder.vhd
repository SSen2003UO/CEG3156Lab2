library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
port(
	A,B,C : in std_logic;
	S,Cout: out std_logic
	);
end;

architecture rtl of fullAdder is

begin

	S <= (A xor B) xor C;
	Cout <= (((A xor B) and C) or (A and B));
end rtl;


