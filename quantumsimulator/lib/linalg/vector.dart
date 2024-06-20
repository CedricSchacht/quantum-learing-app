import 'package:quantumsimulator/quantumsimulator.dart';

/// Representation of a Vector of Complex Doubles
class Vector {
  /// [elements] value of the vector
  List<ComplexDouble> elements;

  Vector(this.elements);

  /// number of elements
  int get size => elements.length;

  /// Calculates the kronecker product of [this] and [other] Vector
  /// both this and other are unaffected
  /// retruns new Vector
  Vector kron(Vector other) {
    List<ComplexDouble> result = [];
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < other.size; j++) {
        result.add(elements[i] * other.elements[j]);
      }
    }
    return Vector(result);
  }

  /// Returns a new Vector with every element increased by [scalar]
  /// this is unaffected
  Vector addScalar(ComplexDouble scalar) {
    return Vector(elements.map((e) => e + scalar).toList());
  }

  /// Returns a new Vector with every element decreased by [scalar]
  /// this is unaffected
  Vector subtractScalar(ComplexDouble scalar) {
    return Vector(elements.map((e) => e - scalar).toList());
  }

  /// Returns a new Vector with every element multiplied by [scalar]
  /// this is unaffected
  Vector timesScalar(ComplexDouble scalar) {
    return Vector(elements.map((e) => e * scalar).toList());
  }

  /// Returns a new Vector with every element devided by [scalar]
  /// this is unaffected
  /// asserts scalar not (near) zero
  Vector devScalar(ComplexDouble scalar) {
    return Vector(elements.map((e) => e / scalar).toList());
  }

  /// returns String representation of Vector
  @override
  String toString() {
    return "Vector(elements: $elements)";
  }

  /// returns true if other is an Vector and all its elements are the same as this ones
  @override
  bool operator ==(dynamic other) {
    if (other == null) return false;
    if (other is! Vector) return false;
    for (var i = 0; i < elements.length; i++) {
      if (elements[i] != other.elements[i]) return false;
    }
    return true;
  }

  /// returns hashCode calculated by toString
  @override
  int get hashCode => toString().hashCode;
}
