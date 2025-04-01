library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux_n is
generic (n: integer:=4;
         c: integer:=2);
    Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
           control : in  STD_LOGIC_VECTOR (c-1 downto 0);
           salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
end mux_n;

architecture Behavioral of mux_n is

signal sel: integer:=0;

begin

sel<=conv_integer (unsigned(Control));

Salida<=Datos(n*(sel+1)-1 downto n*sel);

end Behavioral;
