library ieee;
use ieee.std_logic_1164.all;

entity enARdFF_1 is
	port(
	i_d, i_en, clk, i_resetBar: in std_logic;
	o_q : out std_logic);
end enARdFF_1;

architecture rtl of enARdFF_1 is
 SIGNAL int_q, int_qBar : STD_LOGIC;
 SIGNAL int_sSignal, int_rSignal : STD_LOGIC;
 BEGIN
 -- Concurrent Signal Assignment
 int_sSignal <= i_d and i_en and clk and i_resetBar;
 int_rSignal <= (not(i_d) and i_en and clk) or not(i_resetBar);
 int_q <= int_rSignal nor int_qBar;
 int_qBar <= int_q nor int_sSignal;
 
 --Output Drivers

 o_q <= int_q;
 
 end rtl;