import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/simulation_result.dart';

void main() {
  group('test simulator', () {
    test('simple Gates', () async {
      final Vector initial = Vector([
        // ..    ..
        // 00 01 10 11
        // ..       ..
        ComplexDouble.one(),
        ComplexDouble(),
        ComplexDouble(),
        ComplexDouble(),
      ]);
      final Circuit circuit = Circuit(
        initial: initial,
        steps: [
          H(0),
          CX(0, 1),
        ],
      );
      QuantenSimulator sim = QuantenSimulator();
      var results = sim.calculate(circuit);
      var endResult = await results.elementAt(1);
      final expected = Vector([
        ComplexDouble(real: sqrt1_2),
        ComplexDouble(),
        ComplexDouble(),
        ComplexDouble(real: sqrt1_2),
      ]);
      expect(endResult.after, expected);
    });

    test('test measurement', () async {
      final Vector initial = Vector([
        // ..    ..
        // 00 01 10 11
        // ..       ..
        ComplexDouble.one(),
        ComplexDouble(),
        ComplexDouble(),
        ComplexDouble(),
      ]);
      final Circuit circuit = Circuit(
        initial: initial,
        steps: [
          H(0),
          CX(0, 1),
          MeasureStep(index: 0),
        ],
      );
      QuantenSimulator sim = QuantenSimulator();
      var results = sim.calculate(circuit);
      var endResult = await results.elementAt(2);
      expect(endResult.runtimeType, SimulationMeasureResult);
      expect((endResult as SimulationMeasureResult).p0, moreOrLessEquals(0.5));
    });
  });
}
