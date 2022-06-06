import 'dart:math';

import 'gates.dart';
import 'mathematics.dart';


class QuantumCircuit {
  int qbits;

  List<Gate> gates = [];



  QuantumCircuit(this.qbits) {

  }



  /*
  applies a X-gate
   */
  void x(int qbit) {
    gates.add(X(qbit));
  }

  /*
  applies a H-gate
   */
  void h(int qbit) {
    gates.add(H(qbit));
  }

  /*
  applies a h-gate
   */
  void cx(int qbit1, int qbit2) {
    gates.add(CX(qbit1, qbit2));
  }
}