import 'package:flutter/material.dart';

/// Defines one image-and-text section displayed on a service or project
/// detail page.
class DetailSection {
  const DetailSection({
    required this.imagePath,
    required this.imageTitle,
    required this.paragraph,
    required this.imageDescription,
    this.imageFit = BoxFit.cover,
  });

  /// Local asset path for the section image.
  final String imagePath;

  /// Visible title associated with the image and paragraph.
  final String imageTitle;

  /// Explanatory paragraph displayed with the image.
  final String paragraph;

  /// Accessibility description read by screen readers.
  final String imageDescription;

  /// Controls how the image is displayed inside its available space.
  ///
  /// Use BoxFit.cover for photographs where minor cropping is acceptable.
  /// Use BoxFit.contain for diagrams that must remain fully visible.
  final BoxFit imageFit;
}