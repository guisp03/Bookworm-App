import 'package:flutter/material.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/outsideButton.dart';
import 'package:teste/components/pageModelOutside.dart';
import 'login.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageModelOutside(
      64.0,
      "Esqueci minha\nsenha",
      40.0,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: CustomTextField(
              TextStyle(fontSize: 30.0, height: 1),
              true,
              Color.fromRGBO(25, 50, 60, 0.85),
              'Nova Senha',
              TextStyle(
                color: Color.fromRGBO(252, 252, 252, 1),
              ),
              null,
            ),
          ),
          CustomTextField(
            TextStyle(fontSize: 30.0, height: 1),
            true,
            Color.fromRGBO(25, 50, 60, 0.85),
            'Confirmar Senha',
            TextStyle(
              color: Color.fromRGBO(252, 252, 252, 1),
            ),
            null,
          ),
          OutsideButton(
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            "Entrar",
            80.0,
          ),
        ],
      ),
    );
  }
}
