/// Wraper for Transition Type and [params]
/// [params] are implemented by every Type by it self
class StateTransition {
  final TransitionType type;
  final List<int> params;
  const StateTransition(this.type, this.params);
}

/// Enum of Supported TransitionTypes
// ignore: constant_identifier_names
enum TransitionType { H, X, Y, Z, CX, CCX, ORACLE, CONTROLLED_U, MEASURE }
