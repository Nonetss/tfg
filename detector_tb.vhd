--------------------------------------------------------------------------------
-- Descripción VHDL parametrizable del test de prueba para el bloque multiplexor

-- Desarrollado por Irene Bujalance Fernández
--------------------------------------------------------------------------------
  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY detector_tb IS
  generic(n: integer:=8);
  END detector_tb;

  ARCHITECTURE behavior OF detector_tb IS 

component detector is
	generic(n: integer:=8);
    Port ( X : in  STD_LOGIC;
           E : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           mayor57 : out  STD_LOGIC;
           igual57 : out  STD_LOGIC;
           menor57 : out  STD_LOGIC);
end component;

  signal E : STD_LOGIC:= '0';   
  signal X : STD_LOGIC:= '0';
  signal clk: STD_LOGIC:= '0';
  signal reset: STD_LOGIC:= '0';
  signal mayor57: STD_LOGIC:= '0';
  signal igual57: STD_LOGIC:= '0';
  signal menor57: STD_LOGIC:= '0';

  BEGIN

	uut:detector
	generic map(n=>8)
	port map(E=>E,X=>X,reset=>reset,clk=>clk,mayor57=>	mayor57,igual57=>igual57,menor57=>menor57);

		clk_process :process
		begin
			clk <= '0';
		wait for 100 ns;
			clk <= '1';
		wait for 100 ns;
		end process;
	
     stim_proc: process
   begin
			reset<='0';x<='1'; E<='0';
        		wait for 50 ns; 
			reset<='1';x<='1'; E<='0';
			wait for 100 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 100 ns; 
			reset<='0';x<='1'; E<='1';
			wait for 100 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 50 ns; 
			reset<='0';x<='0'; E<='0';	
			wait for 400 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 250 ns; 
			reset<='0';x<='1'; E<='1';
			wait for 100 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 450 ns; 
			reset<='0';x<='0'; E<='0';
			wait for 200 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 50 ns; 
			reset<='0';x<='1'; E<='1';
			wait for 100 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 50 ns; 
			reset<='0';x<='0'; E<='0';
			wait for 200 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 200 ns; 
			reset<='0';x<='0'; E<='0';
			wait for 200 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 50 ns; 
			reset<='0';x<='1'; E<='1';
			wait for 100 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 50 ns; 
			reset<='0';x<='0'; E<='0';
			wait for 200 ns; 
			reset<='0';x<='1'; E<='0';
			wait for 200 ns; 
			reset<='0';x<='0'; E<='0';
			wait for 200 ns;
			
			wait;
			

     END PROCESS; 

  END;