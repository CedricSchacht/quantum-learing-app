import 'package:flutter/material.dart';
import 'package:quantumvisualisation/painter/transition/transition_painter.dart';

/// The basic gates differ only in the lineType
/// the position of all lines is the same
/// this abstract class implements the lines using a lineDrawer function that concrete gate transition painter should proveide
abstract class BasicGateTransitionPainter extends TransitionPainter {
  BasicGateTransitionPainter(super.transition, super.qBitCount);

  ///draws the line between the [points] using [lineDrawer]
  ///used for a single QBit register only
  void singleQBit(List<Offset> points, Function(Offset, Offset) lineDrawer) {
    lineDrawer(points[0], points[1]);
  }

  ///draws the line between the [points] using [lineDrawer]
  ///used for a two QBit register only
  void twoQBit(List<Offset> points, Function(Offset, Offset) lineDrawer) {
    if (transition.params.first == 0) {
      lineDrawer(points[0], points[1]);
      lineDrawer(points[2], points[3]);
    } else {
      lineDrawer(points[2], points[0]);
      lineDrawer(points[3], points[1]);
    }
  }

  ///draws the line between the [points] using [lineDrawer]
  ///used for a three QBit register only
  void threeQBit(List<Offset> points, Function(Offset, Offset) lineDrawer) {
    switch (transition.params.first) {
      case 0:
        lineDrawer(points[0], points[1]);
        lineDrawer(points[2], points[3]);
        lineDrawer(points[4], points[5]);
        lineDrawer(points[6], points[7]);
        break;
      case 1:
        lineDrawer(points[2], points[0]);
        lineDrawer(points[3], points[1]);
        lineDrawer(points[6], points[4]);
        lineDrawer(points[7], points[5]);
        break;
      case 2:
        lineDrawer(points[0], points[4]);
        lineDrawer(points[1], points[5]);
        lineDrawer(points[2], points[6]);
        lineDrawer(points[3], points[7]);
        break;
    }
  }

  ///draws the line between the [points] using [lineDrawer]
  ///used for a four QBit register only
  void fourQBit(List<Offset> points, Function(Offset, Offset) lineDrawer) {
    switch (transition.params.first) {
      case 0:
        lineDrawer(points[0], points[1]);
        lineDrawer(points[2], points[3]);
        lineDrawer(points[4], points[5]);
        lineDrawer(points[6], points[7]);

        lineDrawer(points[8], points[9]);
        lineDrawer(points[10], points[11]);
        lineDrawer(points[12], points[13]);
        lineDrawer(points[14], points[15]);
        break;
      case 1:
        lineDrawer(points[2], points[0]);
        lineDrawer(points[3], points[1]);
        lineDrawer(points[6], points[4]);
        lineDrawer(points[7], points[5]);

        lineDrawer(points[10], points[8]);
        lineDrawer(points[11], points[9]);
        lineDrawer(points[14], points[12]);
        lineDrawer(points[15], points[13]);
        break;
      case 2:
        lineDrawer(points[0], points[4]);
        lineDrawer(points[1], points[5]);
        lineDrawer(points[2], points[6]);
        lineDrawer(points[3], points[7]);

        lineDrawer(points[8], points[12]);
        lineDrawer(points[9], points[13]);
        lineDrawer(points[10], points[14]);
        lineDrawer(points[11], points[15]);
        break;
      case 3:
        lineDrawer(points[0], points[8]);
        lineDrawer(points[1], points[9]);
        lineDrawer(points[2], points[10]);
        lineDrawer(points[3], points[11]);

        lineDrawer(points[4], points[12]);
        lineDrawer(points[5], points[13]);
        lineDrawer(points[6], points[14]);
        lineDrawer(points[7], points[15]);
        break;
    }
  }
}
