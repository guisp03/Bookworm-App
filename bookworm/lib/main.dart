import 'package:flutter/material.dart';
import 'package:teste/screens/acervo.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        canvasColor: Colors.black,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Josefin Sans',
            fontSize: 30.0,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Josefin Sans',
            fontSize: 32.0,
            color: Colors.black,
          ),
          subtitle2: TextStyle(
            fontFamily: 'Josefin Sans',
            fontSize: 25.0,
            color: Colors.white,
          )
        ),
      ),
      title: 'Bookworm',
      home: AcervoScreen(),
    );
    return materialApp;
  }
}

