import '../models/detail_section.dart';
import '../models/site_content_item.dart';


const List<SiteContentItem> serviceItems = [
  SiteContentItem(
    slug: 'app-development',
    title: 'IoT App Development',
     route: '/services/app-development',
    summary: 'Connected Cross-platform Mobile Apps',
    detailParagraph:
        'I specialize in developing cross-platform mobile applications that seamlessly connect with IoT devices. My apps are designed to provide users with a smooth and intuitive experience, enabling them to monitor and control their connected devices from anywhere.',
    imagePath: 'assets/images/services/app_dev/app_dev_main_image_2.webp',
    imageDescription: 'IoT App for Holding Cabinet Control',
    detailSections: [
      DetailSection(
        imagePath:
            'assets/images/services/app_dev/app_dev_system_connections.webp',
        imageTitle: 'System Connections',
        paragraph:
            'The app connects to various IoT devices and systems, allowing users to monitor and control their connected devices from a single interface. The app is designed to provide real-time data and notifications, ensuring that users are always informed about the status of their devices.',
        imageDescription: 'IoT App System Connections Overview',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/app_dev/app_dev_system_connections_1.webp',
        imageTitle: 'Device Control',
        paragraph:
            'Users can control their connected devices directly from the app, adjusting settings and configurations as needed. The app provides a user-friendly interface that makes it easy to manage multiple devices and systems.',
        imageDescription: 'IoT App Device Control Interface',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/app_dev/app_dev_system_connections_2.webp',
        imageTitle: 'Real-time Monitoring',
        paragraph:
            'The app provides real-time monitoring of connected devices, allowing users to track performance and receive alerts for any issues. This feature ensures that users can take immediate action if any problems arise with their IoT devices.',
        imageDescription: 'IoT App Real-time Monitoring Dashboard',
      ),
    ],
  ),
  SiteContentItem(
    slug: 'embedded-systems',
    title: 'Embedded IoT',
    route: '/services/embedded-systems',
    summary:
        'Design and development of embedded IoT systems for various applications.',
    detailParagraph:
        'My expertise in embedded IoT systems allows me to design and develop solutions for a wide range of applications, from consumer electronics to industrial automation. I focus on creating reliable and efficient embedded solutions that meet the specific requirements of my clients.',
      imagePath: 'assets/images/services/emb_dev/embedded_systems_main.webp',
    imageDescription: 'Embedded IoT System Overview',
    detailSections: [
      DetailSection(
        imagePath:
            'assets/images/services/emb_dev/embedded_systems_detail_1.webp',
        imageTitle: 'Hardware Design',
        paragraph:
            'I provide comprehensive hardware design services for embedded IoT systems, including schematic capture, PCB layout, and component selection. My designs are optimized for performance, reliability, and manufacturability.',
        imageDescription: 'Embedded IoT Hardware Design Example',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/emb_dev/embedded_systems_detail_2.webp',
        imageTitle: 'Firmware Development',
        paragraph:
            'I develop custom firmware for embedded IoT systems, ensuring that the software is optimized for the specific hardware and application requirements. My firmware development process includes testing and validation to ensure reliable operation.',
        imageDescription: 'Embedded IoT Firmware Development Process',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/emb_dev/embedded_systems_detail_3.webp',
        imageTitle: 'System Integration',
        paragraph:
            'I provide system integration services for embedded IoT solutions, ensuring that all components work together seamlessly. This includes integrating sensors, actuators, communication modules, and cloud services to create a complete IoT solution.',
        imageDescription: 'Embedded IoT System Integration Overview',
      ),
    ],
  ),
  SiteContentItem(
    slug: 'iot-iiot',
    title: 'IoT/IIoT',
    route: '/services/iot-iiot',
    summary: 'Internet of Things and Industrial IoT solutions.',
    detailParagraph:
        'I provide comprehensive IoT and IIoT solutions that enable businesses to connect, monitor, and control devices and systems. My services include sensor integration, data analytics, and cloud connectivity to help you harness the power of the Internet of Things.',
  ),
  SiteContentItem(
    slug: 'pwa-development',
    title: 'PWA Development',
    route: '/services/pwa-development',
    summary:
        'Progressive Web App development for cross-platform compatibility.',
    detailParagraph:
        'I specialize in developing Progressive Web Apps (PWAs) that offer a native app-like experience on the web. Our PWAs are designed to be fast, reliable, and engaging, providing users with a seamless experience across different devices and platforms.',
  ),
  SiteContentItem(
    slug: 'schematic-pcb-design',
    title: 'Schematic & PCB Design',
    route: '/services/schematic-pcb-design',
    summary: 'Electronic circuit design and printed circuit board layout.',
    detailParagraph:
        'I offer schematic and PCB design services for electronic circuits. I focus on creating efficient and reliable designs that meet industry standards, ensuring optimal performance and manufacturability for your electronic products.',
  ),
  SiteContentItem(
    slug: 'project-management',
    title: 'Project Management',
    route: '/services/project-management',
    summary:
        'End-to-end project management services for technology initiatives.',
    detailParagraph:
        'I provide comprehensive project management services for technology initiatives, ensuring that projects are completed on time, within budget, and to the highest quality standards. My approach includes planning, execution, monitoring, and closing of projects, with a focus on delivering value to stakeholders.',
  ),
];

