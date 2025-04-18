LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY biestablet_asincrono_tb IS
END biestablet_asincrono_tb;
 
ARCHITECTURE behavior OF biestablet_asincrono_tb IS 
 
     
    COMPONENT biestabled_asincrono
    PORT(
         T : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   signal T : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

   signal Q : std_logic;

 
BEGIN
 
   uut: biestabled_asincrono PORT MAP (
          T => T,
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
      T<='0';reset<='1';
      wait for 150 ns;	
	 reset<='0';
	 wait for 100 ns;	
	 T<='1';
	 wait for 100 ns;
      wait;
   end process;

END;