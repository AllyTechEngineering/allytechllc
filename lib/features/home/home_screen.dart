import 'package:flutter/material.dart';

import '../../utils/site_content.dart';
import '../../widgets/site_card_grid.dart';

final List<NavItem> featuredItems = [
  projectItems.firstWhere((item) => item.slug == 'proofing-ovens'),
  serviceItems.firstWhere((item) => item.slug == 'embedded-systems'),
  projectItems.firstWhere((item) => item.slug == 'embedded-linux'),
  projectItems.firstWhere((item) => item.slug == 'iot'),
  projectItems.firstWhere((item) => item.slug == 'rfid'),
  serviceItems.firstWhere((item) => item.slug == 'project-management'),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => SiteCardGrid(
        title: 'Featured Services & Projects',
        items: featuredItems,
        routePrefix: '/services',
      );
}