library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
port(
	i_sel : in std_logic_vector(1 downto 0);
	i_in0,i_in1,i_in2,i_in3 : in std_logic_vector(7 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end mux4to1;

architecture rtl of mux4to1 is
signal int_in0,int_in1,int_in2,int_in3 : std_logic_vector(7 downto 0);

component and1to7 is
	port(
	i_in1 : in std_logic_vector(7 downto 0);
	i_in2 : in std_logic;
	o_out : out std_logic_vector(7 downto 0)
	);
end component;

begin

	in0 : and1to7 port map(
		i_in1 => i_in0,
		i_in2 => not(i_sel(0) or i_sel(1)),
		o_out => int_in0
		);
	
	in1 : and1to7 port map(
		i_in1 => i_in1,
		i_in2 => i_sel(0) and not(i_sel(1)),
		o_out => int_in1
		);
	
	in2 : and1to7 port map(
		i_in1 => i_in2,
		i_in2 => i_sel(1) and not(i_sel(0)),
		o_out => int_in2
		);	
	
	in3 : and1to7 port map(
		i_in1 => i_in3,
		i_in2 => i_sel(0) and i_sel(1),
		o_out => int_in3
		);
	
	--Output Drivers
	
	o_out <= int_in0 or int_in1 or int_in2 or int_in3;
	
end rtl;