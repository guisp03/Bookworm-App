import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
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
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}
