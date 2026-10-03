# 1-Bit Full Adder (Structural VHDL)

A 1-bit full adder built from two half adders and an OR gate.

```
HA1: s1 = x xor y          c1 = x and y
HA2: sum_o = s1 xor cin_i  c2 = s1 and cin_i
cout_o = c1 or c2
```

## Files
- `src/half_adder.vhd` : half adder entity
- `src/fa_struct.vhd` : structural full adder (two half adders + OR)
- `sim/tb_fa_struct.vhd` : self-checking testbench (8 vectors, 20 ns each)
- `sim/wave.vcd`, `sim/sim_log.txt` : simulation output
- `rtl/` : RTL schematics generated from the VHDL (SVG and Yosys JSON)
- `figures/` : schematic and waveform images used in the report

## Simulate (GHDL)
```
ghdl -a --std=08 src/half_adder.vhd src/fa_struct.vhd sim/tb_fa_struct.vhd
ghdl --elab-run --std=08 tb_fa_struct --vcd=wave.vcd --stop-time=200ns
```
Expected console output: `All 8 vectors checked` with no assertion errors.
