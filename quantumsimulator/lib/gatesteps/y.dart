import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/state_transition.dart';

/// Implementation of GateStep for the PauliY Gate
/// [transition] is set automaticly
/// index of the QBit that hadamard is set on
/// [matrix] is set automaticly
class Y extends GateStep {
  @override
  final Matrix matrix = Matrix([
    [ComplexDouble(), ComplexDouble(imag: -1)],
    [ComplexDouble.i(), ComplexDouble()],
  ]);
  @override
  final int index;
  Y(this.index);
  @override
  StateTransition get transition => StateTransition(TransitionType.Y, [index]);
}
