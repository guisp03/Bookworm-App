import 'package:flutter/material.dart';
import 'package:teste/components/pageModelInside.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      "Eventos",
      RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
            text: 'Algum texto a ser feito ainda',
            style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}