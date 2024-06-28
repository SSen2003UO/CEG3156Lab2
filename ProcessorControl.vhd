library ieee;
use ieee.std_logic_1164.all;

entity ProcessorControl is
port(
	opcode: in std_logic_vector(5 downto 0);
	clk : in std_logic;
	RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite : out std_logic; --Logic
	ALUOp : out std_logic_vector(1 downto 0) --Send to ALUControl
	);
end;

architecture rtl of ProcessorControl is
-- 35 Load, 43 Store, 4 Branch, 2 Jump, 0 Rtype

signal int_ALUOp : std_logic_vector(1 downto 0);
begin
	
	Branch <= not(opcode(0) or opcode(1) or opcode(3) or opcode(4) or opcode(5)) and opcode(2);
	Jump <= not(opcode(0) or opcode(2) or opcode(3) or opcode(4) or opcode(5)) and opcode(1);
	RegDst <= not(opcode(0) or opcode(1) or opcode(2) or opcode(3) or opcode(4) or opcode(5));
	ALUSrc <= not(opcode(0) or opcode(1) or opcode(2) or opcode(3) or opcode(4) or opcode(5));
	MemToReg <= opcode(5) and opcode(1) and opcode(0) and not(opcode(4) or opcode(3) or opcode(2));
	MemRead <= opcode(5) and opcode(1) and opcode(0) and not(opcode(4) or opcode(3) or opcode(2));
	MemWrite <= opcode(5) and opcode(3) and opcode(1) and opcode(0) and not(opcode(4) or opcode(2));
	RegWrite <= (((opcode(5) and opcode(1) and opcode(0) and not(opcode(4) or opcode(3) or opcode(2))) or not(opcode(0) or opcode(1) or opcode(2) or opcode(3) or opcode(4) or opcode(5))));
	ALUOp(0) <= not(opcode(0) or opcode(1) or opcode(3) or opcode(4) or opcode(5)) and opcode(2);
	ALUOp(1) <= not(opcode(0) or opcode(1) or opcode(2) or opcode(3) or opcode(4) or opcode(5)) and clk;

end;
	