import 'package:flutter/material.dart';
import 'package:un1q_app/models/product.dart';

class CartItem extends ChangeNotifier {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}
