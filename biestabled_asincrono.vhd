------------------------------------------------------------------------------------------------
-- Descripción VHDL del bloque biestable asíncrono D de la librería DigitalLib 

-- Desarrollado por Irene Bujalance Fernández
------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity biestabled_asincrono is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	      Q : out  STD_LOGIC);
end biestabled_asincrono;

architecture Behavioral of biestabled_asincrono is

begin

process(clk,reset)

begin

	if (reset='1')then --se ha elegido reset activo a la alta, si el usuario quiere cambiarlo, se pone a 0
	Q<='0';
	elsif (rising_edge (clk)) then
	Q<=D;
	end if;
	
end process;

end Behavioral;
