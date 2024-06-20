import 'dart:math';

/// Representation of Complex Numbers
/// double prezision floating point nubmers for real and imaginary part
class ComplexDouble {
  late final double real;
  late final double imag;

  ///Constructor
  ///[real] defaults to 0.0
  ///[imag] defaults to 0.0i
  ComplexDouble({this.real = 0, this.imag = 0});

  ///Constructor for 1.0+0.0i
  ComplexDouble.one() {
    real = 1;
    imag = 0;
  }

  ///Constructor for 0.0+1.0i
  ComplexDouble.i() {
    real = 0;
    imag = 1;
  }

  /// returns this + other
  /// both this and other are not changed
  ComplexDouble operator +(ComplexDouble other) {
    return ComplexDouble(
      real: real + other.real,
      imag: imag + other.imag,
    );
  }

  /// returns this - other
  /// both this and other are not changed
  ComplexDouble operator -(ComplexDouble other) {
    return ComplexDouble(
      real: real - other.real,
      imag: imag - other.imag,
    );
  }

  /// returns this * other
  /// both this and other are not changed
  ComplexDouble operator *(ComplexDouble other) {
    return ComplexDouble(
      real: real * other.real - imag * other.imag,
      imag: imag * other.real + real * other.imag,
    );
  }

  /// returns this / other
  /// asserts that other is not (near) zero
  /// both this and other are not changed
  ComplexDouble operator /(ComplexDouble other) {
    const epsilon = 1e-5;
    assert(other.r > epsilon);
    if (other.imag < epsilon) {
      return ComplexDouble(
        real: real / other.real,
        imag: imag / other.real,
      );
    }
    var denominator = imag * imag + other.imag * other.imag;
    return ComplexDouble(
      real: (real * other.real + imag * other.imag) / denominator,
      imag: (imag * other.real - real * other.imag) / denominator,
    );
  }

  /// returns absolut value of this
  double abs() => sqrt(real * real + imag * imag);

  /// returns phase angle of this
  double get phi => atan2(imag, real);

  /// returns length of this
  double get r => abs();

  /// returns String representation of Complex numbers
  /// i.e. 3.2 + 0,7752i
  @override
  String toString() {
    return "$real + $imag i";
  }

  /// implements equals using toString method
  @override
  bool operator ==(dynamic other) {
    return toString() == other.toString();
  }

  /// implements hashCode using toString method
  @override
  int get hashCode => toString().hashCode;
}
