import 'package:flutter/material.dart';

import '../presentation/resources/themes_manager.dart';

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  const MyApp._internal(); // private constructor

  static const MyApp instance = MyApp._internal(); // single instance

  // factory constructor returns the instance of the class
  factory MyApp() {
    return instance;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
