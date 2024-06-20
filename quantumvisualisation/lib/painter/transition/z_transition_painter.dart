import 'package:flutter/material.dart';
import 'package:quantumvisualisation/painter/canvas_extensions.dart';
import 'package:quantumvisualisation/painter/transition/basic_gate_transition_painter.dart';

/// Implementation of BasicGateTrasnistionPainter
/// to visualize PauliZ Gates on Regsiters between 1 and 4 QBit
class ZTransitionPainter extends BasicGateTransitionPainter {
  ZTransitionPainter(super.transition, super.qBitCount);

  @override
  void paint(Canvas canvas, Size size) {
    drawBase(canvas, size);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0;
    final points = getPoints(size);
    switch (qBitCount) {
      case 1:
        singleQBit(points, (a, b) => canvas.zLine(a, b, 10.0, paint));
        break;
      case 2:
        twoQBit(points, (a, b) => canvas.zLine(a, b, 8.0, paint));
        break;
      case 3:
        threeQBit(points, (a, b) => canvas.zLine(a, b, 6.0, paint));
        break;
      case 4:
        fourQBit(points, (a, b) => canvas.zLine(a, b, 4.0, paint));
        break;
      default:
        drawUnsupported(canvas, size);
    }
  }
}
