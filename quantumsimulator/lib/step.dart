import 'package:quantumsimulator/state_transition.dart';

/// generalisation over GateSteps and MeasureSteps
/// [transition] required for visualisation
abstract class Step {
  abstract final StateTransition transition;
}

/// MeasureStep
/// [index] of the QBit that shall be measured
/// [transition] is set accordingly
class MeasureStep extends Step {
  final int index;
  @override
  late final StateTransition transition;
  MeasureStep({required this.index}) {
    transition = StateTransition(TransitionType.MEASURE, [index]);
  }
}
