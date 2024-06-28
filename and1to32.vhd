library ieee;
use ieee.std_logic_1164.all;

entity and1to32 is
port(
	i_in1 : in std_logic_vector(31 downto 0);
	i_in2 : in std_logic;
	o_out : out std_logic_vector(31 downto 0)
	);
end and1to32;

architecture rtl of and1to32 is
signal int_out : std_logic_vector(31 downto 0);

component and1to1 is
port(
	i_in1,i_in2 : in std_logic;
	o_out : out std_logic
	);
end component;

begin

	gen_And : for i in 0 to 31 generate
		and1to1_inst : and1to1 
		port map(
			i_in1 => i_in1(i),
			i_in2 => i_in2,
			o_out => int_out(i)
			);
		end generate gen_And;
	
	--Output Drivers
	
	o_out <= int_out;
	
end rtl;
		