# Image Requirements

## Purpose

This document defines the image requirements for the AllyTech LLC Flutter PWA.

The goal is to ensure that Service and Project images:

- Render consistently across mobile, tablet, and desktop layouts
- Scale correctly inside responsive cards
- Load efficiently in the browser
- Maintain visual consistency across the website
- Avoid unnecessary redesign work later

These requirements apply primarily to images used in:

- Home page cards
- Services cards
- Projects cards
- Service detail pages
- Project detail pages

---

## Standard Card Image Format

Use a landscape image with a `16:9` aspect ratio.

Recommended master resolution:

```text
1600 × 900 px
```

Preferred aspect ratio:

```text
16:9
```

Maximum recommended resolution for normal card imagery:

```text
1920 × 1080 px
```

There is generally no need to use images larger than `1920 × 1080` for this website.

---

## Preferred File Formats

Use the following formats:

```text
WebP   Preferred for photographs and rendered graphics
JPEG   Acceptable for photographs
PNG    Use when transparency or sharp technical graphics are required
SVG    Appropriate for simple icons, logos, and vector diagrams
```

For most Service and Project card images, prefer:

```text
WebP
```

---

## File Size Targets

Website images should be optimized before being added to the Flutter project.

Recommended target:

```text
100–250 KB per card image
```

Preferred maximum:

```text
Approximately 350 KB
```

Avoid using multi-megabyte source images directly in the website.

Keep original high-resolution artwork or photographs separately if needed.

The Flutter project should contain optimized web-ready versions.

---

## Image Composition

Card images will normally use:

```dart
BoxFit.cover
```

This means the image may be cropped slightly depending on card dimensions.

Important subjects should therefore remain inside the center portion of the image.

Recommended safe area:

```text
Approximately the center 80% of the image
```

Conceptually:

```text
┌────────────────────────────────────┐
│        possible crop area          │
│   ┌────────────────────────────┐   │
│   │                            │   │
│   │     IMPORTANT CONTENT      │   │
│   │        SAFE AREA           │   │
│   │                            │   │
│   └────────────────────────────┘   │
│        possible crop area          │
└────────────────────────────────────┘
```

Avoid placing important subjects, labels, or other critical information directly against the edges.

---

## Text Inside Images

Do not place normal card titles or descriptive marketing text inside the image itself.

Preferred:

```text
[ IMAGE ]

App Development
Explore App Development →
```

Avoid:

```text
[ IMAGE WITH "APP DEVELOPMENT" BAKED INTO THE IMAGE ]
```

Flutter should render the card title and supporting text separately.

This provides:

- Better responsive behavior
- Better accessibility
- Easier text updates
- Better consistency
- Better localization support if needed later

---

## Technical Diagrams

Technical diagrams may contain text when the text is an intrinsic part of the diagram.

Examples include:

- Block diagrams
- System diagrams
- PCB diagrams
- Architecture diagrams
- Engineering labels
- Signal flow diagrams

For technical diagrams:

- Keep text large enough to remain readable
- Avoid unnecessary marketing language
- Keep labels concise
- Maintain sufficient contrast
- Keep important information away from edges when the image may be cropped

If the entire technical diagram must remain visible, use:

```dart
BoxFit.contain
```

rather than:

```dart
BoxFit.cover
```

---

## Visual Consistency

Service and Project images should maintain a reasonably consistent visual style.

Images should generally have:

- The same `16:9` aspect ratio
- Similar visual density
- Similar subject scale
- Similar use of whitespace
- Important subjects centered
- No decorative border baked into the image
- No rounded corners baked into the image
- No card shadow baked into the image

Flutter should provide:

- Borders
- Rounded corners
- Shadows
- Padding
- Spacing
- Card background
- Hover and interaction behavior

---

## Logos and Branding

Do not embed the AllyTech LLC logo into every card image.

The application already provides site-level branding.

Only include a logo inside an image when it is specifically relevant to that image or project.

Avoid unnecessary repeated branding.

---

## Flutter Image Presentation

A typical responsive card image should use:

```dart
AspectRatio(
  aspectRatio: 16 / 9,
  child: Image.asset(
    imagePath,
    width: double.infinity,
    fit: BoxFit.cover,
  ),
)
```

This allows the same source image to work across:

```text
Mobile       1 column
Tablet       2 columns
Desktop      3 columns
Wide desktop 3–4 columns
```

The card controls the display size.

The source image should not require separate mobile, tablet, and desktop versions.

---

## When to Use BoxFit.cover

Use:

```dart
BoxFit.cover
```

when:

- The image is primarily visual
- Minor cropping is acceptable
- The card should remain visually full
- The subject remains within the safe area

Typical examples:

- Product photography
- Project photography
- Workshop images
- Equipment images
- General engineering imagery

---

## When to Use BoxFit.contain

Use:

```dart
BoxFit.contain
```

when:

- The entire image must remain visible
- Cropping would remove important information
- The image is a technical diagram
- The image contains labels near the edges
- The image represents a complete schematic or system view

Typical examples:

- Block diagrams
- PCB layouts
- System architecture diagrams
- Engineering drawings
- Technical illustrations

---

## Asset Organization

Recommended asset structure:

```text
assets/
└── images/
    ├── services/
    │   ├── app_development.webp
    │   ├── embedded_systems.webp
    │   ├── iot_iiot.webp
    │   ├── pwa_development.webp
    │   ├── pcb_design.webp
    │   └── project_management.webp
    │
    └── projects/
        ├── proofing_oven.webp
        ├── embedded_linux.webp
        ├── iot.webp
        ├── rfid.webp
        ├── apps.webp
        └── other.webp
```

