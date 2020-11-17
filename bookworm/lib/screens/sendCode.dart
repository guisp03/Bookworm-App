import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/outsideButton.dart';
import 'package:teste/components/pageModelOutside.dart';
import 'package:teste/screens/changePassword.dart';
import '../main.dart';

class SendCodeScreen extends StatelessWidget {
  final TextEditingController _codigoContoller = TextEditingController();

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
            padding: EdgeInsets.only(top: 40.0),
            child: CustomTextField(
                TextStyle(
                  fontSize: 30.0,
                  height: 1,
                ),
                false,
                Color.fromRGBO(25, 50, 60, 0.85),
                'Código',
                TextStyle(
                  color: Color.fromRGBO(252, 252, 252, 1),
                ),
                null,
                _codigoContoller,
                null
                ),
          ),
          ClickableText(
            0.0,
            0.0,
            () {},
            Text(
              'Reenviar código',
              style: TextStyle(
                fontSize: 20.0,
                color: BookwormApp.darkBlue,
              ),
            ),
          ),
          OutsideButton(
            () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen()));
            },
            "Confirmar Código",
            10.0,
          ),
        ],
      ),
    );
  }
}
