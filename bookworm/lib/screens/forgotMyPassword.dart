import 'package:flutter/material.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/outsideButton.dart';
import 'package:teste/components/pageModelOutside.dart';
import 'package:teste/screens/sendCode.dart';

class ForgotMyPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

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
            padding: EdgeInsets.only(right: 48.0, left: 48.0),
            child: Container(
              margin: EdgeInsets.only(top: 24.0),
              padding: EdgeInsets.all(16.0),
              color: Color.fromRGBO(25, 50, 60, 0.85),
              child: Text(
                'Para criar uma nova senha, precisamos confirmar que é você mesmo.\n\nInsira o seu email de cadastro. Um código estará lá.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
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
            _emailController
          ),
          OutsideButton(
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SendCodeScreen()));
            },
            "Enviar Código",
            30.0,
          ),
        ],
      ),
    );
  }
}
