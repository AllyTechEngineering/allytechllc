import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/site_content.dart';
import 'portfolio_card.dart';

class SiteCardGrid extends StatelessWidget {
  const SiteCardGrid({
    super.key,
    required this.title,
    required this.items,
    required this.routePrefix,
    this.showSummary = false,
  });

  final String title;
  final List<NavItem> items;
  final String routePrefix;
  final bool showSummary;

  static const double _maxContentWidth = 1280;
  static const double _cardSpacing = 24;
  static const double _minimumCardWidth = 260;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewportWidth = MediaQuery.sizeOf(context).width;

    final horizontalPadding = switch (viewportWidth) {
      < 600 => 16.0,
      < 1024 => 24.0,
      _ => 32.0,
    };

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.displayMedium),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  final availableWidth = constraints.maxWidth;

                  final columnCount =
                      ((availableWidth + _cardSpacing) /
                              (_minimumCardWidth + _cardSpacing))
                          .floor()
                          .clamp(1, 4)
                          .toInt();

                  final cardWidth =
                      (availableWidth - _cardSpacing * (columnCount - 1)) /
                      columnCount;

                  return Wrap(
                    spacing: _cardSpacing,
                    runSpacing: _cardSpacing,
                    children: [
                      for (final item in items)
                        SizedBox(
                          width: cardWidth,
                          child: PortfolioCard(
                            title: item.title,
                            actionText: 'Explore ${item.title}',
                            description: showSummary ? item.summary : null,
                            imagePath: item.imagePath,
                            onTap: () => context.go(
                              item.route ?? '$routePrefix/${item.slug}',
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
