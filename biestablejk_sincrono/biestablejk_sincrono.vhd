library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity biestablejk_sincrono is
    Port ( J : in  STD_LOGIC;
			  K : in STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end biestablejk_sincrono;

architecture Behavioral of biestablejk_sincrono is

signal dato: std_logic;

begin

process(clk)

begin

	if (falling_edge(clk))then
		if (reset='0') then  

		dato<='0';
		else
			if (J='0' and K='0') then
			dato<=dato;
			elsif (J='0' and K='1') then
			dato<='0';
			elsif (J='1' and K='0') then
			dato<='1';
			else
			dato<=not(dato);
			end if;
		end if;
	end if;
	
end process;

Q<=dato;

end Behavioral;