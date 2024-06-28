library ieee;
use ieee.std_logic_1164.all;

entity mux256to1 is
port(
	i_sel : in std_logic_vector(7 downto 0);
	i_in: in std_logic_vector(2047 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end mux256to1;

architecture rtl of mux256to1 is
	signal int_mux : std_logic_vector(63 downto 0);
	signal int_out : std_logic_vector(7 downto 0);
	

component mux32to1 is
port(
	i_sel : in std_logic_vector(4 downto 0);
	i_in : in std_logic_vector(255 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end component;

component mux8to1bit is
port(
	i_sel : in std_logic_vector(2 downto 0);
	i_in : in std_logic_vector(63 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end component;


begin
	 
	gen_mux32to1 : for i in 0 to 7 generate
	mux32_inst : mux32to1
	port map(i_sel(4 downto 0),i_in((i+1)*256-1 downto i*256),int_mux((i+1)*8-1 downto i*8));
	end generate gen_mux32to1;
	
	muxComb : mux8to1bit
	port map(i_sel(7 downto 5),int_mux,int_out);
	
	--Output Drivers
	
	o_out <= int_out;

end rtl;
		
	
