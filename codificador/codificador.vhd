library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity codificador is
generic (n: integer := 2); 
    Port (
        entrada : in  STD_LOGIC_VECTOR((2**n)-1 downto 0);
        salida  : out STD_LOGIC_VECTOR(n-1 downto 0)
    );
end codificador;

architecture Behavioral of codificador is
begin
    process (entrada)
    begin
        -- Valor por defecto (todos los bits en '0')
        salida <= (others => '0');
        
        -- Codificador prioritario (prioridad al bit más significativo)
        for i in (2**n)-1 downto 0 loop
            if entrada(i) = '1' then
                salida <= std_logic_vector(to_unsigned(i, n));
                exit; -- Salir del bucle al encontrar el primer '1'
            end if;
        end loop;
    end process;
end Behavioral;