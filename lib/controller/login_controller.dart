import 'package:flutter/widgets.dart';
import 'package:login_screen/services/prefs_services.dart';

class LoginController {
  String? _login;
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
  setLogin(String value) => _login = value;

  String? _password;
  setPass(String value) => _password = value;

  Future<bool> auth() async {
    inLoader.value = true;

    await Future.delayed(const Duration(seconds: 2));
    if (_login == 'admin' && _password == '123') {
      inLoader.value = false;

      PrefService.save(_login!);
      return true;
    }
    inLoader.value = false;
    return false;
  }
}
