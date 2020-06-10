import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste/screens/product.dart';
import 'package:teste/screens/productsList.dart';

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
            fontFamily: 'Josefin Sans',
            fontSize: 30.0,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Josefin Sans',
            fontSize: 25.0,
            color: Colors.white,
          ),
          subtitle2: TextStyle(
            fontFamily: 'Josefin Sans',
            fontSize: 30.0,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Josefin Sans',
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
      title: 'Bookworm',
      home: ProductListScreen(),
    );
  }
}
