------------------------------------------------------------------------------------------------
-- Descripción VHDL del bloque contador de la librería DigitalLib 
-- con precisión en los datos de entrada (n) parametrizable

-- Desarrollado por Irene Bujalance Fernández
------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity contador is
	generic (n: integer:=3); -- número de bits hasta el que puede llegar el contador
    Port ( en : in  STD_LOGIC;
		direccion: in std_logic; -- direccion=0 => ascendente; direccion=1 => descendente.
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           cuenta : out  STD_LOGIC_VECTOR (n-1 downto 0));
end contador;

architecture Behavioral of contador is

signal cont:std_logic_vector(n-1 downto 0);

begin

process(clk,reset)

begin
	if (reset='1') then
	cont<=std_logic_vector(to_unsigned(0,n));
	elsif (rising_edge(clk)) then
		if (en='1') then
			if (direccion='0') then
			cont<=cont + '1';
			else cont<=cont-'1';
			end if;
		else
		cont<=cont;
		end if;
	end if;

end process;

cuenta<=cont;

end Behavioral;
