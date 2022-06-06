


import 'dart:math';

class Complex {
  late double real;
  late double imaginary;

  Complex(this.real, this.imaginary);

  Complex.zero() {
    real = 0;
    imaginary = 0;
  }

  Complex add(Complex x) {
    return Complex(real + x.real, imaginary + x.imaginary);
  }

  Complex sub(Complex x) {
    return Complex(real - x.real, imaginary - x.imaginary);
  }

  Complex mul(Complex x) {
    return Complex(real * x.real - imaginary * x.imaginary, real * x.imaginary + imaginary * x.real);
  }

  double abs() {
    return sqrt(real * real + imaginary * imaginary);
  }

  String toString() {
    return real.toString() + " + " + imaginary.toString() + "i";
  }

  String toLatex() {
    if (imaginary == 0) {
      return real.toString();
    }
    return real.toString() + " + " + imaginary.toString() + "i";
  }
}



class Matrix {
  int m, n;
  List<List<Complex>> entries = [[]];


  Matrix(this.m, this.n) {
    for (int i = 0; i < m; i++) {
      entries.add([]);
      for (int j = 0; j < n; j++) {
        entries[i].add(Complex.zero());
      }
    }
  }

  Matrix.identity(this.m, this.n) {
    for (int i = 0; i < m; i++) {
      entries.add([]);
      for (int j = 0; j < n; j++) {
        if (i == j) {
          entries[i].add(Complex(1, 0));
        } else {
          entries[i].add(Complex.zero());
        }
      }
    }
  }

  Matrix.filled(this.m, this.n, this.entries) {
    if (entries.length != m) {
      //todo: implement error handling
    }
    for (int i = 0; i < m; i++) {
      if (entries[i].length != n) {
        //todo: implement error handling
      }
    }
  }

  Matrix.filledByReals(this.m, this.n, List<List<double>> entriesReal) {
    for (int i = 0; i < m; i++) {
      entries.add([]);
      for (int j = 0; j < n; j++) {
        entries[i].add(Complex(entriesReal[i][j], 0));
      }
    }
  }

  void set(int i, int j, Complex value) {
    entries[i][j] = value;
  }

  Complex get(int i, int j) {
    return entries[i][j];
  }

  Matrix add(Matrix x) {
    if (m != x.m || n != x.n) {
      //todo: implement error handling
    }
    Matrix result = Matrix(m, n);
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        result.set(i, j, entries[i][j].add(x.entries[i][j]));
      }
    }
    return result;
  }

  Matrix mul(Matrix x) {
    if (n != x.m) {
      //todo: implement error handling
    }
    Matrix result = Matrix(m, x.n);
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < x.n; j++) {
        Complex sum = Complex.zero();
        for (int a = 0; a < n; a++) {
          sum = sum.add(entries[i][a].mul(x.entries[a][j]));
        }
        result.set(i, j, sum);
      }
    }
    return result;
  }


  String toString() {
    String s = "";
    s += "[";
    for (int i = 0; i < m; i++) {
      s += "(";
      for (int j = 0; j < n; j++) {
        s += entries[i][j].toString();
        s += " | ";
      }
      s += "),   ";
    }
    s += "]";
    return s;
  }

  String toLatex() {
    String s = "";
    s += "\\begin{pmatrix}\n";
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        s += entries[i][j].toLatex();
        if (j != n - 1) s += " & \t";
      }
      if (i != m - 1) s += "\\\\";
      s += "\n";
    }
    s += "\\end{pmatrix}";
    return s;
  }
}