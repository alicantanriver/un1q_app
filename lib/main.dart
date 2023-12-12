// import 'package:flutter/material.dart';
// import 'package:un1q_app/app.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Set the orientation to portrait only
//   // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

//   // Run the app.
//   runApp(const App());
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:un1q_app/app.dart';
import 'package:un1q_app/views/cart_view.dart';
import 'package:un1q_app/views/categories_view.dart';
import 'package:un1q_app/views/product_info_view.dart';

/// Flutter code sample for [NavigationBar].

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the orientation to portrait only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}

// class NavigationBarApp extends StatelessWidget {
//   const NavigationBarApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const NavigationExample(),
//     );
//   }
// }

// class NavigationExample extends StatefulWidget {
//   const NavigationExample({super.key});

//   @override
//   State<NavigationExample> createState() => _NavigationExampleState();
// }

// class _NavigationExampleState extends State<NavigationExample> {
//   int currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//         indicatorColor: Colors.amber,
//         selectedIndex: currentPageIndex,
//         destinations: const <Widget>[
//           NavigationDestination(
//             selectedIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: Badge(child: Icon(Icons.local_mall)),
//             label: 'Cart',
//           )
//         ],
//       ),
//       body: <Widget>[
//         /// Home page
//         const CategoriesView(),
//         const CartView()
//       ][currentPageIndex],
//     );
//   }
// }
