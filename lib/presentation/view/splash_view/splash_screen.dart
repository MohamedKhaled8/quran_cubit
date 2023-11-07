import 'package:flutter/material.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/presentation/widgets/splash_screen_widgets/custom_splash_screen_body.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: const CustomSplashScreenBody(),
    );
  }
}


