import 'package:flutter/material.dart';
import 'package:teste/components/customBlackSwatch.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste/screens/product.dart';
import 'package:teste/screens/productsList.dart';

void main() => runApp(BookwormApp());

class BookwormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      theme: ThemeData(
        primarySwatch: customBlack,
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
            ),
            subtitle1: TextStyle(
              fontFamily: 'Josefin Sans',
              fontSize: 25.0,
              color: Colors.black
            ),
            bodyText1: TextStyle(
              fontFamily: 'Josefin Sans',
              fontSize: 16.0,
              color: Colors.black,
            )
            ),
      ),
      title: 'Bookworm',
      home: ProductListScreen(),
    );
  }
}
