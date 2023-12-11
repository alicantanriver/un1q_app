import 'package:flutter/material.dart';

class Food extends ChangeNotifier {
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
    final List<dynamic> img = json['variants'][0]['media'];
    String imgSrc;
    if (img.isNotEmpty) {
      imgSrc = json['variants'][0]['media'][0]['responsive_images']['src'];
    } else {
      imgSrc = '';
    }

    return Food(
        name: json['title'],
        slug: json['slug'],
        description: json['description'],
        price: json['variants'][0]['price']['amount'] as int,
        formattedPrice: json['variants'][0]['price']['formatted'],
        image: imgSrc);
  }
}
