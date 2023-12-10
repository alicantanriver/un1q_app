import 'package:flutter/material.dart';
import 'package:un1q_app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the orientation to portrait only
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Run the app.
  runApp(const App());
}
