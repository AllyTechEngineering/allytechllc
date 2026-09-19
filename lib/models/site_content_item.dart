import 'detail_section.dart';

class SiteContentItem {
  const SiteContentItem({
    required this.slug,
    required this.title,
    this.route,
    this.summary,
    this.imagePath,
    this.imageDescription,
    this.cardDescription,
    this.cardImagePath,
    this.detailParagraph,
    this.detailSections = const [],
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
  final List<DetailSection> detailSections;
}