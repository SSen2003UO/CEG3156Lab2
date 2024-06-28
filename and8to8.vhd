library ieee;
use ieee.std_logic_1164.all;

entity and8to8 is
port(
	A,B : in std_logic_vector(7 downto 0);
	C : out std_logic_vector(7 downto 0)
	);
end;

architecture rtl of and8to8 is

signal int_C : std_logic_vector(7 downto 0);

component and1to1 is
port(
	i_in1,i_in2: in std_logic;
	o_out : out std_logic
	);
end component;

begin

	gen_And : for i in 0 to 7 generate
	And_inst : and1to1
	port map(A(i),B(i),int_C(i));
	end generate gen_And;
	
	--Output Drivers
	
	C <= int_C;
	
end rtl;