
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
ENTITY demux_tb IS
generic (C: integer:=2;
	    n: integer:=2);
END demux_tb;
 
ARCHITECTURE behavior OF demux_tb IS 
 
    
    COMPONENT demux
	 generic (C: integer:=2;
		     n: integer:=4);
    Port ( entrada : in  STD_LOGIC_VECTOR (n-1 downto 0);
           control : in  STD_LOGIC_VECTOR (c-1 downto 0);
           salida : out  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0));
    END COMPONENT;
    

signal entrada : std_logic_vector (n-1 downto 0);
signal control : std_logic_vector(c-1 downto 0) := (others => '0');

 signal salida : std_logic_vector(((2**c)*n)-1 downto 0);
  
BEGIN
 
   uut: demux 
	    generic map (C=>2,n=>2)
	    PORT MAP (
          entrada => entrada,
          control => control,
          salida => salida
			 );

   stim_proc: process
   begin		
    
   	entrada<=std_logic_vector(to_unsigned(3,n));
		control<=std_logic_vector(to_unsigned(3,c));
      wait for 100 ns;	
	   control<=std_logic_vector(to_unsigned(2,c));
      wait for 100 ns;	
   	control<=std_logic_vector(to_unsigned(1,c));
      wait for 100 ns;
   	control<=std_logic_vector(to_unsigned(0,c));
      wait for 100 ns;			
      wait;
		
   end process;

END;