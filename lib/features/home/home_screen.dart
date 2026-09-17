import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/site_content.dart';
import '../../widgets/portfolio_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const double _maxContentWidth = 1280;
  static const double _cardSpacing = 24;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: _maxContentWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Services',
                style: theme.textTheme.displayMedium,
              ),

              const SizedBox(height: 24),

              LayoutBuilder(
                builder: (context, constraints) {
                  final columnCount =
                      _getColumnCount(constraints.maxWidth);

                  final totalSpacing =
                      _cardSpacing * (columnCount - 1);

                  final cardWidth =
                      (constraints.maxWidth - totalSpacing) /
                          columnCount;

                  return Wrap(
                    spacing: _cardSpacing,
                    runSpacing: _cardSpacing,
                    children: [
                      for (final item in serviceItems)
                        SizedBox(
                          width: cardWidth,
                          child: PortfolioCard(
                            title: item.title,
                            actionText: 'Explore ${item.title}',
                            onTap: () {
                              context.go(
                                '/services/${item.slug}',
                              );
                            },
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

  int _getColumnCount(double width) {
    if (width >= 1200) {
      return 4;
    }

    if (width >= 900) {
      return 3;
    }

    if (width >= 600) {
      return 2;
    }

    return 1;
  }
}