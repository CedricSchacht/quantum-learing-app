import 'package:flutter_test/flutter_test.dart';
import 'package:quantumsimulator/quantumsimulator.dart';

void main() {
  group("Vector", () {
    test("Test Vector equal", () {
      Vector a = Vector([
        ComplexDouble(real: 1),
        ComplexDouble(real: 2),
        ComplexDouble(real: 3),
        ComplexDouble(real: 4),
      ]);
      Vector b = Vector([
        ComplexDouble(real: 1),
        ComplexDouble(real: 2),
        ComplexDouble(real: 3),
        ComplexDouble(real: 4),
      ]);
      expect(a, b);
    });

    test("Test Vector size", () {
      Vector a = Vector([
        ComplexDouble(),
        ComplexDouble(),
        ComplexDouble(),
        ComplexDouble(),
      ]);
      expect(a.size, 4);
    });

    test("Test Vector add scalar", () {
      Vector a = Vector([
        ComplexDouble(real: 1),
        ComplexDouble(real: 2),
        ComplexDouble(real: 3),
        ComplexDouble(real: 4),
      ]);
      ComplexDouble scalar = ComplexDouble(real: 2, imag: 3);
      expect(
        a.addScalar(scalar),
        Vector([
          ComplexDouble(real: 3, imag: 3),
          ComplexDouble(real: 4, imag: 3),
          ComplexDouble(real: 5, imag: 3),
          ComplexDouble(real: 6, imag: 3),
        ]),
      );
      expect(
        a,
        Vector([
          ComplexDouble(real: 1),
          ComplexDouble(real: 2),
          ComplexDouble(real: 3),
          ComplexDouble(real: 4),
        ]),
      );
    });

    test("Test Vector subtract scalar", () {
      Vector a = Vector([
        ComplexDouble(real: 1),
        ComplexDouble(real: 2),
        ComplexDouble(real: 3),
        ComplexDouble(real: 4),
      ]);
      ComplexDouble scalar = ComplexDouble(real: 2, imag: 3);
      expect(
        a.subtractScalar(scalar),
        Vector([
          ComplexDouble(real: -1, imag: -3),
          ComplexDouble(real: 0, imag: -3),
          ComplexDouble(real: 1, imag: -3),
          ComplexDouble(real: 2, imag: -3),
        ]),
      );
      expect(
        a,
        Vector([
          ComplexDouble(real: 1),
          ComplexDouble(real: 2),
          ComplexDouble(real: 3),
          ComplexDouble(real: 4),
        ]),
      );
    });

    test("Test Vector times scalar", () {
      Vector a = Vector([
        ComplexDouble(real: 1),
        ComplexDouble(real: 2),
        ComplexDouble(real: 3),
        ComplexDouble(real: 4),
      ]);
      ComplexDouble scalar = ComplexDouble(real: 2, imag: 3);
      expect(
        a.timesScalar(scalar),
        Vector([
          ComplexDouble(real: 2, imag: 3),
          ComplexDouble(real: 4, imag: 6),
          ComplexDouble(real: 6, imag: 9),
          ComplexDouble(real: 8, imag: 12),
        ]),
      );
      expect(
        a,
        Vector([
          ComplexDouble(real: 1),
          ComplexDouble(real: 2),
          ComplexDouble(real: 3),
          ComplexDouble(real: 4),
        ]),
      );
    });

    test("Test Vector devide scalar", () {
      Vector a = Vector([
        ComplexDouble(real: 1),
        ComplexDouble(real: 2),
        ComplexDouble(real: 3),
        ComplexDouble(real: 4),
      ]);
      ComplexDouble scalar = ComplexDouble(real: 2);
      expect(
        a.devScalar(scalar),
        Vector([
          ComplexDouble(real: 0.5),
          ComplexDouble(real: 1),
          ComplexDouble(real: 1.5),
          ComplexDouble(real: 2),
        ]),
      );
      expect(
        a,
        Vector([
          ComplexDouble(real: 1),
          ComplexDouble(real: 2),
          ComplexDouble(real: 3),
          ComplexDouble(real: 4),
        ]),
      );
    });

    test("Test Vector kron", () {
      Vector a = Vector([
        ComplexDouble(real: 1),
        ComplexDouble(real: 2),
        ComplexDouble(real: 3),
        ComplexDouble(real: 4),
      ]);
      Vector b = Vector([
        ComplexDouble(real: 1),
        ComplexDouble(real: 2),
        ComplexDouble(real: 3),
        ComplexDouble(real: 4),
      ]);
      expect(
        a.kron(b),
        Vector([
          ComplexDouble(real: 1),
          ComplexDouble(real: 2),
          ComplexDouble(real: 3),
          ComplexDouble(real: 4),
          ComplexDouble(real: 2),
          ComplexDouble(real: 4),
          ComplexDouble(real: 6),
          ComplexDouble(real: 8),
          ComplexDouble(real: 3),
          ComplexDouble(real: 6),
          ComplexDouble(real: 9),
          ComplexDouble(real: 12),
          ComplexDouble(real: 4),
          ComplexDouble(real: 8),
          ComplexDouble(real: 12),
          ComplexDouble(real: 16),
        ]),
      );
    });
  });
}
