import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:un1q_app/models/category.dart';
import 'package:un1q_app/models/taxon.dart';
import 'package:un1q_app/services/food_api_service.dart';
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
        body: <Widget>[const CategoryList(), const ProductInfoView()][0]);
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<Taxon>?>(
            future: FoodService.getTaxons(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Taxon> taxons = snapshot.data!;
                return ListView.builder(
                    itemCount: taxons.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(taxon: taxons[index]);
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }));
  }
}

class CategoryItem extends StatelessWidget {
  final Taxon taxon;

  const CategoryItem({Key? key, required this.taxon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Category category = Provider.of<Category>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          category.setTaxon(taxon);
          Navigator.of(context).push(
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
