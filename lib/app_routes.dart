import 'package:flutter/material.dart';
import 'package:ommu/view/screen/auth/login.dart';
import 'package:ommu/view/screen/auth/register.dart';
import 'package:ommu/view/screen/home/home_page.dart';

class AppRoutes {

  // *********************** Authentication
  static const String login = '/';
  static const String register = '/register';

  // *********************** Home
  static const String homePage = '/homePage';

  static Map<String, WidgetBuilder> get routes => {
        login: (context) => const LoginPage(),
        register: (context) => const RegisterPage(),
        homePage: (context) => const HomePage(),
      };
}
