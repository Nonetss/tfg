----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:16 02/27/2015 
-- Design Name: 
-- Module Name:    multiplexor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexor is
generic (C: integer:=3); --número de entradas de control del multiplexor
    Port ( Datos : in  STD_LOGIC_VECTOR (2**C-1 downto 0);
           Control : in  STD_LOGIC_VECTOR (C-1 downto 0);
           Salida : out  STD_LOGIC);
end multiplexor;

architecture Behavioral of multiplexor is

signal sel: integer:=0;

begin

sel<=conv_integer (unsigned(Control));

Salida<=Datos(sel);

end Behavioral;
