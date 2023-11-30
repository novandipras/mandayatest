import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandayatest/core_module/injection.dart';
import 'package:mandayatest/core_module/pages/splash_screen_page.dart';
import 'package:mandayatest/home_module/data/model/search_form_model.dart';
import 'package:mandayatest/home_module/presentation/pages/home_page.dart';

PageRoutes pageRoutes = locator<PageRoutes>();

class PageRoutes {
  PageRoutes();

  final routeHistory = <String?>[];

  MaterialPageRoute onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => _getPageRoute(routeSettings),
    );
  }

  Widget _getPageRoute(RouteSettings routeSettings) {
    try {
      switch (routeSettings.name) {
        case SplashScreenPage.routeName:
          return const SplashScreenPage();

        case HomePage.routeName:
          final Map<String, dynamic>? args =
              routeSettings.arguments as Map<String, dynamic>?;
          return HomePage(
            initPage: args?['init_page'] as int?,
            exploreWidget: args?['explore_widget'] as Widget?,
          );

        default:
          return Container(
            color: Colors.blue,
          );
      }
    } catch (e) {
      return UnderMaintenancePage(
        message: e.toString(),
      );
    }
  }
}

class UnderMaintenancePage extends StatelessWidget {
  const UnderMaintenancePage({super.key, this.message});

  final dynamic message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              Text(
                'Halaman ini masih dalam perbaikan',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
