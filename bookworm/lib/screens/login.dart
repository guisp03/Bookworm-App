import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/outsideButton.dart';
import 'package:teste/components/pageModelOutside.dart';
import 'package:teste/main.dart';
import 'package:teste/models/leitor.dart';
import 'package:teste/screens/forgotMyPassword.dart';
import 'package:teste/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  LoginWeb login = new LoginWeb();
  Login logar;

  @override
  Widget build(BuildContext context) {
    return PageModelOutside(
        80,
        "Login",
        88.0,
        Column(
          children: <Widget>[
            CustomTextField(
                TextStyle(
                  fontSize: 30.0,
                  height: 1,
                ),
                false,
                Color.fromRGBO(25, 50, 60, 0.85),
                'Email',
                TextStyle(
                  color: Color.fromRGBO(252, 252, 252, 1),
                ),
                null,
                _emailController),
            CustomTextField(
                TextStyle(
                  fontSize: 30.0,
                  height: 1,
                ),
                true,
                Color.fromRGBO(25, 50, 60, 0.85),
                'Senha',
                TextStyle(
                  color: Color.fromRGBO(252, 252, 252, 1),
                ),
                null,
                _senhaController),
            ClickableText(
              0.0,
              0.0,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotMyPasswordScreen(),
                  ),
                );
              },
              Text(
                'Esqueci a minha senha',
                style: TextStyle(
                  fontSize: 20.0,
                  color: BookwormApp.darkBlue,
                ),
              ),
            ),
            OutsideButton(
              () async {
                if (_emailController.text.isNotEmpty &&
                    _senhaController.text.isNotEmpty) {
                  logar = await login
                      .logar(_emailController.text, _senhaController.text)
                      .catchError((e) => showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => CustomAlertDialog(Text(
                              'Erro ao realizar login! Tente novamente!'))));
                  if (logar.code == 200) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false);
                  } else {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            CustomAlertDialog(Text('Senha incorreta!')));
                  }
                } else {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) =>
                          CustomAlertDialog(Text('Algum campo está vazio!')));
                }
              },
              'Entrar',
              80.0,
            ),
          ],
        ));
  }
}
