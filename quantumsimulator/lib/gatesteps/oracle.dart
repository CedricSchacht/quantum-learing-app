import 'dart:math';

import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/state_transition.dart';

/// Implementation of GateStep for Quantumoracles
/// [transition] is set automaticly
/// [index] of the first input QBit
/// [matrix] is set automaticly
class Oracle extends GateStep {
  @override
  final int index;
  @override
  late final StateTransition transition;
  @override
  late final Matrix matrix;
  final int numInputQBits;
  final bool Function(List<bool>) f;
  Oracle({required this.index, required this.numInputQBits, required this.f}) {
    assert(numInputQBits + index < 4);
    var inputs = List.generate(pow(2, numInputQBits).round(), (index) {
      return index
          .toRadixString(2)
          .padLeft(numInputQBits, '0')
          .split('')
          .map((e) => e == '1')
          .toList();
    });
    List<List<double>> m = [];
    List<int> ones = [];

    for (var i = 0; i < pow(2, numInputQBits).round(); i++) {
      List<double> v1 = List.generate(
        pow(2, numInputQBits + 1).round(),
        (index) => index == 2 * i ? 1 : 0,
      );
      List<double> v2 = List.generate(
        pow(2, numInputQBits + 1).round(),
        (index) => index == 2 * i + 1 ? 1 : 0,
      );
      var output = f(inputs[i]);
      if (output) {
        m.add(v2);
        m.add(v1);
        ones.add(i);
      } else {
        m.add(v1);
        m.add(v2);
      }
    }

    matrix = Matrix.ofDouble(m);

    transition = StateTransition(TransitionType.ORACLE, [
      index,
      numInputQBits,
      ...ones,
    ]);
  }
}
