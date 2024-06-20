import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/state_transition.dart';

void main() {
  QuantenSimulator simulator = QuantenSimulator();
  group("Gate simulation Test", () {
    group('Hadamard', () {
      test('Gate on single qbit register', () async {
        Circuit circuit = Circuit(
          initial: Vector([ComplexDouble.one(), ComplexDouble()]),
          steps: [
            H(0),
          ],
        );
        var res = await simulator.calculate(circuit).first;
        expect(res.before, Vector([ComplexDouble.one(), ComplexDouble()]));
        expect(res.transition.type, TransitionType.H);
        expect(res.transition.params, [0]);
        expect(
          res.after,
          Vector(
            [
              ComplexDouble(real: sqrt1_2),
              ComplexDouble(real: sqrt1_2),
            ],
          ),
        );
      });
    });
    group('Pauli-X', () {
      test('Gate on single qbit register', () async {
        Circuit circuit = Circuit(
          initial: Vector([ComplexDouble.one(), ComplexDouble()]),
          steps: [
            X(0),
          ],
        );
        var res = await simulator.calculate(circuit).first;
        expect(
          res.after,
          Vector(
            [
              ComplexDouble(),
              ComplexDouble.one(),
            ],
          ),
        );
      });
    });

    group('Pauli-Y', () {
      test('Gate on single qbit register', () async {
        Circuit circuit = Circuit(
          initial: Vector([ComplexDouble.one(), ComplexDouble()]),
          steps: [
            Y(0),
          ],
        );
        var res = await simulator.calculate(circuit).first;
        expect(
          res.after,
          Vector(
            [
              ComplexDouble(),
              ComplexDouble.i(),
            ],
          ),
        );
      });
    });

    group('Pauli-Z', () {
      test('Gate on single qbit register', () async {
        Circuit circuit = Circuit(
          initial: Vector([
            ComplexDouble(real: sqrt1_2),
            ComplexDouble(real: sqrt1_2),
          ]),
          steps: [
            Z(0),
          ],
        );
        var res = await simulator.calculate(circuit).first;
        expect(
          res.after,
          Vector(
            [
              ComplexDouble(real: sqrt1_2),
              ComplexDouble(real: -sqrt1_2),
            ],
          ),
        );
      });
    });

    group('CX', () {
      test('Gate on single qbit register', () async {
        Circuit circuit = Circuit(
          initial: Vector([
            ComplexDouble(),
            ComplexDouble(),
            ComplexDouble.one(),
            ComplexDouble(),
          ]),
          steps: [
            CX(0, 1),
          ],
        );
        var res = await simulator.calculate(circuit).first;
        expect(
          res.after,
          Vector(
            [
              ComplexDouble(),
              ComplexDouble(),
              ComplexDouble(),
              ComplexDouble.one(),
            ],
          ),
        );
      });
    });

    group('CCX', () {
      test('Gate on single qbit register', () async {
        Circuit circuit = Circuit(
          initial: Vector([
            ComplexDouble(),
            ComplexDouble(),
            ComplexDouble(),
            ComplexDouble(),
            ComplexDouble(),
            ComplexDouble(),
            ComplexDouble.one(),
            ComplexDouble(),
          ]),
          steps: [
            CCX(0, 1, 2),
          ],
        );
        var res = await simulator.calculate(circuit).first;
        expect(
            res.after,
            Vector([
              ComplexDouble(),
              ComplexDouble(),
              ComplexDouble(),
              ComplexDouble(),
              ComplexDouble(),
              ComplexDouble(),
              ComplexDouble(),
              ComplexDouble.one(),
            ]));
      });
    });

    group('CU', () {
      test('Gate on single qbit register', () async {
        expect(CU(0, X(1).matrix).matrix, CX(0, 1).matrix);
      });
    });

    group('Oracle', () {
      test('Gate on single qbit register', () async {
        Circuit circuit = Circuit(
          initial: Vector([
            ComplexDouble.one(),
            ComplexDouble(),
            ComplexDouble(),
            ComplexDouble(),
          ]),
          steps: [
            Oracle(
              index: 0,
              numInputQBits: 1,
              f: (inputs) => true,
            ),
          ],
        );
        var res = await simulator.calculate(circuit).first;
        expect(
            res.after,
            Vector([
              ComplexDouble(),
              ComplexDouble.one(),
              ComplexDouble(),
              ComplexDouble(),
            ]));
      });
    });
  });
}
