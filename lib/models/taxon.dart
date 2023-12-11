class Taxon {
  final String name;
  final String slug;
  final String metaTitle;
  final String metaDescription;

  Taxon({
    required this.name,
    required this.slug,
    required this.metaTitle,
    required this.metaDescription,
  });

  factory Taxon.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'slug': String slug,
        'meta_title': String metaTitle,
        'meta_description': String metaDescription,
      } =>
        Taxon(
            name: name,
            slug: slug,
            metaTitle: metaTitle,
            metaDescription: metaDescription),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
