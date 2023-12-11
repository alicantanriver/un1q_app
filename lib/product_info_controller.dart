import 'package:flutter/material.dart';
import 'package:un1q_app/models/food.dart';
import 'package:un1q_app/services/food_api_service.dart';
import 'package:un1q_app/views/product_info_view.dart';

class ProductInfoController extends State<ProductInfoView>
    with WidgetsBindingObserver {
  late String taxonName;
  late Future<List<Food>?> food;

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<List<Food>?> getFoods(String taxonName) async {
    return await FoodService.getFoods(taxonName);
  }
}
