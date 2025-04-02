# 🔁 Biestable Asincrónico con Reset

Este proyecto implementa un **biestable tipo D asincrónico** con **reset activo en alto**, diseñado para funcionar con el software **Libra** y cargarse en una **placa FPGA como la Alhambra II** utilizando **Apio**.

## 🧠 ¿Qué es un biestable asincrónico?

Un **biestable tipo D** (o flip-flop D) es un circuito secuencial que:

- **Almacena un bit de información.**
- Actualiza su salida `Q` con el valor de la entrada `D`, **pero solo en el flanco de subida del reloj**.

En este caso, el biestable incluye un **reset asincrónico**, lo que significa que:

- Si `reset = '1'`, la salida `Q` se pone a `'0'` **de forma inmediata**, sin esperar al reloj.

## ⚙️ Señales del componente

| Señal   | Dirección | Descripción                                         |
| ------- | --------- | --------------------------------------------------- |
| `D`     | Entrada   | Valor a guardar en `Q`                              |
| `clk`   | Entrada   | Reloj. `Q` se actualiza con `D` en flanco de subida |
| `reset` | Entrada   | Reset asincrónico. Si es `'1'`, pone `Q` a `'0'`    |
| `Q`     | Salida    | Valor almacenado (por ejemplo, conectado a un LED)  |

## 💡 Comportamiento

- Si `reset = '1'` → `Q` se pone a `'0'` de inmediato (sin reloj).
- Si `reset = '0'` → `Q` toma el valor de `D` en el próximo flanco de subida del reloj.
- En cualquier otro momento, `Q` se mantiene estable.

## 🚀 Cómo cargarlo en la Alhambra II

Sigue estos pasos desde la terminal para compilar y cargar el diseño en la placa:

```sh
./run.sh
apio verify
apio build
apio upload
```
