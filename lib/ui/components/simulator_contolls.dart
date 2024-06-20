import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantenlernapp/bloc/manage_analyse_cubit.dart';
import 'package:quantenlernapp/bloc/manage_simulation_cubit.dart';
import 'package:quantenlernapp/main.dart';

/// Group of buttons to start stop and restart the Simulator
/// used in App Bar
class SimulatorControlls extends StatelessWidget {
  const SimulatorControlls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<ManageSimulationCubit>().startSimulation(circuit);
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
          ),
          child: const Icon(Icons.play_arrow_rounded),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            context.read<ManageSimulationCubit>().startSimulation(circuit);
            context.read<ManageAnalyseCubit>().start();
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.orange),
          ),
          child: const Icon(Icons.replay_rounded),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            context.read<ManageSimulationCubit>().stopSimulation();
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
          ),
          child: const Icon(Icons.stop_rounded),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
