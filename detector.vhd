library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library DigitalLib;
use DigitalLib.entities.all;

entity detector is
	generic( n: integer :=8);
    Port ( X : in  STD_LOGIC;
           E : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           mayor57 : out  STD_LOGIC;
           igual57 : out  STD_LOGIC;
           menor57 : out  STD_LOGIC);
end detector;

architecture Behavioral of detector is

component controlador is
    Port ( E : in  STD_LOGIC;
           X : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           SEC1 : out  STD_LOGIC;
           SEC2 : out  STD_LOGIC);
end component;
signal SEC1,SEC2: std_logic;
signal cuenta5,cuenta7: std_logic_vector (n-1 downto 0);

begin

componente1: controlador Port map (
					E=>E,
					X=>X,
					reset=>reset,
					clk=>clk,
					SEC1=>SEC1,
					SEC2=>SEC2);

componente2: contador GENERIC MAP (n=>8)
port map (en=>SEC1, direccion=>'0', reset=> reset, clk=> clk, cuenta=>cuenta5);

componente3: contador GENERIC MAP (n=>8)
port map (en=>SEC2, direccion=>'0', reset=> reset, clk=> clk, cuenta=>cuenta7);

componente4 : comparador generic map (n=>8)
port map (A=>cuenta5, B=>cuenta7, AmayorB=>mayor57, AigualB=>igual57, AmenorB=>menor57);

end Behavioral;
