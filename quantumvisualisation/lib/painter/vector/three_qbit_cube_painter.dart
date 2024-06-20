import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quantumsimulator/linalg/vector.dart';
import 'package:quantumvisualisation/painter/vector/cube_painter.dart';

///ThreeQBitCubePainter implements CubePainter for Registers with three QBit
///[vector] contains the state of the register
///[vector] size must be equal to 8
class ThreeQBitCubePainter extends CubePainter {
  @override
  final Vector vector;
  ThreeQBitCubePainter(this.vector) {
    assert(vector.size == 8);
  }
  @override
  void paint(Canvas canvas, Size size) {
    var unit = min(size.width, size.height);
    var vCenter = size.height / 2;
    var hCenter = size.width / 2;
    var p0 = Offset(hCenter - 0.4 * unit, vCenter + 0.4 * unit);
    var p1 = Offset(hCenter + 0.1 * unit, vCenter + 0.4 * unit);
    var p2 = Offset(hCenter - 0.4 * unit, vCenter - 0.1 * unit);
    var p3 = Offset(hCenter + 0.1 * unit, vCenter - 0.1 * unit);
    var p4 = Offset(hCenter - 0.1 * unit, vCenter + 0.1 * unit);
    var p5 = Offset(hCenter + 0.4 * unit, vCenter + 0.1 * unit);
    var p6 = Offset(hCenter - 0.1 * unit, vCenter - 0.4 * unit);
    var p7 = Offset(hCenter + 0.4 * unit, vCenter - 0.4 * unit);

    canvas.drawLine(p2, p3, edgePaint);
    canvas.drawLine(p0, p1, edgePaint);
    canvas.drawLine(p2, p0, edgePaint);
    canvas.drawLine(p3, p1, edgePaint);
    canvas.drawLine(p6, p7, edgePaint);
    canvas.drawLine(p4, p5, edgePaint);
    canvas.drawLine(p6, p4, edgePaint);
    canvas.drawLine(p7, p5, edgePaint);
    canvas.drawLine(p2, p6, edgePaint);
    canvas.drawLine(p3, p7, edgePaint);
    canvas.drawLine(p0, p4, edgePaint);
    canvas.drawLine(p1, p5, edgePaint);

    drawCorner(canvas, vector.elements[0], p0, unit * 0.15, '|000>');
    drawCorner(canvas, vector.elements[4], p1, unit * 0.15, '|100>');
    drawCorner(canvas, vector.elements[2], p2, unit * 0.15, '|010>');
    drawCorner(canvas, vector.elements[6], p3, unit * 0.15, '|110>');
    drawCorner(canvas, vector.elements[1], p4, unit * 0.15, '|001>');
    drawCorner(canvas, vector.elements[5], p5, unit * 0.15, '|101>');
    drawCorner(canvas, vector.elements[3], p6, unit * 0.15, '|011>');
    drawCorner(canvas, vector.elements[7], p7, unit * 0.15, '|111>');
  }
}
