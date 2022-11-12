// ignore_for_file: depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class MSplashScreen extends StatelessWidget {
  const MSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: MImages.logo,
      nextScreen: const MOnboardScreen(),
      backgroundColor: MColors.primary,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}