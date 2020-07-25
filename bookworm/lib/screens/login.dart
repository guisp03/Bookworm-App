import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/outsideButton.dart';
import 'package:teste/components/pageModelOutside.dart';
import 'package:teste/main.dart';
import 'package:teste/screens/forgotMyPassword.dart';
import 'package:teste/screens/productsList.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.height.toString());
    debugPrint(MediaQuery.of(context).size.width.toString());
    debugPrint((MediaQuery.of(context).textScaleFactor).toString());
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
          ),
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
          ),
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
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()));
            },
            'Entrar',
            80.0,
          ),
        ],
      ),
    );
  }
}
