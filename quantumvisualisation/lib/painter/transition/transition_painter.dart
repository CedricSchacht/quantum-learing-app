import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quantumsimulator/state_transition.dart';

///TransitionPainter serves two reasons
///first it is used for unsuported transitions
///second it proveds helpers for all transitions that are supported
class TransitionPainter extends CustomPainter {
  ///default paint for the lines between the corners
  final Paint edgePaint = Paint()
    ..color = Colors.grey.shade300
    ..style = PaintingStyle.fill
    ..strokeWidth = 3.0;

  /// the transition that shall be displayed
  final StateTransition transition;

  /// the number of QBit in the current register
  final int qBitCount;
  TransitionPainter(this.transition, this.qBitCount);

  ///TransitionPainter will not update if transition is changed
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  ///draws the outline of a cube such that transition specific lines can be drawn over it
  void drawBase(Canvas canvas, Size size) {
    final points = getPoints(size);
    switch (qBitCount) {
      case 1:
        assert(points.length == 2);
        canvas.drawLine(points[0], points[1], edgePaint);
        break;
      case 2:
        assert(points.length == 4);
        canvas.drawLine(points[0], points[1], edgePaint);
        canvas.drawLine(points[2], points[3], edgePaint);
        canvas.drawLine(points[0], points[2], edgePaint);
        canvas.drawLine(points[1], points[3], edgePaint);
        break;
      case 3:
        assert(points.length == 8);
        canvas.drawLine(points[0], points[1], edgePaint);
        canvas.drawLine(points[2], points[3], edgePaint);
        canvas.drawLine(points[0], points[2], edgePaint);
        canvas.drawLine(points[1], points[3], edgePaint);

        canvas.drawLine(points[4], points[5], edgePaint);
        canvas.drawLine(points[6], points[7], edgePaint);
        canvas.drawLine(points[4], points[6], edgePaint);
        canvas.drawLine(points[5], points[7], edgePaint);

        canvas.drawLine(points[0], points[4], edgePaint);
        canvas.drawLine(points[1], points[5], edgePaint);
        canvas.drawLine(points[2], points[6], edgePaint);
        canvas.drawLine(points[3], points[7], edgePaint);
        break;
      case 4:
        assert(points.length == 16);
        canvas.drawLine(points[0], points[1], edgePaint);
        canvas.drawLine(points[2], points[3], edgePaint);
        canvas.drawLine(points[0], points[2], edgePaint);
        canvas.drawLine(points[1], points[3], edgePaint);

        canvas.drawLine(points[4], points[5], edgePaint);
        canvas.drawLine(points[6], points[7], edgePaint);
        canvas.drawLine(points[4], points[6], edgePaint);
        canvas.drawLine(points[5], points[7], edgePaint);

        canvas.drawLine(points[0], points[4], edgePaint);
        canvas.drawLine(points[1], points[5], edgePaint);
        canvas.drawLine(points[2], points[6], edgePaint);
        canvas.drawLine(points[3], points[7], edgePaint);

        canvas.drawLine(points[8], points[9], edgePaint);
        canvas.drawLine(points[10], points[11], edgePaint);
        canvas.drawLine(points[8], points[10], edgePaint);
        canvas.drawLine(points[9], points[11], edgePaint);

        canvas.drawLine(points[12], points[13], edgePaint);
        canvas.drawLine(points[14], points[15], edgePaint);
        canvas.drawLine(points[12], points[14], edgePaint);
        canvas.drawLine(points[13], points[15], edgePaint);

        canvas.drawLine(points[8], points[12], edgePaint);
        canvas.drawLine(points[9], points[13], edgePaint);
        canvas.drawLine(points[10], points[14], edgePaint);
        canvas.drawLine(points[11], points[15], edgePaint);

        canvas.drawLine(points[0], points[8], edgePaint);
        canvas.drawLine(points[1], points[9], edgePaint);
        canvas.drawLine(points[2], points[10], edgePaint);
        canvas.drawLine(points[3], points[11], edgePaint);

        canvas.drawLine(points[4], points[12], edgePaint);
        canvas.drawLine(points[5], points[13], edgePaint);
        canvas.drawLine(points[6], points[14], edgePaint);
        canvas.drawLine(points[7], points[15], edgePaint);
        break;
    }
  }

