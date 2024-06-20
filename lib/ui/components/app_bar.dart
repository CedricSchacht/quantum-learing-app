import 'package:flutter/material.dart';
import 'package:quantenlernapp/ui/components/simulator_contolls.dart';

/// Styled AppBar Widget to use on every page
AppBar appBar({required String title}) {
  return AppBar(
    backgroundColor: Colors.teal,
    title: Row(
      children: [
        Expanded(child: Text(title)),
        SimulatorControlls(),
      ],
    ),
  );
}
