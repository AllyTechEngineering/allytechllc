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
    slug: 'pwa-development',
    title: 'IoT Web Development',
    route: '/services/pwa-development',
    summary:
        'IoT Progressive Web App Development.',
    detailParagraph:
        'I design multi-tenant IoT progressive web apps that can be easily deployed and managed across different environments.',
  imagePath: 'assets/images/services/web_dev/web_dev_end_user.webp',
    imageDescription: 'IoT Web App Development',
    detailSections: [
      DetailSection(
        imagePath:
            'assets/images/services/web_dev/web_dev_req_planning.webp',
        imageTitle: 'Requirements Engineering',
        paragraph:
            'I provide comprehensive requirements engineering services for IoT progressive web apps, ensuring that all functional and non-functional requirements are clearly defined and met. This includes conducting feasibility studies, creating detailed requirement specifications, and managing requirement changes throughout the development lifecycle.',
        imageDescription: 'IoT Web App Requirements Engineering',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/web_dev/web_dev_main.webp',
        imageTitle: 'System Architecture Design',
        paragraph:
            'I design scalable and secure system architectures for IoT progressive web apps, ensuring that the applications can handle high traffic and data loads while maintaining performance and reliability. This includes selecting appropriate technologies, designing data models, and implementing security best practices.',
        imageDescription: 'IoT Web App System Architecture Design',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/web_dev/web_dev_code.webp',
        imageTitle: 'Development and Deployment',
        paragraph:
            'I develop and deploy IoT progressive web apps using modern web technologies, ensuring that the applications are responsive, user-friendly, and compatible with various devices and browsers. I also provide ongoing maintenance and support to ensure that the applications remain up-to-date and secure.',
        imageDescription: 'IoT Web App Development and Deployment Process',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/web_dev/web_dev_testing_launch.webp',
        imageTitle: 'Testing and Launch',
        paragraph:
            'I conduct thorough testing of IoT progressive web apps to ensure that they meet performance, usability, and security standards. This includes functional testing, performance testing, and user acceptance testing. Once the applications are thoroughly tested, I assist with the launch and deployment process.',
        imageDescription: 'IoT Web App Testing and Launch Process',
      ),
    ],
  ),
    SiteContentItem(
    slug: 'embedded-systems',
    title: 'Embedded IoT Development',
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
        imageTitle: 'Requirements Engineering',
        paragraph:
            'I provide comprehensive requirements engineering services for embedded IoT systems, ensuring that all functional and non-functional requirements are clearly defined and met. This includes conducting feasibility studies, creating detailed requirement specifications, and managing requirement changes throughout the development lifecycle.',
        imageDescription: 'Embedded IoT Requirements Engineering Process',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/emb_dev/embedded_systems_detail_3.webp',
        imageTitle: 'Firmware Development',
        paragraph:
            'I develop custom firmware for embedded IoT systems, ensuring that the software is optimized for the specific hardware and application requirements. My firmware development process includes testing and validation to ensure reliable operation.',
        imageDescription: 'Embedded IoT Firmware Development Process',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/emb_dev/embedded_systems_detail_2.webp',
        imageTitle: 'System Integration',
        paragraph:
            'I provide system integration services for embedded IoT solutions, ensuring that all components work together seamlessly. This includes integrating sensors, actuators, communication modules, and cloud services to create a complete IoT solution.',
        imageDescription: 'Embedded IoT System Integration Overview',
      ),
    ],
  ),
  SiteContentItem(
    slug: 'schematic-pcb-design',
    title: 'Schematic & PCB Design',
    route: '/services/schematic-pcb-design',
    summary: 'Electronic circuit design and printed circuit board layout.',
    detailParagraph:
        'I offer schematic and PCB design services for electronic circuits. I focus on creating efficient and reliable designs that meet industry standards, ensuring optimal performance and manufacturability for your electronic products.',
  imagePath: 'assets/images/services/sch_pcb_dev/sch_pcb_dev_sch.webp',
    imageDescription: 'Schematic and PCB Design Overview',
    detailSections: [
      DetailSection(
        imagePath:
            'assets/images/services/sch_pcb_dev/sch_pcb_dev_bom.webp',
        imageTitle: 'Bill of Materials',
        paragraph:
            'I provide a comprehensive Bill of Materials (BOM) for each schematic and PCB design, detailing all components and their specifications. This ensures that the manufacturing process is smooth and efficient.',
        imageDescription: 'Bill of Materials for PCB Design',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/sch_pcb_dev/sch_pcb_dev_test.webp',
        imageTitle: 'Testing and Validation',
        paragraph:
            'I conduct thorough testing and validation of the designed PCBs to ensure they meet performance and reliability standards. This includes functional testing, signal integrity analysis, and environmental stress testing.',
        imageDescription: 'Testing and Validation of PCB Design',
      ),
    ],  
  ),
  SiteContentItem(
    slug: 'project-management',
    title: 'Project Management',
    route: '/services/project-management',
    summary:
        'IoT NPD Project Management Services',
    detailParagraph:
        'I provide specialized project management services for IoT new product development (NPD) projects. My approach focuses on effective planning, risk management, and stakeholder communication to ensure successful project outcomes.',
  imagePath: 'assets/images/services/npd_pm/npd_pm_main.webp',
    imageDescription: 'IoT NPD Project Management',
    detailSections: [
      DetailSection(
        imagePath:
            'assets/images/services/npd_pm/npd_pm_planning.webp',
        imageTitle: 'Planning and Scheduling',
        paragraph:
            'Running an IoT NPD project requires careful planning and scheduling to ensure that all tasks are completed on time and within budget. I create detailed project plans, timelines, and resource allocation strategies to keep the project on track.',
        imageDescription: 'Project Planning and Scheduling Process',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/npd_pm/npd_pm_sprint.webp',
        imageTitle: 'Agile Project Management',
        paragraph:
            'I employ agile methodologies to manage IoT NPD projects, enabling iterative development, continuous feedback, and rapid adaptation to changing requirements.',
        imageDescription: 'Agile Project Management in IoT NPD',
      ),
      DetailSection(
        imagePath:
            'assets/images/services/npd_pm/npd_pm_gantt.webp',
        imageTitle: 'Waterfall Project Management',
        paragraph:
            'Often a hybrid approach is used, combining agile and waterfall methodologies to suit the specific needs of the IoT NPD project. I create Gantt charts and detailed project documentation to ensure clarity and alignment among all stakeholders.',
        imageDescription: 'Hybrid Project Management Approach for IoT NPD',
      ),
    ],
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
