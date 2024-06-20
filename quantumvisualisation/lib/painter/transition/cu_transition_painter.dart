import 'package:flutter/material.dart';
import 'package:quantumvisualisation/painter/transition/transition_painter.dart';

/// Implementation of TrasnistionPainter
/// to visualize Controlled_U Gates on Regsiters between 2 and 4 QBit
class CUTransitionPainter extends TransitionPainter {
  CUTransitionPainter(super.transition, super.qBitCount);

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

  void _twoQBit(Canvas canvas, Size size) {}
  void _threeQBit(Canvas canvas, Size size) {}
  void _fourQBit(Canvas canvas, Size size) {}
}
