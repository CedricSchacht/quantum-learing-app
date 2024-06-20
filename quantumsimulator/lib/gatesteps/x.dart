import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/state_transition.dart';

/// Implementation of GateStep for the PauliX Gate
/// [transition] is set automaticly
/// index of the QBit that hadamard is set on
/// [matrix] is set automaticly
class X extends GateStep {
  @override
  final Matrix matrix = Matrix.ofDouble([
    [0, 1],
    [1, 0],
  ]);
  @override
  final int index;
  X(this.index);
  @override
  StateTransition get transition => StateTransition(TransitionType.X, [index]);
}
