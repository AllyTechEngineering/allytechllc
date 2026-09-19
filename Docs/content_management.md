# Service and Project Content Management

## Purpose

This document explains how to add and maintain content for the AllyTech LLC service and project pages.

Service-specific and project-specific content is stored separately from the widgets that display it.

---

## File Responsibilities

| File | Responsibility |
|---|---|
| `lib/utils/site_content.dart` | Defines content for each service and project |
| `lib/models/detail_section.dart` | Defines the structure of one image-and-text detail section |
| `lib/widgets/site_card_grid.dart` | Displays service and project card collections |
| `lib/widgets/portfolio_card.dart` | Displays an individual card |
| `lib/widgets/site_detail_page.dart` | Displays the shared detail-page layout |
| `lib/features/services/service_detail_screen.dart` | Sends the selected service content to `SiteDetailPage` |
| `lib/features/projects/project_detail_screen.dart` | Sends the selected project content to `SiteDetailPage` |
| `pubspec.yaml` | Registers image asset directories |

---

## Content Structure

Each service or project is represented by a `NavItem` in `site_content.dart`.

The item may contain separate content for:

- The card
- The detail-page introduction
- The detail-page image-and-text sections

### Card Content

```dart
cardImagePath
cardDescription
```

These values appear on the Services, Projects, or Home card.

### Detail-Page Introduction

```dart
summary
```

The summary appears near the top of the detail page.

### Detail Sections

```dart
detailSections
```

Each detail page is designed to contain four ordered `DetailSection` objects.

Each section contains:

```dart
imagePath
imageTitle
paragraph
imageDescription
imageFit
```

The image, title, and explanatory paragraph remain grouped together as one section.

---

## DetailSection Model

The model is defined in:

```text
lib/models/detail_section.dart
```

```dart
class DetailSection {
  const DetailSection({
    required this.imagePath,
    required this.imageTitle,
    required this.paragraph,
    required this.imageDescription,
    this.imageFit = BoxFit.cover,
  });

  final String imagePath;
  final String imageTitle;
  final String paragraph;
  final String imageDescription;
  final BoxFit imageFit;
}
```

---

## Standard Detail-Page Structure

Each service and project detail page should normally contain:

1. Page title
2. Introductory summary
3. Detail section 1
4. Detail section 2
5. Detail section 3
6. Detail section 4

Each detail section contains:

1. Image
2. Image title
3. Explanatory paragraph

The order of the `DetailSection` objects in `site_content.dart` determines their display order.

---

## Example Project Content

```dart
NavItem(
  slug: 'rfid',
  title: 'RFID',
  cardImagePath: 'assets/images/projects/rfid/rfid_card.webp',
  cardDescription: 'Short description displayed on the RFID card.',
  summary: 'Introductory summary displayed at the top of the RFID detail page.',
  detailSections: [
    DetailSection(
      imagePath: 'assets/images/projects/rfid/rfid_1.webp',
      imageTitle: 'RFID System Overview',
      paragraph: 'Explanation of the complete RFID system.',
      imageDescription: 'Diagram showing the complete RFID system.',
      imageFit: BoxFit.contain,
    ),
    DetailSection(
      imagePath: 'assets/images/projects/rfid/rfid_2.webp',
      imageTitle: 'RFID Tags',
      paragraph: 'Explanation of the RFID tags and how they are used.',
      imageDescription: 'RFID tag attached to an animal.',
    ),
    DetailSection(
      imagePath: 'assets/images/projects/rfid/rfid_3.webp',
      imageTitle: 'Reader and Antenna',
      paragraph: 'Explanation of the reader and antenna installation.',
      imageDescription: 'RFID reader connected to a floor antenna.',
    ),
    DetailSection(
      imagePath: 'assets/images/projects/rfid/rfid_4.webp',
      imageTitle: 'Record Management',
      paragraph: 'Explanation of the record-management application.',
      imageDescription: 'Application screen displaying RFID records.',
    ),
  ],
),
```

---

## Adding Content to an Existing Item

To add or update content:

1. Open `lib/utils/site_content.dart`.
2. Find the appropriate item in `serviceItems` or `projectItems`.
3. Add or update its card content.
4. Add or update its summary.
5. Add four `DetailSection` objects.
6. Add the corresponding images to the appropriate asset directory.
7. Confirm that the asset directory is registered in `pubspec.yaml`.
8. Save the files and perform a hot restart.
9. Review the page at mobile, tablet, and desktop widths.

Normal content changes should not require modifications to `site_detail_page.dart`.

---

## Recommended Asset Organization

```text
assets/
└── images/
    ├── services/
    │   └── embedded_systems/
    │       ├── embedded_systems_card.webp
    │       ├── embedded_systems_1.webp
    │       ├── embedded_systems_2.webp
    │       ├── embedded_systems_3.webp
    │       └── embedded_systems_4.webp
    │
    └── projects/
        └── rfid/
            ├── rfid_card.webp
            ├── rfid_1.webp
            ├── rfid_2.webp
            ├── rfid_3.webp
            └── rfid_4.webp
```

Use lowercase `snake_case` filenames.

---

## Image Presentation

Use:

```dart
BoxFit.cover
```

for photographs where minor cropping is acceptable.

Use:

```dart
BoxFit.contain
```

for:

- Technical diagrams
- Architecture diagrams
- Schematics
- Images containing labels
- Images that must remain completely visible

Every informational image must have an `imageDescription` for accessibility.

---

## Legacy Detail Fields

The earlier detail-page implementation includes:

```dart
imagePath
imageDescription
detailParagraph
```

The standalone `imagePath` is displayed only when `detailSections` is empty.

When `detailSections` contains one or more sections, the section images replace the standalone detail image.

`detailParagraph`, when supplied through the existing `body` property, appears after the detail sections. It may be used as an optional conclusion, but the primary four explanatory paragraphs should be stored inside the four `DetailSection` objects.

---

## When to Modify SiteDetailPage

Modify `site_detail_page.dart` only when adding a new shared presentation feature, such as:

- Image captions
- Specifications tables
- Download links
- Video content
- Call-to-action sections
- A different responsive section layout

Do not modify `site_detail_page.dart` merely to add another service or project.

Normal service and project content belongs in:

```text
lib/utils/site_content.dart
```