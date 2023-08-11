import 'package:flutter/material.dart';
import 'package:login_screen/controller/login_controller.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.formkey,
      required this.controllerLogin,
      required this.controllerPassword,
      required this.generalController,required this.onPressed});
  // ignore: prefer_typing_uninitialized_variables
  final formkey;
  final TextEditingController controllerLogin;
  final TextEditingController controllerPassword;
  final LoginController generalController;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text(
        "Login",
      ),
    );
  }
}
