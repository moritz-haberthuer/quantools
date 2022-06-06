





import 'package:quantools/quantum_circuit.dart';
import 'package:quantools/simulator.dart';

void main() {
  QuantumCircuit qc = QuantumCircuit(2);

  qc.h(0);


  Simulator simulator = Simulator.transpile(qc);

  simulator.run(shots: 1000);
}