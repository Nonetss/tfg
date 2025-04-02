library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity registro_rot_izqda is
  generic (
    n: integer := 4;               -- Bits del registro
    carga_inicial: integer := 3;   -- Valor inicial: 3 (0011 en binario)
    desp: integer := 1;            -- Bits a rotar por ciclo
    div_factor: integer := 5000000 -- Divisor de frecuencia (ej: 5M para 10 Hz en FPGA de 50 MHz)
  );
  port (
    clk : in STD_LOGIC;            
    reset: in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (n-1 downto 0)
  );
end registro_rot_izqda;

architecture Behavioral of registro_rot_izqda is
  signal datos: STD_LOGIC_VECTOR (n-1 downto 0);
  signal counter: integer range 0 to div_factor := 0;
  signal clk_slow: STD_LOGIC := '0';  -- Reloj lento interno
begin

  -- Divisor de frecuencia para reloj lento
  process(clk, reset)
  begin
    if reset = '1' then
      counter <= 0;
      clk_slow <= '0';
    elsif rising_edge(clk) then
      if counter = div_factor - 1 then
        counter <= 0;
        clk_slow <= not clk_slow;  -- Invierte el reloj lento
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;

  -- Lógica de rotación (ahora usa clk_slow)
  process(clk_slow, reset)
  begin
    if reset = '1' then
      datos <= STD_LOGIC_VECTOR(to_unsigned(carga_inicial, n));
    elsif rising_edge(clk_slow) then
      -- Rotación manual a la izquierda (sin operador 'rol')
      datos <= datos(n - 1 - desp downto 0) & datos(n - 1 downto n - desp);
    end if;
  end process;

  Q <= datos;

end Behavioral;