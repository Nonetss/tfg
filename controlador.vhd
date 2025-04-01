------------------------------------------------------------------------------------------------
-- Descripción VHDL del bloque controlador de la librería DigitalLib 

-- Desarrollado por Irene Bujalance Fernández
------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controlador is
    Port ( E : in  STD_LOGIC;
           X : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           SEC1 : out  STD_LOGIC;
           SEC2 : out  STD_LOGIC);
end controlador;

architecture Behavioral of controlador is

type tipo_estado is (S0,S1,S2,S3,S4,S5);

signal estado_actual, proximo_estado: tipo_estado;

begin

process (clk,reset,proximo_estado)
begin
if(reset='1') then
estado_actual<=S0;
elsif (rising_edge(clk)) then
estado_actual<=proximo_estado;
end if;
end process;

process (estado_actual,E,X)
begin
SEC1<='0';
SEC2<='0';
case estado_actual is
when S0=> if (E='1') then
				if (X='1') then
				proximo_estado<=S1;
				else proximo_estado<=S0;
				end if;
			 else proximo_estado<=S0;
			 end if;

when S1 => if (X='0') then
				proximo_estado<=S2;
				else proximo_estado<=S3;
				end if;
				
when S2 => if (X='1') then
				proximo_estado<=S4;
				else proximo_estado<=S0;
				end if;
				
when S3 => if (X='1') then
				proximo_estado<=S5;
				else proximo_estado<=S0;
				end if;

when S4 => proximo_estado<=S0;
				if (X='0') then
				SEC1<='1';
				else SEC2<='0';
				end if;
				
when S5 => proximo_estado<= S0;
				if (X='0') then
				SEC2<='1';
				else SEC2<='0';
				end if;
end case;
end process;
			


end Behavioral;