const List<SiteContentItem> projectItems = [
  SiteContentItem(
    slug: 'proofing-ovens',
    title: 'Proofing Ovens',
    route: '/projects/proofing-ovens',
    summary: 'Custom holding cabinets for hot food industry applications.',
    detailParagraph:
        'I have developed custom proofing ovens for the hot food industry, designed to maintain optimal temperature and humidity for food products. These ovens are built to meet the specific needs of food service providers, ensuring consistent quality and performance.',
    imagePath: 'assets/images/projects/holding_2.webp',
    imageDescription:
        'Custom holding cabinet for hot food industry applications.',
  ),
  SiteContentItem(
    slug: 'embedded-linux',
    title: 'Embedded Linux',
    route: '/projects/embedded-linux',
    summary: 'Single Codebase for Embedded',
    detailParagraph:
        'I specialize in developing cross-platform embedded Linux solutions for a wide range of applications, from consumer electronics to industrial automation. I focus on creating reliable and efficient embedded solutions that meet the specific requirements of my clients.',
  ),
  SiteContentItem(
    slug: 'iot',
    title: 'IoT',
    route: '/projects/iot',
    summary: 'Internet of Things solutions for smart connectivity.',
    detailParagraph:
        'I provide comprehensive IoT solutions for smart connectivity, enabling seamless integration of devices and systems. My approach focuses on creating scalable and secure IoT infrastructures that drive innovation and efficiency for my clients.',
  ),
  SiteContentItem(
    slug: 'rfid',
    title: 'RFID',
    route: '/projects/rfid',
    summary: 'Radio Frequency Identification solutions for asset tracking.',
    imagePath: 'assets/images/projects/rfid_1.webp',
    imageDescription: 'RFID leg band & RFID mat tracking poultry.',
    cardDescription: 'RFID Solutions for Agriculture',
    cardImagePath: 'assets/images/projects/rfid_hen_mat.webp',
    detailParagraph:
        'Detailed information about RFID solutions for agricultural applications.',
    detailSections: [
      DetailSection(
        imagePath: 'assets/images/projects/rfid_1.webp',
        imageTitle: 'RFID Leg Band',
        paragraph:
            'RFID leg bands are used for tracking and monitoring poultry in agricultural settings. These bands provide a reliable and efficient way to manage livestock, ensuring accurate data collection and improved operational efficiency.',
        imageDescription: 'RFID leg band for poultry tracking.',
      ),
      DetailSection(
        imagePath: 'assets/images/projects/rfid_hen_mat.webp',
        imageTitle: 'RFID Mat',
        paragraph:
            'RFID mats are used in conjunction with RFID leg bands to track the movement and behavior of poultry. These mats provide valuable insights into animal health and welfare, enabling farmers to make informed decisions about their livestock management practices.',
        imageDescription: 'RFID mat for poultry tracking.',
      ),
    ],
  ),
  SiteContentItem(
    slug: 'apps',
    title: 'Sailing Race Computer',
    route: '/projects/apps',
    summary: 'Custom mobile and web applications for businesses.',
    imagePath: 'assets/images/projects/sailing_app_gps.webp',
    imageDescription: 'Sailing race computer for competitive sailing.',
    cardDescription: 'Sailing Race Computer',
    cardImagePath: 'assets/images/projects/sailing_app_gps.webp',
    detailParagraph:
        'I develop custom mobile and web applications tailored to the unique needs of businesses. My applications are designed to enhance user experience, streamline operations, and drive business growth through innovative technology solutions.',
  ),
  SiteContentItem(
    slug: 'other',
    title: 'Other',
    route: '/projects/other',
    summary: 'Other technology projects and initiatives.',
    detailParagraph:
        'I work on various technology projects and initiatives that don\'t fit into the other categories. These projects often involve exploring new technologies or addressing unique challenges faced by my clients.',
  ),
];
