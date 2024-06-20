import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quantumsimulator/linalg/vector.dart';
import 'package:quantumvisualisation/painter/vector/cube_painter.dart';

///SingleQBitCubePainter implements CubePainter for Registers with only one QBit
///[vector] contains the state of the register
///[vector] size must be equal to 2
class SingleQBitCubePainter extends CubePainter {
  @override
  final Vector vector;
  SingleQBitCubePainter(this.vector) {
    assert(vector.size == 2);
  }
  @override
  void paint(Canvas canvas, Size size) {
    var unit = min(size.width, size.height);
    var vCenter = size.height / 2;
    var hCenter = size.width / 2;
    var p0 = Offset(hCenter - unit * 0.4, vCenter);
    var p1 = Offset(hCenter + unit * 0.4, vCenter);
    canvas.drawLine(p0, p1, edgePaint);
    drawCorner(canvas, vector.elements[0], p0, unit * 0.2, '|0>');
    drawCorner(canvas, vector.elements[1], p1, unit * 0.2, '|1>');
  }
}
