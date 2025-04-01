-- TestBench Template 
library IEEE;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity deco_tb is
	generic (n: integer:=3);
    
end deco_tb;

architecture Behavioral of deco_tb is

COMPONENT deco
generic (n: integer:=2);
    Port ( entrada : in  STD_LOGIC_VECTOR (n-1 downto 0);
           salida : out  STD_LOGIC_VECTOR ((2**n)-1 downto 0));
END COMPONENT;			  
			  
--Inputs
   signal entrada : std_logic_vector(n-1 downto 0) := (others => '0');

--Outputs
	signal salida : std_logic_vector((2**n)-1 downto 0);
	
signal input: integer:=0;

begin


	-- Instantiate the Unit Under Test (UUT)
   uut: deco 
	generic map (n=>3)
	PORT MAP (
          entrada => entrada,
          salida => salida
        );

   -- Stimulus process
   stim_proc: process
   begin		
		entrada<=std_logic_vector(to_unsigned(1, n));
      wait for 100 ns;	
	   entrada<=std_logic_vector(to_unsigned(0, n));
      wait for 100 ns;	
   	entrada<=std_logic_vector(to_unsigned(3, n));
      wait for 100 ns;
   	entrada<=std_logic_vector(to_unsigned(2, n));
      wait for 100 ns;			
      wait;
   end process;

end Behavioral;