import 'package:flutter/material.dart';
import 'package:un1q_app/models/food.dart';

class UniqueFood {
  final Food food;
  final int quantity;

  UniqueFood(this.food, this.quantity);
}

class Cart extends ChangeNotifier {
  late List<Food> foods = [];
  late double cartTotal;

  void addFood(Food food) {
    foods.add(food);
    notifyListeners();
  }

  void removeFood(Food food) {
    for (int i = 0; i < foods.length; i++) {
      if (foods[i].slug == food.slug) {
        foods.removeAt(i);
        break; // Stop after removing the first occurrence
      }
    }
    notifyListeners();
  }

  List<UniqueFood> getUniqueFoods() {
    List<UniqueFood> uniqueFoods = [];
    for (var element in foods) {
      int quantity = foods.where((el) => el.name == element.name).length;
      if (uniqueFoods
          .where((el) => el.food.name == element.name)
          .toList()
          .isEmpty) {
        uniqueFoods.add(UniqueFood(element, quantity));
      }
    }
    return uniqueFoods;
  }

  double calculateTotal() {
    cartTotal = 0;
    for (var element in foods) {
      cartTotal += element.price;
    }
    return cartTotal / 100;
  }

  void clearCart() {
    foods.clear();
    notifyListeners();
  }

  double calculateDeliveryFee() {
    return calculateTotal() * 0.05;
  }

  double calculateGrandTotal() {
    return calculateTotal() + calculateDeliveryFee();
  }
}
