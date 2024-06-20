import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/state_transition.dart';

/// Implementation of GateStep for a gereralized Controlled-U Gate
/// [transition] is set automaticly
/// index of the QBit that is the controll
/// U is applied to the following QBits
/// [matrix] is set automaticly
class CU extends GateStep {
  @override
  late final Matrix matrix;
  @override
  late final int index;
  @override
  late final StateTransition transition;
  CU(this.index, Matrix u) {
    var topLeft = Matrix.id(u.numColumns).elements;
    var topRight = List.generate(
      u.numRows,
      (_) => List.generate(
        u.numColumns,
        (_) => ComplexDouble(),
      ),
    );

    var bottomLeft = List.generate(
      u.numColumns,
      (_) => List.generate(
        u.numRows,
        (_) => ComplexDouble(),
      ),
    );

    List<List<ComplexDouble>> res = [];
    for (var i = 0; i < topLeft.length; i++) {
      res.add(topLeft[i] + topRight[i]);
    }
    for (var i = 0; i < bottomLeft.length; i++) {
      res.add(bottomLeft[i] + u.elements[i]);
    }
    matrix = Matrix(res);
    transition = StateTransition(TransitionType.CONTROLLED_U, [index]);
  }
}
