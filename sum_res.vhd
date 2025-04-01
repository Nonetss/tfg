------------------------------------------------------------------------------------------------
-- Descripci�n VHDL del bloque sumador-restador de la librer�a DigitalLib 
-- con n�mero de entradas de control (c) y precisi�n en los datos de entrada (n) parametrizable

-- Desarrollado por Irene Bujalance Fern�ndez
------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sum_res is
    generic(n:integer:=3);
    Port ( A : in  STD_LOGIC_VECTOR (n downto 0);
           B : in  STD_LOGIC_VECTOR (n downto 0);
			  M : in STD_LOGIC;
           SUMA : out  STD_LOGIC_VECTOR (n downto 0));
end sum_res;

architecture Behavioral of sum_res is

begin

process (A,B)
	
variable i: integer;
variable CI: std_logic_vector (n+1 downto 0);
		
begin
		
CI(0):= M; -- CI(0):=Cin si el sumador tiene acarreo de entrada
			
for i in 0 to n loop
			
SUMA(i)<= A(i)xor (M xor B(i)) xor CI(i);
CI(i+1):= (A(i) and (M xor B(i)))or ((A(i) xor (M xor B(i))) and CI(i));
			
end loop;
			
-- Cout<=CI(4) si el suamdor tiene acarreo de salida
			
end process;

end Behavioral;