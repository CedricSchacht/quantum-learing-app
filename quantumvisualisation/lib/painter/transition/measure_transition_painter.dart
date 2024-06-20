import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quantumvisualisation/painter/transition/transition_painter.dart';

/// Implementation of TrasnistionPainter
/// to visualize Measurements on Regsiters between 1 and 4 QBit
class MeasureTransitionPainter extends TransitionPainter {
  MeasureTransitionPainter(super.transition, super.qBitCount);

  @override
  void paint(Canvas canvas, Size size) {
    drawBase(canvas, size);
    switch (qBitCount) {
      case 1:
        _singleQBit(canvas, size);
        break;
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

  void _singleQBit(Canvas canvas, Size size) {
    final Offset a = Offset(size.width * 0.5, size.height * 0.7);
    final Offset b = Offset(size.width * 0.5, size.height * 0.3);
    canvas.drawLine(
      a,
      b,
      Paint()
        ..color = Colors.red
        ..strokeWidth = 3,
    );
  }

  void _twoQBit(Canvas canvas, Size size) {
    switch (transition.params) {
      case [0]:
        final Offset a = Offset(size.width * 0.5, size.height * 0.95);
        final Offset b = Offset(size.width * 0.5, size.height * 0.05);
        canvas.drawLine(
          a,
          b,
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        break;
      case [1]:
        final Offset a = Offset(size.width * 0.95, size.height * 0.5);
        final Offset b = Offset(size.width * 0.05, size.height * 0.5);
        canvas.drawLine(
          a,
          b,
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        break;
    }
  }

  void _threeQBit(Canvas canvas, Size size) {
    switch (transition.params) {
      case [0]:
        final Offset a = Offset(size.width * 0.35, size.height * 0.9);
        final Offset b = Offset(size.width * 0.35, size.height * 0.4);
        final Offset c = Offset(size.width * 0.65, size.height * 0.1);
        final Offset d = Offset(size.width * 0.65, size.height * 0.6);
        canvas.drawPoints(
          PointMode.polygon,
          [a, b, c, d, a],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        break;
      case [1]:
        final Offset a = Offset(size.width * 0.4, size.height * 0.4);
        final Offset b = Offset(size.width * 0.9, size.height * 0.4);
        final Offset c = Offset(size.width * 0.6, size.height * 0.65);
        final Offset d = Offset(size.width * 0.1, size.height * 0.65);
        canvas.drawPoints(
          PointMode.polygon,
          [a, b, c, d, a],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        break;
      case [2]:
        final Offset a = Offset(size.width * 0.25, size.height * 0.25);
        final Offset b = Offset(size.width * 0.75, size.height * 0.25);
        final Offset c = Offset(size.width * 0.75, size.height * 0.75);
        final Offset d = Offset(size.width * 0.25, size.height * 0.75);
        canvas.drawPoints(
          PointMode.polygon,
          [a, b, c, d, a],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        break;
    }
  }

  void _fourQBit(Canvas canvas, Size size) {
    switch (transition.params) {
      case [0]:
        final Offset a = Offset(size.width * 0.425, size.height * 0.55);
        final Offset b = Offset(size.width * 0.325, size.height * 0.65);
        final Offset c = Offset(size.width * 0.325, size.height * 0.9);
        final Offset d = Offset(size.width * 0.425, size.height * 0.8);

        final Offset e = Offset(size.width * 0.575, size.height * 0.45);
        final Offset f = Offset(size.width * 0.675, size.height * 0.35);
        final Offset g = Offset(size.width * 0.675, size.height * 0.1);
        final Offset h = Offset(size.width * 0.575, size.height * 0.2);
        canvas.drawPoints(
          PointMode.polygon,
          [a, b, c, d, a],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        canvas.drawPoints(
          PointMode.polygon,
          [e, f, g, h, e],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        break;
      case [1]:
        final Offset a = Offset(size.width * 0.2, size.height * 0.775);
        final Offset b = Offset(size.width * 0.45, size.height * 0.775);
        final Offset c = Offset(size.width * 0.55, size.height * 0.675);
        final Offset d = Offset(size.width * 0.3, size.height * 0.675);

        final Offset e = Offset(size.width * 0.8, size.height * 0.225);
        final Offset f = Offset(size.width * 0.55, size.height * 0.225);
        final Offset g = Offset(size.width * 0.45, size.height * 0.325);
        final Offset h = Offset(size.width * 0.7, size.height * 0.325);
        canvas.drawPoints(
          PointMode.polygon,
          [a, b, c, d, a],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        canvas.drawPoints(
          PointMode.polygon,
          [e, f, g, h, e],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        break;
      case [2]:
        final Offset a = Offset(size.width * 0.25, size.height * 0.6);
        final Offset b = Offset(size.width * 0.5, size.height * 0.6);
        final Offset c = Offset(size.width * 0.5, size.height * 0.85);
        final Offset d = Offset(size.width * 0.25, size.height * 0.85);

        final Offset e = Offset(size.width * 0.75, size.height * 0.4);
        final Offset f = Offset(size.width * 0.5, size.height * 0.4);
        final Offset g = Offset(size.width * 0.5, size.height * 0.15);
        final Offset h = Offset(size.width * 0.75, size.height * 0.15);
        canvas.drawPoints(
          PointMode.polygon,
          [a, b, c, d, a],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        canvas.drawPoints(
          PointMode.polygon,
          [e, f, g, h, e],
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        break;
      case [3]:
        final Offset a = Offset(size.width * 0.25, size.height * 0.45);
        final Offset c = Offset(size.width * 0.75, size.height * 0.55);
        canvas.drawLine(
          a,
          c,
          Paint()
            ..color = Colors.red
            ..strokeWidth = 3,
        );
        break;
    }
  }
}
