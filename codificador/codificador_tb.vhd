library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
 
 
ENTITY codificador_tb IS
generic (n: integer:=3); 
END codificador_tb;
 
ARCHITECTURE behavior OF codificador_tb IS 
 
   COMPONENT codificador
    generic (n: integer:=2); 
    Port ( entrada : in  STD_LOGIC_VECTOR ((2**n)-1 downto 0);
	      salida : out STD_LOGIC_VECTOR (n-1 downto 0));
end component;


  
   signal entrada : std_logic_vector((2**n)-1 downto 0) := (others => '0');

 	
   signal salida : std_logic_vector(n-1 downto 0);
 
BEGIN
 
	uut: codificador generic map(n=>3)
		PORT MAP (
          entrada => entrada,
          salida => salida
          );

 

   stim_proc: process
   begin		
      entrada<=std_logic_vector(to_unsigned(8, 2**n));
      wait for 100 ns;	
	 entrada<=std_logic_vector(to_unsigned(4, 2**n));
      wait for 100 ns;	
   	 entrada<=std_logic_vector(to_unsigned(2,2**n));
      wait for 100 ns;
   	 entrada<=std_logic_vector(to_unsigned(1, 2**n));
      wait for 100 ns;	
      wait;
   end process;

END;