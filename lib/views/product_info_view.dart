import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:un1q_app/models/category.dart';
import 'package:un1q_app/models/food.dart';
import 'package:un1q_app/models/taxon.dart';
import 'package:un1q_app/product_info_controller.dart';

class ProductInfoView extends StatefulWidget {
  const ProductInfoView({super.key});

  @override
  State<ProductInfoView> createState() => ProductInfoController();

  Widget build(BuildContext context, ProductInfoController controller) {
    Category category = Provider.of<Category>(context, listen: false);
    Taxon? taxon = category.getTaxon();

    return Scaffold(
        appBar: AppBar(
          title: Text(taxon!.metaTitle),
        ),
        body: FutureBuilder<List<Food>?>(
          future: controller.getFoods(taxon.name),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Food> foods = snapshot.data!;
              return ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return Text(
                        '${foods[index].name} - ${foods[index].description}: ${foods[index].formattedPrice}');
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
