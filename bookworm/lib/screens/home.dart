import 'package:flutter/material.dart';
import 'package:teste/components/pageModelInside.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      "Início",
      RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
            text: 'Algum texto a ser feito ainda',
            style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}