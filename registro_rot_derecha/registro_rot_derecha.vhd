library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Paquete estándar

entity registro_rot_derecha is
    generic(
        n: integer := 4;
        carga_inicial: integer := 3;
        desp: integer := 1
    );
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(n-1 downto 0)  -- Cambiado a STD_LOGIC_VECTOR
    );
end registro_rot_derecha;

architecture Behavioral of registro_rot_derecha is
    signal datos: STD_LOGIC_VECTOR(n-1 downto 0) := 
        std_logic_vector(to_unsigned(carga_inicial, n));
begin
    process(reset, clk)
    begin
        if reset = '1' then
            datos <= std_logic_vector(to_unsigned(carga_inicial, n));
        elsif rising_edge(clk) then
            -- Implementación manual de rotación derecha
            datos <= datos(desp-1 downto 0) & datos(n-1 downto desp);
        end if;
    end process;
    
    Q <= datos;
end Behavioral;