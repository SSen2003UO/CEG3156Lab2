library ieee;
use ieee.std_logic_1164.all;

entity memoryRegister is
port(
	MemWrite,clk, i_resetBar : in std_logic;
	i_MemAddress, i_WriteData : in std_logic_vector(7 downto 0);
	o_ReadData : out std_logic_vector(7 downto 0)
	);
end memoryRegister;

architecture rtl of memoryRegister is
	signal int_reg : std_logic_vector(2047 downto 0);
	signal int_ReadData : std_logic_vector(7 downto 0);

component register8bit is
	port(
		i_d : in std_logic_vector(7 downto 0);
		i_clk, i_en, i_resetBar: in std_logic;
		o_q : out std_logic_vector(7 downto 0)
		);
end component;

component mux256to1 is
	port(
		i_sel : in std_logic_vector(7 downto 0);
		i_in: in std_logic_vector(2047 downto 0);
		o_out : out std_logic_vector(7 downto 0)
	);
end component;

begin

	gen_Reg : for i in 0 to 255 generate
		reg_inst : register8bit
		port map(
			i_d => i_WriteData,
			i_clk => clk,
			i_en => MemWrite,
			i_resetBar => i_resetBar,
			o_q => int_reg((i+1)*8-1 downto i*8)
			);
		end generate gen_Reg;
	
	muxRead : mux256to1
	port map(i_MemAddress(7 downto 0),int_reg,int_ReadData);
	
	--Output Drivers
	
	o_ReadData <= int_ReadData;
	
end rtl;
			