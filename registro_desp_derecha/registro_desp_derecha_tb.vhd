LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY registro_desp_derecha_tb IS
  GENERIC (
    n: INTEGER := 4;
    carga_inicial: INTEGER := 3;
    desp: INTEGER := 1
  );
END registro_desp_derecha_tb;

ARCHITECTURE behavior OF registro_desp_derecha_tb IS 

  COMPONENT registro_desp_derecha
    GENERIC (
      n: INTEGER := 4;
      carga_inicial: INTEGER := 3;
      desp: INTEGER := 1
    );
    PORT ( 
      clk : IN STD_LOGIC;
      reset: IN STD_LOGIC;
      Q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)  -- Changed to STD_LOGIC_VECTOR
    );
  END COMPONENT;

  SIGNAL clk: STD_LOGIC := '0';
  SIGNAL reset: STD_LOGIC := '1';
  SIGNAL Q : STD_LOGIC_VECTOR(n-1 DOWNTO 0);  -- Changed to STD_LOGIC_VECTOR

  CONSTANT clk_period : TIME := 200 ns;  -- Matches your 100ns half-period

BEGIN

  uut: registro_desp_derecha 
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

  -- Clock generation process
  clk_process: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;

  -- Stimulus process
  stim_proc: PROCESS
  BEGIN		
    reset <= '1';
    WAIT FOR 100 ns;
    
    reset <= '0';
    
    -- Add stimulus pattern here if needed
    -- Example:
    -- WAIT FOR 500 ns;
    -- reset <= '1';
    -- WAIT FOR 100 ns;
    -- reset <= '0';
    
    WAIT; -- Stop simulation
  END PROCESS;

END behavior;