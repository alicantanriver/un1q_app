import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:un1q_app/models/cart.dart';

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
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: uniqueFoods.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${uniqueFoods[index].quantity} x '),
                          Text('${uniqueFoods[index].food.name} ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(cart.convertPriceToFormattedString(
                              (uniqueFoods[index].quantity *
                                      uniqueFoods[index].food.price)
                                  .toDouble()))
                        ],
                      ),
                      leading: Image.network(
                        uniqueFoods[index].food.image,
                        width: 60.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                      ),
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
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Delivery Fee:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    Text(
                      cart.convertPriceToFormattedString(
                          cart.calculateDeliveryFee()),
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Amount:',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(
                          cart.convertPriceToFormattedString(
                              cart.calculateGrandTotal()),
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold))
                    ])
              ]),
              // add a checkout button that clears the total amount
              const SizedBox(height: 16.0),
              FilledButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(1000, 255, 202, 81))),
                onPressed: () {
                  cart.clearCart();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Order Confirmed"),
                      content: const Text(
                          "Your order has been successfully placed, and we're getting started on preparing your delicious meal. "),
                      actions: [
                        FilledButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
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
