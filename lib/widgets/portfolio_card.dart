import 'package:flutter/material.dart';

class PortfolioCard extends StatefulWidget {
  const PortfolioCard({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
    this.imagePath,
    this.description,
    this.imageFit = BoxFit.cover,
  });

  final String title;
  final String actionText;
  final String? description;
  final VoidCallback onTap;

  /// Optional local asset image.
  /// If null, a temporary placeholder is displayed.
  final String? imagePath;

  /// Use BoxFit.cover for normal card imagery.
  /// Use BoxFit.contain when the entire image must remain visible,
  /// such as a technical diagram.
  final BoxFit imageFit;

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Use the application's CardTheme as the normal elevation.
    final defaultElevation = theme.cardTheme.elevation ?? 4.0;

    // Portfolio cards rise slightly on desktop/web hover.
    final targetElevation = _isHovered
        ? defaultElevation + 4.0
        : defaultElevation;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: defaultElevation, end: targetElevation),
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        builder: (context, elevation, child) {
          return Card(
            margin: EdgeInsets.zero,

            // Elevation is dynamic because this card supports hover.
            // Shape, shadow color, surface color, etc. come from CardTheme.
            elevation: elevation,

            // Required so the image and InkWell are clipped to the
            // CardTheme's rounded shape.
            clipBehavior: Clip.antiAlias,

            child: InkWell(
              onTap: widget.onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(aspectRatio: 16 / 9, child: _buildImage(theme)),

                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 92),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: theme.textTheme.titleMedium,
                          ),

                          const SizedBox(height: 8),
                          if (widget.description != null &&
                              widget.description!.isNotEmpty) ...[
                            Text(
                              widget.description!,
                              style: theme.textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                          ],
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.actionText,
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                size: 18,
                                color: theme.colorScheme.primary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage(ThemeData theme) {
    if (widget.imagePath != null) {
      return Image.asset(
        widget.imagePath!,
        width: double.infinity,
        height: double.infinity,
        fit: widget.imageFit,
      );
    }

    // Temporary placeholder until the final website images are available.
    return ColoredBox(
      color: theme.colorScheme.surfaceContainerHighest,
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 48,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
