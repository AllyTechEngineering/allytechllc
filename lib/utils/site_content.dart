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
    this.cardDescription,
    this.cardImagePath,
    this.detailParagraph,
  });

  final String slug;
  final String title;
  final String? route;
  final String? summary;
  final String? imagePath;
  final String? imageDescription;
  final String? cardDescription;
  final String? cardImagePath;
  final String? detailParagraph;
}

const List<NavItem> serviceItems = [
  NavItem(
    slug: 'app-development',
    title: 'App Development',
    summary: 'Cross-platform Mobile Apps for iOS, Android, Linux and Windows.',
    detailParagraph:
        'I specialize in developing cross-platform mobile applications that run seamlessly on iOS, Android, Linux, and Windows. I leverage the latest technologies to create user-friendly and efficient apps tailored to your business needs.',
  ),
  NavItem(
    slug: 'embedded-systems',
    title: 'Embedded Systems',
    summary:
        'Design and development of embedded systems for various applications.',
    detailParagraph:
        'My expertise in embedded systems allows me to design and develop solutions for a wide range of applications, from consumer electronics to industrial automation. I focus on creating reliable and efficient embedded solutions that meet the specific requirements of my clients.',
  ),
  NavItem(
    slug: 'iot-iiot',
    title: 'IoT/IIoT',
    summary: 'Internet of Things and Industrial IoT solutions.',
    detailParagraph:
        'I provide comprehensive IoT and IIoT solutions that enable businesses to connect, monitor, and control devices and systems. My services include sensor integration, data analytics, and cloud connectivity to help you harness the power of the Internet of Things.',
  ),
  NavItem(
    slug: 'pwa-development',
    title: 'PWA Development',
    summary:
        'Progressive Web App development for cross-platform compatibility.',
    detailParagraph:
        'I specialize in developing Progressive Web Apps (PWAs) that offer a native app-like experience on the web. Our PWAs are designed to be fast, reliable, and engaging, providing users with a seamless experience across different devices and platforms.',
  ),
  NavItem(
    slug: 'schematic-pcb-design',
    title: 'Schematic & PCB Design',
    summary: 'Electronic circuit design and printed circuit board layout.',
    detailParagraph:
        'I offer schematic and PCB design services for electronic circuits. I focus on creating efficient and reliable designs that meet industry standards, ensuring optimal performance and manufacturability for your electronic products.',
  ),
  NavItem(
    slug: 'project-management',
    title: 'Project Management',
    summary:
        'End-to-end project management services for technology initiatives.',
    detailParagraph:
        'I provide comprehensive project management services for technology initiatives, ensuring that projects are completed on time, within budget, and to the highest quality standards. My approach includes planning, execution, monitoring, and closing of projects, with a focus on delivering value to stakeholders.',
  ),
];

const List<NavItem> projectItems = [
  NavItem(
    slug: 'proofing-ovens',
    title: 'Proofing Ovens',
    summary: 'Custom holding cabinets for hot food industry applications.',
    detailParagraph:
        'I have developed custom proofing ovens for the hot food industry, designed to maintain optimal temperature and humidity for food products. These ovens are built to meet the specific needs of food service providers, ensuring consistent quality and performance.',
        imagePath: 'assets/images/projects/holding_2.webp',
    imageDescription: 'Custom holding cabinet for hot food industry applications.', 
  ),
  NavItem(
    slug: 'embedded-linux',
    title: 'Embedded Linux',
    summary: 'Single Codebase for Embedded',
    detailParagraph:
        'I specialize in developing cross-platform embedded Linux solutions for a wide range of applications, from consumer electronics to industrial automation. I focus on creating reliable and efficient embedded solutions that meet the specific requirements of my clients.',
  ),
  NavItem(
    slug: 'iot',
    title: 'IoT',
    summary: 'Internet of Things solutions for smart connectivity.',
    detailParagraph:
        'I provide comprehensive IoT solutions for smart connectivity, enabling seamless integration of devices and systems. My approach focuses on creating scalable and secure IoT infrastructures that drive innovation and efficiency for my clients.',
  ),
  NavItem(
    slug: 'rfid',
    title: 'RFID',
    summary: 'Radio Frequency Identification solutions for asset tracking.',
    imagePath: 'assets/images/projects/rfid_1.webp',
    imageDescription: 'RFID leg band & RFID mat tracking poultry.',
    cardDescription: 'RFID Solutions for Agriculture',
    cardImagePath: 'assets/images/projects/rfid_hen_mat.webp',
    detailParagraph:
        'Detailed information about RFID solutions for agricultural applications.',
  ),
  NavItem(
    slug: 'apps',
    title: 'Sailing Race Computer',
    summary: 'Custom mobile and web applications for businesses.',
    imagePath: 'assets/images/projects/sailing_app_gps.webp',
    imageDescription: 'Sailing race computer for competitive sailing.',
    cardDescription: 'Sailing Race Computer',
    cardImagePath: 'assets/images/projects/sailing_app_gps.webp',
    detailParagraph:
        'I develop custom mobile and web applications tailored to the unique needs of businesses. My applications are designed to enhance user experience, streamline operations, and drive business growth through innovative technology solutions.',
  ),
  NavItem(
    slug: 'other',
    title: 'Other',
    summary: 'Other technology projects and initiatives.',
    detailParagraph:
        'I work on various technology projects and initiatives that don\'t fit into the other categories. These projects often involve exploring new technologies or addressing unique challenges faced by my clients.',
  ),
];
