// Single source of truth for the sub-items under Services and Projects.
// Router, menu screens, and detail screens all read from these lists so
// slug and title can never drift out of sync between files.

class NavItem {
  const NavItem({required this.slug, required this.title});
  final String slug;
  final String title;
}

const List<NavItem> serviceItems = [
  NavItem(slug: 'app-development', title: 'App Development'),
  NavItem(slug: 'embedded-systems', title: 'Embedded Systems'),
  NavItem(slug: 'iot-iiot', title: 'IoT/IIoT'),
  NavItem(slug: 'pwa-development', title: 'PWA Development'),
  NavItem(slug: 'schematic-pcb-design', title: 'Schematic & PCB Design'),
  NavItem(slug: 'project-management', title: 'Project Management'),
];

const List<NavItem> projectItems = [
  NavItem(slug: 'proofing-ovens', title: 'Proofing Ovens'),
  NavItem(slug: 'embedded-linux', title: 'Embedded Linux'),
  NavItem(slug: 'iot', title: 'IoT'),
  NavItem(slug: 'rfid', title: 'RFID'),
  NavItem(slug: 'apps', title: 'Apps'),
  NavItem(slug: 'other', title: 'Other'),
];