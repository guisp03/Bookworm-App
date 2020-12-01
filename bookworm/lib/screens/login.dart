import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/outsideButton.dart';
import 'package:teste/components/pageModelOutside.dart';
import 'package:teste/main.dart';
import 'package:teste/models/leitor.dart';
import 'package:teste/screens/forgotMyPassword.dart';
import 'package:teste/screens/productsList.dart';
import 'package:teste/util/resize.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  LoginWeb login = new LoginWeb();
  Login logar;
  Resize resize = new Resize();
  List<String> tokenSplit = [];
  Token token;
  LeitorWeb leitorWeb = new LeitorWeb();
  Leitor leitor;

  @override
  Widget build(BuildContext context) {
     resize.getWidthAndHeight(context);
    return PageModelOutside(
      resize.getHeight(80.0),
      "Login",
      resize.getFontScale(88),
      Column(
        children: <Widget>[
          CustomTextField(
              TextStyle(
                fontSize: resize.getFontScale(30.0),
                height: resize.getHeight(1),
              ),
              false,
              Color.fromRGBO(25, 50, 60, 0.85),
              'Email',
              TextStyle(
                color: Color.fromRGBO(252, 252, 252, 1),
              ),
              null,
              _emailController,
              null),
          CustomTextField(
              TextStyle(
                fontSize: resize.getFontScale(30.0),
                height: resize.getHeight(1),
              ),
              true,
              Color.fromRGBO(25, 50, 60, 0.85),
              'Senha',
              TextStyle(
                color: Color.fromRGBO(252, 252, 252, 1),
              ),
              null,
              _senhaController,
              null),
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
                fontSize: resize.getFontScale(20.0),
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
                        builder: (_) => CustomAlertDialog(
                            Text('Erro ao realizar login! Tente novamente!'))));
                if (logar.code == 200) {
                  tokenSplit = logar.token.split('.');
                  token = Token.fromJson(json.decode(utf8.decode(base64.decode(tokenSplit[1] + '='))));
                 Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductListScreen(int.parse(token.idLeitor))));
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
            resize.getWidth(80.0),
          ),
        ],
      ),
    );
  }
}
