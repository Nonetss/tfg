library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port (
        clk      : in  STD_LOGIC;
        btn_set  : in  STD_LOGIC;
        btn_clr  : in  STD_LOGIC;
        Q        : out STD_LOGIC
    );
end main;

architecture Behavioral of main is

    -- Declarar componente switch virtual
    component boton_a_switch
        Port (
            clk     : in  STD_LOGIC;
            btn_set : in  STD_LOGIC;
            btn_clr : in  STD_LOGIC;
            salida  : out STD_LOGIC
        );
    end component;

    -- Declarar componente biestable tipo D
    component biestabled_asincrono
        Port (
            D     : in  STD_LOGIC;
            clk   : in  STD_LOGIC;
            Q     : out STD_LOGIC
        );
    end component;

    -- Señal interna que simula el switch
    signal D_virtual : STD_LOGIC;

begin

    -- Instancia del componente "switch digital"
    inst_virtual_switch : boton_a_switch
        port map (
            clk     => clk,
            btn_set => btn_set,
            btn_clr => btn_clr,
            salida  => D_virtual
        );

    -- Instancia del biestable tipo D
    inst_biestable : biestabled_asincrono
        port map (
            D     => D_virtual,
            clk   => clk,
            Q     => Q
        );

end Behavioral;
