import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutteradvanced/presentation/resources/assets_manager.dart';

import '../resources/colors_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _goNextPage() {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  void _startTimer() {
    _timer = Timer(
      const Duration(
        seconds: 2,
      ),
      _goNextPage,
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssetsManager.splashLogo),
        ),
      ),
    );
  }
}
