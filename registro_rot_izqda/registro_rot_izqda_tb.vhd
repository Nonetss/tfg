LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY registro_rot_izqda_tb IS
generic (
    n: integer := 4;
    carga_inicial: integer := 3;
    desp: integer := 1
);
END registro_rot_izqda_tb;

ARCHITECTURE behavior OF registro_rot_izqda_tb IS 

    COMPONENT registro_rot_izqda
    generic (
        n: integer := 4;
        carga_inicial: integer := 3;
        desp: integer := 1
    );
    PORT (
        clk : in STD_LOGIC;
        reset: in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (n-1 downto 0)  -- Changed to STD_LOGIC_VECTOR
    );
    END COMPONENT;

    signal clk: std_logic := '0';
    signal reset: std_logic := '0';
    signal Q : STD_LOGIC_VECTOR(n-1 downto 0);  -- Changed to STD_LOGIC_VECTOR

BEGIN

    uut: registro_rot_izqda 
    generic map (
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
    clk_process: process
    begin
        clk <= '0';
        wait for 100 ns;
        clk <= '1';
        wait for 100 ns;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        reset <= '1';
        wait for 200 ns;  -- Wait for two clock cycles
        reset <= '0';
        
        -- Let the simulation run for several clock cycles to observe rotation
        wait for 1000 ns;
        
        wait;
    end process;

END;