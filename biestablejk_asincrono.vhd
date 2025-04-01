------------------------------------------------------------------------------------------------
-- Descripción VHDL del bloque biestable JK asíncrono de la librería DigitalLib 

-- Desarrollado por Irene Bujalance Fernández
------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity biestablejk_asincrono is
    Port ( J : in  STD_LOGIC;
		 K : in STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end biestablejk_asincrono;

architecture Behavioral of biestablejk_asincrono is

signal dato: std_logic;

begin

process(clk)

begin

	if (reset='1') then  --se ha elegido reset activo a la alta, si el usuario quiere cambiarlo, se pone a 0

	dato<='0';
	elsif (rising_edge(clk)) then
		if (J='0' and K='0') then
		dato<=dato;
		elsif (J='0' and K='1') then
		dato<='0';
		elsif (J='1' and K='0') then
		dato<='1';
		else
		dato<=not(dato);
		end if;
	end if;
	
	
end process;
Q<=dato;
end Behavioral;