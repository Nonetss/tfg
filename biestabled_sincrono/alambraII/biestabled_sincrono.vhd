library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity biestabled_sincrono is
    Port (
        D   : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end biestabled_sincrono;

architecture Behavioral of biestabled_sincrono is
begin

    process(clk)
    begin
        if falling_edge(clk) then
            Q <= D;
        end if;
    end process;

end Behavioral;
