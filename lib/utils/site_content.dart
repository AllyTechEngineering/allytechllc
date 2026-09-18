// Single source of truth for the sub-items under Services and Projects.
// Router, menu screens, and detail screens all read from these lists so
// slug and title can never drift out of sync between files.

class NavItem {
  const NavItem({
    required this.slug,
    required this.title,
    this.route,
    this.summary,
    this.imagePath,
    this.imageDescription,
  });

  final String slug;
  final String title;
  final String? route;
  final String? summary;
  final String? imagePath;
  final String? imageDescription;
}

const List<NavItem> serviceItems = [
  NavItem(slug: 'app-development', title: 'App Development', summary: 'Cross-platform Mobile Apps for iOS, Android, Linux and Windows.'),
  NavItem(slug: 'embedded-systems', title: 'Embedded Systems', summary: 'Design and development of embedded systems for various applications.'),
  NavItem(slug: 'iot-iiot', title: 'IoT/IIoT', summary: 'Internet of Things and Industrial IoT solutions.'),
  NavItem(slug: 'pwa-development', title: 'PWA Development', summary: 'Progressive Web App development for cross-platform compatibility.'),
  NavItem(slug: 'schematic-pcb-design', title: 'Schematic & PCB Design', summary: 'Electronic circuit design and printed circuit board layout.'),
  NavItem(slug: 'project-management', title: 'Project Management', summary: 'End-to-end project management services for technology initiatives.'),
];

const List<NavItem> projectItems = [
  NavItem(slug: 'proofing-ovens', title: 'Proofing Ovens', summary: 'Custom proofing ovens for bakery and food processing applications.'),
  NavItem(slug: 'embedded-linux', title: 'Embedded Linux', summary: 'Linux-based embedded systems for various applications.'),
  NavItem(slug: 'iot', title: 'IoT', summary: 'Internet of Things solutions for smart connectivity.'),
  NavItem(slug: 'rfid', title: 'RFID', summary: 'Radio Frequency Identification solutions for asset tracking.',imagePath:'assets/images/projects/rfid_hen_mat.webp', imageDescription: 'RFID leg band & RFID mat tracking poultry.'),
  NavItem(slug: 'apps', title: 'Apps', summary: 'Custom mobile and web applications for businesses.'),
  NavItem(slug: 'other', title: 'Other', summary: 'Other technology projects and initiatives.'),
];
