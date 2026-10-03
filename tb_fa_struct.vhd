library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_fa_struct is
end tb_fa_struct;

architecture sim of tb_fa_struct is
    component fa_struct
        Port ( x      : in  STD_LOGIC;
               y      : in  STD_LOGIC;
               cin_i  : in  STD_LOGIC;
               sum_o  : out STD_LOGIC;
               cout_o : out STD_LOGIC);
    end component;

    signal x, y, cin_i : STD_LOGIC := '0';
    signal sum_o, cout_o : STD_LOGIC;
    constant STEP : time := 20 ns;
begin
    dut : fa_struct
        port map (x => x, y => y, cin_i => cin_i,
                  sum_o => sum_o, cout_o => cout_o);

    drive : process
        variable vec      : unsigned(2 downto 0);
        variable ones     : integer;
        variable exp_sum  : STD_LOGIC;
        variable exp_cout : STD_LOGIC;
    begin
        for n in 0 to 7 loop
            vec := to_unsigned(n, 3);
            x     <= vec(2);
            y     <= vec(1);
            cin_i <= vec(0);
            wait for STEP;

            ones := (n / 4) + ((n / 2) mod 2) + (n mod 2);
            if (ones mod 2) = 1 then exp_sum := '1'; else exp_sum := '0'; end if;
            if ones >= 2 then exp_cout := '1'; else exp_cout := '0'; end if;

            assert sum_o = exp_sum
                report "sum_o mismatch at vector " & integer'image(n)
                severity error;
            assert cout_o = exp_cout
                report "cout_o mismatch at vector " & integer'image(n)
                severity error;
        end loop;
        report "All 8 vectors checked" severity note;
        wait;
    end process;
end sim;
