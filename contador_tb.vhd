--------------------------------------------------------------------------------
-- Descripción VHDL parametrizable del test de prueba para el bloque contador

-- Desarrollado por Irene Bujalance Fernández
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY contador_tb IS
generic (n: integer:=4);
END contador_tb;
 
ARCHITECTURE behavior OF contador_tb IS 
 
     
    COMPONENT contador
	 generic (n: integer:=3);
    PORT(
         en : IN  std_logic;
	    direccion: IN std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         cuenta : OUT  std_logic_vector(n-1 downto 0)
        );
    END COMPONENT;
    

   signal en : std_logic := '0';
   signal direccion: std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

   signal cuenta : std_logic_vector(n-1 downto 0);

 
BEGIN
 
	uut: contador 
	generic map(n=>4)
	PORT MAP (
          en => en,
	     direccion => direccion,
          reset => reset,
          clk => clk,
          cuenta => cuenta
        );

   clk_process :process
   begin
		clk <= '0';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
   end process;
 

   
   stim_proc: process
   begin		
      reset<='1';en<='0';direccion<='0';
      wait for 100 ns;	
	 reset<='0';
      wait for 100 ns;
	 en<='1';
      wait for 400 ns; 
	 direccion<='1';
	 wait for 400 ns;

      wait;
   end process;

END;