  /// calculates the Offests of the corners for a cube with the dimentsion of qBitCount
  /// [size] is required to center the diagram on the canvas
  List<Offset> getPoints(Size size) {
    var unit = min(size.width, size.height);
    var vCenter = size.height / 2;
    var hCenter = size.width / 2;
    switch (qBitCount) {
      case 1:
        var p1 = Offset(hCenter - unit * 0.4, vCenter);
        var p2 = Offset(hCenter + unit * 0.4, vCenter);
        return [p1, p2];
      case 2:
        var p1 = Offset(hCenter - 0.4 * unit, vCenter - 0.4 * unit);
        var p2 = Offset(hCenter + 0.4 * unit, vCenter - 0.4 * unit);
        var p3 = Offset(hCenter - 0.4 * unit, vCenter + 0.4 * unit);
        var p4 = Offset(hCenter + 0.4 * unit, vCenter + 0.4 * unit);
        return [p1, p2, p3, p4];
      case 3:
        var p1 = Offset(hCenter - 0.4 * unit, vCenter - 0.1 * unit);
        var p2 = Offset(hCenter + 0.1 * unit, vCenter - 0.1 * unit);
        var p3 = Offset(hCenter - 0.4 * unit, vCenter + 0.4 * unit);
        var p4 = Offset(hCenter + 0.1 * unit, vCenter + 0.4 * unit);
        var p5 = Offset(hCenter - 0.1 * unit, vCenter - 0.4 * unit);
        var p6 = Offset(hCenter + 0.4 * unit, vCenter - 0.4 * unit);
        var p7 = Offset(hCenter - 0.1 * unit, vCenter + 0.1 * unit);
        var p8 = Offset(hCenter + 0.4 * unit, vCenter + 0.1 * unit);
        return [p1, p2, p3, p4, p5, p6, p7, p8];
      case 4:
        var p1 = Offset(hCenter - 0.3 * unit, vCenter + 0.15 * unit);
        var p2 = Offset(hCenter - 0.05 * unit, vCenter + 0.15 * unit);
        var p3 = Offset(hCenter - 0.3 * unit, vCenter + 0.4 * unit);
        var p4 = Offset(hCenter - 0.05 * unit, vCenter + 0.4 * unit);

        var p5 = Offset(hCenter - 0.2 * unit, vCenter + 0.05 * unit);
        var p6 = Offset(hCenter + 0.05 * unit, vCenter + 0.05 * unit);
        var p7 = Offset(hCenter - 0.2 * unit, vCenter + 0.3 * unit);
        var p8 = Offset(hCenter + 0.05 * unit, vCenter + 0.3 * unit);

        var p9 = Offset(hCenter - 0.05 * unit, vCenter - 0.3 * unit);
        var pa = Offset(hCenter + 0.2 * unit, vCenter - 0.3 * unit);
        var pb = Offset(hCenter - 0.05 * unit, vCenter - 0.05 * unit);
        var pc = Offset(hCenter + 0.2 * unit, vCenter - 0.05 * unit);

        var pd = Offset(hCenter + 0.05 * unit, vCenter - 0.4 * unit);
        var pe = Offset(hCenter + 0.3 * unit, vCenter - 0.4 * unit);
        var pf = Offset(hCenter + 0.05 * unit, vCenter - 0.15 * unit);
        var p0 = Offset(hCenter + 0.3 * unit, vCenter - 0.15 * unit);
        return [p1, p2, p3, p4, p5, p6, p7, p8, p9, pa, pb, pc, pd, pe, pf, p0];
      default:
        return [];
    }
  }

  /// paint method for unsuported transitions
  /// check StateTransitionCube
  void drawUnsupported(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Colors.red);
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    final textSpan = TextSpan(
      text: "Unsupported transition ${transition.type} for $qBitCount QBit(s).",
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  /// if not overriden the transition is displayed as unsupported
  @override
  void paint(Canvas canvas, Size size) {
    drawUnsupported(canvas, size);
  }
}
