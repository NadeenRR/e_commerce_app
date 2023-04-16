import 'package:e_commerce_app/utils/routes.dart';
import 'package:e_commerce_app/views/pages/buttom_navbar.dart';
import 'package:e_commerce_app/views/pages/login_page.dart';
import 'package:flutter/cupertino.dart';

import '../views/pages/landing_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );

    case AppRoutes.buttomNavPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const ButtomNavBar(),
        settings: settings,
      );

    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
  }
}
