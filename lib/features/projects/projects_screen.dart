import 'package:flutter/material.dart';

import '../../utils/site_content.dart';
import '../../widgets/site_card_grid.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) => const SiteCardGrid(
    title: 'Projects',
    items: projectItems,
    routePrefix: '/projects',
    showSummary: true,
  );
}
