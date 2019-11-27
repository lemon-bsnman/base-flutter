import 'package:base_app/screens/login_screen.dart';
import 'package:base_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

const LoginRoute = '/';
const ProfileRoute = '/profile';

class Routes {
  static RouteFactory routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;

      Widget screen;
      switch (settings.name) {
        case LoginRoute:
          screen = LoginScreen();
          break;
        case ProfileRoute:
          screen = ProfileScreen();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(
        builder: (context) => screen,
      );
    };
  }
}
