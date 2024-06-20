import 'package:flutter/material.dart';
import 'package:quantumvisualisation/painter/canvas_extensions.dart';
import 'package:quantumvisualisation/painter/transition/transition_painter.dart';

/// Implementation of TrasnistionPainter
/// to visualize Toffolie Gates (CCX) on Regsiters between 3 and 4 QBit
class CCXTransitionPainter extends TransitionPainter {
  CCXTransitionPainter(super.transition, super.qBitCount);

  @override
  void paint(Canvas canvas, Size size) {
    drawBase(canvas, size);
    switch (qBitCount) {
      case 3:
        _threeQBit(canvas, size);
        break;
      case 4:
        _fourQBit(canvas, size);
        break;
      default:
        drawUnsupported(canvas, size);
    }
  }

  void _threeQBit(Canvas canvas, Size size) {
    var points = getPoints(size);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0;
    switch (transition.params) {
      case [0, 1, 2]:
        canvas.xLine(points[1], points[5], 6, paint);
        break;
      case [0, 2, 1]:
        canvas.xLine(points[7], points[5], 6, paint);
        break;
      case [1, 0, 2]:
        canvas.xLine(points[1], points[5], 6, paint);
        break;
      case [1, 2, 0]:
        canvas.xLine(points[4], points[5], 6, paint);
        break;
      case [2, 0, 1]:
        canvas.xLine(points[7], points[5], 6, paint);
        break;
      case [2, 1, 0]:
        canvas.xLine(points[4], points[5], 6, paint);
        break;
    }
  }

  void _fourQBit(Canvas canvas, Size size) {
    var points = getPoints(size);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0;
    switch (transition.params) {
      case [0, 1, 2]:
        canvas.xLine(points[1], points[5], 4, paint);
        canvas.xLine(points[9], points[13], 4, paint);
        break;
      case [0, 1, 3]:
        canvas.xLine(points[1], points[9], 4, paint);
        canvas.xLine(points[5], points[13], 4, paint);
        break;
      case [0, 2, 1]:
        canvas.xLine(points[7], points[5], 4, paint);
        canvas.xLine(points[15], points[13], 4, paint);
        break;
      case [0, 2, 3]:
        canvas.xLine(points[7], points[15], 4, paint);
        canvas.xLine(points[5], points[13], 4, paint);
        break;
      case [0, 3, 1]:
        canvas.xLine(points[13], points[15], 4, paint);
        canvas.xLine(points[11], points[9], 4, paint);
        break;
      case [0, 3, 2]:
        canvas.xLine(points[13], points[9], 4, paint);
        canvas.xLine(points[15], points[11], 4, paint);
        break;

      case [1, 0, 2]:
        canvas.xLine(points[1], points[5], 4, paint);
        canvas.xLine(points[9], points[13], 4, paint);
        break;
      case [1, 0, 3]:
        canvas.xLine(points[1], points[9], 4, paint);
        canvas.xLine(points[5], points[13], 4, paint);
        break;
      case [1, 2, 0]:
        canvas.xLine(points[4], points[5], 4, paint);
        canvas.xLine(points[12], points[13], 4, paint);
        break;
      case [1, 2, 3]:
        canvas.xLine(points[4], points[12], 4, paint);
        canvas.xLine(points[5], points[13], 4, paint);
        break;
      case [1, 3, 0]:
        canvas.xLine(points[12], points[13], 4, paint);
        canvas.xLine(points[8], points[9], 4, paint);
        break;
      case [1, 3, 2]:
        canvas.xLine(points[12], points[8], 4, paint);
        canvas.xLine(points[9], points[13], 4, paint);
        break;

      case [2, 0, 1]:
        canvas.xLine(points[7], points[5], 4, paint);
        canvas.xLine(points[15], points[13], 4, paint);
        break;
      case [2, 0, 3]:
        canvas.xLine(points[7], points[15], 4, paint);
        canvas.xLine(points[5], points[13], 4, paint);
        break;
      case [2, 1, 0]:
        canvas.xLine(points[4], points[5], 4, paint);
        canvas.xLine(points[12], points[13], 4, paint);
        break;
      case [2, 1, 3]:
        canvas.xLine(points[4], points[12], 4, paint);
        canvas.xLine(points[5], points[13], 4, paint);
        break;
      case [2, 3, 0]:
        canvas.xLine(points[8], points[9], 4, paint);
        canvas.xLine(points[10], points[11], 4, paint);
        break;
      case [2, 3, 1]:
        canvas.xLine(points[8], points[10], 4, paint);
        canvas.xLine(points[9], points[11], 4, paint);
        break;

      case [3, 0, 1]:
        canvas.xLine(points[13], points[15], 4, paint);
        canvas.xLine(points[11], points[9], 4, paint);
        break;
      case [3, 0, 2]:
        canvas.xLine(points[13], points[9], 4, paint);
        canvas.xLine(points[15], points[11], 4, paint);
        break;
      case [3, 1, 0]:
        canvas.xLine(points[12], points[13], 4, paint);
        canvas.xLine(points[8], points[9], 4, paint);
        break;
      case [3, 1, 2]:
        canvas.xLine(points[12], points[8], 4, paint);
        canvas.xLine(points[9], points[13], 4, paint);
        break;
      case [3, 2, 0]:
        canvas.xLine(points[8], points[9], 4, paint);
        canvas.xLine(points[10], points[11], 4, paint);
        break;
      case [3, 2, 1]:
        canvas.xLine(points[8], points[10], 4, paint);
        canvas.xLine(points[9], points[11], 4, paint);
        break;
    }
  }
}
