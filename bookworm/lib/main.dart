import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste/screens/start.dart';
import 'package:teste/util/resize.dart';

void main() {
  runApp(BookwormApp());
}

//Infelizmente diferente daquilo projetado pelo grupo e pelos desenvolvedores mobile,
//devido as complicações encontradas no período de quarentena, como os computadores
//não possúirem todos os recursos! Não foi possível completar as funções de trocar a senha, via api e email
//Favoritar e desfavoritar os livros, bem como efetuar sua reserva, além da busca em algum momentos aprsentar falha!

class BookwormApp extends StatelessWidget {
  static const Color darkBlue = Color.fromRGBO(25, 50, 60, 1);
  static const Color darkBlueOpacity = Color.fromRGBO(25, 50, 60, 0.85);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        Resize resize = new Resize();
        resize.getWidthAndHeight(context);
        return Theme(
          data: ThemeData(
            primaryColor: darkBlue,
            canvasColor: darkBlue,
            accentColor: darkBlue,
            hintColor: darkBlue,
            textTheme: TextTheme(
              headline6: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: resize.getFontScale(35.0),
                color: Color.fromRGBO(252, 252, 252, 1),
              ),
              headline5: TextStyle(
                  fontFamily: 'JosefinSans', fontSize: 70.0, color: darkBlue),
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
                fontSize: 20.0,
                color: Color.fromRGBO(252, 252, 252, 1),
              ),
              bodyText2: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 20.0,
                color: Color.fromRGBO(252, 252, 252, 0.6),
              ),
            ),
          ),
          child: child,
        );
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Bookworm',
      home: StartScreen(),
    );
  }
}
