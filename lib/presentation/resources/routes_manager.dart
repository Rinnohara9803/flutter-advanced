import 'package:flutteradvanced/presentation/splash/splash_view.dart';
import 'package:flutteradvanced/presentation/store_detail/store_detail_view.dart';

import '../forget_password/forget_password_view.dart';
import '../login/login_view.dart';
import '../main/main_view.dart';
import '../on_boarding/on_boarding_view.dart';
import '../register/register_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String mainRoute = '/main';
  static const String storeDetailRoute = '/storeDetail';
  static const String forgetPasswordRoute = '/forgetPassword';

  static Map<String, Widget Function(BuildContext)> routes = {
    splashRoute: (context) => const SplashView(),
    loginRoute: (context) => const LoginView(),
    registerRoute: (context) => const RegisterView(),
    forgetPasswordRoute: (context) => const ForgetPasswordView(),
    onBoardingRoute: (context) => const OnBoardingView(),
    mainRoute: (context) => const MainView(),
    storeDetailRoute: (context) => const StoreDetailView(),
  };
}
