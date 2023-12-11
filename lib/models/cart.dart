import 'package:flutter/material.dart';
import 'package:un1q_app/models/food.dart';

class Cart extends ChangeNotifier {
  late List<Food> foods;
  late double cartTotal;

  void addFood(Food food) {
    foods.add(food);
    notifyListeners();
  }

  void removeFood(String name) {
    foods.removeWhere((element) => element.name == name);
    notifyListeners();
  }

  void calculateTotal() {
    cartTotal = 0;
    for (var element in foods) {
      cartTotal += element.price;
    }
    notifyListeners();
  }

  void clearCart() {
    foods.clear();
    notifyListeners();
  }
}
