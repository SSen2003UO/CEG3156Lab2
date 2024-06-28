library ieee;
use ieee.std_logic_1164.all;

entity ALU is
port(
	i_a,i_b : in std_logic_vector(7 downto 0);
	i_ControlSig : in std_logic_vector(3 downto 0); -- 1bit 1 = AU, 1bit 0 = LU
	o_zero : out std_logic;
	o_ALUResult : out std_logic_vector(7 downto 0)
	);
end;

architecture rtl of ALU is

signal int_AU,int_LU,int_SLT,int_O,int_OFinal : std_logic_vector(7 downto 0) := (others => '0');
signal int_Control : std_logic;

component LogicUnit is
port(
	A,B : in std_logic_vector(7 downto 0);
	ALUOP : in std_logic;
	S : out std_logic_vector(7 downto 0)
	);
end component;

component ArthmeticUnit is
port(
	A,B : in std_logic_vector(7 downto 0);
	sel : in std_logic; -- 0 is Add, 1 is Sub
	O : out std_logic_vector(7 downto 0)
	);
end component;

component SetLessThan is
    port (
        A , B    : in  std_logic_vector(7 downto 0);
        Result : out std_logic_vector(7 downto 0)
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
  
  int_Control <= i_ControlSig(2) and i_ControlSig(1) and i_ControlSig(0);
 AU : ArthmeticUnit
 port map(i_a,i_b,i_ControlSig(2),int_AU);
 
 LU : LogicUnit
 port map(i_a,i_b,i_ControlSig(0),int_LU);
 
 SLT : SetLessThan
 port map(i_a,i_b,int_SLT);
 
 muxComb : mux2to1
 port map(int_LU,int_AU, i_ControlSig(1),int_O);
 
 muxFinal : mux2to1
 port map(int_O,int_SLT,int_Control,int_OFinal);
 
 --Output Drivers
 
 o_ALUResult <= int_OFinal;
 o_zero <= not(int_OFinal(0) or int_OFinal(1) or int_OFinal(2) or int_OFinal(3) or int_OFinal(4) or int_OFinal(5) or int_OFinal(6) or int_OFinal(7));

 end;
