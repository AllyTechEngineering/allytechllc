# Responsive Design Requirements

## Purpose

This document defines the responsive and adaptive UI requirements for the AllyTech LLC Flutter PWA.

The site must render correctly and remain usable across:

- Mobile phones
- Tablets
- Laptop displays
- Desktop displays
- Large desktop monitors

The application must use one shared Flutter codebase and adapt its presentation based on available display width.

Do not create separate mobile, tablet, and desktop applications.

---

## Design Principles

1. Base responsive behavior on available width, not device type, operating system, or user agent.

2. Use shared responsive rules throughout the application.

3. Keep navigation behavior separate from individual screen content.

4. Allow page content to reflow naturally as width changes.

5. Avoid fixed layouts that only work at one resolution.

6. Avoid fixed pixel widths for major page structures unless used as a maximum constraint.

7. Keep text readable on large screens by constraining content width.

8. Preserve usability when the browser window is resized dynamically.

9. Use Material 3 components and Flutter responsive/adaptive best practices.

10. Avoid duplicating page implementations for different screen sizes.

---

## Responsive Breakpoints

The application uses the following primary breakpoints:

| Width | Layout Type |
|---|---|
| `< 600 px` | Mobile |
| `600–1023 px` | Tablet |
| `>= 1024 px` | Desktop |

Reference implementation:

```dart
enum DeviceType {
  mobile,
  tablet,
  desktop,
}

DeviceType getDeviceType(double width) {
  if (width >= 1024) return DeviceType.desktop;
  if (width >= 600) return DeviceType.tablet;
  return DeviceType.mobile;
}
```

The breakpoint values must be centralized and reused.

Do not scatter hardcoded values such as `600` and `1024` throughout unrelated widgets.

If breakpoint constants are created, they should be maintained in a shared utility or constants file.

---

## Responsive Detection

Use the available widget or screen width to determine layout behavior.

Preferred Flutter tools include:

- `LayoutBuilder`
- `MediaQuery`
- `MediaQuery.sizeOf(context)`

Use `LayoutBuilder` where the layout should respond to the space provided by a parent.

Use `MediaQuery` where the widget needs information about the overall viewport.

Do not use:

- Operating system detection
- Browser user-agent detection
- Device model detection
- Platform-specific assumptions

A tablet-sized browser window on a desktop computer should render using the tablet layout.

---

## Adaptive Navigation

Navigation presentation changes according to available width.

### Mobile

For widths below `600 px`:

- Use a Material 3 `AppBar`
- Use a hamburger menu
- Use a `NavigationDrawer`
- Main content uses the available page width
- Navigation should not permanently consume horizontal screen space

Expected structure:

```text
AppBar
└── Menu Button
    └── NavigationDrawer

Page Content
```

---

### Tablet

For widths from `600 px` through `1023 px`:

- Use a Material 3 `AppBar`
- Use a `NavigationRail`
- Display the page content beside the navigation rail
- Keep the navigation rail relatively compact
- Allow the content area to use the remaining width

Expected structure:

```text
AppBar

NavigationRail | Page Content
```

---

### Desktop

For widths of `1024 px` and greater:

- Use a Material 3 `AppBar`
- Use a `NavigationRail`
- Use the expanded horizontal space for page content
- Constrain page content to a readable maximum width where appropriate
- Center constrained page content within the available space

Expected structure:

```text
AppBar

NavigationRail |     Centered Page Content
               |     within available area
```

The desktop layout must not stretch text and cards indefinitely across very wide monitors.

---

## Application Shell

The application shell is responsible for:

- App bar
- Adaptive navigation
- Navigation destination selection
- Responsive page structure
- Displaying routed screen content

Current shared widgets:

```text
lib/widgets/custom_app_bar.dart
lib/widgets/adaptive_navigation.dart
lib/widgets/adaptive_scaffold.dart
```

Individual screens should not duplicate the application-level navigation structure.

---

## Page Content Width

Large displays require a maximum readable content width.

For desktop layouts, use a centered `ConstrainedBox` or similar layout mechanism.

Recommended starting range:

```text
Maximum content width: approximately 1200–1400 px
```

