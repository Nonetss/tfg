library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_bit.all;


entity registro_rot_derecha is

generic (n:integer:=4;
	    carga_inicial: integer:=3;
         desp:integer:=1);
    Port ( clk : in  STD_LOGIC;
	      reset: in std_logic;
           Q : out  bit_VECTOR (n-1 downto 0));
end registro_rot_derecha;

architecture Behavioral of registro_rot_derecha is

signal datos: bit_vector (n-1 downto 0);

begin

process (reset,clk)

begin

if reset='1' then 

datos<=bit_vector(to_unsigned(carga_inicial,n));

elsif rising_edge(clk) then

datos<=datos ror (desp);

end if;

end process;

Q<=datos;

end Behavioral;
