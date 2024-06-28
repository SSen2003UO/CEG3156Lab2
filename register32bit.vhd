library ieee;
use ieee.std_logic_1164.all;

entity register32bit is
	port(
		i_d : in std_logic_vector(31 downto 0);
		i_clk, i_en, i_resetBar : in std_logic;
		o_q : out std_logic_vector(31 downto 0)
		);
end register32bit;

architecture rtl of register32bit is
	component enARdFF_1 is
		port(
		i_d, i_en, clk, i_resetBar: in std_logic;
		o_q : out std_logic);
	end component;
	
signal int_q : std_logic_vector	(31 downto 0);

begin

	gen_dFF: for i in 0 to 31 generate
		dFF_inst: enARdFF_1
			port map(
			clk => i_clk,
			i_d => i_d(i),
			i_en => i_en,
			i_resetBar => i_resetBar,
			o_q => int_q(i)
			);
		end generate gen_dFF;

		--Output Drivers
		
	o_q <= int_q;
		
end rtl;
