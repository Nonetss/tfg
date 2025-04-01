library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity biestablet_asincrono is
    Port ( T : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end biestablet_asincrono;

architecture Behavioral of biestablet_asincrono is
signal dato: std_logic;
begin

process(clk)

begin

		if (reset='1') then 
		dato<='0';
		elsif (rising_edge(clk)) then
			if (T='0') then
			dato<=dato;
			else
			dato<=not(dato);
			end if;
		end if;

	
end process;
Q<=dato;
end Behavioral;