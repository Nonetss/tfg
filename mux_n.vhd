----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:49 02/27/2015 
-- Design Name: 
-- Module Name:    mux_n - Behavioral 
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

entity mux_n is
generic (n: integer:=4; --número de bits
         c: integer:=2);--número de entradas de control
    Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
           control : in  STD_LOGIC_VECTOR (c-1 downto 0);
           salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
end mux_n;

architecture Behavioral of mux_n is

signal sel: integer:=0;

begin

sel<=conv_integer (unsigned(Control));

Salida<=Datos(n*(sel+1)-1 downto n*sel);

end Behavioral;
