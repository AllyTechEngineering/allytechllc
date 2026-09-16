import 'package:flutter/material.dart';

class NavDestination {
  const NavDestination({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;
}

const List<NavDestination> appNavDestinations = [
  NavDestination(label: 'Home', icon: Icons.home, route: '/'),
  NavDestination(label: 'Services', icon: Icons.build, route: '/services'),
  NavDestination(label: 'Projects', icon: Icons.work, route: '/projects'),
  NavDestination(label: 'About', icon: Icons.info, route: '/about'),
  NavDestination(label: 'Privacy', icon: Icons.privacy_tip, route: '/privacy'),
];

/// Drawer for mobile widths, NavigationRail for tablet/desktop.
/// Breakpoint matches Material 3 guidance (600px), per arch.md.
class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  static bool isWideLayout(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600;

  @override
  Widget build(BuildContext context) {
    return isWideLayout(context) ? _buildRail(context) : _buildDrawer(context);
  }

  Widget _buildRail(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      labelType: NavigationRailLabelType.all,
      destinations: appNavDestinations
          .map((d) => NavigationRailDestination(
                icon: Icon(d.icon),
                label: Text(d.label),
              ))
          .toList(),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          for (int i = 0; i < appNavDestinations.length; i++)
            ListTile(
              leading: Icon(appNavDestinations[i].icon),
              title: Text(appNavDestinations[i].label),
              selected: i == selectedIndex,
              onTap: () {
                Navigator.of(context).pop();
                onDestinationSelected(i);
              },
            ),
        ],
      ),
    );
  }
}