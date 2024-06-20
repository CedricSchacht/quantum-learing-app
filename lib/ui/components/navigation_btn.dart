import 'package:flutter/material.dart';

/// Styled Button vor navigation inside Analyse pages
class NavigationBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const NavigationBtn({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.teal),
        ),
        child: child,
      ),
    );
  }
}
