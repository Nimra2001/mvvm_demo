import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_demo/utils/routes/routes_name.dart';
import 'package:mvvm_demo/view/home_screen.dart';
import 'package:mvvm_demo/view/login_view.dart';
import 'package:mvvm_demo/view/signup_view.dart';
import 'package:mvvm_demo/view/splash_view.dart';

class Routes {

  //settings accept string parameter
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  const LoginView());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  const SplashView());
      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  const SignUpView());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
