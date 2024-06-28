library ieee;
use ieee.std_logic_1164.all;

entity mux2to1bit32 is
port(
	A,B : in std_logic_vector(31 downto 0);
	sel : in std_logic;
	O : out std_logic_vector(31 downto 0)
	);
end;

architecture rtl of mux2to1bit32 is

signal int_A,int_B : std_logic_vector(31 downto 0);

component and1to32 is
port(
	i_in1 : in std_logic_vector(31 downto 0);
	i_in2 : in std_logic;
	o_out : out std_logic_vector(31 downto 0)
	);
end component;

begin

	muxA : and1to32
	port map(A,not(sel),int_A);
	
	muxB : and1to32
	port map(B,sel,int_B);
	
	--Output Drivers
	
	O <= int_A or int_B;

end;
