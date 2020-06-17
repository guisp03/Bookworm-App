import 'package:flutter/material.dart';
import 'package:teste/components/customTextField.dart';

import 'login.dart';

class ForgetPasswordScreen extends StatelessWidget {
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
            color: Color.fromRGBO(255, 255, 255, 0.25),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 88.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Senha',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      padding: const EdgeInsets.only(bottom: 24.0),
                    ),
                    CustomTextField(
                      TextStyle(
                        fontSize: 30.0,
                        height: 1,
                      ),
                      Color.fromRGBO(25, 50, 60, 0.85),
                      'Nova Senha',
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
                      Color.fromRGBO(25, 50, 60, 0.85),
                      'Confirmar Senha',
                      TextStyle(
                        color: Color.fromRGBO(252, 252, 252, 1),
                      ),
                      null,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24.0,
                        bottom: 24.0,
                        right: 48.0,
                        left: 48.0,
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        color: Color.fromRGBO(25, 50, 60, 1),
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          bottom: 16.0,
                          right: 112.0,
                          left: 112.0,
                        ),
                      ),
                    )
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