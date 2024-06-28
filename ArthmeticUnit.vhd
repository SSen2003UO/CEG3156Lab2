library ieee;
use ieee.std_logic_1164.all;

entity ArthmeticUnit is
port(
	A,B : in std_logic_vector(7 downto 0);
	sel : in std_logic; -- 0 is Add, 1 is Sub
	O : out std_logic_vector(7 downto 0)
	);
end;

architecture rtl of ArthmeticUnit is

	signal int_O : std_logic_vector(7 downto 0);
	signal int_B : std_logic_vector(7 downto 0);
	
component fullAdder8bit is
port(
	A,B : in std_logic_vector(7 downto 0);
	C : in std_logic;
	S : out std_logic_vector(7 downto 0);
	Cout : out std_logic
	);
end component;

component complementer8bit is
port(
	A : in std_logic_vector(7 downto 0);
	B : in std_logic;
	O : out std_logic_vector(7 downto 0)
	);
end component;

begin

	comp : complementer8bit
	port map(B,sel,int_B);

	Unit : fullAdder8bit
	port map(A,int_B,sel,int_O);
	
	--Output Drivers
	
	O <= int_O;
	
	
end rtl;

	