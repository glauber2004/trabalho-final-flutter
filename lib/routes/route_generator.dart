
import 'package:flutter/material.dart';
import '../views/splash/splash_screen.dart';
import '../views/login/login_screen.dart';
import '../views/home/home_screen.dart';
import '../views/add_book/add_book_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.addBook:
        return MaterialPageRoute(builder: (_) => AddBookScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
