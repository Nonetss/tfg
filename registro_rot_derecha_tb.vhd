
  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY registro_rot_derecha_tb IS
  generic (n:integer:=4;
		carga_inicial: integer:=3;
           desp:integer:=1);
  END registro_rot_derecha_tb;

  ARCHITECTURE behavior OF registro_rot_derecha_tb IS 

          COMPONENT registro_rot_derecha
          generic (n:integer:=4;
			   carga_inicial: integer:=3;
                   desp:integer:=1);
			Port ( clk : in  STD_LOGIC;
				  reset: in std_logic;
				  Q : out  bit_VECTOR (n-1 downto 0));
          END COMPONENT;

          signal clk:  std_logic;
	     signal reset: std_logic;

          signal Q :  bit_vector(n-1 downto 0);
          

  BEGIN

        uut: registro_rot_derecha
		generic map (n=>4,
				  carga_inicial=>3,
				  desp=>1)
		PORT MAP(
                    clk => clk,
                    reset => reset,
			    Q => Q
                    );

    clk_process :process
   begin
	clk <= '0';
	wait for 100 ns;
	clk <= '1';
	wait for 100 ns;
	end process;

   stim_proc: process
   begin		
      reset<='1';
      wait for 100 ns;	
	 reset<='0';
	 wait for 100 ns;
      wait;
   end process;

END;