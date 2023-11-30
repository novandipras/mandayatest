
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mandayatest/core_module/gen/assets.gen.dart';
import 'package:mandayatest/core_module/utils/app_colors.dart';
import 'package:mandayatest/home_module/presentation/pages/home_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});
  static const routeName = '/splashScreenPage';

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        Assets.png.airbnbVertical.path,
      ),
      backgroundColor: AppColors.palleteWhite,
      showLoader: true,
      loaderColor:  const Color(0xffFF5A5F),
      durationInSeconds: 3,
      navigator: HomePage.routeName,
    );
  }
}
