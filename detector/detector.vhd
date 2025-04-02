library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Add these lines to explicitly reference the implementations
library work;
use work.controlador;
use work.contador;
use work.comparador;

entity detector is
    generic(n: integer := 8);
    Port ( X : in  STD_LOGIC;
           E : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           mayor57 : out  STD_LOGIC;
           igual57 : out  STD_LOGIC;
           menor57 : out  STD_LOGIC);
end detector;

architecture Behavioral of detector is
    -- These component declarations can be removed if using direct instantiation
    signal SEC1, SEC2: std_logic;
    signal cuenta5, cuenta7: std_logic_vector(n-1 downto 0);

begin
    -- Direct instantiation of entities
    componente1: entity work.controlador
        port map (
            E => E,
            X => X,
            clk => clk,
            reset => reset,
            SEC1 => SEC1,
            SEC2 => SEC2
        );

    componente2: entity work.contador
        generic map(n => 8)
        port map (
            en => SEC1,
            direccion => '0',
            reset => reset,
            clk => clk,
            cuenta => cuenta5
        );

    componente3: entity work.contador
        generic map(n => 8)
        port map (
            en => SEC2,
            direccion => '0',
            reset => reset,
            clk => clk,
            cuenta => cuenta7
        );

    componente4: entity work.comparador
        generic map(n => 8)
        port map (
            A => cuenta5,
            B => cuenta7,
            AmayorB => mayor57,
            AigualB => igual57,
            AmenorB => menor57
        );
end Behavioral;