import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/site_content.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: projectItems.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = projectItems[index];
        return Card(
          child: ListTile(
            title: Text(item.title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/projects/${item.slug}'),
          ),
        );
      },
    );
  }
}