The exact value may be adjusted based on visual testing.

Example structure:

```dart
Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(
      maxWidth: 1280,
    ),
    child: pageContent,
  ),
)
```

The maximum width should apply to page content, not necessarily to full-width backgrounds or decorative elements.

---

## Horizontal Page Padding

Pages must maintain consistent horizontal padding.

Suggested starting values:

| Layout | Horizontal Padding |
|---|---|
| Mobile | 16 px |
| Tablet | 24 px |
| Desktop | 32 px |

These values may be adjusted during UI refinement.

Padding should be centralized where practical rather than independently chosen on each screen.

---

## Vertical Spacing

Use consistent vertical spacing between:

- Page headings
- Sections
- Cards
- Images
- Text blocks
- Calls to action

Avoid arbitrary spacing values throughout individual screens.

Prefer a small consistent spacing scale such as:

```text
8 px
16 px
24 px
32 px
48 px
64 px
```

The exact spacing scale may be refined as the visual design matures.

---

## Responsive Screen Content

Responsive behavior applies to the content inside each screen, not only to the navigation shell.

A screen should reorganize its content according to available width.

---

## Mobile Layout

For widths below `600 px`:

- Prefer single-column layouts
- Stack major content sections vertically
- Display cards one per row where practical
- Allow images to use most or all of the available content width
- Stack text and image sections vertically
- Avoid horizontal scrolling
- Keep buttons and interactive elements easy to tap
- Keep side padding sufficient to avoid content touching screen edges

Example:

```text
Heading

Text

Image

Card
Card
Card

Call to Action
```

---

## Tablet Layout

For widths from `600 px` through `1023 px`:

- Use multiple columns where useful
- Typically display two cards per row
- Increase spacing compared with mobile
- Allow some text/image sections to remain stacked if side-by-side layout becomes cramped
- Use available horizontal space without forcing desktop-style layouts too early

Example:

```text
Heading

Card      Card
Card      Card

Text

Image
```

---

## Desktop Layout

For widths of `1024 px` and greater:

- Use multi-column layouts where appropriate
- Typically display three or more cards per row depending on available width
- Allow hero sections to display text and imagery side-by-side
- Use additional horizontal spacing
- Constrain readable text width
- Avoid excessive empty space inside cards
- Avoid stretching paragraphs across the entire screen

Example:

```text
              Heading

Text Content              Image

Card      Card      Card

        Call to Action
```

---

## Responsive Grids

Use responsive grids for Services, Projects, and other card-based content.

Suitable Flutter widgets include:

- `GridView`
- `GridView.builder`
- `SliverGrid`
- `Wrap`
- `LayoutBuilder`

The number of columns should depend on available content width.

Typical target behavior:

| Layout | Typical Columns |
|---|---|
| Mobile | 1 |
| Tablet | 2 |
| Desktop | 3 |
| Large Desktop | 3–4 when appropriate |

Do not force four columns simply because the display is wide.

Card width and readability take priority over maximizing the number of columns.

---

## Card Sizing

Cards should remain visually consistent within a section.

Avoid hardcoding card widths that cause overflow or excessive unused space.

Cards should:

- Expand within reasonable constraints
- Preserve consistent internal padding
- Maintain aligned headings and content where practical
- Adapt height naturally when content differs
- Avoid clipped text

When cards contain images, image dimensions should remain visually consistent across cards within the same section.

---

## Hero Sections

Hero sections should adapt significantly between mobile and desktop.

### Mobile

Use a vertical layout:

```text
Heading
Supporting Text
Call to Action
Image
```

or:

```text
Image
Heading
Supporting Text
Call to Action
```

depending on final visual design.

### Tablet

Use either:

- A stacked layout
- A partial two-column layout

Choose based on available width and content readability.

### Desktop

A side-by-side layout is appropriate:

```text
Text Content     Image
```

The text area and image area should not necessarily use equal width.

The layout should prioritize readable text width.

---

## Images

Images must respond to available layout space.

Use Flutter tools such as:

