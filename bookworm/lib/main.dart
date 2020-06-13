import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste/screens/login.dart';
import 'package:teste/screens/product.dart';
import 'package:teste/screens/productsList.dart';
import 'package:teste/screens/start.dart';

void main() => runApp(BookwormApp());

class BookwormApp extends StatelessWidget {

  static const Color darkBlue = Color(0xFF19323C);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      theme: ThemeData(
        primaryColor: darkBlue,
        canvasColor: darkBlue,
        accentColor: darkBlue,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 35.0,
            color: Color.fromRGBO(252, 252, 252, 1),
          ),
          headline5: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 70.0,
          ),
          subtitle1: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 25.0,
            color: Color.fromRGBO(252, 252, 252, 1),
          ),
          subtitle2: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 30.0,
            color: Color.fromRGBO(252, 252, 252, 1),
          ),
          bodyText1: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 22.0,
            color: Color.fromRGBO(252, 252, 252, 1),
          ),
          bodyText2:
          TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 22.0,
            color: Color.fromRGBO(252, 252, 252, 0.6)
          ),
        ),
      ),
      title: 'Bookworm',
      home: ProductListScreen(),
    );
  }
}
