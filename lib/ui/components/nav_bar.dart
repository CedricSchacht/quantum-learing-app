import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Styled NavBar to use on every page
class NavBar extends StatelessWidget {
  final String currentRoute;
  final tabs = const [
    _RouteNavBarItem(
      route: '/circuit',
      item: _NavBarItem(
        icon: Icons.app_registration_outlined,
        tooltip: "circuit",
        label: "Circuit",
      ),
    ),
    _RouteNavBarItem(
      route: '/code',
      item: _NavBarItem(
        icon: Icons.code,
        tooltip: "code",
        label: "Code",
      ),
    ),
    _RouteNavBarItem(
      route: '/cube',
      item: _NavBarItem(
        icon: Icons.add_to_photos_outlined,
        tooltip: "cube diagram",
        label: "Cube Diagram",
      ),
    ),
    _RouteNavBarItem(
      route: '/vector',
      item: _NavBarItem(
        icon: Icons.bar_chart_outlined,
        tooltip: "vector",
        label: "Vector",
      ),
    ),
  ];

  const NavBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: tabs.map((e) => e.route).toList().indexOf(currentRoute),
      onTap: (value) => context.go(tabs[value].route),
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.teal,
      items: tabs
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e.item.icon),
              label: e.item.label,
              tooltip: e.item.tooltip,
            ),
          )
          .toList(),
    );
  }
}

class _NavBarItem {
  final String tooltip;
  final IconData icon;
  final String label;
  const _NavBarItem({
    required this.icon,
    required this.tooltip,
    required this.label,
  });
}

class _RouteNavBarItem {
  final String route;
  final _NavBarItem item;
  const _RouteNavBarItem({
    required this.route,
    required this.item,
  });
}
