import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandayatest/core_module/pages/splash_screen_page.dart';
import 'package:mandayatest/core_module/injection.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mandayatest/core_module/routes/page_routes.dart';
import 'package:mandayatest/core_module/routes/route_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initInjector();
  await initializeDateFormatting('id_ID');
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  ).whenComplete(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreenPage.routeName,
      theme: ThemeData(fontFamily: 'AirbnbCereal'),
      navigatorObservers: [
        routeObserver,
      ],
      onGenerateRoute: pageRoutes.onGenerateRoute,
    );
  }
}

