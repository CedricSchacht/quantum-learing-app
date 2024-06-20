import 'package:flutter_test/flutter_test.dart';
import 'package:quantumsimulator/quantumsimulator.dart';

void main() {
  group("Matrix", () {
    test("Test Matrix equal", () {
      Matrix a = Matrix.ofDouble([
        [1, 2, 3, 4],
        [2, 3, 4, 5],
        [3, 4, 5, 6],
        [4, 5, 6, 7],
      ]);
      Matrix b = Matrix.ofDouble([
        [1, 2, 3, 4],
        [2, 3, 4, 5],
        [3, 4, 5, 6],
        [4, 5, 6, 7],
      ]);
      expect(a, b);
    });

    test("Test Matrix id", () {
      Matrix a = Matrix.id(4);
      Matrix b = Matrix.ofDouble([
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1],
      ]);
      expect(a, b);
    });

    test("Test Matrix dimensions", () {
      Matrix a = Matrix.ofDouble([
        [1, 0, 0, 0],
        [1, 0, 0, 0],
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1],
      ]);
      expect(a.numRows, 6);
      expect(a.numColumns, 4);
    });

    test("Test Matrix get element", () {
      Matrix a = Matrix.ofDouble([
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1],
      ]);
      expect(a.getElement(0, 0), ComplexDouble(real: 1));
      expect(a.getElement(3, 2), ComplexDouble());
    });

    test("Test Matrix times Matrix", () {
      Matrix a = Matrix.ofDouble([
        [1, 0],
        [1, 0],
      ]);
      Matrix b = Matrix.ofDouble([
        [0, 1],
        [1, 0],
      ]);
      expect(
        a * b,
        Matrix.ofDouble([
          [0, 1],
          [0, 1],
        ]),
      );
      expect(
        b,
        Matrix.ofDouble([
          [0, 1],
          [1, 0],
        ]),
      );
      expect(
        a,
        Matrix.ofDouble([
          [1, 0],
          [1, 0],
        ]),
      );
    });

    test("Test Matrix times Matrix 2", () {
      Matrix a = Matrix.ofDouble([
        [1, 0, 0, 0],
        [0, 0, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 1],
      ]);
      Matrix b = Matrix.ofDouble([
        [0, 1, 0, 0],
        [1, 0, 0, 0],
        [0, 0, 0, 1],
        [0, 0, 1, 0],
      ]);
      expect(
        a * b,
        Matrix.ofDouble([
          [0, 1, 0, 0],
          [0, 0, 0, 1],
          [1, 0, 0, 0],
          [0, 0, 1, 0],
        ]),
      );
      expect(
        b,
        Matrix.ofDouble([
          [0, 1, 0, 0],
          [1, 0, 0, 0],
          [0, 0, 0, 1],
          [0, 0, 1, 0],
        ]),
      );
      expect(
        a,
        Matrix.ofDouble([
          [1, 0, 0, 0],
          [0, 0, 1, 0],
          [0, 1, 0, 0],
          [0, 0, 0, 1],
        ]),
      );
    });

    test("Test Matrix times Vector", () {
      Vector a = Vector([
        ComplexDouble(real: 0),
        ComplexDouble(real: 2),
        ComplexDouble(real: 3),
        ComplexDouble(real: 4),
      ]);
      Matrix m = Matrix.ofDouble([
        [0, 0, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 1],
        [1, 0, 0, 0],
      ]);
      expect(
          m.times(a),
          Vector([
            ComplexDouble(real: 3),
            ComplexDouble(real: 2),
            ComplexDouble(real: 4),
            ComplexDouble(real: 0),
          ]));
    });

    test("Test Matrix kron Matrix", () {
      Matrix a = Matrix.ofDouble([
        [1, 0],
        [1, 0],
      ]);
      Matrix b = Matrix.ofDouble([
        [0, 1],
        [1, 0],
      ]);
      expect(
        a.kron(b),
        Matrix.ofDouble([
          [0, 1, 0, 0],
          [1, 0, 0, 0],
          [0, 1, 0, 0],
          [1, 0, 0, 0],
        ]),
      );
      expect(
        b,
        Matrix.ofDouble([
          [0, 1],
          [1, 0],
        ]),
      );
      expect(
        a,
        Matrix.ofDouble([
          [1, 0],
          [1, 0],
        ]),
      );
    });

    test("Test Matrix add Scalar", () {
      Matrix a = Matrix.id(4);
      ComplexDouble scalar = ComplexDouble(real: 4);
      expect(a, Matrix.id(4));
      expect(scalar, ComplexDouble(real: 4));
      expect(
        a.addScalar(scalar),
        Matrix.ofDouble([
          [5, 4, 4, 4],
          [4, 5, 4, 4],
          [4, 4, 5, 4],
          [4, 4, 4, 5],
        ]),
      );
    });
    test("Test Matrix subtract Scalar", () {
      Matrix a = Matrix.id(4);
      ComplexDouble scalar = ComplexDouble(real: 4);
      expect(a, Matrix.id(4));
      expect(scalar, ComplexDouble(real: 4));
      expect(
        a.subtractScalar(scalar),
        Matrix.ofDouble([
          [-3, -4, -4, -4],
          [-4, -3, -4, -4],
          [-4, -4, -3, -4],
          [-4, -4, -4, -3],
        ]),
      );
    });
    test("Test Matrix multiply Scalar", () {
      Matrix a = Matrix.id(4);
      ComplexDouble scalar = ComplexDouble(real: 4);
      expect(a, Matrix.id(4));
      expect(scalar, ComplexDouble(real: 4));
      expect(
        a.timesScalar(scalar),
        Matrix.ofDouble([
          [4, 0, 0, 0],
          [0, 4, 0, 0],
          [0, 0, 4, 0],
          [0, 0, 0, 4],
        ]),
      );
    });
    test("Test Matrix devide Scalar", () {
      Matrix a = Matrix.id(4);
      ComplexDouble scalar = ComplexDouble(real: 4);
      expect(a, Matrix.id(4));
      expect(scalar, ComplexDouble(real: 4));
      expect(
        a.devScalar(scalar),
        Matrix.ofDouble([
          [0.25, 0, 0, 0],
          [0, 0.25, 0, 0],
          [0, 0, 0.25, 0],
          [0, 0, 0, 0.25],
        ]),
      );
    });
  });
}
