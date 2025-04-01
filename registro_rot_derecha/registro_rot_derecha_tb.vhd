LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY registro_rot_derecha_tb IS
  GENERIC (
    n: INTEGER := 4;
    carga_inicial: INTEGER := 3;
    desp: INTEGER := 1
  );
END registro_rot_derecha_tb;

ARCHITECTURE behavior OF registro_rot_derecha_tb IS 

  COMPONENT registro_rot_derecha
    GENERIC (
      n: INTEGER := 4;
      carga_inicial: INTEGER := 3;
      desp: INTEGER := 1
    );
    PORT ( 
      clk : IN STD_LOGIC;
      reset: IN STD_LOGIC;
      Q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)  -- Cambiado a STD_LOGIC_VECTOR
    );
  END COMPONENT;

  SIGNAL clk: STD_LOGIC := '0';
  SIGNAL reset: STD_LOGIC := '1';
  SIGNAL Q : STD_LOGIC_VECTOR(n-1 DOWNTO 0);  -- Cambiado a STD_LOGIC_VECTOR

  CONSTANT clk_period : TIME := 200 ns;  -- 100ns para cada medio ciclo

BEGIN

  uut: registro_rot_derecha  -- ¡CORRECTO! Instanciamos el componente, no el testbench
    GENERIC MAP (
      n => 4,
      carga_inicial => 3,
      desp => 1
    )
    PORT MAP(
      clk => clk,
      reset => reset,
      Q => Q
    );

  -- Generación de reloj
  clk_process: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;

  -- Proceso de estimulación
  stim_proc: PROCESS
  BEGIN
    reset <= '1';
    WAIT FOR 100 ns;
    reset <= '0';
    WAIT FOR 1000 ns;  -- Tiempo extendido para observar la rotación
    WAIT;
  END PROCESS;

END behavior;