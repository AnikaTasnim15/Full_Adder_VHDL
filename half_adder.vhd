library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port ( p : in  STD_LOGIC;
           q : in  STD_LOGIC;
           s : out STD_LOGIC;
           c : out STD_LOGIC);
end half_adder;

architecture gate_level of half_adder is
begin
    s <= p xor q;
    c <= p and q;
end gate_level;