- `AspectRatio`
- `ConstrainedBox`
- `SizedBox`
- `FittedBox`
- `ClipRRect`
- `BoxFit.cover`
- `BoxFit.contain`

Images must:

- Preserve appropriate aspect ratio
- Avoid distortion
- Avoid overflow
- Avoid unexpected cropping of important content
- Remain useful at mobile widths
- Avoid becoming excessively large on desktop displays

Use `BoxFit.cover` when cropping is acceptable.

Use `BoxFit.contain` when the full image must remain visible.

---

## Local Assets

The current site uses local assets.

Asset references must be declared correctly in:

```text
pubspec.yaml
```

Responsive layout logic should control how an image is presented.

Do not create separate mobile and desktop copies of the same image unless there is a specific design reason.

---

## Typography

Material 3 theme typography should remain the primary typography source.

Use:

```dart
Theme.of(context).textTheme
```

rather than independently defining fonts and text sizes throughout screens.

Typography may scale moderately by layout size where needed.

For example:

- Mobile page headings may use a smaller display style
- Desktop hero headings may use a larger display style
- Body text should remain within a comfortable reading range across all layouts

Avoid excessive responsive font scaling.

Do not scale all typography proportionally to screen width.

---

## Text Width

Paragraphs should not span extremely wide desktop layouts.

For long-form text such as:

- About content
- Privacy policy
- Project descriptions
- Service descriptions

Use a constrained text column where appropriate.

Readable content width is more important than filling the entire viewport.

---

## Buttons and Interactive Controls

Interactive elements must remain usable on touch devices.

Requirements:

- Maintain adequate touch target size
- Avoid placing controls too close together
- Ensure buttons do not overflow narrow screens
- Allow button labels to wrap or adjust where necessary
- Avoid relying only on hover behavior
- Preserve keyboard access on desktop/web

Call-to-action buttons may:

- Use content width on desktop
- Expand to wider or full-width presentation on mobile where appropriate

---

## Navigation Selection

Navigation state must remain consistent when switching between:

- Drawer navigation
- NavigationRail
- Browser navigation
- Direct URL navigation

The selected destination should be determined from the active route rather than maintained independently in each navigation widget.

Changing viewport width must not change the selected route.

Example:

```text
Desktop /projects
     ↓ resize browser
Mobile /projects
```

The application remains on `/projects`.

Only the navigation presentation changes.

---

## Routing

Responsive behavior must remain independent from routing.

Use `go_router`.

Expected primary routes:

```text
/
/services
/projects
/about
/privacy
```

Possible future child/detail routes include:

```text
/services/app-development
/services/embedded-systems
/services/iot
/services/pwa-development
/services/pcb-design
/services/project-management

/projects/proofing-ovens
/projects/embedded-linux
/projects/iot
/projects/rfid
/projects/apps
```

Do not create routes based on viewport type.

Invalid examples:

```text
/mobile/projects
/desktop/projects
```

The route identifies content, not layout.

---

## Browser Resizing

Flutter web users may resize the browser continuously.

The application must:

- Recalculate layout when available width changes
- Switch between adaptive navigation layouts cleanly
- Avoid requiring a page refresh
- Avoid losing the active route
- Avoid overflowing content during breakpoint transitions
- Avoid rendering duplicate navigation elements

Special attention must be given to widths immediately around:

```text
600 px
1024 px
```

---

## Accessibility

Responsive layouts must remain accessible.

Requirements include:

- Adequate touch targets
- Keyboard navigation support
- Logical focus order
- Sufficient color contrast
- Semantic labels where appropriate
- Support for browser zoom
- Support for increased text scaling
- No clipped critical text
- No interaction that depends exclusively on hover

Layouts should tolerate increased text size without major overflow.

---

## Orientation

The application should respond naturally to orientation changes on mobile and tablet devices.

Do not assume:

```text
Mobile = portrait
Tablet = landscape
```

Use available width.

A large phone in landscape may cross the `600 px` breakpoint.

That is acceptable if the layout remains usable.

---

## Scrolling

Pages should primarily use vertical scrolling.

Avoid horizontal scrolling for normal site content.

Horizontal scrolling may only be used where it is an intentional component behavior.

