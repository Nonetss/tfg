------------------------------------------------------------------------------------------------
-- Descripci�n VHDL del bloque biestable D s�ncrono de la librer�a DigitalLib 

-- Desarrollado por Irene Bujalance Fern�ndez
------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity biestabled_sincrono is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end biestabled_sincrono;

architecture Behavioral of biestabled_sincrono is

begin

process(clk,reset)

begin

	if (falling_edge(clk))then
		if (reset='0') then   --se ha elegido reset activo a la baja, si el usuario quiere cambiarlo, se pone a 1
		Q<='0';
		else
		Q<=D;
		end if;
	end if;
	
end process;

end Behavioral;
