library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library DigitalLib;
use DigitalLib.entities.all;

entity sumador_jerarquico is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
	      M : in STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (6 downto 0));
end sumador_jerarquico;

architecture Behavioral of sumador_jerarquico is


signal suma: STD_LOGIC_VECTOR (3 downto 0);

begin

componente1: sum_res
generic map (n=>3)
PORT MAP (A=>A,B=>B,SUMA=>SUMA,M=>M);

componente2: HEX2LED
PORT MAP (hex=>SUMA,led=>led);

end Behavioral;
