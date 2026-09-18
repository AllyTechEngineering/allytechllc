import 'package:flutter/material.dart';

import '../../utils/site_content.dart';
import '../../widgets/site_detail_page.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    final item = serviceItems.firstWhere((item) => item.slug == slug);

    return SiteDetailPage(
      title: item.title,
    );
  }
}