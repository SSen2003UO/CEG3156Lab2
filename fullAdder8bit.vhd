library ieee;
use ieee.std_logic_1164.all;

entity fullAdder8bit is
port(
	A,B : in std_logic_vector(7 downto 0);
	C : in std_logic;
	S : out std_logic_vector(7 downto 0);
	Cout : out std_logic
	);
end;

architecture rtl of fullAdder8bit is

signal int_S : std_logic_vector(7 downto 0);
signal int_C : std_logic_vector(8 downto 0);

component fullAdder is
port(
	A,B,C : in std_logic;
	S,Cout: out std_logic
	);
end component;

begin
	int_C(0) <= C;
	
	gen_Add : for i in 0 to 7 generate
	Add_inst : fullAdder
	port map(A(i),B(i),int_C(i),int_S(i),int_C(i+1));
	end generate gen_Add;
	
	--Output Drivers
	
	S <= int_S;
	Cout <= int_C(8);
	
end rtl;
