import 'package:flutter/material.dart';
import 'package:teste/components/pageModel.dart';

class SupportUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageModelScreen(
      'Apoie',
      RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: 'Outro texto que tem que fazer',
          style: Theme.of(context).textTheme.subtitle1
        ),
      ),
    );
  }
}