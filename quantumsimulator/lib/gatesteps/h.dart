import 'dart:math';

import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/state_transition.dart';

/// Implementation of GateStep for the Hadamard Gate
/// [transition] is set automaticly
/// index of the QBit that hadamard is set on
/// [matrix] is set automaticly
class H extends GateStep {
  @override
  final Matrix matrix = Matrix.ofDouble([
    [1, 1],
    [1, -1],
  ]).timesScalar(ComplexDouble(real: sqrt1_2));
  @override
  final int index;
  H(this.index);
  @override
  StateTransition get transition => StateTransition(TransitionType.H, [index]);
}
