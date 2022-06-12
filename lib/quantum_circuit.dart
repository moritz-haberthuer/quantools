import 'dart:math';

import 'gates.dart';
import 'mathematics.dart';


class QuantumCircuit {
  int qbits;

  List<Gate> gates = [];



  QuantumCircuit(this.qbits) {

  }




  void x(int qbit) {
    gates.add(X(qbit));
  }

  void y(int qbit) {
    gates.add(Y(qbit));
  }

  void z(int qbit) {
    gates.add(Z(qbit));
  }

  void h(int qbit) {
    gates.add(H(qbit));
  }

  void i(int qbit) {
    gates.add(I(qbit));
  }

  void t(int qbit) {
    gates.add(T(qbit));
  }

  void tdg(int qbit) {
    gates.add(Tdg(qbit));
  }

  void s(int qbit) {
    gates.add(S(qbit));
  }

  void sdg(int qbit) {
    gates.add(Sdg(qbit));
  }

  void cx(int qbit1, int qbit2) {
    gates.add(CX(qbit1, qbit2));
  }

  void cy(int qbit1, int qbit2) {
    gates.add(CY(qbit1, qbit2));
  }

  void cz(int qbit1, int qbit2) {
    gates.add(CZ(qbit1, qbit2));
  }

  void ch(int qbit1, int qbit2) {
    gates.add(CH(qbit1, qbit2));
  }

  void swap(int qbit1, int qbit2) {
    gates.add(Swap(qbit1, qbit2));
  }

  void toffoli(int qbit1, int qbit2, int qbit3) {
    gates.add(Toffoli(qbit1, qbit2, qbit3));
  }
}