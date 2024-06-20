import 'package:flutter/material.dart';
import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumvisualisation/painter/vector/cube_painter.dart';
import 'package:quantumvisualisation/painter/vector/four_qbit_cube_painter.dart';
import 'package:quantumvisualisation/painter/vector/single_qbit_cube_painter.dart';
import 'package:quantumvisualisation/painter/vector/three_qbit_cube_painter.dart';
import 'package:quantumvisualisation/painter/vector/two_qbit_cube_painter.dart';

///Use this Widget to Display a Statevector as Cubediagramm
///[vector] to represent in cube diagram, vector size must be between 2 and 16
///[size] Diemnstion that the Widget will use
class StateVectorCube extends StatelessWidget {
  final Vector vector;
  final Size size;
  const StateVectorCube({
    super.key,
    required this.size,
    required this.vector,
  });

  @override
  Widget build(BuildContext context) {
    CubePainter painter;
    switch (vector.size) {
      case 2:
        painter = SingleQBitCubePainter(vector);
        break;
      case 4:
        painter = TwoQBitCubePainter(vector);
        break;
      case 8:
        painter = ThreeQBitCubePainter(vector);
        break;
      case 16:
        painter = FourQBitCubePainter(vector);
        break;
      default:
        return Center(
          child: Text("Vector of size ${vector.size} is not supported"),
        );
    }
    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        size: size,
        painter: painter,
      ),
    );
  }
}
