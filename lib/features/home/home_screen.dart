import 'package:flutter/material.dart';

import '../../utils/site_content.dart';
import '../../widgets/site_card_grid.dart';

const List<NavItem> featuredItems = [
  NavItem(
    slug: 'proofing-ovens',
    title: 'Proofing Ovens',
    route: '/projects/proofing-ovens',
  ),
  NavItem(
    slug: 'embedded-systems',
    title: 'Embedded Systems',
    route: '/services/embedded-systems',
  ),
  NavItem(
    slug: 'embedded-linux',
    title: 'Embedded Linux',
    route: '/projects/embedded-linux',
  ),
  NavItem(
    slug: 'iot',
    title: 'IoT',
    route: '/projects/iot',
  ),
  NavItem(
    slug: 'rfid',
    title: 'RFID',
    route: '/projects/rfid',
    cardDescription: 'RFID Solutions for Agriculture',
    cardImagePath: 'assets/images/projects/rfid_hen_mat.webp',
  ),
  NavItem(
    slug: 'project-management',
    title: 'Project Management',
    route: '/services/project-management',
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const SiteCardGrid(
        title: 'Featured Services & Projects',
        items: featuredItems,
        routePrefix: '/services',
      );
}