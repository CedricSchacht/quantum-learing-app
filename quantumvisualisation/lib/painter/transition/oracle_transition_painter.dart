import 'package:flutter/material.dart';
import 'package:quantumvisualisation/painter/canvas_extensions.dart';
import 'package:quantumvisualisation/painter/transition/transition_painter.dart';

/// Implementation of TrasnistionPainter
/// to visualize Oracles on Regsiters between ? and 4 QBit
class OracleTransitionPainter extends TransitionPainter {
  OracleTransitionPainter(super.transition, super.qBitCount);

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
    final points = getPoints(size);
    final int index = transition.params[0];
    final int numInputQBits = transition.params[1];
    assert(index == 0);
    assert(numInputQBits < 2);
    final List<int> ones = transition.params.sublist(2);
    final Paint paint = Paint()..color = Colors.black;
    switch (index) {
      case 0:
        final lines = [
          (start: points[0], end: points[2]),
          (start: points[1], end: points[3]),
        ];
        lines.indexed
            .where((element) => ones.contains(element.$1))
            .forEach((e) => canvas.xLine(e.$2.start, e.$2.end, 8, paint));
        break;
    }
  }

  void _threeQBit(Canvas canvas, Size size) {
    final points = getPoints(size);
    final int index = transition.params[0];
    final int numInputQBits = transition.params[1];
    assert(numInputQBits < 3);
    final List<int> ones = transition.params.sublist(2);
    final Paint paint = Paint()..color = Colors.black;
    switch (index) {
      case 0:
        List<List<({Offset end, Offset start})>> lines = [];
        switch (numInputQBits) {
          case 1:
            lines = [
              [
                (start: points[2], end: points[3]),
                (start: points[6], end: points[7]),
              ],
              [
                (start: points[0], end: points[1]),
                (start: points[4], end: points[5]),
              ],
            ];
            break;
          case 2:
            lines = [
              [(start: points[2], end: points[6])],
              [(start: points[0], end: points[4])],
              [(start: points[3], end: points[7])],
              [(start: points[1], end: points[5])],
            ];
            break;
        }
        lines.indexed
            .where((element) => ones.contains(element.$1))
            .map((e) => e.$2)
            .expand((element) => element)
            .forEach((e) => canvas.xLine(e.start, e.end, 6, paint));
        break;
      case 1:
        final lines = [
          [
            (start: points[2], end: points[6]),
            (start: points[3], end: points[7]),
          ],
          [
            (start: points[0], end: points[4]),
            (start: points[1], end: points[5]),
          ],
        ];
        lines.indexed
            .where((element) => ones.contains(element.$1))
            .map((e) => e.$2)
            .expand((element) => element)
            .forEach((e) => canvas.xLine(e.start, e.end, 6, paint));
        break;
    }
  }

  void _fourQBit(Canvas canvas, Size size) {
    final points = getPoints(size);
    final int index = transition.params[0];
    final int numInputQBits = transition.params[1];
    assert(numInputQBits < 4);
    final List<int> ones = transition.params.sublist(2);
    final Paint paint = Paint()..color = Colors.black;

    switch (index) {
      case 0:
        List<List<({Offset end, Offset start})>> lines = [];
        switch (numInputQBits) {
          case 1:
            lines = [
              [
                (start: points[0], end: points[2]),
                (start: points[4], end: points[6]),
                (start: points[8], end: points[10]),
                (start: points[12], end: points[14]),
              ],
              [
                (start: points[1], end: points[3]),
                (start: points[5], end: points[7]),
                (start: points[9], end: points[11]),
                (start: points[13], end: points[15]),
              ],
            ];
            break;
          case 2:
            lines = [
              [
                (start: points[2], end: points[6]),
                (start: points[10], end: points[14]),
              ],
              [
                (start: points[3], end: points[7]),
                (start: points[11], end: points[15]),
              ],
              [
                (start: points[0], end: points[4]),
                (start: points[8], end: points[12]),
              ],
              [
                (start: points[1], end: points[5]),
                (start: points[9], end: points[13]),
              ],
            ];
            break;
          case 3:
            lines = [
              [
                (start: points[2], end: points[10]),
              ],
              [
                (start: points[3], end: points[11]),
              ],
              [
                (start: points[0], end: points[8]),
              ],
              [
                (start: points[1], end: points[9]),
              ],
              [
                (start: points[6], end: points[14]),
              ],
              [
                (start: points[7], end: points[15]),
              ],
              [
                (start: points[4], end: points[12]),
              ],
              [
                (start: points[5], end: points[13]),
              ],
            ];
            break;
        }
        lines.indexed
            .where((element) => ones.contains(element.$1))
            .map((e) => e.$2)
            .expand((element) => element)
            .forEach((e) => canvas.xLine(e.start, e.end, 6, paint));
        break;
      case 1:
        List<List<({Offset end, Offset start})>> lines = [];
        switch (numInputQBits) {
          case 1:
            lines = [
              [
                (start: points[2], end: points[6]),
                (start: points[3], end: points[7]),
                (start: points[10], end: points[14]),
                (start: points[11], end: points[15]),
              ],
              [
                (start: points[0], end: points[4]),
                (start: points[1], end: points[5]),
                (start: points[8], end: points[12]),
                (start: points[9], end: points[13]),
              ],
            ];
            break;
          case 2:
            lines = [
              [
                (start: points[2], end: points[10]),
                (start: points[3], end: points[11]),
              ],
              [
                (start: points[6], end: points[14]),
                (start: points[7], end: points[15]),
              ],
              [
                (start: points[0], end: points[8]),
                (start: points[1], end: points[9]),
              ],
              [
                (start: points[4], end: points[12]),
                (start: points[5], end: points[13]),
              ],
            ];
            break;
        }
        lines.indexed
            .where((element) => ones.contains(element.$1))
            .map((e) => e.$2)
            .expand((element) => element)
            .forEach((e) => canvas.xLine(e.start, e.end, 6, paint));
        break;
      case 2:
        List<List<({Offset end, Offset start})>> lines = [];
        switch (numInputQBits) {
          case 1:
            lines = [
              [
                (start: points[2], end: points[10]),
                (start: points[3], end: points[11]),
                (start: points[0], end: points[8]),
                (start: points[1], end: points[9]),
              ],
              [
                (start: points[6], end: points[14]),
                (start: points[7], end: points[15]),
                (start: points[4], end: points[12]),
                (start: points[5], end: points[13]),
              ],
            ];
            break;
        }
        lines.indexed
            .where((element) => ones.contains(element.$1))
            .map((e) => e.$2)
            .expand((element) => element)
            .forEach((e) => canvas.xLine(e.start, e.end, 6, paint));
        break;
    }
  }
}
