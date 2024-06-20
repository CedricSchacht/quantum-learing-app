import 'package:quantumsimulator/quantumsimulator.dart';

/// Representation of a Matrix of Complex Doubles
class Matrix {
  /// [elements] value of the Matrix
  late final List<List<ComplexDouble>> elements;

  /// Constructor
  /// asserts that elements are not empty
  /// asserts that in every row are the same number of Complex Doubles
  Matrix(this.elements) {
    assert(elements.isNotEmpty);
    assert(elements.every((element) => elements[0].length == element.length));
  }

  /// Constructor
  /// instanziates a Matrix with ones in the first diagonal and zero in all other cells
  Matrix.id(int size) {
    elements = List.generate(
      size,
      (row) => List.generate(
        size,
        (col) => row == col ? ComplexDouble(real: 1) : ComplexDouble(),
      ),
    );
  }

  /// Constructor
  /// maps the doubles to Complex Doubles
  Matrix.ofDouble(List<List<double>> doubles) {
    elements = doubles
        .map((row) => row.map((e) => ComplexDouble(real: e)).toList())
        .toList();
  }

  /// returns the number of elements in a row
  int get numRows => elements.length;

  /// returns the number of elements in a column
  int get numColumns => elements[0].length;

  /// returns the element at [row], [column]
  ComplexDouble getElement(int row, int column) => elements[row][column];

  /// returns the Product of to matrizies
  /// both this and other are unaffected
  /// asserts that this.numColumns is equal to other.numRows
  Matrix operator *(Matrix other) {
    assert(numColumns == other.numRows);
    var result = List.generate(
      numRows,
      (a) => List.filled(other.numColumns, ComplexDouble()),
    );
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < other.numColumns; j++) {
        for (int k = 0; k < numColumns; k++) {
          result[i][j] += elements[i][k] * other.elements[k][j];
        }
      }
    }
    return Matrix(result);
  }

  /// Calculates the Product of Matrix times [other] Vector
  /// both this and other are unaffected
  /// retruns new Vector
  /// asserts that this.numColumns is equal to vector size
  Vector times(Vector other) {
    assert(numColumns == other.size);
    var result = List.filled(numRows, ComplexDouble());
    for (int i = 0; i < numRows; i++) {
      for (int k = 0; k < numColumns; k++) {
        result[i] += elements[i][k] * other.elements[k];
      }
    }
    return Vector(result);
  }

  /// Calculates the kronecker product of [this] and [other] Matrix
  /// both this and other are unaffected
  /// retruns new Matrix
  Matrix kron(Matrix other) {
    List<List<ComplexDouble>> result = [];
    for (int i = 0; i < numRows; i++) {
      for (int m = 0; m < other.numRows; m++) {
        List<ComplexDouble> newRow = [];
        for (int j = 0; j < numColumns; j++) {
          for (int n = 0; n < other.numColumns; n++) {
            newRow.add(elements[i][j] * other.elements[m][n]);
          }
        }
        result.add(newRow);
      }
    }
    return Matrix(result);
  }

  /// Returns a new Matrix with every element increased by [scalar]
  /// this is unaffected
  Matrix addScalar(ComplexDouble scalar) {
    return Matrix(
      elements.map((row) => row.map((e) => e + scalar).toList()).toList(),
    );
  }

  /// Returns a new Matrix with every element decreased by [scalar]
  /// this is unaffected
  Matrix subtractScalar(ComplexDouble scalar) {
    return Matrix(
      elements.map((row) => row.map((e) => e - scalar).toList()).toList(),
    );
  }

  /// Returns a new Matrix with every element multiplied by [scalar]
  /// this is unaffected
  Matrix timesScalar(ComplexDouble scalar) {
    return Matrix(
      elements.map((row) => row.map((e) => e * scalar).toList()).toList(),
    );
  }

  /// Returns a new Matrix with every element devided by [scalar]
  /// this is unaffected
  /// asserts scalar not (near) zero
  Matrix devScalar(ComplexDouble scalar) {
    return Matrix(
      elements.map((row) => row.map((e) => e / scalar).toList()).toList(),
    );
  }

  /// retruns true if
  /// pther is a Matrix
  /// matrix has the same dimensions
  /// every cell es equal
  @override
  bool operator ==(dynamic other) {
    if (other == null) return false;
    if (other is! Matrix) return false;
    for (var i = 0; i < elements.length; i++) {
      for (var j = 0; j < elements[i].length; j++) {
        if (elements[i][j] != other.elements[i][j]) return false;
      }
    }
    return true;
  }

  /// returns String representation of the Matrix
  @override
  String toString() {
    return "Matrix(elements: \n${elements.join("\n")})";
  }

  /// returns the hashCode from String representation
  @override
  int get hashCode => toString().hashCode;
}
