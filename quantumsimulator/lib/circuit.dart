import 'dart:math';

import 'package:quantumsimulator/quantumsimulator.dart';

/// Datastructure containing all needed Information to simulate a Circuit
/// asserts that number of QBits is between 1 and 4
/// [qBitCount] number of QBits required in the Circuit, calculated by size of initial vector
/// [steps] list of Gates and measurements in the Circuit
/// [initial] Vector of Complex number, representing the Register State before the first step
class Circuit {
  late int qBitCount;
  final List<Step> steps;
  final Vector initial;
  Circuit({required this.initial, required this.steps}) {
    qBitCount = (log(initial.size) / log(2)).round();
    assert(pow(2, qBitCount) == initial.size);
    assert(qBitCount < 5);
    assert(qBitCount > 0);
  }

  /// getter that calculates the unitary Matrix of the circuit
  /// returns null if circuit contains Measurements
  /// be carefull, computation is heavy and may freeze thread
  Matrix? get matrix {
    if (steps.any((element) => element is MeasureStep)) return null;
    return (steps as List<GateStep>).fold<Matrix>(
      Matrix.id(qBitCount),
      (previousValue, element) {
        return element.matrix * previousValue;
      },
    );
  }
}
