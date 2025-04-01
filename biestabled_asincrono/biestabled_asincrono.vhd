library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity biestabled_asincrono is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	      Q : out  STD_LOGIC);
end biestabled_asincrono;

architecture Behavioral of biestabled_asincrono is

begin

process(clk,reset)

begin

	if (reset='1')then 
	Q<='0';
	elsif (rising_edge (clk)) then
	Q<=D;
	end if;
	
end process;

end Behavioral;
