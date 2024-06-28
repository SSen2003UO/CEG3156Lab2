library ieee;
use ieee.std_logic_1164.all;

entity mux8to1 is
port(
	i_sel : in std_logic_vector(2 downto 0);
	i_0in,i_1in,i_2in,i_3in,i_4in,i_5in,i_6in,i_7in : in std_logic_vector(7 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end mux8to1;

architecture rtl of mux8to1 is
signal int_in0,int_in1,int_in2,int_in3,int_in4,int_in5,int_in6,int_in7 : std_logic_vector(7 downto 0);

component and1to7 is
	port(
	i_in1 : in std_logic_vector(7 downto 0);
	i_in2 : in std_logic;
	o_out : out std_logic_vector(7 downto 0)
	);
end component;

begin

	in0 : and1to7 port map(
		i_in1 => i_0in,
		i_in2 => not(i_sel(0) or i_sel(1) or i_sel(2)),
		o_out => int_in0
		);
	
	in1 : and1to7 port map(
		i_in1 => i_1in,
		i_in2 => i_sel(0) and not(i_sel(1) or i_sel(2)),
		o_out => int_in1
		);
	
	in2 : and1to7 port map(
		i_in1 => i_2in,
		i_in2 => i_sel(1) and not(i_sel(2) or i_sel(0)),
		o_out => int_in2
		);
	
	in3 : and1to7 port map(
		i_in1 => i_3in,
		i_in2 => i_sel(0) and i_sel(1) and not(i_sel(2)),
		o_out => int_in3
		);
		
	in4 : and1to7 port map(
		i_in1 => i_4in,
		i_in2 => not(i_sel(0) or i_sel(1)) and i_sel(2),
		o_out => int_in4
		);
	
	in5 : and1to7 port map(
		i_in1 => i_5in,
		i_in2 => i_sel(0) and not(i_sel(1)) and i_sel(2),
		o_out => int_in5
		);
	
	in6 : and1to7 port map(
		i_in1 => i_6in,
		i_in2 => not(i_sel(0)) and i_sel(1) and i_sel(2),
		o_out => int_in6
		);
	
	in7 : and1to7 port map(
		i_in1 => i_7in,
		i_in2 => i_sel(0) and i_sel(1) and i_sel(2),
		o_out => int_in7
		);
	
	--Output Drivers
	
	o_out <= int_in0 or int_in1 or int_in2 or int_in3 or int_in4 or int_in5 or int_in6 or int_in7;
	
end rtl;
