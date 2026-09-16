import 'package:flutter/material.dart';
import 'adaptive_navigation.dart';
import 'custom_app_bar.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.body,
  });

  final String title;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final isWide = AdaptiveNavigation.isWideLayout(context);
    final nav = AdaptiveNavigation(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
    );

    return Scaffold(
      appBar: CustomAppBar(title: title),
      drawer: isWide ? null : nav,
      body: isWide
          ? Row(
              children: [
                nav,
                const VerticalDivider(width: 1),
                Expanded(child: body),
              ],
            )
          : body,
    );
  }
}