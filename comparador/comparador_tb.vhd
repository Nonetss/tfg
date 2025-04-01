LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
  
ENTITY comparador_tb IS
generic(n: INTEGER:=4);
END comparador_tb;
 
ARCHITECTURE behavior OF comparador_tb IS 
 
    
    COMPONENT comparador
	 generic(n: INTEGER:=2);
      PORT(
           A : IN  std_logic_vector(n-1 downto 0);
           B : IN  std_logic_vector(n-1 downto 0);
           AmayorB : OUT  std_logic;
           AigualB : OUT  std_logic;
           AmenorB : OUT  std_logic
           );
    END COMPONENT;
    

   signal A : std_logic_vector(n-1 downto 0) := (others => '0');
   signal B : std_logic_vector(n-1 downto 0) := (others => '0');

   signal AmayorB : std_logic;
   signal AigualB : std_logic;
   signal AmenorB : std_logic;

    
BEGIN
 
   uut: comparador generic map(n=>4)
		PORT MAP (
           A => A,
           B => B,
           AmayorB => AmayorB,
           AigualB => AigualB,
           AmenorB => AmenorB
           );

 
   stim_proc: process
   begin		
      A<=std_logic_vector(to_unsigned(3,n));
      B<=std_logic_vector(to_unsigned(2,n));
      wait for 100 ns;	
	 B<=std_logic_vector(to_unsigned(3,n));
	 wait for 100 ns;
	 A<=std_logic_vector(to_unsigned(2,n));

      wait;
   end process;

END;