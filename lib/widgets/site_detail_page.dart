import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/detail_section.dart';

class SiteDetailPage extends StatelessWidget {
  const SiteDetailPage({
    super.key,
    required this.title,
    this.backRoute,
    this.backLabel,
    this.summary,
    this.imagePath,
    this.imageFit = BoxFit.cover,
    this.imageDescription,
    this.sections = const [],
    this.body,
  });

  final String title;
  final String? backRoute;
  final String? backLabel;
  final String? summary;
  final String? imagePath;
  final BoxFit imageFit;
  final String? imageDescription;
  final List<DetailSection> sections;
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
              if (backRoute != null) ...[
                TextButton.icon(
                  onPressed: () => context.go(backRoute!),
                  icon: const Icon(Icons.arrow_back),
                  label: Text(backLabel ?? 'Back'),
                ),
                const SizedBox(height: 16),
              ],

              Text(title, style: theme.textTheme.displayMedium),

              if (summary != null) ...[
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(summary!, style: theme.textTheme.bodyLarge),
                ),
              ],

              if (imagePath != null && sections.isEmpty) ...[
                const SizedBox(height: 32),
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

              const SizedBox(height: 32),
              Divider(color: theme.colorScheme.outlineVariant),
              const SizedBox(height: 24),

              if (sections.isEmpty && body == null)
                Text('Content coming soon.', style: theme.textTheme.bodyLarge),

              for (final section in sections) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      section.imagePath,
                      width: double.infinity,
                      fit: section.imageFit,
                      semanticLabel: section.imageDescription,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Text(section.imageTitle, style: theme.textTheme.headlineSmall),

                const SizedBox(height: 12),

                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(
                    section.paragraph,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),

                const SizedBox(height: 48),
              ],

              if (body != null) body!,
            ],
          ),
        ),
      ),
    );
  }
}
