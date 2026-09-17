# AllyTech LLC Website Architecture

## Project Purpose

AllyTech LLC is a public-facing consulting and portfolio website built as a Flutter Progressive Web App (PWA).

The primary goals are to:

- Showcase AllyTech LLC technical capabilities.
- Present representative commercial and engineering projects.
- Support freelance and consulting business development.
- Support professional/job opportunities.
- Provide prospective clients and employers with a clear way to understand capabilities and make contact.

Phase 1 is primarily a professional capability and project showcase. Firestore-backed application features are not currently required for the public website.

---

## Technology Stack

- Flutter
- Dart
- Material 3
- Firebase Hosting
- Firebase Core
- Cloud Firestore
- Provider
- go_router
- url_launcher
- google_fonts

GitHub repository:

`AllyTechEngineering/allytechllc`

---

## Screens

### Home

Primary landing page and introduction to AllyTech LLC.

### Services

- App Development
- Embedded Systems
- IoT / IIoT
- PWA Development
- Schematic & PCB Design
- Project Management

### Projects

- Proofing Ovens
- Embedded Linux
- IoT
- RFID
- Apps
- Other

### About

Professional and company background.

### Privacy

Privacy policy and related information.

---

## Application Structure

Use shared application-level widgets rather than duplicating navigation and scaffolding on individual screens.

Current shared widgets include:

```text
lib/widgets/custom_app_bar.dart
lib/widgets/adaptive_navigation.dart
lib/widgets/adaptive_scaffold.dart
```

Shared constants are maintained in:

```text
lib/utils/constants.dart
```

The application shell is responsible for:

- App bar
- Navigation
- Responsive layout
- Displaying the selected routed screen

Individual screens should primarily contain their own page content.

---

## Adaptive and Responsive Design

The application must render correctly on:

- Mobile phones
- Tablets
- Laptop displays
- Desktop displays
- Large desktop monitors

Responsive behavior must be based on available display width rather than operating system or device identification.

### Breakpoints

```dart
DeviceType getDeviceType(double width) {
  if (width >= 1024) return DeviceType.desktop;
  if (width >= 600) return DeviceType.tablet;
  return DeviceType.mobile;
}
```

| Width | Layout |
|---|---|
| `< 600 px` | Mobile |
| `600–1023 px` | Tablet |
| `>= 1024 px` | Desktop |

Use Flutter responsive and adaptive best practices:

https://docs.flutter.dev/ui/adaptive-responsive

Detailed responsive implementation requirements are maintained in:

```text
Docs/responsive_design.md
```

---

## Adaptive Navigation

Navigation changes according to available width.

### Mobile

Use:

- Material 3 AppBar
- Hamburger menu
- Navigation Drawer

### Tablet

Use:

- Material 3 AppBar
- NavigationRail
- Responsive content area

### Desktop

Use:

- Material 3 AppBar
- NavigationRail
- Expanded content area
- Centered and constrained page content where appropriate

Do not maintain separate mobile, tablet, and desktop applications.

The same screens and routes are used at every display size.

Only navigation presentation and page layout adapt to available width.

---

## Responsive Page Layout

Individual screens must adapt their content independently of the application navigation.

### Mobile

- Primarily single-column layouts
- Cards normally display one per row
- Hero content stacks vertically
- Images scale within available width

### Tablet

- Multi-column layouts where appropriate
- Cards normally display approximately two per row
- Increased horizontal spacing

### Desktop

- Multi-column layouts where appropriate
- Cards normally display approximately three or more per row depending on available width
- Hero content may use side-by-side text and imagery
- Page content should be constrained to a readable maximum width rather than stretched across the entire monitor

Use Flutter layout widgets such as:

- LayoutBuilder
- MediaQuery
- Wrap
- GridView
- Row
- Column
- Flex
- Expanded
- Flexible
- ConstrainedBox
- AspectRatio

Avoid fixed layouts that only work at one resolution.

Avoid scattering independent breakpoint values throughout the application. Shared responsive utilities should be used where appropriate.

---

## Routing

Use `go_router`.

The PWA should use URL-based navigation so major screens have browser-addressable routes.

Expected routes include:

```text
/
/services
/projects
/about
/privacy
```

Additional routes may be added for individual service and project pages as the site develops.

Responsive layout changes must not affect routing.

Changing the viewport width changes the presentation of a route, not the route itself.

---

## State Management

Use Provider:

https://pub.dev/packages/provider

https://github.com/rrousselGit/provider

Provider should be used when application state must be shared between widgets or screens.

Do not introduce state management where normal local widget state is sufficient.

---

## Material Design

Use Material 3 as the primary UI design system.

Application-wide visual configuration should be maintained through the Flutter theme rather than repeated styling within individual widgets.

This includes where appropriate:

- Colors
- Typography
- Navigation styling
- Component themes
- App bar styling
- NavigationRail styling

---

## Images and Assets

Current website content uses local assets.

Images must:

- Scale responsively
- Preserve appropriate aspect ratios
- Avoid overflow
- Avoid distortion
- Use `BoxFit.cover` or `BoxFit.contain` as appropriate
- Work correctly across mobile, tablet, and desktop layouts

Do not assume a fixed display size for project imagery.

---

## Firebase

Firebase is currently used for:

- Firebase Hosting
- Firebase Core
- Cloud Firestore

The Flutter application has been configured using FlutterFire.

Firestore connectivity has been tested successfully.

Firestore is not required for the primary Phase 1 portfolio content.

Permanent Firestore security rules must be implemented before any production Firestore-backed functionality is introduced.

---

## Hosting

The Flutter web application is hosted using Firebase Hosting.

Primary domain:

`https://allytechllc.com`

Firebase hosting site:

`https://allytechllc-website.web.app`

The application is configured as a single-page application with requests rewritten to `index.html` as required for Flutter web routing.

---

## Development Environment

Primary development environment:

- Windows 11
- VS Code
- Flutter SDK
- Firebase CLI
- FlutterFire CLI
- Git / GitHub

Local project:

```text
C:\Developer\allytechllc
```

---

## Current Development Workflow

A Windows-specific file-lock issue currently prevents reliable Flutter web debug/hot-reload operation on this development machine.

Current supported workflows are:

### Local Windows Debugging

```text
flutter run -d windows
```

### Web Build

```text
flutter build web
```

### Local Web Preview

Serve:

```text
build/web
```

using the existing local web-server workflow.

### Firebase Deployment

```text
firebase deploy --only hosting
```

The file-lock issue is considered a development-environment issue rather than an application architecture issue.

---

## Architectural Principles

1. Maintain one Flutter application for mobile, tablet, and desktop.
2. Adapt navigation and layout based on available width.
3. Keep application navigation separate from individual page content.
4. Reuse shared widgets instead of duplicating application structure.
5. Use URL-based routing appropriate for a PWA.
6. Keep breakpoint definitions and responsive behavior consistent throughout the application.
7. Avoid unnecessary architectural complexity for the Phase 1 portfolio website.
8. Use Firestore only where application requirements justify persistent cloud data.
9. Keep page content readable on large displays by constraining content width where appropriate.
10. Follow Flutter responsive/adaptive and Material 3 best practices.