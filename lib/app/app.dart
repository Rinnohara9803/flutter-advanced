import 'package:flutter/material.dart';
import 'package:flutteradvanced/presentation/forget_password/forget_password_view.dart';
import 'package:flutteradvanced/presentation/login/login_view.dart';
import 'package:flutteradvanced/presentation/main/main_view.dart';
import 'package:flutteradvanced/presentation/on_boarding/on_boarding_view.dart';
import 'package:flutteradvanced/presentation/register/register_view.dart';

import '../presentation/resources/routes_manager.dart';
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
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: Routes.splashRoute,
      routes: Routes.routes,
    );
  }
}
