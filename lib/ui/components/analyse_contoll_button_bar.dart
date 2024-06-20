import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantenlernapp/bloc/manage_analyse_cubit.dart';
import 'package:quantenlernapp/ui/components/navigation_btn.dart';

/// Group of buttons to controll the Analyse Cubit
class AnalyseControllButtonBar extends StatelessWidget {
  const AnalyseControllButtonBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageAnalyseCubit, ManageAnalyseState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavigationBtn(
                  onPressed: context.read<ManageAnalyseCubit>().start,
                  child: const Icon(Icons.home),
                ),
                NavigationBtn(
                  onPressed: context.read<ManageAnalyseCubit>().prev,
                  child: const Text("Prev"),
                ),
                Text(state.stepIndex.toString()),
                NavigationBtn(
                  onPressed: context.read<ManageAnalyseCubit>().next,
                  child: const Text("Next"),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
