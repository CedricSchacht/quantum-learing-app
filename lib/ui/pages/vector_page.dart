import 'package:flutter/material.dart';
import 'package:quantenlernapp/ui/components/app_bar.dart';
import 'package:quantenlernapp/ui/components/nav_bar.dart';

/// Page to display BarChart of the simulation Result Vectors (not yet implemented)
class VectorPage extends StatelessWidget {
  const VectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Vector"),
      bottomNavigationBar: const NavBar(currentRoute: "/vector"),
      body: const Text("Vector"),
    );
  }
}
