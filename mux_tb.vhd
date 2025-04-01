--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:11:55 02/27/2015
-- Design Name:   
-- Module Name:   C:/libreria/mux/mux_tb.vhd
-- Project Name:  mux
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplexor
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux_tb IS
generic (C: integer:=1);
END mux_tb;
 
ARCHITECTURE behavior OF mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexor
	 generic (C: integer:=1);
	     PORT(
         Datos : IN  std_logic_vector(2**C-1 downto 0);
         Control : IN  std_logic_vector(C-1 downto 0);
         Salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Datos : std_logic_vector(2**C-1 downto 0) := (others => '0');
   signal Control : std_logic_vector(C-1 downto 0) := (others => '0');

 	--Outputs
   signal Salida : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexor 
	generic map (C=>1)
	PORT MAP (
          Datos => Datos,
          Control => Control,
          Salida => Salida
        );

   -- Stimulus process
   stim_proc: process
   begin		
		datos<=std_logic_vector(to_unsigned(6, 2**C));
		control<=std_logic_vector(to_unsigned(1, C));
      wait for 100 ns;	
	   control<=std_logic_vector(to_unsigned(3, C));
      wait for 100 ns;	
   	control<=std_logic_vector(to_unsigned(2, C));
      wait for 100 ns;
   	control<=std_logic_vector(to_unsigned(0, C));
      wait for 100 ns;			
      wait;
   end process;

END;