Page layouts must not create accidental horizontal overflow.

---

## Overflow Handling

All responsive widgets must be checked for:

- `RenderFlex overflow`
- Clipped text
- Overflowing images
- Navigation collisions
- Buttons extending off-screen
- Cards narrower than their content
- Unexpected horizontal scrollbars

Use flexible layout widgets rather than hiding overflow problems.

---

## Shared Responsive Utilities

Responsive logic should be centralized where practical.

Potential shared functionality may include:

```text
lib/utils/responsive.dart
```

Possible responsibilities:

```dart
class AppBreakpoints {
  static const double mobile = 600;
  static const double desktop = 1024;
}
```

and:

```dart
enum DeviceType {
  mobile,
  tablet,
  desktop,
}
```

and helper functions such as:

```dart
DeviceType getDeviceType(double width)
```

Additional responsive utilities should only be added when they reduce duplication.

Do not create unnecessary abstraction for simple layout decisions.

---

## Recommended Layout Widgets

Prefer Flutter's built-in layout system.

Commonly used widgets should include:

```text
LayoutBuilder
MediaQuery
Row
Column
Wrap
GridView
Expanded
Flexible
Spacer
Padding
SizedBox
ConstrainedBox
Center
AspectRatio
FractionallySizedBox
```

Avoid using `Stack` and absolute positioning for normal page structure unless the visual design specifically requires it.

---

## Avoid Fixed Positioning

Do not build page layouts using fixed coordinates.

Avoid patterns such as:

```dart
Positioned(
  left: 247,
  top: 153,
)
```

for ordinary responsive content.

The interface should be driven by Flutter's layout constraints.

---

## Testing Strategy

Responsive testing must cover representative widths.

Minimum target widths:

```text
360 px
390 px
600 px
768 px
1024 px
1366 px
1440 px
1920 px
```

Also test immediately around breakpoints:

```text
599 px
600 px
601 px

1023 px
1024 px
1025 px
```

This verifies that layout transitions occur cleanly.

---

## Primary Test Categories

Each primary screen should be checked for:

- Navigation behavior
- Page width
- Horizontal padding
- Text readability
- Grid column count
- Card sizing
- Image scaling
- Button sizing
- Overflow
- Browser resizing
- Active route preservation

Screens include:

```text
Home
Services
Projects
About
Privacy
```

Future service and project detail pages must follow the same responsive rules.

---

## Target Browser Behavior

The Flutter PWA should render correctly in current mainstream desktop and mobile browsers supported by Flutter web.

Primary testing should include:

- Chrome desktop
- Chrome mobile viewport testing
- Edge desktop
- Safari/iOS where practical

Browser-specific workarounds should only be introduced when an actual compatibility problem is confirmed.

---

## PWA Considerations

Responsive behavior must work both when the site is:

- Opened normally in a browser
- Installed as a PWA

Do not assume that installed PWA window dimensions match standard desktop browser dimensions.

Always respond to the actual available width.

---

## Performance

Responsive implementation should avoid unnecessary rebuild complexity.

Prefer:

- Simple constraint-based layouts
- Shared widgets
- Local layout decisions
- Flutter built-in layout mechanisms

Avoid:

- Multiple complete widget trees for every screen size unless genuinely necessary
- Excessive nested `LayoutBuilder` widgets
- Repeated `MediaQuery` calculations where no responsive behavior is required

Responsive design should remain understandable and maintainable.

---

## Implementation Rule

When developing a new screen:

1. Build the semantic page content.
2. Verify the mobile layout.
3. Verify the tablet layout.
4. Verify the desktop layout.
5. Test breakpoint transitions.
6. Test browser resizing.
7. Check for overflow.
8. Verify route/navigation behavior.
9. Verify image behavior.
10. Verify text scaling and readability.

A screen is not considered complete until it has been checked at all three primary layout categories.

---

## Source of Truth

This document is the source of truth for responsive and adaptive UI behavior.

High-level architectural decisions are maintained in:

```text
Docs/arch.md
```

If implementation decisions conflict with this document, update the documentation deliberately rather than introducing undocumented responsive behavior.