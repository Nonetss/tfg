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

    -- Declaración del componente boton_a_switch
    component boton_a_switch
        Port (
            clk     : in  STD_LOGIC;
            btn_set : in  STD_LOGIC;
            btn_clr : in  STD_LOGIC;
            salida  : out STD_LOGIC
        );
    end component;

    -- Declaración del nuevo biestable sincrónico sin reset
    component biestabled_sincrono
        Port (
            D   : in  STD_LOGIC;
            clk : in  STD_LOGIC;
            Q   : out STD_LOGIC
        );
    end component;

    signal D_virtual : STD_LOGIC;

begin

    inst_virtual_switch : boton_a_switch
        port map (
            clk     => clk,
            btn_set => btn_set,
            btn_clr => btn_clr,
            salida  => D_virtual
        );

    inst_biestable : biestabled_sincrono
        port map (
            D   => D_virtual,
            clk => clk,
            Q   => Q
        );

end Behavioral;
