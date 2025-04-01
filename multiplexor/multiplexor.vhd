library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity multiplexor is
generic (C: integer:=3); 
    Port ( Datos : in  STD_LOGIC_VECTOR (2**C-1 downto 0);
           Control : in  STD_LOGIC_VECTOR (C-1 downto 0);
           Salida : out  STD_LOGIC);
end multiplexor;

architecture Behavioral of multiplexor is

signal sel: integer:=0;

begin

sel<=conv_integer (unsigned(Control));

Salida<=Datos(sel);

end Behavioral;
