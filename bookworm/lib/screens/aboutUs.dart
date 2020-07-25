import 'package:flutter/material.dart';
import 'package:teste/components/pageModelInside.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      'Sobre',
      RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: 'Algum texto a ser feito ainda',
          style: Theme.of(context).textTheme.subtitle1
        ),
      ),
    );
  }
}
