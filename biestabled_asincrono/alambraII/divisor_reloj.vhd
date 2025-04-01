library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divisor_reloj is
    Port (
        clk_in  : in  STD_LOGIC;
        clk_out : out STD_LOGIC
    );
end divisor_reloj;

architecture Behavioral of divisor_reloj is
    constant MAX_COUNT : integer := 6000000; -- 12 MHz / 2
    signal contador : integer := 0;
    signal clk_div : STD_LOGIC := '0';
begin

    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if contador = MAX_COUNT - 1 then
                contador <= 0;
                clk_div <= not clk_div;
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_div;

end Behavioral;
