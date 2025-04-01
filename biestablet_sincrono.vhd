------------------------------------------------------------------------------------------------
-- Descripción VHDL del bloque biestable T síncrono de la librería DigitalLib 

-- Desarrollado por Irene Bujalance Fernández
------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity biestablet_sincrono is
    Port ( T : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end biestablet_sincrono;

architecture Behavioral of biestablet_sincrono is

signal dato: std_logic;

begin

process(clk)

begin

	if (falling_edge(clk))then
		if (reset='0') then  --se ha elegido reset activo a la baja, si el usuario quiere cambiarlo, se pone a 1

		dato<='0';
		else
			if (T='0') then
			dato<=dato;
			else
			dato<=not(dato);
			end if;
		end if;
	end if;
	
end process;
Q<=dato;
end Behavioral;