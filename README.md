
Quantools is a quantum computation simulation library, which allows you to draw simple quantum circuits and count the outputs.

## Features

Define simple quantum circuits, by using the following Gates: X, Y, Z, H, I, T, S, Tdg, Sdg, CX, CY, CZ, CH, Swap
Run a simulation and count the outputs


## Usage

Define cuantum circuits
```dart
var qc = QuantumCircuit(3);
qc.x(0);
qc.h(1);
qc.cx(1, 2);
qc.swap(0, 2);
```

Run simulation:
```dart
  Simulator simulator = Simulator.transpile(qc);
  var result = simulator.run(shots: 1000);
```
