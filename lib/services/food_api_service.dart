// write a api service that gets food data from Service
// and returns a list of Food objects

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:un1q_app/models/food.dart';
import 'package:un1q_app/models/taxon.dart';

class FoodService {
  static const String _baseUrl = 'https://stagingshop.threls.dev/api/';

  static Future<List<Taxon>?> getTaxons() async {
    try {
      final response = await http.get(
          Uri.parse('${_baseUrl}taxonomies/food-type'),
          headers: {'taxonomy': 'food-type'});
      if (response.statusCode == 200) {
        final List<Taxon> taxons = [];
        final List<dynamic> taxonsData = json.decode(response.body);
        for (var taxonData in taxonsData) {
          final Taxon taxon = Taxon.fromJson(taxonData);
          taxons.add(taxon);
        }
        return taxons;
      } else {
        debugPrint('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  static Future<List<Food>?> getFoods(String taxon) async {
    try {
      final response = await http.get(Uri.parse(
          '${_baseUrl}products?filter[class]=food&filter[taxons]=$taxon'));
      if (response.statusCode == 200) {
        final List<Food> foods = [];
        final Map<String, dynamic> foodsData = json.decode(response.body);
        for (var foodData in foodsData['data']) {
          final Food food = Food.fromJson(foodData);
          foods.add(food);
        }
        return foods;
      } else {
        debugPrint('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}
