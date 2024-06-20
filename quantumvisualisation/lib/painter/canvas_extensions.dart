import 'package:flutter/material.dart';

///HadamardLine is used for Transition Painter
///It's a Line with Circles at both ends
///[a] startpoint
///[b] endpoint
///[radius] of the circles at the ends
///[paint] used for both line and circles
extension HadamardLine on Canvas {
  hadamardLine(Offset a, Offset b, double radius, Paint paint) {
    drawLine(a, b, paint);
    drawCircle(a, radius, paint);
    drawCircle(b, radius, paint);
  }
}

///XLine is used for Transition Painter
///It's a double Arrow
///[a] startpoint
///[b] endpoint
///[arrowSize] size and weight of the arrow tips
///[paint] used for both line and arrow tips
extension XLine on Canvas {
  xLine(Offset a, Offset b, double arrowSize, Paint paint) {
    drawLine(a, b, paint);
    _arrowTipPainter(a, b, arrowSize, paint);
    _arrowTipPainter(b, a, arrowSize, paint);
  }

  _arrowTipPainter(Offset end, Offset start, double arrowSize, Paint paint) {
    final direction = (end - start).direction;
    translate(start.dx, start.dy);
    rotate(direction);
    var tip = Path();
    tip.moveTo(0.0, 0.0);
    tip.lineTo(arrowSize * 2, arrowSize);
    tip.lineTo(arrowSize * 2, -arrowSize);
    tip.close();
    drawPath(tip, paint);
    rotate(-direction);
    translate(-start.dx, -start.dy);
  }
}

///YLine is used for Transition Painter
///It's a simple line for now
///[a] startpoint
///[b] endpoint
///[arrowSize] unused for now
///[paint] used for line
extension YLine on Canvas {
  yLine(Offset a, Offset b, double arrowSize, Paint paint) {
    drawLine(a, b, paint);
  }
}

///ZLine is used for Transition Painter
///It's a line with a circle with a '-' inside at the endpoint
///[a] startpoint
///[b] endpoint
///[arrowSize] size and weight of circle at the endpoint
///[paint] used for both line and arrow tip
extension ZLine on Canvas {
  zLine(Offset a, Offset b, double arrowSize, Paint paint) {
    drawLine(a, b, paint);
    drawCircle(b, arrowSize, paint);
    drawCircle(b, arrowSize * 0.8, Paint()..color = Colors.white);
    final textStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: arrowSize * 3,
    );
    final textSpan = TextSpan(
      text: "-",
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: arrowSize,
    );
    var singOffset = Offset(
      b.dx - textPainter.width / 2 - arrowSize / 10,
      b.dy - textPainter.height / 2 - arrowSize / 3,
    );
    textPainter.paint(this, singOffset);
  }
}
