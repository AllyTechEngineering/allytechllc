import 'package:flutter/material.dart';

import '../../utils/site_content.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    final item = serviceItems.firstWhere((i) => i.slug == slug);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 16),
          // TODO: replace with real copy for this service.
          const Text('Content coming soon.'),
        ],
      ),
    );
  }
}