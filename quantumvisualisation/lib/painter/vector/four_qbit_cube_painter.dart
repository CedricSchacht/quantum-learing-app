import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quantumsimulator/linalg/vector.dart';
import 'package:quantumvisualisation/painter/vector/cube_painter.dart';

///FourQBitCubePainter implements CubePainter for Registers with four QBit
///[vector] contains the state of the register
///[vector] size must be equal to 16
class FourQBitCubePainter extends CubePainter {
  @override
  final Vector vector;
  FourQBitCubePainter(this.vector) {
    assert(vector.size == 16);
  }
  @override
  void paint(Canvas canvas, Size size) {
    var unit = min(size.width, size.height);
    var paint2 = edgePaint..strokeWidth = edgePaint.strokeWidth * 0.6;
    var vCenter = size.height / 2;
    var hCenter = size.width / 2;
    var p0 = Offset(hCenter - 0.3 * unit, vCenter + 0.4 * unit);
    var p1 = Offset(hCenter - 0.05 * unit, vCenter + 0.4 * unit);
    var p2 = Offset(hCenter - 0.3 * unit, vCenter + 0.15 * unit);
    var p3 = Offset(hCenter - 0.05 * unit, vCenter + 0.15 * unit);

    var p4 = Offset(hCenter - 0.2 * unit, vCenter + 0.3 * unit);
    var p5 = Offset(hCenter + 0.05 * unit, vCenter + 0.3 * unit);
    var p6 = Offset(hCenter - 0.2 * unit, vCenter + 0.05 * unit);
    var p7 = Offset(hCenter + 0.05 * unit, vCenter + 0.05 * unit);

    var p8 = Offset(hCenter - 0.05 * unit, vCenter - 0.05 * unit);
    var p9 = Offset(hCenter + 0.2 * unit, vCenter - 0.05 * unit);
    var pa = Offset(hCenter - 0.05 * unit, vCenter - 0.3 * unit);
    var pb = Offset(hCenter + 0.2 * unit, vCenter - 0.3 * unit);

    var pc = Offset(hCenter + 0.05 * unit, vCenter - 0.15 * unit);
    var pd = Offset(hCenter + 0.3 * unit, vCenter - 0.15 * unit);
    var pe = Offset(hCenter + 0.05 * unit, vCenter - 0.4 * unit);
    var pf = Offset(hCenter + 0.3 * unit, vCenter - 0.4 * unit);

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

    canvas.drawLine(pa, pb, edgePaint);
    canvas.drawLine(p8, p9, edgePaint);
    canvas.drawLine(pa, p8, edgePaint);
    canvas.drawLine(pb, p9, edgePaint);

    canvas.drawLine(pe, pf, edgePaint);
    canvas.drawLine(pc, pd, edgePaint);
    canvas.drawLine(pe, pc, edgePaint);
    canvas.drawLine(pf, pd, edgePaint);

    canvas.drawLine(pa, pe, edgePaint);
    canvas.drawLine(pb, pf, edgePaint);
    canvas.drawLine(p8, pc, edgePaint);
    canvas.drawLine(p9, pd, edgePaint);

    canvas.drawLine(p2, pa, paint2);
    canvas.drawLine(p3, pb, paint2);
    canvas.drawLine(p0, p8, paint2);
    canvas.drawLine(p1, p9, paint2);

    canvas.drawLine(p6, pe, paint2);
    canvas.drawLine(p7, pf, paint2);
    canvas.drawLine(p4, pc, paint2);
    canvas.drawLine(p5, pd, paint2);
    drawCorner(canvas, vector.elements[0], p0, unit * 0.07, '|0000>');
    drawCorner(canvas, vector.elements[8], p1, unit * 0.07, '|1000>');
    drawCorner(canvas, vector.elements[4], p2, unit * 0.07, '|0100>');
    drawCorner(canvas, vector.elements[12], p3, unit * 0.07, '|1100>');
    drawCorner(canvas, vector.elements[2], p4, unit * 0.07, '|0010>');
    drawCorner(canvas, vector.elements[10], p5, unit * 0.07, '|1010>');
    drawCorner(canvas, vector.elements[6], p6, unit * 0.07, '|0110>');
    drawCorner(canvas, vector.elements[14], p7, unit * 0.07, '|1110>');
    drawCorner(canvas, vector.elements[1], p8, unit * 0.07, '|0001>');
    drawCorner(canvas, vector.elements[9], p9, unit * 0.07, '|1001>');
    drawCorner(canvas, vector.elements[5], pa, unit * 0.07, '|0101>');
    drawCorner(canvas, vector.elements[13], pb, unit * 0.07, '|1101>');
    drawCorner(canvas, vector.elements[3], pc, unit * 0.07, '|0011>');
    drawCorner(canvas, vector.elements[11], pd, unit * 0.07, '|1011>');
    drawCorner(canvas, vector.elements[7], pe, unit * 0.07, '|0111>');
    drawCorner(canvas, vector.elements[15], pf, unit * 0.07, '|1111>');
  }
}
