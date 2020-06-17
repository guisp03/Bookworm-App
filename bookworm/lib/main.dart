import 'package:flutter/material.dart';
import 'package:teste/screens/login.dart';
import 'package:teste/screens/productsList.dart';

void main() => runApp(BookwormApp());

class BookwormApp extends StatelessWidget {
  static const Color darkBlue = Color.fromRGBO(25, 50, 60, 1);
  static const Color darkBlueOpacity = Color.fromRGBO(25, 50, 60, 0.85);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: darkBlue,
        canvasColor: darkBlue,
        accentColor: darkBlue,
        hintColor: darkBlue,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 35.0,
            color: Colors.white,
          ),
          headline5: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 70.0,
          ),
          subtitle1: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 25.0,
            color: Colors.white,
          ),
          subtitle2: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 30.0,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 16.0,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 22.0,
            color: Color.fromRGBO(252, 252, 252, 0.6),
          ),
        ),
      ),
      title: 'Bookworm',
      home: LoginScreen(),
    );
  }
}
