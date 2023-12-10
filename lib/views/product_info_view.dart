import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:un1q_app/models/product.dart';

class ProductInfoView extends StatelessWidget {
  // final Product product;

  const ProductInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image.network(
            //   // You can use the product image URL here
            //   'https://example.com/product-image.jpg',
            //   height: 200.0,
            //   fit: BoxFit.cover,
            // ),
            const SizedBox(height: 16.0),
            Text(
              product.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20.0, color: Colors.green),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // // Add the product to the cart
                // context
                //     .read<CartProvider>()
                //     .addToCart(CartItem(product: product));
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('${product.name} added to cart')),
                // );
              },
              icon: const Icon(FontAwesomeIcons.cartPlus),
              label: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
