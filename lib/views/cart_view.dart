import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:un1q_app/models/cart.dart';
import 'package:un1q_app/models/food.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of(context, listen: true);
    List<UniqueFood> uniqueFoods = cart.getUniqueFoods();

    // return view that lists cart.foods
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Order',
            style: GoogleFonts.inter(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              // const Text(
              //   'Cart',
              //   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: uniqueFoods.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(uniqueFoods[index].food.name),
                      subtitle:
                          Text('Quantity: ${uniqueFoods[index].quantity}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cart.removeFood(uniqueFoods[index].food);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              // add the delivery fee text
              Text(
                'Delivery Fee: € ${double.parse(cart.calculateDeliveryFee().toStringAsFixed(2))}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Total Amount: € ${double.parse(cart.calculateTotal().toStringAsFixed(2))}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              // add a checkout button that clears the total amount
              const SizedBox(height: 16.0),
              FilledButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(1000, 255, 202, 81))),
                onPressed: () {
                  cart.clearCart();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(
                          color: Color.fromARGB(1000, 24, 24, 24),
                          fontSize: 25),
                    ),
                  ],
                ),
              )
            ])));
  }
}

// import 'package:flutter/material.dart';
// import 'package:un1q_app/cart_provider.dart';
// import 'package:provider/provider.dart';

// class CheckoutView extends StatelessWidget {
//   const CheckoutView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double totalAmount = context.watch<CartProvider>().getTotalAmount();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Checkout'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'Order Summary',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16.0),
//             // Display a list of cart items and their quantities
//             ...context.watch<CartProvider>().cartItems.map((cartItem) {
//               return ListTile(
//                 title: Text(cartItem.product.name),
//                 subtitle: Text('Quantity: ${cartItem.quantity}'),
//               );
//             }).toList(),
//             const SizedBox(height: 16.0),
//             Text(
//               'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
//               style:
//                   const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Submit the order (Show a modal for success in this example)
//                 _showOrderSuccessModal(context, totalAmount);
//               },
//               child: const Text('Submit Order'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showOrderSuccessModal(BuildContext context, double totalAmount) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Order Submitted'),
//           content: Column(
//             children: [
//               Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
//               const SizedBox(height: 8.0),
//               const Text('Thank you for your order!'),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // TODO: Reset the cart and navigate to the home screen or any other screen
//                 Navigator.pop(context); // Close the dialog
//                 // context.read<CartProvider>().clearCart(); // Clear the cart
//                 // You can use Navigator.pushReplacement to navigate to a new screen and clear the navigation stack
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
