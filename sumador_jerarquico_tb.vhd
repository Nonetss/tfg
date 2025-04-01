LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY sumador_jerarquico_tb IS
END sumador_jerarquico_tb;
 
ARCHITECTURE behavior OF sumador_jerarquico_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador_jerarquico
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
	    M : in STD_LOGIC;
         LED : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal M : STD_LOGIC;

   signal LED : std_logic_vector(6 downto 0);
    
 
BEGIN
 
   uut: sumador_jerarquico PORT MAP (
         						 A => A,
        						 B => B,
							 M=>M,
        					      LED => LED
    						      );


   stim_proc: process
   begin		
      A<="0010";B<="0010";M<='0';
      wait for 100 ns;	
	 A<="0100";M<='1';
	 wait for 100 ns;
	 A<="0011";
	 wait for 100 ns;

      wait;
   end process;

END;
