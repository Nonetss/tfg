
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity deco is
generic (n: integer:=3); --n�mero de bits de la entrada
    Port (entrada : in  STD_LOGIC_VECTOR ((n-1) downto 0);
	     salida : out STD_LOGIC_VECTOR ((2**n)-1 downto 0));
end deco;

architecture Behavioral of deco is

signal input: integer:=0;

begin

input<=conv_integer (unsigned(entrada));

process (input)

begin

for i in 0 to (2**n)-1 loop

	if (i=input) then
		salida(i)<='1'; 
	else
		salida(i)<='0';
	end if;

end loop;

end process;

end Behavioral;
