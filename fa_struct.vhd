library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fa_struct is
    Port ( x      : in  STD_LOGIC;
           y      : in  STD_LOGIC;
           cin_i  : in  STD_LOGIC;
           sum_o  : out STD_LOGIC;
           cout_o : out STD_LOGIC);
end fa_struct;

architecture structural of fa_struct is
    component half_adder
        Port ( p : in  STD_LOGIC;
               q : in  STD_LOGIC;
               s : out STD_LOGIC;
               c : out STD_LOGIC);
    end component;

    signal s1, c1, c2 : STD_LOGIC;
begin
    HA1 : half_adder port map (p => x,  q => y,     s => s1,    c => c1);
    HA2 : half_adder port map (p => s1, q => cin_i, s => sum_o, c => c2);

    cout_o <= c1 or c2;
end structural;
