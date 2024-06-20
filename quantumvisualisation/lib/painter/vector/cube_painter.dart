import 'package:flutter/material.dart';
import 'package:quantumsimulator/quantumsimulator.dart';

///CustomPainter abstraction for CubePainter of every QBit Count
///will not repaint on vector changes
///provides default colors for lines
///provides draw method for corner squares
abstract class CubePainter extends CustomPainter {
  ///The Vector that shall be represented
  abstract final Vector vector;

  ///default paint object for lines between corners
  final Paint edgePaint = Paint()
    ..color = Colors.grey.shade700
    ..style = PaintingStyle.fill
    ..strokeWidth = 3.0;

  ///drawCorner draws the Squares at [offset] with size [unit]
  ///adds a [label] at the bottom right side of offset
  ///Size of the blue square is defined by abs of [c]
  ///rotation of the corner is definde by phase angle of c
  ///angle of 0 is the X axis
  ///angle is measured counter clockwise
  void drawCorner(
    Canvas canvas,
    ComplexDouble c,
    Offset offset,
    double unit,
    String label,
  ) {
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(c.phi);
    canvas.translate(-offset.dx, -offset.dy);
    final bgPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    final bg = Rect.fromLTWH(
      offset.dx - unit / 2.0,
      offset.dy - unit / 2.0,
      unit,
      unit,
    );
    canvas.drawRect(bg, bgPaint);
    final amplitudePaint = Paint()
      ..color = Colors.teal.shade700
      ..style = PaintingStyle.fill;
    final amplitude = Rect.fromLTWH(
      offset.dx - unit / 2,
      offset.dy + unit / 2,
      c.r * unit,
      -c.r * unit,
    );
    canvas.drawRect(amplitude, amplitudePaint);
    final arrowPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;
    Offset a = Offset(
      offset.dx - unit / 2.0,
      offset.dy + unit / 2.0,
    );
    Offset b = Offset(
      offset.dx - unit / 2.0 + c.r * unit,
      offset.dy + unit / 2.0,
    );
    canvas.drawLine(a, b, arrowPaint);
    _arrowTipPainter(canvas, a, b, unit * 0.1, arrowPaint);

    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(-c.phi);
    canvas.translate(-offset.dx, -offset.dy);

    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: unit * 0.2,
    );
    final textSpan = TextSpan(
      text: label,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: unit,
    );
    final pos = Offset(offset.dx + unit * 0.5, offset.dy + unit * 0.7);
    textPainter.paint(canvas, pos);
  }

  _arrowTipPainter(
    Canvas canvas,
    Offset end,
    Offset start,
    double arrowSize,
    Paint paint,
  ) {
    canvas.translate(start.dx, start.dy);
    var tip = Path();
    tip.moveTo(0.0, 0.0);
    tip.lineTo(-arrowSize * 2, arrowSize);
    tip.lineTo(-arrowSize * 2, -arrowSize);
    tip.close();
    canvas.drawPath(tip, paint);
    canvas.translate(-start.dx, -start.dy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
