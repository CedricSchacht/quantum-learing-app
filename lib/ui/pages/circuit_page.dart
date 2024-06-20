import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quantenlernapp/bloc/manage_analyse_cubit.dart';
import 'package:quantenlernapp/bloc/manage_simulation_cubit.dart';
import 'package:quantenlernapp/main.dart';
import 'package:quantenlernapp/ui/components/app_bar.dart';
import 'package:quantenlernapp/ui/components/nav_bar.dart';
import 'package:quantenlernapp/ui/components/navigation_btn.dart';
import 'package:quantumsimulator/quantumsimulator.dart';

/// Page to display Circuit (not yet implemented)
class CircuitPage extends StatelessWidget {
  const CircuitPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, Circuit> circuits = {
      "Random": Circuit(
        initial: Vector([
          ComplexDouble.one(),
          ComplexDouble(),
        ]),
        steps: [
          H(0),
          MeasureStep(index: 0),
        ],
      ),
      "EPR-Paar": Circuit(
        initial: Vector([
          ComplexDouble.one(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
        ]),
        steps: [
          H(0),
          CX(0, 1),
          MeasureStep(index: 0),
        ],
      ),
      "Deutsch with f(x) = x": Circuit(
        initial: Vector([
          ComplexDouble(),
          ComplexDouble.one(),
          ComplexDouble(),
          ComplexDouble(),
        ]),
        steps: [
          H(0),
          H(1),
          Oracle(index: 0, numInputQBits: 1, f: (x) => x[0]),
          H(0),
          MeasureStep(index: 0),
        ],
      ),
      "Deutsch-Jozsa with f(x_1, x_2) = true": Circuit(
        initial: Vector([
          ComplexDouble.one(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
        ]),
        steps: [
          X(2),
          H(0),
          H(1),
          H(2),
          Oracle(
            index: 0,
            numInputQBits: 2,
            f: (x) => true,
          ),
          H(0),
          H(1),
          MeasureStep(index: 0),
          MeasureStep(index: 1),
        ],
      ),
      "Deutsch-Jozsa with f(x_1, x_2) = (x_1 && x_2) || (!x_1 && !x_2)":
          Circuit(
        initial: Vector([
          ComplexDouble.one(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
          ComplexDouble(),
        ]),
        steps: [
          X(2),
          H(0),
          H(1),
          H(2),
          Oracle(
            index: 0,
            numInputQBits: 2,
            f: (x) => (x[0] && x[1]) || (!x[0] && !x[1]),
          ),
          H(0),
          H(1),
          MeasureStep(index: 0),
          MeasureStep(index: 1),
        ],
      ),
    };
    return Scaffold(
      appBar: appBar(title: "Circuit"),
      bottomNavigationBar: const NavBar(currentRoute: "/circuit"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Example Ciruits"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: circuits.entries.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NavigationBtn(
                      child: Text(e.key),
                      onPressed: () {
                        circuit = e.value;
                        context.read<ManageAnalyseCubit>().start();
                        context.read<ManageSimulationCubit>().stopSimulation();
                        context.go('/cube');
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
