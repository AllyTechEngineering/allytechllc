# AllyTech LLC Website

The official website for **AllyTech LLC**, an engineering consultancy that builds embedded systems, IoT/IIoT solutions, cross-platform apps, and electronic hardware.

The site is a **Flutter Progressive Web App (PWA)** hosted on **Firebase Hosting**. One Flutter codebase serves phones, tablets, and desktop browsers.

🌐 **Live site:** [allytechllc.com](https://allytechllc.com)

---

## Overview

The site presents AllyTech LLC's engineering services and representative project work to prospective clients and collaborators.

**Services**

- App Development
- Embedded Systems
- IoT / IIoT
- PWA Development
- Schematic & PCB Design
- Project Management

**Projects**

- Proofing Ovens
- Embedded Linux
- IoT
- RFID
- Sailing Race Computer
- Other

---

## Features

- **Responsive, adaptive layout.** Layout is based on available width, not device type:
  - Mobile (< 600 px): app bar with a navigation drawer
  - Tablet (600–1023 px): navigation rail with the content area beside it
  - Desktop (≥ 1024 px): navigation rail with centered, width-constrained content
- **URL-based routing.** Every page, including each service and project detail page, has its own browser-addressable URL.
- **Data-driven content.** Service and project text and images live in one content file, separate from the widgets that display them.
- **Reusable detail pages.** Each detail page is built from ordered image-and-text sections, so new content needs no layout changes.
- **Material 3 theming.** Colors, typography, and component styles come from one application theme.
- **Installable PWA.** The site can be installed from supported browsers.

---

## Tech Stack

| Area | Technology |
|---|---|
| Framework | [Flutter](https://flutter.dev) (web / PWA) |
| Language | [Dart](https://dart.dev) |
| UI | Material 3 |
| Routing | [go_router](https://pub.dev/packages/go_router) |
| State management | [provider](https://pub.dev/packages/provider) |
| Typography | [google_fonts](https://pub.dev/packages/google_fonts) |
| Links | [url_launcher](https://pub.dev/packages/url_launcher) |
| Hosting | [Firebase Hosting](https://firebase.google.com/docs/hosting) |
| Backend (reserved for future features) | Firebase Core, Cloud Firestore |

---

## Project Structure

```
lib/
├── features/          # Page-level screens
│   ├── home/
│   ├── services/      # Services list and service detail screens
│   ├── projects/      # Projects list and project detail screens
│   ├── about/
│   └── legal/         # Privacy page
├── models/            # Content models (SiteContentItem, DetailSection)
├── routing/           # go_router configuration
├── utils/             # Theme, constants, and site content
├── widgets/           # Shared UI: adaptive scaffold, navigation, cards, detail page
├── firebase_options.dart
└── main.dart

assets/
└── images/            # Optimized WebP images for services and projects

Docs/                  # Architecture, responsive design, content, and image standards
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- A Chromium-based browser for web development
- [Firebase CLI](https://firebase.google.com/docs/cli) (only needed for deployment)

### Run locally

```
git clone https://github.com/AllyTechEngineering/allytechllc.git
cd allytechllc
flutter pub get
flutter run -d chrome
```

### Build for the web

```
flutter build web
```

The production build is written to `build/web`.

### Deploy

Deployment requires access to the project's Firebase account:

```
firebase deploy --only hosting
```

---

## Managing Content

Service and project content is defined in `lib/utils/site_content.dart`. Adding or updating a service or project normally means editing that file and adding images under `assets/images/`. No routing or layout changes are needed.

See the documentation below for details.

---

## Documentation

| Document | Description |
|---|---|
| [`Docs/arch.md`](Docs/arch.md) | Application architecture and design principles |
| [`Docs/responsive_design.md`](Docs/responsive_design.md) | Breakpoints, adaptive navigation, and layout rules |
| [`Docs/content_management.md`](Docs/content_management.md) | How to add and update service and project content |
| [`Docs/image_requirements.md`](Docs/image_requirements.md) | Image sizing, format, and composition standards |
| [`Docs/ui_standards.md`](Docs/ui_standards.md) | Card and component UI standards |

---

## License

The **source code** in this repository is licensed under the [MIT License](LICENSE).

The **website content** is © AllyTech LLC, all rights reserved, and is not covered by the MIT License. This includes text, photographs, project images, logos, and branding.

---

## Contact

For consulting inquiries, visit [allytechllc.com](https://allytechllc.com).
