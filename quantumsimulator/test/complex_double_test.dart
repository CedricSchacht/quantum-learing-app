import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:quantumsimulator/quantumsimulator.dart';

void main() {
  group("ComplexDouble", () {
    test('Test Complex equal', () {
      ComplexDouble a = ComplexDouble(real: 1, imag: 1.0000000000000001);
      ComplexDouble b = ComplexDouble(real: 1, imag: 1);
      expect(a, b);
    });

    test('Test Complex zero', () {
      ComplexDouble a = ComplexDouble(real: 0, imag: 0);
      ComplexDouble b = ComplexDouble();
      expect(a, b);
    });

    test('Test Complex adition', () {
      ComplexDouble a = ComplexDouble(real: 1, imag: 1);
      ComplexDouble b = ComplexDouble(real: 1, imag: 1);
      expect(a + b, ComplexDouble(real: 2, imag: 2));
      expect(a, ComplexDouble(real: 1, imag: 1));
      expect(b, ComplexDouble(real: 1, imag: 1));
    });

    test('Test Complex subtraction', () {
      ComplexDouble a = ComplexDouble(real: 1, imag: 1);
      ComplexDouble b = ComplexDouble(real: 1, imag: 1);
      expect(a - b, ComplexDouble(real: 0, imag: 0));
      expect(a, ComplexDouble(real: 1, imag: 1));
      expect(b, ComplexDouble(real: 1, imag: 1));
    });

    test('Test Complex multiplication', () {
      ComplexDouble a = ComplexDouble(real: 2, imag: 3);
      ComplexDouble b = ComplexDouble(real: 4, imag: 5);
      expect(a * b, ComplexDouble(real: -7, imag: 22));
      expect(a, ComplexDouble(real: 2, imag: 3));
      expect(b, ComplexDouble(real: 4, imag: 5));
    });

    test('Test Complex division', () {
      ComplexDouble a = ComplexDouble(real: 2, imag: 3);
      ComplexDouble b = ComplexDouble(real: 4, imag: 5);
      expect(
          a / b,
          ComplexDouble(
            real: 0.6764705882352942,
            imag: 0.058823529411764705,
          ));
      expect(a, ComplexDouble(real: 2, imag: 3));
      expect(b, ComplexDouble(real: 4, imag: 5));
    });

    test('Test Complex division 2', () {
      ComplexDouble a = ComplexDouble(real: 1, imag: 3);
      ComplexDouble b = ComplexDouble(real: 2);
      expect(a / b, ComplexDouble(real: 0.5, imag: 1.5));
      expect(a, ComplexDouble(real: 1, imag: 3));
      expect(b, ComplexDouble(real: 2));
    });

    test('Test Complex polar', () {
      ComplexDouble a = ComplexDouble(real: 1, imag: 1);
      ComplexDouble b = ComplexDouble(real: 1, imag: -1);
      ComplexDouble c = ComplexDouble(real: -1, imag: 1);
      ComplexDouble d = ComplexDouble(real: -1, imag: -1);
      ComplexDouble e = ComplexDouble();
      expect(a.r, sqrt2);
      expect(b.r, sqrt2);
      expect(c.r, sqrt2);
      expect(d.r, sqrt2);
      expect(e.r, 0);
      var deg2rad = pi / 180.0;
      expect(a.phi, 45.0 * deg2rad);
      expect(b.phi, -45.0 * deg2rad);
      expect(c.phi, 135.0 * deg2rad);
      expect(d.phi, -135.0 * deg2rad);
      expect(e.phi, 0);
    });
  });
}