Additional subfolders may be added later for:

```text
about/
logos/
diagrams/
backgrounds/
```

---

## File Naming

Use lowercase `snake_case`.

Preferred:

```text
app_development.webp
embedded_systems.webp
proofing_oven.webp
rfid_system.webp
```

Avoid:

```text
App Development.webp
AppDevelopmentFinal2.webp
IMG_3847.webp
new-image-final-final.webp
```

File names should describe the image purpose clearly.

---

## pubspec.yaml

Local assets must be declared in:

```text
pubspec.yaml
```

For example:

```yaml
flutter:
  assets:
    - assets/images/services/
    - assets/images/projects/
```

Use directory declarations when practical rather than listing every image individually.

---

## Accessibility

Images should be treated according to their purpose.

### Informational Images

If an image conveys information, the surrounding Flutter widget should provide an appropriate semantic description.

Examples:

- Technical diagram
- Project photograph
- Product rendering
- System illustration

### Decorative Images

If an image is purely decorative, avoid adding unnecessary semantic information that creates screen-reader noise.

Card titles and descriptions should normally provide the primary accessible context for the card.

---

## Responsive Behavior

Images must work correctly at all supported layout widths.

They must:

- Scale with the card
- Avoid distortion
- Avoid overflow
- Preserve the intended aspect ratio
- Remain visually useful at mobile widths
- Avoid becoming excessively large on desktop
- Avoid forcing horizontal scrolling

Do not use fixed image widths for card imagery.

---

## Card Layout Requirements

Card imagery should support responsive card layouts such as:

```text
Mobile
[ Card ]

Tablet
[ Card ] [ Card ]

Desktop
[ Card ] [ Card ] [ Card ]

Wide Desktop
[ Card ] [ Card ] [ Card ] [ Card ]
```

The same image asset should work at all of these widths.

---

## Recommended Card Structure

A typical card should use:

```text
┌───────────────────────────────┐
│                               │
│           IMAGE               │
│            16:9               │
│                               │
├───────────────────────────────┤
│ App Development               │
│ Explore App Development →     │
└───────────────────────────────┘
```

The entire card may be interactive.

The image itself does not need to contain navigation text.

---

## Image Quality

Images should appear sharp on normal and high-density displays.

Recommended master size:

```text
1600 × 900 px
```

This provides sufficient resolution for normal desktop card presentation while remaining practical for web optimization.

Avoid enlarging small source images beyond their useful resolution.

Upscaling should only be performed when image quality remains acceptable.

---

## Color and Contrast

Images should remain readable and visually clear within the website theme.

Avoid:

- Extremely dark images with no visible subject
- Extremely bright images that overpower the card
- Low-contrast technical diagrams
- Small labels with insufficient contrast
- Excessively busy backgrounds

If text must appear inside a technical image, ensure adequate contrast between text and background.

---

## Cropping Guidelines

When creating or editing card imagery:

- Keep the primary subject near the center
- Leave reasonable space around the subject
- Avoid important content in the extreme left or right edges
- Avoid important content in the extreme top or bottom edges
- Avoid placing technical labels directly against image boundaries

This improves compatibility with responsive `BoxFit.cover` behavior.

---

## Source Image Storage

Keep original source images separate from optimized website assets when possible.

Example:

```text
Project source artwork
    ↓
High-resolution original
    ↓
Optimized web export
    ↓
assets/images/...
```

Do not repeatedly edit compressed web versions if the original artwork is available.

---

## Image Optimization Workflow

Recommended workflow:

1. Create or obtain the source image.
2. Crop to `16:9`.
3. Resize to approximately `1600 × 900`.
4. Verify important content is inside the safe area.
5. Remove unnecessary embedded text.
6. Export to WebP where appropriate.
7. Optimize file size.
8. Verify visual quality.
9. Add the optimized image to the correct assets directory.
10. Test the image on mobile, tablet, and desktop layouts.

---

## Service Image Requirements

Each primary Service category should eventually have a dedicated image.

Current categories:

```text
App Development
Embedded Systems
IoT / IIoT
PWA Development
Schematic & PCB Design
Project Management
```

Recommended filenames:

```text
app_development.webp
embedded_systems.webp
iot_iiot.webp
pwa_development.webp
pcb_design.webp
project_management.webp
```

---

## Project Image Requirements

Each primary Project category should eventually have representative imagery.

Current categories:

```text
Proofing Ovens
Embedded Linux
IoT
RFID
Apps
Other
```

Recommended filenames:

```text
proofing_oven.webp
embedded_linux.webp
iot.webp
rfid.webp
apps.webp
other.webp
```

Individual projects may later receive their own dedicated images.

---

## Standard Summary

Use the following standard for normal AllyTech LLC card images:

```text
Aspect Ratio:       16:9
Master Resolution:  1600 × 900 px
Maximum Normal Size:1920 × 1080 px
Preferred Format:   WebP
Target File Size:   100–250 KB
Preferred Maximum:  ~350 KB
Image Text:         Avoid unless intrinsic to a technical diagram
Important Content:  Keep within approximately center 80%
Normal Flutter Fit: BoxFit.cover
Diagram Flutter Fit:BoxFit.contain
Naming:             lowercase_snake_case
```

---

## Source of Truth

This document is the source of truth for website image preparation and image presentation requirements.

Responsive layout requirements are maintained in:

```text
Docs/responsive_design.md
```

Application architecture is maintained in:

```text
Docs/arch.md
```

If image requirements change during implementation, update this document deliberately so future image creation remains consistent.
