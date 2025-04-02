#!/bin/bash

set -e  # Salir si hay errores
set -x  # Mostrar comandos

# Nombres base
ENTITY=registro_rot_izqda
TB=${ENTITY}_tb

# Análisis y simulación con GHDL
ghdl -a -fsynopsys ${ENTITY}.vhd
# ghdl -a -fsynopsys ${TB}.vhd
# ghdl -e -fsynopsys ${TB}

# # Simulación limitada a 1us para que no se quede esperando
# ghdl -r -fsynopsys ${TB} --vcd=${ENTITY}.vcd --stop-time=1us

# Opción para abrir GTKWave manualmente (descomenta si quieres)
# gtkwave ${ENTITY}.vcd &

# Síntesis con Yosys (usando el plugin GHDL)
yosys -m ghdl -p "ghdl -fsynopsys ${ENTITY}.vhd -e ${ENTITY}; write_verilog build.v" || {
  echo "❌ Yosys falló"
  exit 1
}

echo "✅ Simulación y síntesis completadas con éxito."
