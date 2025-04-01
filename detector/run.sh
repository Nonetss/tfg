#!/bin/bash

set -e  # Exit on errors
set -x  # Show commands

# Base names
ENTITY=detector
TB=${ENTITY}_tb

# Analysis and simulation with GHDL
# Compile in proper order with correct flags
ghdl -a  -fsynopsys ../contador/contador.vhd
ghdl -a  -fsynopsys ../comparador/comparador.vhd
ghdl -a  -fsynopsys ../controlador/controlador.vhd
ghdl -a  -fsynopsys ${ENTITY}.vhd
ghdl -a  -fsynopsys ${TB}.vhd

# Elaborate and run simulation
ghdl -e  -fsynopsys ${TB}
ghdl -r  -fsynopsys ${TB} --vcd=${ENTITY}.vcd --stop-time=1us

# Synthesis with Yosys (using GHDL plugin)
# Using --std=08 consistently and proper file order
yosys -m ghdl -p "
ghdl  -fsynopsys  \
     ../contador/contador.vhd \
     ../comparador/comparador.vhd \
     ../controlador/controlador.vhd \
     ${ENTITY}.vhd -e ${ENTITY}; 
write_verilog build.v" || {
  echo "❌ Yosys failed"
  exit 1
}


echo "✅ Simulation and synthesis completed successfully."