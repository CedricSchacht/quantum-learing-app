import 'package:quantumsimulator/linalg/vector.dart';
import 'package:quantumsimulator/state_transition.dart';

/// Wrapper for Calculation Results
/// containing the [before] Vector, a [transition] and the [after] Vector
class SimulationResult {
  final Vector before;
  final StateTransition transition;
  final Vector after;
  SimulationResult({
    required this.before,
    required this.transition,
    required this.after,
  });
}

/// Wrapper for Measure Results adding probabilities of measureing 0 in [p0] and 1 in [p1]
class SimulationMeasureResult extends SimulationResult {
  final double p0;
  final double p1;
  SimulationMeasureResult({
    required this.p0,
    required this.p1,
    required super.before,
    required super.transition,
    required super.after,
  });
}
