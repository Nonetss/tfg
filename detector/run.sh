ghdl -a -fsynopsys main.vhdl
yosys -m ghdl -p "ghdl main.vhdl -e main; write_verilog build.v"
