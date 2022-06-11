





import 'package:quantools/quantum_circuit.dart';
import 'package:quantools/simulator.dart';

void main() {
  QuantumCircuit qc = QuantumCircuit(2);

  qc.h(0);


  Simulator simulator = Simulator.transpile(qc);

  var res = simulator.run(shots: 1000);

  for (var key in res.keys) {
    print("${key} => ${res[key]}");
  }
}