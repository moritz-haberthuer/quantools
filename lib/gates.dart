

import 'mathematics.dart';

abstract class Gate {
  List<int> getQbits();
  Matrix getUnitary();
}


class X extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filledByReals(2, 2, [[0,1], [1,0]]);

  X(this.qbit) ;

  @override
  List<int> getQbits() {
    return [qbit];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class H extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filledByReals(2, 2, [[0.7071, 0.7071], [0.7071, -0.7071]]);

  H(this.qbit) ;

  @override
  List<int> getQbits() {
    return [qbit];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class CX extends Gate{
  int qbit1;
  int qbit2;
  static Matrix unitary = Matrix.filledByReals(4, 4, [[1,0,0,0], [0,0,0,1], [0,0,1,0], [0,1,0,0]]);


  CX(this.qbit1, this.qbit2) ;

  @override
  List<int> getQbits() {
    return [qbit1, qbit2];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}