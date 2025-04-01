library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity boton_a_switch is
    Port (
        clk      : in  STD_LOGIC;
        btn_set  : in  STD_LOGIC;
        btn_clr  : in  STD_LOGIC;
        salida   : out STD_LOGIC
    );
end boton_a_switch;

architecture Behavioral of boton_a_switch is
    signal estado : STD_LOGIC := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if btn_set = '1' then
                estado <= '1';
            elsif btn_clr = '1' then
                estado <= '0';
            end if;
        end if;
    end process;

    salida <= estado;

end Behavioral;
