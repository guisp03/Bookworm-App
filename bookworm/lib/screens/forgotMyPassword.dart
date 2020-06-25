import 'package:flutter/material.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/screens/sendCode.dart';

class ForgotMyPasswordScreen extends StatelessWidget {
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
                      width: 300,
                      child: Text(
                          'Esqueci minha senha',
                        style: TextStyle(fontSize: 40, color: Colors.black)
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 10),
                      padding: const EdgeInsets.all(15),
                      color: Color.fromRGBO(25, 50, 60, 0.85),
                      height: 345,
                      width: 280,
                      child: Text(
                          'Para criar uma nova senha, precisamos confirmar que você é você mesmo.\n \n Insira o mesmo email de quando fez seu cadastro. Vamos te mandar um código por lá.',
                              style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    CustomTextField(
                      TextStyle(
                        fontSize: 30.0,
                        height: 1,
                      ),
                      Color.fromRGBO(25, 50, 60, 0.85),
                      'Email',
                      TextStyle(
                        color: Color.fromRGBO(252, 252, 252, 1),
                      ),
                      null,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SendCodeScreen()));
                        },
                        child: Text(
                          'Enviar Código',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        color: Color.fromRGBO(25, 50, 60, 1),
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          bottom: 16.0,
                          right: 55,
                          left: 55
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          )
      ]
      ),
    );
  }
}

