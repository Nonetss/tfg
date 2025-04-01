------------------------------------------------------------------------------------------------
-- Descripción VHDL del bloque comparador de la librería DigitalLib 
-- con precisión en los datos de entrada (n) parametrizable

-- Desarrollado por Irene Bujalance Fernández
------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity comparador is
	 generic (n: integer:=2); -- precisión de los datos de entrada
      Port ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
             B : in  STD_LOGIC_VECTOR (n-1 downto 0);
             AmayorB : out  STD_LOGIC;
             AigualB : out  STD_LOGIC;
             AmenorB : out  STD_LOGIC);
end comparador;

architecture Behavioral of comparador is

begin

AmayorB<='1' when A>B else '0'; 
AigualB<='1' when A=B else '0'; 
AmenorB<='1' when A<B else '0'; 

end Behavioral;
