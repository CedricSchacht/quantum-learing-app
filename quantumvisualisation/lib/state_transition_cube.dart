import 'package:flutter/widgets.dart';
import 'package:quantumsimulator/state_transition.dart';
import 'package:quantumvisualisation/painter/transition/ccx_transition_painter.dart';
import 'package:quantumvisualisation/painter/transition/cu_transition_painter.dart';
import 'package:quantumvisualisation/painter/transition/cx_transition_painter.dart';
import 'package:quantumvisualisation/painter/transition/h_transition_painter.dart';
import 'package:quantumvisualisation/painter/transition/measure_transition_painter.dart';
import 'package:quantumvisualisation/painter/transition/oracle_transition_painter.dart';
import 'package:quantumvisualisation/painter/transition/transition_painter.dart';
import 'package:quantumvisualisation/painter/transition/x_transiiton_painter.dart';
import 'package:quantumvisualisation/painter/transition/y_transition_painter.dart';
import 'package:quantumvisualisation/painter/transition/z_transition_painter.dart';

///Use this Widget to Display a Statetransition according to the Cubediagramm
///[transition] instance of StateTransition containing the transition information
///[size] Dimentsion that the Widget will use
///[qBitCount] number of QBits of the Circuit containing the transition
class StateTransitionCube extends StatelessWidget {
  final StateTransition transition;
  final Size size;
  final int qBitCount;
  const StateTransitionCube({
    super.key,
    required this.qBitCount,
    required this.size,
    required this.transition,
  });

  @override
  Widget build(BuildContext context) {
    TransitionPainter painter;
    switch (transition.type) {
      case TransitionType.H:
        painter = HTransitionPainter(transition, qBitCount);
        break;
      case TransitionType.X:
        painter = XTransitionPainter(transition, qBitCount);
        break;
      case TransitionType.Y:
        painter = YTransitionPainter(transition, qBitCount);
        break;
      case TransitionType.Z:
        painter = ZTransitionPainter(transition, qBitCount);
        break;
      case TransitionType.CX:
        painter = CXTransitionPainter(transition, qBitCount);
        break;
      case TransitionType.CCX:
        painter = CCXTransitionPainter(transition, qBitCount);
        break;
      case TransitionType.ORACLE:
        painter = OracleTransitionPainter(transition, qBitCount);
        break;
      case TransitionType.CONTROLLED_U:
        painter = CUTransitionPainter(transition, qBitCount);
        break;
      case TransitionType.MEASURE:
        painter = MeasureTransitionPainter(transition, qBitCount);
        break;
      default:
        painter = TransitionPainter(transition, qBitCount);
    }
    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        size: size,
        painter: painter,
      ),
    );
  }
}
