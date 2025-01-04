import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fastfoodapp/presentation/pages/mainscreen.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 90.sp,
        backgroundColor: AppColors.primaryColor,
        splash: Lottie.asset(Imagepath.animatedSplash, repeat: true),
        duration: 2000,
        nextScreen: const Mainscreen());
  }
}
