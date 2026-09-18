import 'package:flutter/material.dart';

import '../../utils/site_content.dart';
import '../../widgets/site_detail_page.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    final item = serviceItems.firstWhere((item) => item.slug == slug);

    return SiteDetailPage(
      title: item.title,
      backRoute: '/services',
      backLabel: 'Back to Services',
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
