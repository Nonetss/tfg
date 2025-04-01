LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY biestablejk_sincrono_tb IS
END biestablejk_sincrono_tb;
 
ARCHITECTURE behavior OF biestablejk_sincrono_tb IS 
 
 
    COMPONENT biestablejk_sincrono
    PORT(
         J : IN  std_logic;
	    K : IN std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   
   signal J : std_logic := '0';
   signal K : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	
   signal Q : std_logic;

    
BEGIN
 
	uut: biestablejk_sincrono PORT MAP (
          J => J,
	     K=> K,
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
      J<='0';K<='0';reset<='0';
      wait for 150 ns;	
	 reset<='1';
	 wait for 100 ns;	
	 J<='0';K<='1';
	 wait for 100 ns;
	 J<='1';k<='0';
	 wait for 100 ns;
	 J<='1';K<='1';
	 wait for 100 ns;
      wait;
   end process;

END;