import 'package:flutter/material.dart';
import 'package:utspbm/core/store.dart';
import 'package:utspbm/pages/cart_page.dart';
import 'package:utspbm/pages/home_page.dart';
import 'package:utspbm/pages/login_page.dart';
import 'package:utspbm/splash_screen.dart';
import 'package:utspbm/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widgets/themes.dart';

void main() {
  runApp(
      VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
