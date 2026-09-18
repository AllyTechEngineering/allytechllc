import 'package:flutter/material.dart';

class SiteDetailPage extends StatelessWidget {
  const SiteDetailPage({
    super.key,
    required this.title,
    this.imagePath,
    this.imageFit = BoxFit.cover,
    this.imageDescription,
    this.body,
  });

  final String title;
  final String? imagePath;
  final BoxFit imageFit;
  final String? imageDescription;
  final Widget? body;

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
        vertical: 32,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.displayMedium),

              if (imagePath != null) ...[
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      imagePath!,
                      width: double.infinity,
                      fit: imageFit,
                      semanticLabel: imageDescription,
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 24),

              body ??
                  Text(
                    'Content coming soon.',
                    style: theme.textTheme.bodyLarge,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}