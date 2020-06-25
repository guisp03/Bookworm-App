import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/screens/changePassword.dart';

import '../main.dart';

class SendCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
      Image.asset(
      'assets/images/fundo.jpeg',
        fit: BoxFit.cover,
      ),
          Container(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.only(top: 60),
                   child: Column(
                        children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 140),
                           width: 300,
                           child: Text(
                              'Esqueci minha senha',
                                  style: TextStyle(fontSize: 40, color: Colors.black)
                            ),
                        ),
                   CustomTextField(
                     TextStyle(
                       fontSize: 30.0,
                       height: 1,
                     ),
                     Color.fromRGBO(25, 50, 60, 0.85),
                     'Código',
                     TextStyle(
                       color: Color.fromRGBO(252, 252, 252, 1),
                     ),
                     null,
                   ),
                          ClickableText(
                                () {
                            },
                            Text(
                              'Reenviar código',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: BookwormApp.darkBlue,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 24.0,
                              right: 48.0,
                              left: 48.0,
                            ),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                              },
                              child: Text(
                                'Confirmar Código',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              color: Color.fromRGBO(25, 50, 60, 1),
                              padding: const EdgeInsets.only(
                                  top: 16,
                                  bottom: 16,
                                  right: 20,
                                  left: 20
                              ),
                            ),
                          ),
                        ],
                   ),
                 ),
            ),
          ),
      ],
      ),
    );
  }
}
