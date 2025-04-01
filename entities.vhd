library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

package Entities is 

component deco is
generic (n: integer);
    Port (entrada : in  STD_LOGIC_VECTOR ((n-1) downto 0);
         salida : out STD_LOGIC_VECTOR ((2**n)-1 downto 0));
end component;

component biestablet_sincrono is
    Port ( T : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component biestabled_asincrono is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
          Q : out  STD_LOGIC);
end component;

component biestabled_sincrono is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component biestablejk_asincrono is
    Port ( J : in  STD_LOGIC;
         K : in STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component biestablejk_sincrono is
    Port ( J : in  STD_LOGIC;
          K : in STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component biestabled_sincrono is
    Port ( T : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component codificador is
generic (n: integer);
    Port ( entrada : in  STD_LOGIC_VECTOR ((2**n)-1 downto 0);
          salida : out STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component comparador is
     generic (n: integer);
      Port ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
             B : in  STD_LOGIC_VECTOR (n-1 downto 0);
             AmayorB : out  STD_LOGIC;
             AigualB : out  STD_LOGIC;
             AmenorB : out  STD_LOGIC);
end component;

component contador is
    generic (n: integer);
    Port ( en : in  STD_LOGIC;
        direccion: in std_logic;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           cuenta : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component demux is
generic (c: integer;
        n: integer);
Port (entrada : in  STD_LOGIC_VECTOR(n-1 downto 0);
      control : in  STD_LOGIC_VECTOR (c-1 downto 0);
      salida : out  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0));
end component;

component mux_n is
generic (n: integer;
         c: integer);
    Port ( datos : in  STD_LOGIC_VECTOR (((2**c)*n)-1 downto 0);
           control : in  STD_LOGIC_VECTOR (c-1 downto 0);
           salida : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component registro_desp_derecha is
generic (n:integer;
        carga_inicial: integer;
         desp:integer);
    Port ( clk : in  STD_LOGIC;
          reset: in std_logic;
           Q : out  bit_VECTOR (n-1 downto 0));
end component;

component registro_desp_izqda is
generic (n:integer;
        carga_inicial: integer;
         desp:integer);
    Port ( clk : in  STD_LOGIC;
          reset: in std_logic;
           Q : out  bit_VECTOR (n-1 downto 0));
end component;

component registro_rot_derecha is
generic (n:integer;
        carga_inicial: integer;
         desp:integer);
    Port ( clk : in  STD_LOGIC;
          reset: in std_logic;
           Q : out  bit_VECTOR (n-1 downto 0));
end component;

component registro_rot_izqda is
generic (n:integer;
        carga_inicial: integer;
         desp:integer);
    Port ( clk : in  STD_LOGIC;
          reset: in std_logic;
           Q : out  bit_VECTOR (n-1 downto 0));
end component;

component sum_res is
    generic(n:integer);
    Port ( A : in  STD_LOGIC_VECTOR (n downto 0);
           B : in  STD_LOGIC_VECTOR (n downto 0);
           M : in STD_LOGIC;
           SUMA : out  STD_LOGIC_VECTOR (n downto 0));
end component;

end Entities;

