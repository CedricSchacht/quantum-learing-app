import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quantenlernapp/bloc/manage_analyse_cubit.dart';
import 'package:quantenlernapp/bloc/manage_simulation_cubit.dart';
import 'package:quantenlernapp/ui/pages/circuit_page.dart';
import 'package:quantenlernapp/ui/pages/code_page.dart';
import 'package:quantenlernapp/ui/pages/cube_diagram_page.dart';
import 'package:quantenlernapp/ui/pages/vector_page.dart';
import 'package:quantumsimulator/quantumsimulator.dart';

/// main entry point for the app
void main() {
  runApp(const MyApp());
}

var circuit = Circuit(
  initial: Vector([
    ComplexDouble.one(),
    ComplexDouble(),
  ]),
  steps: [
    H(0),
    MeasureStep(index: 0),
  ],
);

/// route manager
final GoRouter _goRouter = GoRouter(
  initialLocation: '/cube',
  routes: [
    GoRoute(
      path: '/circuit',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: CircuitPage(),
      ),
    ),
    GoRoute(
      path: '/cube',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: CubeDiagramPage(),
      ),
    ),
    GoRoute(
      path: '/vector',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: VectorPage(),
      ),
    ),
    GoRoute(
      path: '/code',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: CodePage(),
      ),
    ),
  ],
);

/// Main Widget
/// providing Analyse Cubit and Simulation Cubit for the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ManageAnalyseCubit()),
        BlocProvider(create: (context) => ManageSimulationCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: _goRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
