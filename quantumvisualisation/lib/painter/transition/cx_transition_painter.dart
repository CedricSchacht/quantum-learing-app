import 'package:flutter/material.dart';
import 'package:quantumvisualisation/painter/canvas_extensions.dart';
import 'package:quantumvisualisation/painter/transition/transition_painter.dart';

/// Implementation of TrasnistionPainter
/// to visualize CNOT Gates (CX) on Regsiters between 2 and 4 QBit
class CXTransitionPainter extends TransitionPainter {
  CXTransitionPainter(super.transition, super.qBitCount);

  @override
  void paint(Canvas canvas, Size size) {
    drawBase(canvas, size);
    switch (qBitCount) {
      case 2:
        _twoQBit(canvas, size);
        break;
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

  void _twoQBit(Canvas canvas, Size size) {
    var points = getPoints(size);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0;
    switch (transition.params) {
      case [0, 1]:
        canvas.xLine(points[1], points[3], 8, paint);
        break;
      case [1, 0]:
        canvas.xLine(points[1], points[0], 8, paint);
        break;
    }
  }

  void _threeQBit(Canvas canvas, Size size) {
    var points = getPoints(size);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0;
    switch (transition.params) {
      case [0, 1]:
        canvas.xLine(points[1], points[3], 6, paint);
        canvas.xLine(points[5], points[7], 6, paint);
        break;
      case [0, 2]:
        canvas.xLine(points[1], points[5], 6, paint);
        canvas.xLine(points[3], points[7], 6, paint);
        break;
      case [1, 0]:
        canvas.xLine(points[1], points[0], 6, paint);
        canvas.xLine(points[5], points[4], 6, paint);
        break;
      case [1, 2]:
        canvas.xLine(points[1], points[5], 6, paint);
        canvas.xLine(points[0], points[4], 6, paint);
        break;
    }
  }

  void _fourQBit(Canvas canvas, Size size) {
    var points = getPoints(size);
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 3.0;
    switch (transition.params) {
      case [0, 1]:
        canvas.xLine(points[1], points[3], 4, paint);
        canvas.xLine(points[5], points[7], 4, paint);
        canvas.xLine(points[9], points[11], 4, paint);
        canvas.xLine(points[13], points[15], 4, paint);
        break;
      case [0, 2]:
        canvas.xLine(points[1], points[5], 4, paint);
        canvas.xLine(points[3], points[7], 4, paint);
        canvas.xLine(points[9], points[13], 4, paint);
        canvas.xLine(points[11], points[15], 4, paint);
        break;
      case [0, 3]:
        canvas.xLine(points[1], points[9], 4, paint);
        canvas.xLine(points[3], points[11], 4, paint);
        canvas.xLine(points[5], points[13], 4, paint);
        canvas.xLine(points[7], points[15], 4, paint);
        break;
      case [1, 0]:
        canvas.xLine(points[1], points[0], 4, paint);
        canvas.xLine(points[4], points[5], 4, paint);
        canvas.xLine(points[8], points[9], 4, paint);
        canvas.xLine(points[12], points[13], 4, paint);
        break;
      case [1, 2]:
        canvas.xLine(points[1], points[5], 4, paint);
        canvas.xLine(points[0], points[4], 4, paint);
        canvas.xLine(points[8], points[12], 4, paint);
        canvas.xLine(points[9], points[13], 4, paint);
        break;
      case [1, 3]:
        canvas.xLine(points[1], points[9], 4, paint);
        canvas.xLine(points[0], points[8], 4, paint);
        canvas.xLine(points[4], points[12], 4, paint);
        canvas.xLine(points[5], points[13], 4, paint);
        break;
      case [2, 0]:
        canvas.xLine(points[4], points[5], 4, paint);
        canvas.xLine(points[6], points[7], 4, paint);
        canvas.xLine(points[12], points[13], 4, paint);
        canvas.xLine(points[14], points[15], 4, paint);
        break;
      case [2, 1]:
        canvas.xLine(points[4], points[6], 4, paint);
        canvas.xLine(points[5], points[7], 4, paint);
        canvas.xLine(points[12], points[14], 4, paint);
        canvas.xLine(points[13], points[15], 4, paint);
        break;
      case [2, 3]:
        canvas.xLine(points[4], points[12], 4, paint);
        canvas.xLine(points[5], points[13], 4, paint);
        canvas.xLine(points[6], points[14], 4, paint);
        canvas.xLine(points[7], points[15], 4, paint);
        break;
      case [3, 0]:
        canvas.xLine(points[8], points[9], 4, paint);
        canvas.xLine(points[10], points[11], 4, paint);
        canvas.xLine(points[12], points[13], 4, paint);
        canvas.xLine(points[14], points[15], 4, paint);
        break;
      case [3, 1]:
        canvas.xLine(points[8], points[10], 4, paint);
        canvas.xLine(points[9], points[11], 4, paint);
        canvas.xLine(points[12], points[14], 4, paint);
        canvas.xLine(points[13], points[15], 4, paint);
        break;
      case [3, 2]:
        canvas.xLine(points[8], points[12], 4, paint);
        canvas.xLine(points[9], points[13], 4, paint);
        canvas.xLine(points[10], points[14], 4, paint);
        canvas.xLine(points[11], points[15], 4, paint);
        break;
    }
  }
}
