library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity demux is
generic (c: integer:=2;
	    n: integer:=2); 
Port (entrada : in  STD_LOGIC_VECTOR(n-1 downto 0);
      control : in  STD_LOGIC_VECTOR (c-1 downto 0);
      salida : out  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0));
end demux;

architecture Behavioral of demux is

signal sel: integer:=0;

begin

sel<=conv_integer (control);

process (sel,entrada)

begin

for i in 0 to (2**c)-1 loop

	if (sel=i) then
		salida(n*(i+1)-1 downto n*i)<=entrada; 
	else
		salida(n*(i+1)-1 downto n*i)<=std_logic_vector(to_unsigned(0,n));

	end if;

end loop;

end process;

end Behavioral;

