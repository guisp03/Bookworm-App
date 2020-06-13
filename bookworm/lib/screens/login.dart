import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/fundoClaro.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Color.fromRGBO(255, 255, 255, 0.25),
            child: Column(

              children: <Widget>[
                Container(child:
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline5,
                ),
                  padding: const EdgeInsets.only(top: 100, bottom: 50),
                ),
                Container(
                  width: 320,
                  padding: const EdgeInsets.only(bottom: 50),
                  child: TextField(
                    style: TextStyle(fontSize: 30, height: 1,   ),
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color.fromRGBO(252, 252, 252, 1)),
                        filled: true,
                        fillColor: Color.fromRGBO(25, 50, 60, 0.85),
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(40))
                        ),
                    ),
                  ),
                ),
                Container(
                  width: 320,
                  child: TextField(
                    style: TextStyle(fontSize: 30, height: 1),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                        labelStyle: TextStyle(color: Color.fromRGBO(252, 252, 252, 1)),
                        filled: true,
                        fillColor: Color.fromRGBO(25, 50, 60, 0.85),
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(40))
                        ),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  }
}
