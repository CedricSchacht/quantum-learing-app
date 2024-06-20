import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quantumsimulator/linalg/vector.dart';
import 'package:quantumvisualisation/painter/vector/cube_painter.dart';

///TwoQBitCubePainter implements CubePainter for Registers with two QBit
///[vector] contains the state of the register
///[vector] size must be equal to 4
class TwoQBitCubePainter extends CubePainter {
  @override
  final Vector vector;
  TwoQBitCubePainter(this.vector) {
    assert(vector.size == 4);
  }
  @override
  void paint(Canvas canvas, Size size) {
    var unit = min(size.width, size.height);
    var vCenter = size.height / 2;
    var hCenter = size.width / 2;
    var p0 = Offset(hCenter - 0.4 * unit, vCenter + 0.4 * unit);
    var p1 = Offset(hCenter - 0.4 * unit, vCenter - 0.4 * unit);
    var p2 = Offset(hCenter + 0.4 * unit, vCenter + 0.4 * unit);
    var p3 = Offset(hCenter + 0.4 * unit, vCenter - 0.4 * unit);
    canvas.drawLine(p1, p3, edgePaint);
    canvas.drawLine(p0, p2, edgePaint);
    canvas.drawLine(p1, p0, edgePaint);
    canvas.drawLine(p3, p2, edgePaint);
    drawCorner(canvas, vector.elements[0], p0, unit * 0.2, '|00>');
    drawCorner(canvas, vector.elements[1], p1, unit * 0.2, '|01>');
    drawCorner(canvas, vector.elements[2], p2, unit * 0.2, '|10>');
    drawCorner(canvas, vector.elements[3], p3, unit * 0.2, '|11>');
  }
}
