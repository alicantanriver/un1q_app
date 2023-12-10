import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:un1q_app/views/product_info_view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Row(
        children: [
          Expanded(
            child: CategoryColumn(
              categories: [
                {'name': 'Mexican', 'image': 'assets/images/taco.png'},
                {
                  'name': 'Fast Food',
                  'image': 'assets/images/french-fries.png'
                },
                {'name': 'Vegetarian', 'image': 'assets/images/salad.png'},
              ],
            ),
          ),
          Expanded(
            child: CategoryColumn(categories: [
              {'name': 'Asian', 'image': 'assets/images/sushi.png'},
              {'name': 'American', 'image': 'assets/images/burger.png'},
              {'name': 'Italian', 'image': 'assets/images/pizza.png'},
            ]),
          ),
        ],
      ),
    );
  }
}

class CategoryColumn extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const CategoryColumn({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: categories
          .map((category) => CategoryItem(
                categoryName: category['name'],
                categoryImage: category['image'],
              ))
          .toList(),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final String categoryImage;

  const CategoryItem(
      {Key? key, required this.categoryName, required this.categoryImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to the product info screen for the selected category
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductInfoView(),
            ),
          );
        },
        child: Card(
          elevation: 3.0,
          child: Column(
            children: [
              Image.asset(
                categoryImage,
                height: 100.0,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              ListTile(
                title: Center(
                  child: Text(
                    categoryName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
