import 'package:flutter/material.dart';
import 'package:un1q_app/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    double totalAmount = context.watch<CartProvider>().getTotalAmount();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            // Display a list of cart items and their quantities
            ...context.watch<CartProvider>().cartItems.map((cartItem) {
              return ListTile(
                title: Text(cartItem.product.name),
                subtitle: Text('Quantity: ${cartItem.quantity}'),
              );
            }).toList(),
            const SizedBox(height: 16.0),
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Submit the order (Show a modal for success in this example)
                _showOrderSuccessModal(context, totalAmount);
              },
              child: const Text('Submit Order'),
            ),
          ],
        ),
      ),
    );
  }

  void _showOrderSuccessModal(BuildContext context, double totalAmount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Submitted'),
          content: Column(
            children: [
              Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
              const SizedBox(height: 8.0),
              const Text('Thank you for your order!'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // TODO: Reset the cart and navigate to the home screen or any other screen
                Navigator.pop(context); // Close the dialog
                // context.read<CartProvider>().clearCart(); // Clear the cart
                // You can use Navigator.pushReplacement to navigate to a new screen and clear the navigation stack
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
