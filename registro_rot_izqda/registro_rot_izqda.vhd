library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity registro_rot_izqda is
    generic (
        n: integer := 4;
        carga_inicial: integer := 3;
        desp: integer := 1
    );
    Port (
        clk : in STD_LOGIC;
        reset: in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (n-1 downto 0)
    );
end registro_rot_izqda;

architecture Behavioral of registro_rot_izqda is
    signal datos: STD_LOGIC_VECTOR (n-1 downto 0);

begin
    process (reset, clk)
    begin
        if reset = '1' then
            datos <= STD_LOGIC_VECTOR(to_unsigned(carga_inicial, n));
        elsif rising_edge(clk) then
            -- Manual implementation of rotate left
            datos <= datos(n-1-desp downto 0) & datos(n-1 downto n-desp);
        end if;
    end process;

    Q <= datos;
end Behavioral;