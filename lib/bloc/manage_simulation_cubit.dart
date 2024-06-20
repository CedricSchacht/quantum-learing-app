import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantumsimulator/quantumsimulator.dart';
import 'package:quantumsimulator/simulation_result.dart';

/// Union Type over posible Simulation States
abstract class ManageSimulationState {}

/// State if Simulation is currently not running
class SimulationStopped extends ManageSimulationState {}

/// State if Simulation is running
/// [results] List of results since simulation is started
/// [qBitCount] number of qbits in the circuit that is currently simulated
class SimulationRunning extends ManageSimulationState {
  final List<SimulationResult> results;
  final int qBitCount;
  SimulationRunning(this.results, this.qBitCount);
}

/// Global State Manager according to BLoC Cubit pattern
/// used in Cube diagram Page
class ManageSimulationCubit extends Cubit<ManageSimulationState> {
  /// Simulator used to calculate results
  final QuantenSimulator _simulator = QuantenSimulator();
  StreamSubscription<SimulationResult>? _streamSubscription;

  ManageSimulationCubit() : super(SimulationStopped());

  /// starts Simulation with new [circuit]
  /// prevois simulations will be stopped
  void startSimulation(Circuit circuit) {
    emit(SimulationRunning([], circuit.qBitCount));
    _simulator.stop();
    _streamSubscription?.cancel();
    _streamSubscription = _simulator.calculate(circuit).listen(_resultListener);
  }

  /// stops current simulation
  /// emits SimulationStopped state
  void stopSimulation() {
    _simulator.stop();
    _streamSubscription?.cancel();
    _streamSubscription = null;
    emit(SimulationStopped());
  }

  /// listener updating the SimulationState on every result
  void _resultListener(SimulationResult result) {
    if (state is SimulationRunning) {
      emit(SimulationRunning(
        [...(state as SimulationRunning).results, result],
        (state as SimulationRunning).qBitCount,
      ));
    }
  }
}
