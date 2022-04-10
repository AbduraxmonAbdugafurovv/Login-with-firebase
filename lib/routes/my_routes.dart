import 'package:firebaselogin/screens/home_page.dart';
import 'package:firebaselogin/screens/login_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case "home":
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
    return null;
  }
}
