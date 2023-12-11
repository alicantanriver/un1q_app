import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:un1q_app/models/category.dart';
import 'package:un1q_app/models/taxon.dart';
import 'package:un1q_app/services/food_api_service.dart';
import 'package:un1q_app/views/categories_view.dart';

class CategoriesController extends State<CategoriesView>
    with WidgetsBindingObserver {
  late Future<List<Taxon>?> futureTaxon;

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }

  @override
  void initState() {
    super.initState();
    futureTaxon = FoodService.getTaxons();
    WidgetsBinding.instance.addObserver(this);
  }

  /// This function is used to log the button presses on the accept button.
  void onTaxonPressed(Taxon taxon) {
    Category category = Provider.of<Category>(context, listen: false);
    category.setTaxon(taxon);
    Navigator.pushNamed(context, '/product-info-view');
  }
}
