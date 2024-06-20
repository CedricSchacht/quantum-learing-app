import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/state_transition.dart';

/// Implementation of GateStep for the PauliZ Gate
/// [transition] is set automaticly
/// index of the QBit that hadamard is set on
/// [matrix] is set automaticly
class Z extends GateStep {
  @override
  final Matrix matrix = Matrix.ofDouble([
    [1, 0],
    [0, -1],
  ]);
  @override
  final int index;
  Z(this.index);
  @override
  StateTransition get transition => StateTransition(TransitionType.Z, [index]);
}
