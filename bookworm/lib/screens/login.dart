import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
          Column(
            children: <Widget>[
              Text('Login', style: Theme.of(context).textTheme.headline5,),
            ],
          ),
        ],
      ),
    );
  }
}
