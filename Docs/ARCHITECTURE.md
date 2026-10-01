# AllyTech LLC Website Architecture

## 1. System Overview

The AllyTech LLC website is implemented as a Flutter Progressive Web App
using Dart.

A single Flutter application provides the mobile, tablet, laptop, and
desktop browser experience. Responsive behavior is determined by
available display width rather than device or operating-system
identification.

The production web application is hosted using Firebase Hosting.

## 2. Application Design

The application uses a data-driven UI architecture with reusable
presentation components.

Service and project content is represented by structured Dart models and
maintained separately from the widgets that render the content. Shared
widgets render service and project cards, detail pages, navigation, and
responsive application structure.

This separates: - Content data - Routing - Responsive application
structure - Reusable presentation widgets - Feature screens

## 3. Project Structure

```
lib/
├── features/
│   ├── home/
│   ├── services/
│   ├── projects/
│   ├── about/
│   └── legal/
├── models/
├── routing/
├── utils/
├── widgets/
├── firebase_options.dart
└── main.dart

assets/
└── images/

Docs/
```

## 4. Content Architecture

Service and project content is maintained in:

```
lib/utils/site_content.dart
```

Content is represented using:

```
SiteContentItem
DetailSection
```

`SiteContentItem` defines the primary content for a service or project,
including its slug, route, title, summary, image information,
descriptive content, and optional detail sections.

`DetailSection` defines an ordered detail-page section containing an
image, title, descriptive paragraph, and image description.

This allows multiple services and projects to use the same presentation
widgets without creating a separate page implementation for each content
item.

## 5. Services

The current service content consists of:

-   IoT App Development
-   IoT Web Development
-   Embedded IoT Development
-   Schematic & PCB Design
-   Project Management focused on IoT NPD

Service routes are defined with the corresponding content item and are
rendered through the shared service/detail-page structure.

## 6. Projects

The current project content consists of:

-   Proofing Ovens
-   Flutter/Dart Embedded Linux
-   IoT Connected RFID
-   Sailing Race Computer

Project routes are defined with the corresponding content item and are
rendered through the shared project/detail-page structure.

## 7. Routing

Routing is implemented with `go_router`.

The application uses URL-based navigation for major pages and individual
service and project detail pages.

Responsive layout changes do not change the active route. Changing the
viewport width changes presentation only.

## 8. Responsive Architecture

Responsive behavior is based on available width.

```
Mobile:   < 600 px
Tablet:   600–1023 px
Desktop:  >= 1024 px
```

### Mobile

-   Material 3 AppBar
-   Navigation Drawer
-   Primarily single-column page layouts
-   Cards normally displayed one per row

### Tablet

-   Material 3 AppBar
-   NavigationRail
-   Responsive content area
-   Multi-column content where appropriate

### Desktop

-   Material 3 AppBar
-   NavigationRail
-   Expanded content area
-   Centered and width-constrained content where appropriate
-   Multi-column content where appropriate

Shared responsive behavior is implemented through Flutter layout
mechanisms rather than separate applications for each display class.

## 9. Application Shell

Shared application-level widgets provide the common application
structure.

Current shared application-shell components include:

```
lib/widgets/custom_app_bar.dart
lib/widgets/adaptive_navigation.dart
lib/widgets/adaptive_scaffold.dart
```

The application shell is responsible for: - App bar - Navigation -
Responsive layout - Routed page content

Feature screens primarily provide page-specific content.

## 10. Presentation Components

Reusable widgets provide common card-grid and detail-page presentation.

Service and project screens select structured content and pass it to the
shared presentation widgets.

Detail pages render the primary content followed by the ordered
`DetailSection` collection when detail sections are present.

## 11. Theme

The application uses Material 3.

Application colors, typography, and component styling are maintained
through the shared Flutter theme rather than independently styled
feature pages.

## 12. Assets

Website imagery is stored under:

```
assets/images/
```

Service and project images are organized by content area and registered
as Flutter assets in:

```
pubspec.yaml
```

WebP is used for service and project imagery where currently
implemented.

## 13. Hosting

The Flutter web production build is deployed to Firebase Hosting.

The public site uses:

```
allytechllc.com
```

Firebase configuration is maintained in the project repository for the
deployed web application.

## 14. Contact

The contact feature is implemented as a persistent contact action within the shared application shell.

The contact action uses Flutter's `FloatingActionButton`. Its presentation adapts to the available display width:

- Desktop and tablet use an extended floating action button with a contact icon and `Contact` label.
- Mobile uses a compact icon-only floating action button.

Selecting the contact action opens a Material 3 modal dialog over the current page. No route change is required.

The dialog contains:

- Name
- Email
- Message
- Cancel action
- Send action

The contact feature uses `url_launcher` to construct and launch a `mailto:` URI addressed to:

`btaylor@allytechllc.com`
