import 'package:flutter/material.dart';

import '../../utils/site_content.dart';
import '../../widgets/site_detail_page.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    final item = projectItems.firstWhere((item) => item.slug == slug);

    return SiteDetailPage(
      title: item.title,
      backRoute: '/projects',
      backLabel: 'Back to Projects',
      summary: item.summary,
      imagePath: item.imagePath,
      imageDescription: item.imageDescription,
      body: item.detailParagraph == null
          ? null
          : Text(
              item.detailParagraph!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
    );
  }
}
