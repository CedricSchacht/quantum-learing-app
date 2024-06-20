import 'package:flutter/material.dart';
import 'package:quantenlernapp/ui/components/app_bar.dart';
import 'package:quantenlernapp/ui/components/nav_bar.dart';

/// Page to build circuit by code (not yet implemented)
class CodePage extends StatelessWidget {
  const CodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Code"),
      bottomNavigationBar: const NavBar(currentRoute: "/code"),
      body: const Text("Code"),
    );
  }
}
