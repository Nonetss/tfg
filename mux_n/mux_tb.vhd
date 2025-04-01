LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
 
 
ENTITY mux_tb IS
generic (C: integer:=1);
END mux_tb;
 
ARCHITECTURE behavior OF mux_tb IS 
 
 
    COMPONENT multiplexor
	 generic (C: integer:=1);
	     PORT(
         Datos : IN  std_logic_vector(2**C-1 downto 0);
         Control : IN  std_logic_vector(C-1 downto 0);
         Salida : OUT  std_logic
        );
    END COMPONENT;
    

   signal Datos : std_logic_vector(2**C-1 downto 0) := (others => '0');
   signal Control : std_logic_vector(C-1 downto 0) := (others => '0');

   signal Salida : std_logic;
 
BEGIN
 
   uut: multiplexor 
	generic map (C=>1)
	PORT MAP (
          Datos => Datos,
          Control => Control,
          Salida => Salida
        );

   stim_proc: process
   begin		
		datos<=std_logic_vector(to_unsigned(6, 2**C));
		control<=std_logic_vector(to_unsigned(1, C));
      wait for 100 ns;	
	   control<=std_logic_vector(to_unsigned(3, C));
      wait for 100 ns;	
   	control<=std_logic_vector(to_unsigned(2, C));
      wait for 100 ns;
   	control<=std_logic_vector(to_unsigned(0, C));
      wait for 100 ns;			
      wait;
   end process;

END;
