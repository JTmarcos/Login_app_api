import 'package:flutter/material.dart';
import 'package:login_screen/routes/routes.dart';
import 'package:login_screen/services/prefs_services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.wait(
      [PrefService.isAuth(), Future.delayed(const Duration(seconds: 3))],
    ).then((value) => value[0]
        ? Navigator.of(context).pushReplacementNamed(Routes.homePage)
        : Navigator.of(context).pushReplacementNamed(Routes.loginPage));

    //Future.delayed(const Duration(seconds: 3)).then(
    //(_) => Navigator.of(context).pushReplacementNamed(Routes.loginPage));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade500,
      child: const Center(
          child: CircularProgressIndicator(
        color: Colors.white,
      )),
    );
  }
}
