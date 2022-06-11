



import 'dart:math';

import 'package:quantools/gates.dart';
import 'package:quantools/quantum_circuit.dart';

import 'mathematics.dart';

class Simulator {
  QuantumCircuit qc;

  late int _dim;
  late Matrix unitary;

  Simulator.transpile(this.qc) {
    _dim = pow(2, qc.qbits).toInt();
    unitary = Matrix.identity(_dim, _dim);

    for (Gate gate in qc.gates) {
      Matrix unitaryForGate = _getUnitaryForGate(gate.getQbits(), gate.getUnitary());
      unitary = unitaryForGate.mul(unitary);
    }
  }


  Map<String, int> run({int shots = 1000}) {
    Matrix initialState = Matrix(_dim, 1);
    initialState.set(0,0, Complex(1, 0));
    Matrix finalState = unitary.mul(initialState);

    List<double> CDF = [];
    List<String> labels = [];
    for (int i = 0; i < _dim; i++) {
      double prev = 0;
      if (i > 0) {
        prev = CDF[i - 1];
      }
      Complex probability = finalState.get(i, 0);
      CDF.add(prev + (probability.mul(probability).abs()));
      labels.add(_bintostring(_tobin(i)));
    }

    Map<String, int> counts = {};
    var random = Random();
    loopThroughAllShots: for (int i = 0; i < shots; i++) {
      double a = random.nextDouble();
      for (int i = 0; i < _dim; i++) {
        if (a < CDF[i]) {
          int? prevCount = counts[labels[i]];
          if (prevCount == null) {
            prevCount = 0;
          }
          counts[labels[i]] = prevCount + 1;
          continue loopThroughAllShots;
        }
      }
    }

    return counts;
  }


  String _bintostring(List<bool> bin) {
    String s = "";
    for (int i = bin.length - 1; i >= 0; i--) {
      if (bin[i]) {
        s += "1";
      } else {
        s += "0";
      }
    }
    return s;
  }

  List<bool> _tobin(int dec) {
    List<bool> bin = [];
    for (int i = 0; i < qc.qbits; i++) {
      bin.add(dec & pow(2, i).toInt() != 0);
    }
    return bin;
  }

  int _todec(List<bool> bin) {
    if (bin.length == 0) {
      //todo: implement error handling
      return 0;
    }
    int dec = 0;
    for (int i = 0; i < bin.length; i++) {
      if (bin[i]) dec += pow(2, i).toInt();
    }
    return dec;
  }

  List<bool> _extract(List<int> qbits, List<bool> bin) {
    List<bool> res = [];
    for (int i = 0; i < qbits.length; i++) {
      res.add(bin[qbits[i]]);
    }
    return res;
  }

  Matrix _getUnitaryForGate(List<int> qbits, Matrix gateMatrix) {
    Matrix unitary = Matrix(_dim, _dim);
    loop_i: for (int i = 0; i < _dim; i++) {
      var iBin = _tobin(i);
      loop_j: for (int j = 0; j < _dim; j++) {
        var jBin = _tobin(j);
        for (int a = 0; a < jBin.length; a++) {
          if (!qbits.contains(a) && iBin[a] != jBin[a]) {
            continue loop_j;
          }
        }
        int iSample = _todec(_extract(qbits, iBin));
        int jSample = _todec(_extract(qbits, jBin));
        unitary.set(i, j, gateMatrix.get(iSample, jSample));
      }
    }
    return unitary;
  }
}