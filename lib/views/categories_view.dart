import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:un1q_app/categories_controller.dart';
import 'package:un1q_app/models/taxon.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => CategoriesController();

  Widget build(BuildContext context, CategoriesController controller) {
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
      body: Center(
          child: FutureBuilder<List<Taxon>?>(
              future: controller.futureTaxon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Taxon> taxons = snapshot.data!;
                  return ListView.builder(
                      itemCount: taxons.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          taxon: taxons[index],
                          controller: controller,
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              })),
    );
  }
}

// class CategoryColumn extends StatelessWidget {
//   final List<Map<String, dynamic>> categories;

//   const CategoryColumn({Key? key, required this.categories}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: categories
//           .map((category) => CategoryItem(
//                 categoryName: category['name'],
//                 categoryImage: category['image'],
//               ))
//           .toList(),
//     );
//   }
// }

class CategoryItem extends StatelessWidget {
  final Taxon taxon;
  final CategoriesController? controller;

  const CategoryItem({Key? key, required this.taxon, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          return controller?.onTaxonPressed(taxon);
        },
        child: Card(
          elevation: 3.0,
          child: Column(
            children: [
              Image.asset(
                'assets/images/${taxon.name}.png',
                height: 100.0,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              ListTile(
                title: Center(
                  child: Text(
                    taxon.name,
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
