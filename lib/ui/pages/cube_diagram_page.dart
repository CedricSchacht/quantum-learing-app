import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quantenlernapp/bloc/manage_analyse_cubit.dart';
import 'package:quantenlernapp/bloc/manage_simulation_cubit.dart';
import 'package:quantenlernapp/ui/components/analyse_contoll_button_bar.dart';
import 'package:quantenlernapp/ui/components/app_bar.dart';
import 'package:quantenlernapp/ui/components/nav_bar.dart';
import 'package:quantumvisualisation/quantumvisualisation.dart';

class CubeDiagramPage extends StatelessWidget {
  const CubeDiagramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Cube Diagram"),
      bottomNavigationBar: const NavBar(currentRoute: '/cube'),
      body: BlocBuilder<ManageAnalyseCubit, ManageAnalyseState>(
        builder: (context, analyseState) {
          return BlocBuilder<ManageSimulationCubit, ManageSimulationState>(
            builder: (context, simulationState) {
              switch (simulationState.runtimeType) {
                case SimulationStopped:
                  return _SimulationStoppedState();
                case SimulationRunning:
                  return _SimulatingState(
                    simulationState as SimulationRunning,
                    analyseState.stepIndex,
                  );
                default:
                  return const Text("something is wrong");
              }
            },
          );
        },
      ),
    );
  }
}

class _SimulationStoppedState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Simulation is stopped"));
  }
}

class _SimulatingState extends StatelessWidget {
  final SimulationRunning state;
  final int stepIndex;
  const _SimulatingState(this.state, this.stepIndex);
  @override
  Widget build(BuildContext context) {
    if (stepIndex >= state.results.length) {
      return _SimulatingLoadingState();
    }

    final width = MediaQuery.of(context).size.width / 2.5;
    final height = MediaQuery.of(context).size.height - 100.0;
    final diagramPartSize = min(width, height);
    final halfSize = Size(diagramPartSize * 0.7, diagramPartSize * 0.7);
    final transitionSize = Size(diagramPartSize * 0.4, diagramPartSize * 0.4);

    final qBitCount = state.qBitCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StateVectorCube(
                size: halfSize,
                vector: state.results[stepIndex].before,
              ),
              StateTransitionCube(
                  qBitCount: qBitCount,
                  size: transitionSize,
                  transition: state.results[stepIndex].transition),
              StateVectorCube(
                size: halfSize,
                vector: state.results[stepIndex].after,
              ),
            ],
          ),
        ),
        const AnalyseControllButtonBar()
      ],
    );
  }
}

class _SimulatingLoadingState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: SpinKitCircle(
            color: Colors.teal,
          ),
        ),
        AnalyseControllButtonBar(),
      ],
    );
  }
}
