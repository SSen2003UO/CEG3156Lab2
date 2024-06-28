library ieee;
use ieee.std_logic_1164.all;

entity ALUControl is
port(
	ALUOp : in std_logic_vector(1 downto 0);
	funct : in std_logic_vector(5 downto 0);
	ALUControl : out std_logic_vector(3 downto 0)
	);
end;

architecture rtl of ALUControl is
begin
    process(ALUOp, funct)
    begin
        case ALUOp is
            when "00" =>  -- Load/Store instructions
                ALUControl <= "0010";  -- ADD operation
            when "01" =>  -- Branch instructions
                ALUControl <= "0110";  -- SUB operation
            when "10" =>  -- R-type instructions
                case funct is
                    when "100000" =>  -- ADD
                        ALUControl <= "0010";
                    when "100010" =>  -- SUB
                        ALUControl <= "0110";
                    when "100100" =>  -- AND
                        ALUControl <= "0000";
                    when "100101" =>  -- OR
                        ALUControl <= "0001";
                    when "101010" =>  -- SLT
                        ALUControl <= "0111";
                    when others =>
                        ALUControl <= "0000";  -- Undefined operation
                end case;
            when others =>
                ALUControl <= "0000";  -- Undefined operation
        end case;
    end process;
end rtl;
