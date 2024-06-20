import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/state_transition.dart';
import 'package:quantumvisualisation/quantumvisualisation.dart';

void main() {
  group('measure transition tests', () {
    var combinations = [
      [1, 0],
      [2, 0],
      [2, 1],
      [3, 0],
      [3, 1],
      [3, 2],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
    ];
    for (var combination in combinations) {
      testWidgets('measure transition test $combination', (tester) async {
        await tester.pumpWidget(
          Center(
            child: StateTransitionCube(
              qBitCount: combination[0],
              size: const Size.square(400.0),
              transition: StateTransition(
                TransitionType.MEASURE,
                [
                  combination[1],
                ],
              ),
            ),
          ),
        );
        await expectLater(
          find.byType(Center),
          matchesGoldenFile('measure_transition_test_$combination.png'),
        );
      });
    }
  });
  group('x transition tests', () {
    var combinations = [
      [1, 0],
      [2, 0],
      [2, 1],
      [3, 0],
      [3, 1],
      [3, 2],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
    ];
    for (var combination in combinations) {
      testWidgets('x transition test $combination', (tester) async {
        await tester.pumpWidget(
          Center(
            child: StateTransitionCube(
              qBitCount: combination[0],
              size: const Size.square(400.0),
              transition: StateTransition(
                TransitionType.X,
                [
                  combination[1],
                ],
              ),
            ),
          ),
        );
        await expectLater(
          find.byType(Center),
          matchesGoldenFile('x_transition_test_$combination.png'),
        );
      });
    }
  });
  group('y transition tests', () {
    var combinations = [
      [1, 0],
      [2, 0],
      [2, 1],
      [3, 0],
      [3, 1],
      [3, 2],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
    ];
    for (var combination in combinations) {
      testWidgets('y transition test $combination', (tester) async {
        await tester.pumpWidget(
          Center(
            child: StateTransitionCube(
              qBitCount: combination[0],
              size: const Size.square(400.0),
              transition: StateTransition(
                TransitionType.Y,
                [
                  combination[1],
                ],
              ),
            ),
          ),
        );
        await expectLater(
          find.byType(Center),
          matchesGoldenFile('y_transition_test_$combination.png'),
        );
      });
    }
  });
  group('z transition tests', () {
    var combinations = [
      [1, 0],
      [2, 0],
      [2, 1],
      [3, 0],
      [3, 1],
      [3, 2],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
    ];
    for (var combination in combinations) {
      testWidgets('z transition test $combination', (tester) async {
        await tester.pumpWidget(
          Center(
            child: StateTransitionCube(
              qBitCount: combination[0],
              size: const Size.square(400.0),
              transition: StateTransition(
                TransitionType.Z,
                [
                  combination[1],
                ],
              ),
            ),
          ),
        );
        await expectLater(
          find.byType(Center),
          matchesGoldenFile('z_transition_test_$combination.png'),
        );
      });
    }
  });
  group('h transition tests', () {
    var combinations = [
      [1, 0],
      [2, 0],
      [2, 1],
      [3, 0],
      [3, 1],
      [3, 2],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
    ];
    for (var combination in combinations) {
      testWidgets('h transition test $combination', (tester) async {
        await tester.pumpWidget(
          Center(
            child: StateTransitionCube(
              qBitCount: combination[0],
              size: const Size.square(400.0),
              transition: StateTransition(
                TransitionType.H,
                [
                  combination[1],
                ],
              ),
            ),
          ),
        );
        await expectLater(
          find.byType(Center),
          matchesGoldenFile('h_transition_test_$combination.png'),
        );
      });
    }
  });
  group('cx transition tests', () {
    var combinations = [
      [2, 0, 1],
      [2, 1, 0],
      [3, 0, 1],
      [3, 0, 2],
      [3, 1, 0],
      [3, 1, 2],
      [4, 0, 1],
      [4, 0, 2],
      [4, 0, 3],
      [4, 1, 0],
      [4, 1, 2],
      [4, 1, 3],
      [4, 2, 0],
      [4, 2, 1],
      [4, 2, 3],
      [4, 3, 0],
      [4, 3, 1],
      [4, 3, 2],
    ];
    for (var combination in combinations) {
      testWidgets('cx transition test $combination', (tester) async {
        await tester.pumpWidget(
          Center(
            child: StateTransitionCube(
              qBitCount: combination[0],
              size: const Size.square(400.0),
              transition: StateTransition(
                TransitionType.CX,
                [
                  combination[1],
                  combination[2],
                ],
              ),
            ),
          ),
        );
        await expectLater(
          find.byType(Center),
          matchesGoldenFile('cx_transition_test_$combination.png'),
        );
      });
    }
  });
  group('ccx transition tests', () {
    var combinations = [
      [3, 0, 1, 2],
      [3, 0, 2, 1],
      [3, 1, 0, 2],
      [3, 1, 2, 0],
      [3, 2, 0, 1],
      [3, 2, 1, 0],
      [4, 0, 1, 2],
      [4, 0, 1, 3],
      [4, 0, 2, 1],
      [4, 0, 2, 3],
      [4, 0, 3, 1],
      [4, 0, 3, 2],
      [4, 1, 0, 2],
      [4, 1, 0, 3],
      [4, 1, 2, 0],
      [4, 1, 2, 3],
      [4, 1, 3, 0],
      [4, 1, 3, 2],
      [4, 2, 0, 1],
      [4, 2, 0, 3],
      [4, 2, 1, 0],
      [4, 2, 1, 3],
      [4, 2, 3, 0],
      [4, 2, 3, 1],
      [4, 3, 0, 1],
      [4, 3, 0, 2],
      [4, 3, 1, 1],
      [4, 3, 1, 2],
      [4, 3, 2, 0],
      [4, 3, 2, 1],
    ];
    for (var combination in combinations) {
      testWidgets('ccx transition test $combination', (tester) async {
        await tester.pumpWidget(
          Center(
            child: StateTransitionCube(
              qBitCount: combination[0],
              size: const Size.square(400.0),
              transition: StateTransition(
                TransitionType.CCX,
                [
                  combination[1],
                  combination[2],
                  combination[3],
                ],
              ),
            ),
          ),
        );
        await expectLater(
          find.byType(Center),
          matchesGoldenFile('ccx_transition_test_$combination.png'),
        );
      });
    }
  });

  group('oracle transition tests', () {
    var combinations = [
      [2, 0, 1, 0],
      [2, 0, 1, 1],
      [2, 0, 1, 0, 1],
      //
      [3, 0, 1, 0],
      [3, 0, 1, 1],
      [3, 0, 1, 0, 1],
      //
      [3, 0, 2, 0],
      [3, 0, 2, 1],
      [3, 0, 2, 2],
      [3, 0, 2, 3],
      [3, 0, 2, 0, 1, 2, 3],
      //
      [3, 1, 1, 0],
      [3, 1, 1, 1],
      [3, 1, 1, 0, 1],
      //
      [4, 0, 1, 0],
      [4, 0, 1, 1],
      [4, 0, 1, 0, 1],
      //
      [4, 0, 2, 0],
      [4, 0, 2, 1],
      [4, 0, 2, 2],
      [4, 0, 2, 3],
      [4, 0, 2, 0, 1, 2, 3],
      //
      [4, 0, 3, 0],
      [4, 0, 3, 1],
      [4, 0, 3, 2],
      [4, 0, 3, 3],
      [4, 0, 3, 4],
      [4, 0, 3, 5],
      [4, 0, 3, 6],
      [4, 0, 3, 7],
      [4, 0, 3, 0, 1, 2, 3, 4, 5, 6, 7],
      //
      [4, 1, 1, 0],
      [4, 1, 1, 1],
      [4, 1, 1, 0, 1],
      //
      [4, 1, 2, 0],
      [4, 1, 2, 1],
      [4, 1, 2, 2],
      [4, 1, 2, 3],
      [4, 1, 2, 0, 1, 2, 3],
      //
      [4, 2, 1, 0],
      [4, 2, 1, 1],
      [4, 2, 1, 0, 1],
    ];
    for (var combination in combinations) {
      testWidgets('oracle transition test $combination', (tester) async {
        await tester.pumpWidget(
          Center(
            child: StateTransitionCube(
              qBitCount: combination[0],
              size: const Size.square(400.0),
              transition: StateTransition(
                TransitionType.ORACLE,
                [
                  combination[1],
                  combination[2],
                  combination[3],
                ],
              ),
            ),
          ),
        );
        await expectLater(
          find.byType(Center),
          matchesGoldenFile('oracle_transition_test_$combination.png'),
        );
      });
    }
  });
  group("State Cube Tests", () {
    testWidgets('Single Qbit Register', (WidgetTester tester) async {
      final Vector vec = Vector([
        ComplexDouble(real: sqrt1_2),
        ComplexDouble(imag: sqrt1_2),
      ]);
      await tester.pumpWidget(Center(
        child: StateVectorCube(
          size: const Size.square(400.0),
          vector: vec,
        ),
      ));
      await expectLater(
        find.byType(Center),
        matchesGoldenFile('single_qbit_register_cube.png'),
      );
    });

    testWidgets('Two Qbit Register', (WidgetTester tester) async {
      final Vector vec = Vector([
        ComplexDouble(real: sqrt1_2),
        ComplexDouble(),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(real: 0.2, imag: 0.2),
      ]);
      await tester.pumpWidget(Center(
        child: StateVectorCube(
          size: const Size.square(400.0),
          vector: vec,
        ),
      ));
      await expectLater(
        find.byType(Center),
        matchesGoldenFile('two_qbit_register_cube.png'),
      );
    });

    testWidgets('Three Qbit Register', (WidgetTester tester) async {
      final Vector vec = Vector([
        ComplexDouble(real: sqrt1_2),
        ComplexDouble(),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(),
        ComplexDouble(real: sqrt1_2),
        ComplexDouble(real: 0.2, imag: 0.2),
      ]);
      await tester.pumpWidget(Center(
        child: StateVectorCube(
          size: const Size.square(400.0),
          vector: vec,
        ),
      ));
      await expectLater(
        find.byType(Center),
        matchesGoldenFile('three_qbit_register_cube.png'),
      );
    });

    testWidgets('Four Qbit Register', (WidgetTester tester) async {
      final Vector vec = Vector([
        ComplexDouble(real: sqrt1_2),
        ComplexDouble(),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(),
        ComplexDouble(real: sqrt1_2),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(),
        ComplexDouble(real: sqrt1_2),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(real: 0.2, imag: 0.2),
        ComplexDouble(),
        ComplexDouble(real: sqrt1_2),
      ]);
      await tester.pumpWidget(Center(
        child: StateVectorCube(
          size: const Size.square(400.0),
          vector: vec,
        ),
      ));
      await expectLater(
        find.byType(Center),
        matchesGoldenFile('four_qbit_register_cube.png'),
      );
    });
  });
}
