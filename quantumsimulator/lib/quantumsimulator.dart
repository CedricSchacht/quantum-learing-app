import 'dart:isolate';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:quantumsimulator/circuit.dart';
import 'package:quantumsimulator/gatesteps/gate_step.dart';
import 'package:quantumsimulator/linalg/complex_double.dart';
import 'package:quantumsimulator/linalg/matrix.dart';
import 'package:quantumsimulator/linalg/vector.dart';
import 'package:quantumsimulator/simulation_result.dart';
import 'package:quantumsimulator/step.dart';

export 'package:quantumsimulator/circuit.dart';
export 'package:quantumsimulator/step.dart';
export 'package:quantumsimulator/linalg/matrix.dart';
export 'package:quantumsimulator/linalg/vector.dart';
export 'package:quantumsimulator/linalg/complex_double.dart';
export 'package:quantumsimulator/gatesteps/gate_step.dart';
export 'package:quantumsimulator/gatesteps/h.dart';
export 'package:quantumsimulator/gatesteps/x.dart';
export 'package:quantumsimulator/gatesteps/y.dart';
export 'package:quantumsimulator/gatesteps/z.dart';
export 'package:quantumsimulator/gatesteps/cx.dart';
export 'package:quantumsimulator/gatesteps/ccx.dart';
export 'package:quantumsimulator/gatesteps/oracle.dart';
export 'package:quantumsimulator/gatesteps/controlled_u.dart';

/// QuantenSimulator is used to calculate the Statevectors after every step
class QuantenSimulator {
  /// worker is used so that the heavy calculations in an seperate isolate
  Isolate? _worker;

  /// streams the Results that the worker calculates
  /// if a worker is already calculation, it will be stopped before new calculation is started
  Stream<SimulationResult> calculate(Circuit circuit) async* {
    _worker?.kill(priority: Isolate.immediate);
    ReceivePort receivePort = ReceivePort();
    _worker = await Isolate.spawn<_CalcluatorModel>(
      _calculate,
      _CalcluatorModel(sendPort: receivePort.sendPort, circuit: circuit),
    );
    yield* receivePort.cast<SimulationResult>();
  }

  /// stop can be used to kill the worker isolate
  void stop() => _worker?.kill(priority: Isolate.immediate);

  /// async calculate is called in worker
  /// [model] contains the Circuit and a SendPort
  /// results are returned by SendPort in model
  void _calculate(_CalcluatorModel model) async {
    try {
      Vector before = model.circuit.initial;
      late Vector after;
      for (var step in model.circuit.steps) {
        final result = _calculateStep(before, step, model.circuit.qBitCount);
        after = result.after;
        model.sendPort.send(result);
        before = after;
      }
    } on AssertionError catch (e) {
      debugPrintStack(stackTrace: e.stackTrace);
    }
  }

  /// calculates a single step
  /// [before] contains the state as input for the step
  /// [step] either a measurement or a gate step
  /// [qBitCount] number of qbits in current Circuit
  SimulationResult _calculateStep(Vector before, Step step, int qBitCount) {
    if (step is GateStep) {
      return _calculateGateStep(before, step, qBitCount);
    } else if (step is MeasureStep) {
      return _calculateMeasureStep(before, step, qBitCount);
    } else {
      throw Exception("Unknown Step type: ${step.runtimeType}");
    }
  }

  /// calculates a single step if it is a gatestep
  /// [before] contains the state as input for the step
  /// [gateStep] contains the matrix for the gate calculation
  /// [qBitCount] number of qbits in current Circuit
  SimulationResult _calculateGateStep(
    Vector before,
    GateStep gateStep,
    int qBitCount,
  ) {
    final emptyL = pow(2, gateStep.index).round();
    final gateSize = _affectedQBitCount(gateStep.matrix);
    final emptyR = pow(2, qBitCount - gateStep.index - gateSize).round();
    final idL = Matrix.id(emptyL);
    final gate = gateStep.matrix;
    final idR = Matrix.id(emptyR);
    final filledMatrix = idL.kron(gate).kron(idR);
    final result = SimulationResult(
        before: before,
        transition: gateStep.transition,
        after: filledMatrix.times(before));
    return result;
  }

  /// calculates a single step if it is a measure step
  /// [before] contains the state as input for the step
  /// [measureStep] instruction which qbit shall be measured
  /// [qBitCount] number of qbits in current Circuit
  SimulationMeasureResult _calculateMeasureStep(
    Vector before,
    MeasureStep measureStep,
    int qBitCount,
  ) {
    double p0 = 0.0;
    double p1 = 0.0;
    for (var i = 0; i < before.size; i++) {
      if (_isBitSet(i, qBitCount, measureStep.index)) {
        p0 += before.elements[i].r * before.elements[i].r;
      } else {
        p1 += before.elements[i].r * before.elements[i].r;
      }
    }
    bool measureResult = Random().nextDouble() > p0;
    ComplexDouble faktor;
    if (measureResult) {
      faktor = ComplexDouble(real: 1 / sqrt(1 - p0));
    } else {
      faktor = ComplexDouble(real: 1 / sqrt(p0));
    }
    List<ComplexDouble> elements = [];
    for (var i = 0; i < before.size; i++) {
      if (_isBitSet(i, qBitCount, measureStep.index) != measureResult) {
        elements.add(before.elements[i] * faktor);
      } else {
        elements.add(ComplexDouble());
      }
    }
    final result = SimulationMeasureResult(
      p0: p0,
      p1: p1,
      before: before,
      transition: measureStep.transition,
      after: Vector(elements),
    );
    return result;
  }

  /// helper method
  /// [n] integer to check if a bit is set on
  /// [length] padding with '0' if n is to small
  /// [index] which bit shall be checked
  bool _isBitSet(int n, int length, int index) {
    return n.toRadixString(2).padLeft(length, '0')[index] == "1";
  }

  /// helper method
  /// calculates the number of qbits a matrix affects
  /// asserts that a matrix is of size 2^n x 2^n
  int _affectedQBitCount(Matrix matrix) {
    var res = (log(matrix.numColumns) / log(2)).round();
    assert(pow(2, res).round() == matrix.numColumns);
    assert(matrix.numColumns == matrix.numRows);
    return res;
  }
}

/// wrapper class
/// for [sendPort] and [circuit]
class _CalcluatorModel {
  final SendPort sendPort;
  final Circuit circuit;
  _CalcluatorModel({required this.sendPort, required this.circuit});
}
