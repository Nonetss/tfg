library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity codificador is
generic (n: integer:=2); 
    Port ( entrada : in  STD_LOGIC_VECTOR ((2**n)-1 downto 0);
	      salida : out STD_LOGIC_VECTOR (n-1 downto 0));
end codificador;

architecture Behavioral of codificador is


begin


process (entrada)

begin

for i in 0 to (2**n)-1 loop

	if (entrada(i)='1') then
		salida<=std_logic_vector(to_unsigned(i,n)); 
	end if;

end loop;

end process;

end Behavioral;
