library ieee;
use ieee.std_logic_1164.all;

entity combineData is
port(
	RegDst,Jump,MemRead,MemToReg,ALUSrc : in std_logic;
	ALUOp : in std_logic_vector(1 downto 0);
	O : out std_logic_vector(7 downto 0)
	);
end;

architecture rtl of combineData is

begin
	O(7) <= '0';
	O(6) <= RegDst;
	O(5) <= Jump;
	O(4) <= MemRead;
	O(3) <= MemToReg;
	O(2) <= ALUSrc;
	O(1 downto 0) <= ALUOp;

end;
