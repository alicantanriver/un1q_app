// import 'package:flutter/material.dart';
// import 'package:un1q_app/models/cart_item.dart';

// class CartProvider with ChangeNotifier {
//   final List<CartItem> _cartItems = [];

//   List<CartItem> get cartItems => _cartItems;

//   void addToCart(CartItem item) {
//     _cartItems.add(item);
//     notifyListeners();
//   }

//   void removeFromCart(CartItem item) {
//     _cartItems.remove(item);
//     notifyListeners();
//   }

//   // Add other methods like increaseQuantity, decreaseQuantity, etc.

//   double getTotalAmount() {
//     return _cartItems.fold(
//         0, (sum, item) => sum + (item.quantity * item.product.price));
//   }
// }
