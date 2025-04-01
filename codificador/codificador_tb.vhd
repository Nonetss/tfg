library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
 
ENTITY codificador_tb IS
generic (n: integer := 3); -- Definimos n=3 para 8 entradas
END codificador_tb;
 
ARCHITECTURE behavior OF codificador_tb IS 
 
   COMPONENT codificador
    generic (n: integer := 3); -- Aseguramos coincidencia con el testbench
    Port ( 
      entrada : in  STD_LOGIC_VECTOR ((2**n)-1 downto 0);
      salida : out STD_LOGIC_VECTOR (n-1 downto 0)
    );
   END COMPONENT;

   -- Señales de prueba
   signal entrada : std_logic_vector((2**n)-1 downto 0) := (others => '0');
   signal salida : std_logic_vector(n-1 downto 0);
 
BEGIN
   -- Instancia del componente bajo prueba
   uut: codificador 
     generic map(n => 3) -- Especificamos n=3 aquí también
     PORT MAP (
       entrada => entrada,
       salida => salida
     );

   -- Proceso de estimulación
   stim_proc: process
   begin
      report "Iniciando simulacion...";
      
      -- Prueba 1: Ninguna entrada activa
      entrada <= (others => '0');
      wait for 100 ns;
      assert salida = "000" report "Error en caso 00000000" severity error;
      
      -- Prueba 2: Activamos cada entrada individualmente
      for i in 0 to (2**n)-1 loop
        entrada <= (others => '0');
        entrada(i) <= '1';
        wait for 100 ns;
        assert salida = std_logic_vector(to_unsigned(i, n)) 
          report "Error en entrada " & integer'image(i) severity error;
      end loop;
      
      -- Prueba 3: Múltiples entradas activas (verificamos prioridad)
      entrada <= "00000001"; wait for 50 ns;
      assert salida = "000" report "Error prioridad 0" severity error;
      
      entrada <= "00000011"; wait for 50 ns;
      assert salida = "001" report "Error prioridad 1" severity error;
      
      entrada <= "00001111"; wait for 50 ns;
      assert salida = "011" report "Error prioridad 3" severity error;
      
      entrada <= "11111111"; wait for 50 ns;
      assert salida = "111" report "Error prioridad 7" severity error;
      
      -- Prueba 4: Patrones aleatorios
      entrada <= "01010101"; wait for 50 ns;
      assert salida = "110" report "Error patron 01010101" severity error;
      
      entrada <= "00110011"; wait for 50 ns;
      assert salida = "101" report "Error patron 00110011" severity error;
      
      report "Simulacion completada";
      wait;
   end process;

END;