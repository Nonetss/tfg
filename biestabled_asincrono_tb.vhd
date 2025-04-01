--------------------------------------------------------------------------------
-- Descripción VHDL parametrizable del test de prueba para el bloque biestable D asíncrono

-- Desarrollado por Irene Bujalance Fernández
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY biestabled_asincrono_tb IS
END biestabled_asincrono_tb;
 
ARCHITECTURE behavior OF biestabled_asincrono_tb IS 
 
    
    COMPONENT biestabled_asincrono
    PORT(
         D : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   
   signal D : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	
   signal Q : std_logic;


   constant clk_period : time := 10 ns;
 
BEGIN
 
	   uut: biestabled_asincrono PORT MAP (
          D => D,
          clk => clk,
          reset => reset,
          Q => Q
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
      D<='1';reset<='1';
      wait for 100 ns;	
		D<='1';reset<='0';
		wait for 100 ns;	
		D<='1';reset<='1';
		wait for 100 ns;
		D<='1';reset<='0';
      wait;
   end process;

END;