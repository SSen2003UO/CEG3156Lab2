library ieee;
use ieee.std_logic_1164.all;

entity registerFile is
	port(
		clk, RegWrite, i_resetBar : in std_logic;
		i_readReg1, i_readReg2, i_writeReg : in std_logic_vector(2 downto 0);
		i_writeData : in std_logic_vector(7 downto 0);
		o_readData1, o_readData2 : out std_logic_vector(7 downto 0)
		);
end registerFile;

architecture rtl of registerFile is

	type signal_array_t is array (0 to 7) of std_logic_vector(7 downto 0);
	
	signal int_reg : signal_array_t := (others => (others => '0')); --Initialize with 0
	signal int_readReg1,int_readReg2,int_writeReg : std_logic_vector(7 downto 0) := (others => '0');

component decoder3to8 is
port(
		i_in : in std_logic_vector(2 downto 0);
		o_out: out std_logic_vector(7 downto 0)
	);
end component;

component register8bit is
port(
		i_d : in std_logic_vector(7 downto 0);
		i_clk, i_en, i_resetBar : in std_logic;
		o_q : out std_logic_vector(7 downto 0)
		);
end component;

component mux8to1 is
port(
	i_sel : in std_logic_vector(2 downto 0);
	i_0in,i_1in,i_2in,i_3in,i_4in,i_5in,i_6in,i_7in: in std_logic_vector(7 downto 0);
	o_out : out std_logic_vector(7 downto 0)
	);
end component;

begin
			
	decodeWrite : decoder3to8
		port map(
			i_in => i_writeReg,
			o_out => int_writeReg
		);
			
	gen_Reg : for i in 0 to 7 generate
	register_inst : register8bit
	port map(
		i_d => i_writeData,
		i_clk => clk,
		i_resetBar => i_resetBar,
		i_en => RegWrite and int_writeReg(i),
		o_q => int_reg(i)
		);
	end generate gen_Reg;
	
	readData1 : mux8to1
	port map(
	i_readReg1,int_reg(0), int_reg(1), int_reg(2), int_reg(3), int_reg(4), int_reg(5), int_reg(6), int_reg(7),int_readReg1);
	
	readData2 : mux8to1
	port map(
	i_readReg2,int_reg(0), int_reg(1), int_reg(2), int_reg(3), int_reg(4), int_reg(5), int_reg(6), int_reg(7),int_readReg2);
	
	--Output Drivers
	
	o_readData1 <= int_readReg1;
	o_readData2 <= int_readReg2;
	
end rtl;
	
	
	
	
	
	