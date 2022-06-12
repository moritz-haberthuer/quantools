

import 'mathematics.dart';

abstract class Gate {
  List<int> getQbits();
  Matrix getUnitary();
}


class X extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filledByReals(2, 2, [[0.0,1.0,], [1.0,0.0,], ]);

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

class Y extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filled(2, 2, [[Complex(0.0, 0.0), Complex(0.0, 1.0), ], [Complex(0.0, -1.0), Complex(0.0, 0.0), ], ]);

  Y(this.qbit) ;

  @override
  List<int> getQbits() {
    return [qbit];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class Z extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filledByReals(2, 2, [[1.0,0.0,], [0.0,-1.0,], ]);

  Z(this.qbit) ;

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
  static Matrix unitary = Matrix.filledByReals(2, 2, [[0.7071067811865475,0.7071067811865475,], [0.7071067811865475,-0.7071067811865475,], ]);

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

class I extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filledByReals(2, 2, [[1.0,0.0,], [0.0,1.0,], ]);

  I(this.qbit) ;

  @override
  List<int> getQbits() {
    return [qbit];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class T extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filled(2, 2, [[Complex(1.0, 0.0), Complex(0.0, 0.0), ], [Complex(0.0, 0.0), Complex(0.7071067811865475, 0.7071067811865475), ], ]);

  T(this.qbit) ;

  @override
  List<int> getQbits() {
    return [qbit];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class Tdg extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filled(2, 2, [[Complex(1.0, 0.0), Complex(0.0, 0.0), ], [Complex(0.0, 0.0), Complex(0.7071067811865475, -0.7071067811865475), ], ]);

  Tdg(this.qbit) ;

  @override
  List<int> getQbits() {
    return [qbit];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class S extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filled(2, 2, [[Complex(1.0, 0.0), Complex(0.0, 0.0), ], [Complex(0.0, 0.0), Complex(0.0, 1.0), ], ]);

  S(this.qbit) ;

  @override
  List<int> getQbits() {
    return [qbit];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class Sdg extends Gate{
  int qbit;
  static Matrix unitary = Matrix.filled(2, 2, [[Complex(1.0, 0.0), Complex(0.0, 0.0), ], [Complex(0.0, 0.0), Complex(0.0, -1.0), ], ]);

  Sdg(this.qbit) ;

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
  static Matrix unitary = Matrix.filledByReals(4, 4, [[1.0,0.0,0.0,0.0,], [0.0,0.0,0.0,1.0,], [0.0,0.0,1.0,0.0,], [0.0,1.0,0.0,0.0,], ]);

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

class CY extends Gate{
  int qbit1;
  int qbit2;
  static Matrix unitary = Matrix.filled(4, 4, [[Complex(1.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0), ], [Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 1.0), ], [Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(1.0, 0.0), Complex(0.0, 0.0), ], [Complex(0.0, 0.0), Complex(0.0, -1.0), Complex(0.0, 0.0), Complex(0.0, 0.0), ], ]);
  CY(this.qbit1, this.qbit2) ;

  @override
  List<int> getQbits() {
    return [qbit1, qbit2];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class CZ extends Gate{
  int qbit1;
  int qbit2;
  static Matrix unitary = Matrix.filledByReals(4, 4, [[1.0,0.0,0.0,0.0,], [0.0,1.0,0.0,0.0,], [0.0,0.0,1.0,0.0,], [0.0,0.0,0.0,-1.0,], ]);

  CZ(this.qbit1, this.qbit2) ;

  @override
  List<int> getQbits() {
    return [qbit1, qbit2];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class CH extends Gate{
  int qbit1;
  int qbit2;
  static Matrix unitary = Matrix.filledByReals(4, 4, [[1.0,0.0,0.0,0.0,], [0.0,0.7071067811865475,0.0,0.7071067811865475,], [0.0,0.0,1.0,0.0,], [0.0,0.7071067811865475,0.0,-0.7071067811865475,], ]);

  CH(this.qbit1, this.qbit2) ;

  @override
  List<int> getQbits() {
    return [qbit1, qbit2];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class Swap extends Gate{
  int qbit1;
  int qbit2;
  static Matrix unitary = Matrix.filledByReals(4, 4, [[1.0,0.0,0.0,0.0,], [0.0,0.0,1.0,0.0,], [0.0,1.0,0.0,0.0,], [0.0,0.0,0.0,1.0,], ]);

  Swap(this.qbit1, this.qbit2) ;

  @override
  List<int> getQbits() {
    return [qbit1, qbit2];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

class Toffoli extends Gate{
  int qbit1;
  int qbit2;
  int qbit3;

  static Matrix unitary = Matrix.filledByReals(8, 8, [[1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,], [0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,], [0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,], [0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,], [0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,], [0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,], [0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,], [0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,], ]);
  Toffoli(this.qbit1, this.qbit2, this.qbit3) ;

  @override
  List<int> getQbits() {
    return [qbit1, qbit2, qbit3];
  }

  @override
  Matrix getUnitary() {
    return unitary;
  }
}

