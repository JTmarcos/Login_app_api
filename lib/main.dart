import 'package:flutter/material.dart';
import 'package:login_screen/pages/home_page.dart';
import 'package:login_screen/pages/login_page.dart';
import 'package:login_screen/pages/splash_page.dart';
import 'package:login_screen/pages/subhome_page.dart';
import 'package:login_screen/routes/routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login test",
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      initialRoute: Routes.splashPage,
      routes: {
        Routes.splashPage: (_) => const SplashPage(),
        Routes.loginPage: (_) => const LoginPage(),
        Routes.homePage: (_) => const HomePage(),
        Routes.detailsPage: (_) => const DetailsPage(),
      },
    );
  }
}
