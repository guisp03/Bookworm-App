import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class StartScreen extends StatefulWidget {
  @override
  StartScreenState createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  void navigationToNextPage(){

    Navigator.pushReplacementNamed(context, '/LoginScreen');

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
