library ieee;
use ieee.std_logic_1164.all;

entity mux32to1 is
port(
	i_sel : in std_logic_vector(4 downto 0);
	i_in : in std_logic_vector(255 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end mux32to1;

architecture rtl of mux32to1 is
signal int_mux0,int_mux1,int_mux2,int_mux3,int_out : std_logic_vector(7 downto 0);

component mux8to1bit is
port(
	i_sel : in std_logic_vector(2 downto 0);
	i_in : in std_logic_vector(63 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end component;

component mux4to1 is
port(
	i_sel : in std_logic_vector(1 downto 0);
	i_in0,i_in1,i_in2,i_in3 : in std_logic_vector(7 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end component;

begin

	mux0 : mux8to1bit
	port map(i_sel(2 downto 0),i_in(63 downto 0),int_mux0);
	
	mux1 : mux8to1bit
	port map(i_sel(2 downto 0),i_in(127 downto 64),int_mux1);
	
	mux2 : mux8to1bit
	port map(i_sel(2 downto 0),i_in(191 downto 128),int_mux2);
	
	mux3 : mux8to1bit
	port map(i_sel(2 downto 0),i_in(255 downto 192),int_mux3);
	
	muxComb : mux4to1
	port map(i_sel(4 downto 3),int_mux0,int_mux1,int_mux2,int_mux3,int_out);
	
	--Output Drivers
	
	o_out <= int_out;

end rtl;
		
	
