library ieee;
use ieee.std_logic_1164.all;

entity mux8to1bit is
port(
	i_sel : in std_logic_vector(2 downto 0);
	i_in : in std_logic_vector(63 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end;

architecture rtl of mux8to1bit is

signal int_in : std_logic_vector(63 downto 0);
signal int_mux, int_muxF : std_logic_vector(15 downto 0);

component mux4to1 is
	port(
		i_sel : in std_logic_vector(1 downto 0);
		i_in0,i_in1,i_in2,i_in3 : in std_logic_vector(7 downto 0);
		o_out : out std_logic_vector(7 downto 0)
	);
end component;

component and1to7 is
	port(
	i_in1 : in std_logic_vector(7 downto 0);
	i_in2 : in std_logic;
	o_out : out std_logic_vector(7 downto 0)
	);
end component;

begin

	gen_mux : for i in 0 to 1 generate
	mux_inst : mux4to1
		port map(i_sel(1 downto 0),i_in((i+1)*8-1 downto i*8),i_in((i+2)*8-1 downto (i+1)*8),i_in((i+3)*8-1 downto (i+2)*8),i_in((i+4)*8-1 downto (i+3)*8),int_mux((i+1)*8-1 downto i*8));
	end generate gen_mux;
	
	andMux1 : and1to7
	port map(int_mux(7 downto 0),not(i_sel(2)),int_muxF(7 downto 0));
	
	andMux2 : and1to7
	port map(int_mux(15 downto 8),i_sel(2),int_muxF(15 downto 8));
	
	--Output Driver
	
	o_out <= int_muxF(7 downto 0) or int_muxF(15 downto 8);
end rtl;
			