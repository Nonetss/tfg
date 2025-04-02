# 🔁 Biestable Sincrónico con Reset

Este proyecto implementa un **biestable tipo D sincrónico** con **reset activo en nivel bajo**, compatible con el software **Libra** y cargable en la placa **Alhambra II** usando **Apio**.

## 🧠 ¿Qué es un biestable sincrónico?

Un **biestable tipo D** (o flip-flop D) es un circuito secuencial que:

- **Almacena un bit** de información.
- Copia el valor de la entrada `D` en la salida `Q`, **solo durante el flanco del reloj**.

En esta versión:

- El biestable **actualiza su salida `Q` en el flanco de bajada** del reloj (`falling_edge(clk)`).
- Tiene una señal de **reset activo en bajo (`reset = '0'`)** que pone `Q` a `'0'` durante ese flanco.

## ⚙️ Señales del componente

| Señal   | Dirección | Descripción                            |
| ------- | --------- | -------------------------------------- |
| `D`     | Entrada   | Valor a guardar en `Q`                 |
| `clk`   | Entrada   | Reloj (flanco de bajada)               |
| `reset` | Entrada   | Reset activo en nivel bajo (`0`)       |
| `Q`     | Salida    | Valor almacenado (reflejado en un LED) |

## 💡 Comportamiento

- Si `reset = '0'` en un flanco de bajada del reloj, `Q` se pone a `'0'`.
- Si `reset = '1'` y llega un flanco de bajada del reloj, entonces `Q <= D`.
- Entre flancos, `Q` permanece estable.

## 🚀 Cargarlo en la Alhambra II

Sigue estos pasos para compilar y cargar el diseño en la FPGA con Apio:

```sh
./run.sh
apio verify
apio build
apio upload
```
