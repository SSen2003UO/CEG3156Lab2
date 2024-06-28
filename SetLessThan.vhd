library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SetLessThan is
    Port (
        A  ,B: in  std_logic_vector(7 downto 0);
        Result : out std_logic_vector(7 downto 0)                 -- Output (1 if A < B, else 0)
    );
end;

architecture rtl of SetLessThan is
begin
    process(A, B)
    begin
        if A < B then
            Result <= "00000001";
        else
            Result <= "00000000";
        end if;
    end process;
end rtl;