library ieee;
use ieee.std_logic_1164.all;

entity PCAdd4 is
port(
	A : in std_logic_vector(31 downto 0);
	O : out std_logic_vector(31 downto 0)
	);
end;

architecture rtl of PCAdd4 is

signal int_O : std_logic_vector(31 downto 0);
signal int_B : std_logic_vector(31 downto 0) := (others => '0');
signal int_C : std_logic_vector(32 downto 0);

component fullAdder is
port(
	A,B,C : in std_logic;
	S,Cout: out std_logic
	);
end component;

begin

	int_B(2) <= '1';
	int_C(0) <= '0';

	gen_Add : for i in 0 to 31 generate
	Add_inst : fullAdder
	port map(A(i),int_B(i),int_C(i),int_O(i),int_C(i+1));
	end generate gen_Add;

	--Output Driver
	
	O <= int_O;

end rtl;

	
