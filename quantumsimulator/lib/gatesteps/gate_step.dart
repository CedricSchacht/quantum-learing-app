import 'package:quantumsimulator/linalg/matrix.dart';
import 'package:quantumsimulator/step.dart';

/// abstract GateStep implemented
/// i.e. X, Y, Z, CCX, ...
abstract class GateStep extends Step {
  /// required unitary [matrix] representing the state
  abstract final Matrix matrix;

  /// required [index] of the first affected QBit
  abstract final int index;
}
