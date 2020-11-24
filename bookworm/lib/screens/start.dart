import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:teste/screens/login.dart';
import 'package:teste/screens/productsList.dart';

class StartScreen extends StatefulWidget {
  @override
  StartScreenState createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  bool logado = false;

  void navigationToNextPage() {
    if (logado == false) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
      setState(() {
        logado = true;
      });
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ProductListScreen()),
          (route) => false);
    }
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          'assets/images/fundo.jpeg',
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
    );
  }
}
