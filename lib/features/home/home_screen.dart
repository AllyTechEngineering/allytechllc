import 'package:flutter/material.dart';

import '../../utils/site_content.dart';
import '../../widgets/site_card_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const SiteCardGrid(
        title: 'Services',
        items: serviceItems,
        routePrefix: '/services',
      );
}