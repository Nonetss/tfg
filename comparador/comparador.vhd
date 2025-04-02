library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Paquete estándar IEEE

entity comparador is
    generic (n: integer := 2);
    Port (
        A : in  STD_LOGIC_VECTOR (n-1 downto 0);
        B : in  STD_LOGIC_VECTOR (n-1 downto 0);
        AmayorB : out STD_LOGIC;
        AigualB : out STD_LOGIC;
        AmenorB : out STD_LOGIC
    );
end comparador;

architecture Behavioral of comparador is
begin
    AmayorB <= '1' when unsigned(A) > unsigned(B) else '0'; 
    AigualB <= '1' when unsigned(A) = unsigned(B) else '0'; 
    AmenorB <= '1' when unsigned(A) < unsigned(B) else '0'; 
end Behavioral;