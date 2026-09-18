import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'adapt_nav.dart';
import 'custom_app_bar.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    super.key,
    required this.title,
    required this.navigationShell,
  });

  final String title;
  final StatefulNavigationShell navigationShell;

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = AdaptiveNavigation.isWideLayout(context);
    final nav = AdaptiveNavigation(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _onDestinationSelected,
    );

    return Scaffold(
      appBar: CustomAppBar(title: title, getToolBarHeight: kToolbarHeight),
      drawer: isWide ? null : nav,
      body: isWide
          ? Row(
              children: [
                nav,
                const VerticalDivider(width: 1),
                Expanded(child: navigationShell),
              ],
            )
          : navigationShell,
    );
  }
}