import 'package:flutter/material.dart';
import 'package:login_screen/components/elevated_button.dart';
import 'package:login_screen/controller/login_controller.dart';
import 'package:login_screen/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller1 = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  bool hidepassword = true;

  valueValidator(String? value) {
    if ((value != null && value.isEmpty) || value?.trim() == '') {
      return true;
    } else {
      return false;
    }
  }

  hidePassword() {
    setState(() {
      hidepassword = !hidepassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    void hideKeyboard() {
      FocusScope.of(context).unfocus();
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.people,
                size: MediaQuery.of(context).size.height * 0.2,
              ),
              TextFormField(
                controller: _controller1,
                validator: (String? value) {
                  if (valueValidator(value)) {
                    return ("Insira um usuário de Login");
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: const Text("Login"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _controller2,
                obscureText: hidepassword,
                validator: (String? value) {
                  if (valueValidator(value)) {
                    return ("Insira uma senha");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: hidePassword,
                      icon: hidepassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ValueListenableBuilder(
                valueListenable: _controller.inLoader,
                builder: (BuildContext context, dynamic inLoader, __) {
                  return inLoader
                      ? const CircularProgressIndicator()
                      : CustomElevatedButton(
                          onPressed: () {
                            hideKeyboard();
                            if (_formKey.currentState!.validate()) {
                              _controller.setLogin(_controller1.text);

                              _controller.setPass(_controller2.text);
                              _controller.auth().then(
                                (value) {
                                  if (value) {
                                    Navigator.of(context)
                                        .pushReplacementNamed(Routes.homePage);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Login e senha incorretos'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    _controller1.clear();
                                    _controller2.clear();
                                  }
                                },
                              );
                            }
                          },
                          formkey: _formKey,
                          controllerLogin: _controller1,
                          controllerPassword: _controller2,
                          generalController: _controller);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
