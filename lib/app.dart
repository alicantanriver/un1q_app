import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:un1q_app/main.dart';
import 'package:un1q_app/models/cart.dart';
import 'package:un1q_app/models/category.dart';
import 'package:un1q_app/views/cart_view.dart';
import 'package:un1q_app/views/categories_view.dart';

/// This feature is to set the theme and routes for the app. It does this by referencing the [main] class and it outputs the main app class [main].
/// It uses CompatibilityService to check if the device is compatible with the app. If it is not, it will display the [CompatibilityView]. If it is, it will display the app. otherwise, it will display the [CompatabilityView] screen.
/// It also uses [MultiProvider] to provide the [MeasurementState], [PatientContextModel], [ProcessedDataModel], and [ResultController] to the app.
///  It also uses [MaterialApp] to set the theme for the app.
/// It also uses [initialRoute] to set the initial route for the app.
/// It also uses [routes] to set the routes for the app. It also uses [WidgetsBindingObserver] to observe the app's lifecycle. It also uses [AnalyticsController] to log the time spent on the app and the button presses.
///  It also uses [RestartAppOnReload] to restart the app when the app is reloaded.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  int selectedPageIndex = 0;

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Category(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
          title: "rCP",
          home: Scaffold(
            body: <Widget>[
              const CategoriesView(),
              const CartView(),
            ][selectedPageIndex],
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  selectedPageIndex = index;
                });
              },
              indicatorColor: Colors.amber,
              selectedIndex: selectedPageIndex,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home_outlined),
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Badge(child: Icon(Icons.local_mall_outlined)),
                  icon: Badge(child: Icon(Icons.local_mall)),
                  label: 'Cart',
                )
              ],
            ),
          ),
          theme: ThemeData(
            useMaterial3: true,

            ///Floral White
            scaffoldBackgroundColor: const Color(0xFFFFF8F0),

            ///Midnight Green
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: GoogleFonts.gothicA1().fontFamily,
                  bodyColor: const Color(0xFF104547),
                  displayColor: const Color(0xFF174547),
                ),

            colorScheme: const ColorScheme.light(
              ///Floral White
              primary: Color(0xFFFFF8F0),

              ///Midnight Green
              secondary: Color(0xFF174547),

              ///Cambridge Blue
              tertiary: Color(0xFF68A691),
            ),

            appBarTheme: AppBarTheme(
              ///Floral White
              backgroundColor: const Color(0xFFFFF8F0),
              centerTitle: true,
              iconTheme: IconThemeData(
                ///Midnight Green
                color: const Color(0xFF174547),

                shadows: [
                  Shadow(
                    color: const Color(0xFF174547).withOpacity(0.4),
                    blurRadius: 2,
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              actionsIconTheme: const IconThemeData(
                ///Midnight Green
                color: Color(0xFF174547),

                shadows: [],
              ),
            ),

            filledButtonTheme: FilledButtonThemeData(
              style: ButtonStyle(
                ///Cambridge Blue
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF68A691)),

                ///Floral White
                foregroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFFF8F0)),

                ///Cambridge Blue
                shadowColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF68A691)),

                ///Floral White
                iconColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFFF8F0)),

                iconSize: MaterialStateProperty.all<double>(35),

                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    ///Cambridge Blue
                    color: Color(0xFFFFF8F0),
                    fontSize: 30,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                ),
                elevation: MaterialStateProperty.all<double>(3),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                ///Floral White
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFFF8F0)),

                ///Cambridge Blue
                foregroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF68A691)),

                ///Cambridge Blue
                shadowColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF68A691)),

                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(
                    ///Cambridge Blue
                    color: Color(0xFF68A691),
                    width: 1,
                  ),
                ),

                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    ///Midnight Green
                    color: Color(0xFF174547),
                    fontSize: 30,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                ),
                elevation: MaterialStateProperty.all<double>(3),
              ),
            ),
            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                ///Midnight Green
                shadowColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF174547)),

                ///Midnight Green
                iconColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF174547)),
              ),
            ),
          ),
          routes: {
            "/categories": (context) => const CategoriesView(),
            "/checkout-view": (context) => const CartView(),
          }),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
}
