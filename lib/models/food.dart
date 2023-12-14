class Food {
  final String name;
  final String slug;
  final String description;
  final int price;
  final String formattedPrice;
  final String image;

  Food({
    required this.name,
    required this.slug,
    required this.description,
    required this.price,
    required this.formattedPrice,
    required this.image,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        name: json['title'],
        slug: json['slug'],
        description: json['description'],
        price: json['variants'][0]['price']['amount'] as int,
        formattedPrice: json['variants'][0]['price']['formatted'],
        image: json['media'][0]['url']);
  }
}
