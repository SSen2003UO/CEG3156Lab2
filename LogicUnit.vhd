library ieee;
use ieee.std_logic_1164.all;

entity LogicUnit is
port(
	A,B : in std_logic_vector(7 downto 0);
	ALUOP : in std_logic; --0 = And, 1 = Or
	S : out std_logic_vector(7 downto 0)
	);
end;

architecture rtl of LogicUnit is

signal int_And,int_Or,int_O : std_logic_vector(7 downto 0);

component and8to8 is
port(
	A,B : in std_logic_vector(7 downto 0);
	C : out std_logic_vector(7 downto 0)
	);
end component;

component or8to8 is
port(
	A,B : in std_logic_vector(7 downto 0);
	C : out std_logic_vector(7 downto 0)
	);
end component;

component mux2to1 is
port(
	A,B : in std_logic_vector(7 downto 0);
	sel : in std_logic;
	O : out std_logic_vector(7 downto 0)
	);
end component;

begin
	
	andUnit : and8to8
	port map(A,B,int_And);
	
	orUnit : or8to8
	port map(A,B,int_Or);
	
	muxComb : mux2to1
	port map(int_And,int_Or,ALUOP,int_O);
	
	--Output Drivers
	
	S <= int_O;
	
end;
	