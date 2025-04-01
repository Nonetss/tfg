# 🔁 Biestable JK Asincrónico con Reset

Este proyecto implementa un **biestable tipo JK asincrónico** con **reset activo en alto**, pensado para funcionar con el software **Libra** y cargarse en una FPGA usando **Apio**.

## 🧠 ¿Qué es un biestable JK?

Un **biestable tipo JK** es una evolución del biestable tipo D, capaz de realizar múltiples operaciones según el valor de sus dos entradas (`J` y `K`), evaluadas en cada flanco de reloj.

Este diseño además incorpora un **reset asincrónico**, que permite borrar el estado **de forma inmediata**, sin necesidad de esperar al reloj.

## ⚙️ Comportamiento

- El biestable evalúa sus entradas en el **flanco de subida del reloj** (`rising_edge(clk)`).
- La salida `Q` se comporta según la siguiente tabla de verdad:

| J   | K   | Resultado           |
| --- | --- | ------------------- |
| 0   | 0   | Mantiene estado     |
| 0   | 1   | `Q` se pone en 0    |
| 1   | 0   | `Q` se pone en 1    |
| 1   | 1   | `Q` cambia (toggle) |

- Si `reset = '1'`, la salida `Q` se pone en `'0'` **inmediatamente**, sin necesidad de esperar al reloj (asincronía).

## 🔌 Señales del componente

| Señal   | Dirección | Descripción                                     |
| ------- | --------- | ----------------------------------------------- |
| `J`     | Entrada   | Entrada J                                       |
| `K`     | Entrada   | Entrada K                                       |
| `clk`   | Entrada   | Reloj. Se evalúan `J` y `K` en flanco de subida |
| `reset` | Entrada   | Reset asincrónico. Activo en alto (`'1'`)       |
| `Q`     | Salida    | Estado actual del biestable                     |

## 🚀 Cómo cargarlo en la Alhambra II

Para cargar este diseño en la FPGA utilizando Apio, ejecuta los siguientes comandos:

```sh
./run.sh
apio verify
apio build
apio upload

```
