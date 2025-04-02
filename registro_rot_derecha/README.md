# Resumen de los Fallos Encontrados y sus Soluciones

A lo largo de nuestros ejercicios con los registros de desplazamiento y rotación, hemos identificado varios tipos de errores recurrentes:

## 1. Problemas con Paquetes/Packages

**Fallo**: Uso de paquetes no estándar o incompatibles
- `STD_LOGIC_ARITH`
- `STD_LOGIC_UNSIGNED`
- `numeric_bit`

**Solución**: 
```vhdl
-- Usar solo estos paquetes estándar
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
```

**Razón**: Los paquetes no estándar pueden causar incompatibilidades entre herramientas de simulación y síntesis.

## 2. Problemas con Tipos de Datos

**Fallo**: Uso de `bit_vector` en lugar de `STD_LOGIC_VECTOR`

**Solución**:
```vhdl
-- Cambiar todas las declaraciones
signal datos: STD_LOGIC_VECTOR(n-1 downto 0);
Port (Q : out STD_LOGIC_VECTOR(n-1 downto 0));
```

**Razón**: `STD_LOGIC_VECTOR` es el estándar industrial y soporta más estados ('U', 'X', 'Z' además de '0' y '1').

## 3. Problemas con Operadores de Desplazamiento

**Fallo**: Uso de operadores `srl`, `sll`, `ror` que no son universalmente soportados

**Solución**: Implementación manual con concatenación
```vhdl
-- Para desplazamiento derecha
datos <= (desp-1 downto 0 => '0') & datos(n-1 downto desp);

-- Para rotación derecha
datos <= datos(desp-1 downto 0) & datos(n-1 downto desp);
```

**Razón**: Algunas herramientas de síntesis no soportan estos operadores.

## 4. Problemas en Testbenches

**Fallo principal**: Instanciación incorrecta del componente bajo prueba

**Ejemplo de error**:
```vhdl
uut: registro_rot_derecha_tb -- ¡Incorrecto! Debe ser el nombre del componente
```

**Solución correcta**:
```vhdl
uut: registro_rot_derecha -- Nombre del componente, no del testbench
```

**Otros fallos comunes en testbenches**:
- Falta de inicialización de señales
- Tiempos de simulación demasiado cortos
- Tipos de datos inconsistentes con la unidad bajo prueba

## 5. Problemas de Configuración (Binding)

**Fallo**: Componentes declarados pero no implementados correctamente

**Solución**: Dos enfoques:
1. **Directo**: Instanciación directa de entidades
```vhdl
uut: entity work.registro_rot_derecha
```

2. **Configuración explícita**:
```vhdl
for all: componente1 use entity work.controlador(Behavioral);
```

## 6. Problemas de Organización de Proyecto

**Fallos comunes**:
- Orden de compilación incorrecto
- Archivos en rutas incorrectas
- Dependencias no resueltas

**Solución**: Estructura recomendada:
```
proyecto/
├── src/
│   ├── entidades.vhd
│   ├── contador.vhd
│   ├── comparador.vhd
│   └── detector.vhd
├── test/
│   └── detector_tb.vhd
└── scripts/
    └── run.sh
```

## Conclusión

Los principales tipos de fallos que hemos encontrado son:

1. Uso de construcciones no estándar
2. Inconsistencias en tipos de datos
3. Operadores no sintetizables
4. Errores en la jerarquía de diseño (testbenches)
5. Problemas de configuración de componentes
6. Organización inadecuada del proyecto

La solución sistemática ha sido:
1. Adoptar paquetes y tipos estándar
2. Implementar manualmente operaciones complejas
3. Verificar consistencia entre componentes y testbenches
4. Establecer una estructura de proyecto clara
5. Usar herramientas modernas (VHDL-2008) con flags adecuados (`--std=08`)

Estos principios te ayudarán a evitar estos errores comunes en tus futuros diseños VHDL.